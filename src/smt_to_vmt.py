from z3 import Solver, And, Not, Implies, substitute
import subprocess
import pprint

from egraph import EGraph
from variable import (
    HistoryVariable,
    ProphecyVariable,
    ImmutableVariable,
    Capture,
)
from countermodel import CounterModel
from utils import timeout, write_list_to_file, unabstract_out_vmt, Translate
from synthesizer import Synthesizer
from z3_defs import * 


IC3IA = "ic3ia"
CYCLES = 50


class SmtToVmt:
    def __init__(self, all_vars, prop, filename, control_flow=None):
        self.all_vars = all_vars
        self.control_flow = control_flow
        self.history_vars = []
        self.prophecy_vars = []
        self.filename = filename
        self.prop = prop

        self.filename = "out.vmt"
        self.vmt_model = (
            []
        )  # each string in this list is a single sexpr for the vmt model

        self.init_constraints, self.init_sexprs = [], []
        self.trans_constraints, self.trans_sexprs = [], []
        self.aux_trans_constraints, self.aux_trans_sexprs = [], []
        self.aux_init_constraints, self.aux_init_sexprs = [], []
        self.prop_constraints, self.prop_sexprs = [], []

        self.set_constraints()
        self.ic3ia_cex = set()
        self.countermodels = []
        self.cur_cex_steps = 0
        self.cur_model = None
        self.num_proph = 0
        self.used_interpolants = []
        self.invariant = None
        # self.prophic3_bench = ""
        self.proph_axiom_instances = []
        self.axiom_violations = []

    def get_vars(self):
        return list(self.all_vars)

    def set_constraints(self):
        for var in self.all_vars:
            if var.get_init_constraints() is not None:
                self.add_init_constraints(var.get_init_constraints())
            if var.get_trans_constraints() is not None:
                self.add_trans_constraints(var.get_trans_constraints())
        if self.control_flow:
            self.add_trans_constraints([self.control_flow.get_control_flow_predicate()])
        self.add_prop_constraints(self.prop.get_property())

    def run_loop(self, debug=True):
        self.debug = debug
        for count in range(0, CYCLES):
            if self.run_ic3ia():
                print(f"Total cycles needed: {count}")
                print(f"Total Prophecy Variables needed: {self.num_proph}")
                if self.used_interpolants:
                    print(f"Used Interpolants: {self.used_interpolants}")
                return
            else:
                self.check_axiom_instances()
        raise ValueError(f"Used more than {CYCLES} cycles.")

    def run_ic3ia(self):
        print("Running IC3IA...")
        self.build_vmt()
        write_list_to_file("out.vmt", self.vmt_model)
        out = subprocess.run([IC3IA, "-w", self.filename], capture_output=True)
        return self.check_ic3ia_out(out)

    def get_highest_frame(self):
        highest_step_frame = 0
        for v in self.countermodels[-1].violations:
            if highest_step_frame < v.highest_frame:
                highest_step_frame = v.highest_frame
        return highest_step_frame

    def check_ic3ia_out(self, out, interp=None):
        stdout = out.stdout.decode()
        if "counterexample" in stdout:
            cex = stdout.split("search stats:")[0]
            self.ic3ia_cex.add(cex)
            steps = cex.split("step")[1:]
            self.cur_cex_steps = len(steps)
            print(f"ic3ia Length: {len(steps)}")
            ic3ia_countermodel = self.parse_ic3ia_cex(cex)
            return False
        elif "invariant" in stdout:
            print("Proved!")
            self.invariant = stdout.split("search stats:")[0].replace(
                "invariant", "Invariant:"
            )
            print(self.invariant)
            return True
        elif "computing witness" in stdout:
            print("Proved, but no witness")
            return True
        else:
            if "unknown" in stdout and not interp:
                raise ValueError("IC3IA gives 'Unknown'")
            elif "unknown" in stdout and interp:
                print("IC3IA give 'Unknown' for interpolant vmt")
            else:
                raise ValueError("Error in Vmt")

    def parse_ic3ia_cex(self, cex_str):
        cex_str = cex_str.replace("counterexample\n;; step 0\n", "")
        cex_str = cex_str.replace("|Arr|", "Arr")
        sexpr_list = Translate().parse_sexpr_string(cex_str)
        z3_sexpr_list = []
        parser = ParseToZ3(self.all_vars)
        num_steps = self.cur_cex_steps - 1
        for i, sexpr in enumerate(sexpr_list):
            parser.set_step(i)
            z3_sexpr_list.append(parser.parse_sexpr_to_z3(sexpr))
            if i < num_steps:
                axiom_violations_at_step = self.substitute_trans_constraints(self.axiom_violations, i)
                z3_sexpr_list.extend(axiom_violations_at_step)
        self.cur_prop = self.substitute_single_frame_constraints(self.prop_constraints, num_steps)
        solver = Solver()
        new_model = And(z3_sexpr_list)
        new_prop = And(self.cur_prop)
        solver.add(Not(Implies(new_model, new_prop)))
        s = solver.check()
        if str(s) == "unsat":
            raise ValueError("Z3 model cannot be UNSAT")
        self.cur_model = solver.model()
        self.print_bmc_model()


    def build_vmt(self):
        """
        Puts all necessary vmt sexprs into `self.vmt_model`
        """
        self.vmt_model = []
        self.add_preliminary_defs()
        init = self.init_sexprs + self.aux_init_sexprs
        trans = self.trans_sexprs + self.aux_trans_sexprs
        self.add_sexprs_to_vmt(init, "init-conditions", ":init true")
        self.add_sexprs_to_vmt(trans, "trans-conditions", ":trans true")
        self.add_sexprs_to_vmt(self.prop_sexprs, "property", ":invar-property 0")

    def build_vmt_interp(self, i_type, interp):
        self.vmt_model = []
        self.add_preliminary_defs()
        self.add_capture_var_to_model()
        last_hist = self.history_vars[-1]
        last_proph = self.prophecy_vars[-1]
        init = self.init_sexprs
        if i_type == "safe":
            init = init + [Capture().get_init_sexpr()]
            hist_trans = [zi.sexpr() for zi in last_hist.get_safe_interp_trans(interp)]
        else:
            hist_trans = [
                zi.sexpr() for zi in last_hist.get_trigger_interp_trans(interp)
            ]
        trans = (
            self.trans_sexprs
            + hist_trans
            + [t.sexpr() for t in last_proph.get_trans_constraints()]
            + self.get_rest_hist_and_proph_constraint()
            + self.proph_axiom_instances
        )
        self.add_sexprs_to_vmt(init, "init-conditions", ":init true")
        self.add_sexprs_to_vmt(trans, "trans-conditions", ":trans true")
        self.add_sexprs_to_vmt(self.prop_sexprs, "property", ":invar-property 0")

    def get_rest_hist_and_proph_constraint(self):
        sexprs = []
        for p in self.prophecy_vars[:-1]:
            for tc in p.get_trans_constraints():
                sexprs.append(tc.sexpr())
        for h in self.history_vars[:-1]:
            for tc in h.get_trans_constraints():
                sexprs.append(tc.sexpr())
        return sexprs

    def add_preliminary_defs(self):
        for sort in all_sorts:
            self.vmt_model.append(f"(declare-sort {sort.sexpr()} 0)")
        for func in all_funcs:
            self.vmt_model.append(func.sexpr())
        for var in self.all_vars:
            self.vmt_model.append(var.get_def_sexpr())
        self.vmt_model.append("")

    def add_capture_var_to_model(self):
        self.vmt_model.append(Capture().get_def_sexpr())

    def add_sexprs_to_vmt(self, sexprs, func_name, annotation_format):
        self.vmt_model.append(f"(define-fun {func_name} () Bool (!")
        self.vmt_model.append(" (and")
        self.vmt_model.extend(sexprs)
        self.vmt_model.append(f") {annotation_format}))")
        self.vmt_model.append("")

    def add_init_constraints(self, init):
        self.add_constraint_to_list(self.init_constraints, self.init_sexprs, init)

    def add_trans_constraints(self, trans):
        self.add_constraint_to_list(self.trans_constraints, self.trans_sexprs, trans)

    def add_prop_constraints(self, prop):
        self.add_constraint_to_list(self.prop_constraints, self.prop_sexprs, prop)

    def add_aux_init_constraints(self, aux):
        self.add_constraint_to_list(
            self.aux_init_constraints, self.aux_init_sexprs, aux
        )

    def add_aux_trans_constraints(self, aux):
        self.add_constraint_to_list(
            self.aux_trans_constraints, self.aux_trans_sexprs, aux
        )

    def add_constraint_to_list(self, constraint_list, sexpr_list, constraints):
        constraint_list.extend(constraints)
        sexpr_list.extend([constraint.sexpr() for constraint in constraints])

    def add_ic3ia_axiom_violations(self, violations):
        for violation in violations:
            self.debug_print(f"Processing Axiom Violation: {violation}")
            constraint = violation.get_constraint(self.cur_model.decls())
            self.axiom_violations.append(constraint)
            if violation.is_init_violation():
                self.add_init_constraints([constraint])
                self.add_trans_constraints([constraint])
            elif violation.is_trans_violation():
                self.add_trans_constraints([constraint])
            else:
                print("Prophecy Needed")
                auxs = violation.build_auxiliary_variables(self.num_proph)
                for hist, proph, axiom_instance in auxs:
                    self.num_proph += 1
                    if not violation.check_history_kills(hist):
                        print("Trying interpolation")
                        i_type, interp = self.get_top_interpolant(hist)
                        print ("type: {} interp: {}".format(i_type,interp))
                        self.used_interpolants.append(interp)
                        if i_type == "safe":
                            hist.set_safe_interp_trans(interp)
                        else:
                            hist.set_trigger_interp_trans(interp)
                    print ("hist: {}".format(repr(hist)))
                    for tc in hist.trans_constraints:
                        print ("tc: {}".format(tc))
                    self.add_history_var(hist)
                    self.add_prophecy_var(proph)
                    print(f"Axiom Violation with Prophecy: {axiom_instance}")
                    self.add_aux_trans_constraints([axiom_instance])
                    self.add_aux_init_constraints(hist.cap.init_constraints)
                    self.proph_axiom_instances.append(axiom_instance.sexpr())
                return

    def get_top_interpolant(self,hist):
        synth = Synthesizer(
            self.get_all_interpolant_clauses(),
            self.countermodels[-1].model,
            self.all_vars,
            self.get_highest_frame(),
            self.prop,
            hist,
            self.cur_cex_steps,
        )
        return synth.get_top_interpolant()

    def get_all_interpolant_clauses(self):
        interp_clauses = set()
        for cm in self.countermodels:
            interp_clauses = interp_clauses.union(cm.get_interpolant_clauses())
        return interp_clauses

    def add_prophecy_var(self, proph_var):
        self.prophecy_vars.append(proph_var)
        self.all_vars.append(proph_var)
        self.add_aux_trans_constraints(proph_var.get_trans_constraints())
        self.update_property_with_prophecy(proph_var)

    def add_history_var(self, hist_var):
        self.history_vars.append(hist_var)
        self.all_vars.append(hist_var.cap)
        self.all_vars.append(hist_var)
        self.add_aux_trans_constraints(hist_var.get_trans_constraints())

    def update_property_with_prophecy(self, proph):
        new_prop = Implies(proph.get_prop_antecedent(), self.prop_constraints[0])
        self.prop_constraints = [new_prop]
        self.prop_sexprs = [new_prop.sexpr()]

    def get_immutable_vars(self):
        return [var for var in self.all_vars if isinstance(var, ImmutableVariable)]


    def check_axiom_instances(self):
        egraph = EGraph(
            self.cur_model,
            self.cur_prop,
            self.all_vars,
            self.cur_cex_steps,
            self.debug,
        )
        violations = egraph.get_axiom_violations()
        self.countermodels.append(CounterModel(self.cur_model, violations))
        if violations:
            print("Found Axiom Violations")
            self.add_ic3ia_axiom_violations(violations)
        else:
            raise ValueError("No Axiom Violations Found!")

    def substitute_single_frame_constraints(self, constraints, cex_step):
        return [
            substitute(constraint, self.get_subs_for_cex_step(cex_step))
            for constraint in constraints
        ]

    def substitute_trans_constraints(self, constraints, cex_step):
        return [
            substitute(
                substitute(constraint, self.get_subs_for_cex_step(cex_step)),
                self.get_subs_for_next_cex_step(cex_step + 1),
            )
            for constraint in constraints
        ]

    def get_subs_for_cex_step(self, step):
        return [var.make_step_var_sub(step) for var in self.all_vars]

    def get_subs_for_next_cex_step(self, step):
        return [var.make_step_next_var_sub(step) for var in self.all_vars]

    def debug_print(self, s):
        if self.debug:
            print(s)

    def print_bmc_model(self):
        model_dict = {}
        for expr in self.cur_model:
            expr_name = expr.name()
            interp_string = f"{expr_name} = {self.cur_model.get_interp(expr)}"
            frame_num = expr_name.split("_")[-1]
            if not frame_num in model_dict:
                model_dict[frame_num] = []
            model_dict[frame_num].append(interp_string)
        for k in model_dict:
            model_dict[k] = sorted(model_dict[k])

        if self.debug:
            print("Z3 BMC Model:")
            pprint.pprint(model_dict)

    def write_vmt_to_file(self, filename):
        self.build_vmt()
        write_list_to_file(f"./vmt/{filename}", self.vmt_model)

    def __repr__(self):
        return f"Init: {self.init_constraints}\nTrans: {self.trans_constraints}\nProp: {self.prop_constraints}"
