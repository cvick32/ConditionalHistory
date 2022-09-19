from variable import (
    HistoryVariable,
    ProphecyVariable,
    ImmutableVariable,
    StateVariable,
)
from z3_defs import substitute, parse_sexpr_to_z3
from z3 import And
from utils import (
    Translate,
    Sexpr,
    match_step_str_to_var,
    run_smt_interpol_from_sexprs,
    ENode,
)
import pprint

CHAR_OFFSET = 65


class Violation:
    def __init__(self, axiom_instance, needed_subs, egraph):
        self.axiom_instance = axiom_instance
        self.needed_subs = needed_subs
        self.control_path = egraph.control_path
        self.used_transitions = egraph.used_transitions
        self.all_vars = egraph.all_vars
        self.props = egraph.props
        self.z3_model = egraph.model
        self.debug = egraph.debug
        self.egraph = egraph
        self.prophecy_vars = []
        self.set_frame_numbers()
        self.proph_next_var = False
        self.interp_clauses = None

    def get_constraint(self, decls):
        self.decls = decls
        if self.is_init_violation():
            return self.sub_init_axiom()
        elif self.is_trans_violation():
            return self.sub_trans_axiom()
        else:
            return None

    def get_synthesis_formula(self, model):
        synthesis_formula = True
        for prophecy_var in self.prophecy_vars:
            synthesis_formula = And(
                synthesis_formula, prophecy_var.get_synthesis_formula(model)
            )

        return synthesis_formula

    def check_for_immutable_var_instance(self):
        if not self.is_init_violation() and not self.is_trans_violation():
            high_enode = ENode(self.highest_frame_expr, [], self.highest_frame_expr)
            for equal_enode in self.egraph.get_enodes_in_equiv_class(high_enode):
                if isinstance(
                    match_step_str_to_var(equal_enode.var_string(), self.all_vars),
                    (ImmutableVariable, ProphecyVariable),
                ):
                    print("Saved a Prophecy Variable by Instantiating with Immutable")
                    self.axiom_instance = substitute(
                        self.axiom_instance,
                        (self.highest_frame_expr, equal_enode.z3_obj),
                    )
                    self.set_frame_numbers()
                    break

    def check_history_kills(self, hist):
        clause = hist.get_current_history_condition()
        for i in range(0, self.highest_frame):
            if not self.check_clause_on_model_and_step(clause, i):
                return False
        return self.check_clause_on_model_and_step(clause, self.highest_frame)

    def check_clause_on_model_and_step(self, clause, step):
        sub_clause = substitute(
            substitute(clause, self.get_subs_for_cex_step(step)),
            self.get_subs_for_next_cex_step(step + 1),
        )
        return self.z3_model.eval(sub_clause)

    def is_init_violation(self):
        return (len(self.frame_numbers) == 1 and 0 in self.frame_numbers) or len(
            self.frame_numbers
        ) == 0

    def is_trans_violation(self):
        return (
            max(self.frame_numbers) - min(self.frame_numbers) == 1
            or max(self.frame_numbers) - min(self.frame_numbers) == 0
        )

    def set_frame_numbers(self):
        self.highest_frame = -1
        self.highest_frame_var = None
        self.frame_numbers = set()
        self._set_frame_numbers_help(self.axiom_instance)

    def _set_frame_numbers_help(self, z3_term):
        children = z3_term.children()
        if children:
            for child in children:
                self._set_frame_numbers_help(child)
        else:
            z3_str = str(z3_term)
            fn = self.get_frame_number(z3_str)
            if fn is not None:
                self.frame_numbers.add(fn)
                if fn > self.highest_frame:
                    self.highest_frame = fn
                    self.highest_frame_expr = z3_term
                    self.highest_frame_var = match_step_str_to_var(
                        z3_str, self.all_vars
                    )

    def get_frame_number(self, var_str):
        if match_step_str_to_var(var_str, self.all_vars):
            if self.is_name_immutable_var(var_str):
                return None
            return int(var_str.split("_")[1])

    def is_name_immutable_var(self, name):
        for ivar in [
            i
            for i in self.all_vars
            if isinstance(i, (ImmutableVariable, ProphecyVariable))
        ]:
            if ivar.match_step_str(name):
                return True
        return False

    def match_name_to_var(self, name):
        for var in self.all_vars:
            if var.match_name(name):
                return var

    def match_next_name_to_var(self, next_name):
        for var in self.all_vars:
            if var.match_next_name(next_name):
                return var

    def sub_init_axiom(self):
        return substitute(self.axiom_instance, self.get_step_var_to_var_subs())

    def sub_trans_axiom(self):
        if len(self.frame_numbers) > 1:
            return substitute(
                self.axiom_instance, self.get_step_var_to_var_subs(self.highest_frame)
            )
        else:
            return substitute(self.axiom_instance, self.get_step_var_to_var_subs())

    def build_auxiliary_variables(self, num_proph):
        equals = self.filter_subs_for_equalities()
        if not equals:
            equal_enode_var_defs = [True, True]  # True == True, no equality to rely on
            yield self.yield_hist_and_proph(equal_enode_var_defs, num_proph)
        for equal_enodes in self.filter_subs_for_equalities():
            equal_enode_var_defs = self.enodes_to_var_defs(equal_enodes)
            if (
                equal_enode_var_defs
            ):  # do not consider where equality needs to be prophed
                yield self.yield_hist_and_proph(equal_enode_var_defs, num_proph)
                num_proph += 1
                return

    def yield_hist_and_proph(self, equal_enode_var_defs, num_proph):
        expr_to_proph = self.highest_frame_expr
        var_to_proph = self.highest_frame_var
        control_path_exprs = self.get_control_path_exprs()
        self.debug_print(f"Variable to prophecy: {var_to_proph}")
        self.debug_print(
            f"Control Path Expr: {control_path_exprs}"
        )  # add control path generator
        self.debug_print(f"Axiom Instance: {self.axiom_instance}")
        self.debug_print(f"Necessary Equality: {equal_enode_var_defs}")
        hist, proph = self.create_proph_and_hist(
            var_to_proph,
            equal_enode_var_defs,
            control_path_exprs,
            expr_to_proph,
            num_proph,
        )
        axiom = substitute(self.axiom_instance, [(expr_to_proph, proph.var_def)])
        self.debug_print(f"Axiom: {axiom}")
        return (hist, proph, substitute(axiom, self.get_step_var_to_var_subs()))

    def create_proph_and_hist(
        self, var_to_proph, equal_enode_var_defs, cpes, expr_to_proph, num_proph
    ):
        proph_frame = str(expr_to_proph).split("_")[1]
        pc_val = self.get_pc_val_from_frame(proph_frame)
        pc_var = self.get_pc_var()
        hist_vars = []
        history = var_to_proph
        for i in range(0, self.length - int(proph_frame)):
            history = HistoryVariable(
                history,
                equal_enode_var_defs,
                cpes,
                pc_var,
                pc_val,
                num_proph,
            )
            hist_vars.append(history)
        prophecy = ProphecyVariable(var_to_proph, expr_to_proph, history, num_proph)
        self.prophecy_vars.append(prophecy)
        return hist_vars, prophecy

    def get_pc_var(self):
        try:
            return {av.get_name(): av for av in self.all_vars}["pc"]
        except Exception as e:
            return None

    def get_pc_val_from_frame(self, frame_num_str):
        for expr in self.z3_model:
            z3_str = str(expr)
            if z3_str in ["ConstArr", "Write", "Read"]:
                continue
            try:
                name, frame = z3_str.split("_")
            except:
                continue
            if name == "pc" and frame == frame_num_str:
                return self.z3_model[expr]
        return None

    def filter_subs_for_equalities(self):
        """
        Yield list of values that must be equal to get
        get current substitution.
        """
        equals = []
        for sub in self.needed_subs:
            for vals in sub.values():
                if len(vals) == 2:
                    equals.append(vals)
                elif len(vals) > 2:
                    # TODO: depend on more than 2 things being equal?
                    # (see note in history variable)
                    raise ValueError("MORE THAN TWO VALUES EQUAL")
        return equals

    def get_step_var_to_var_subs(self, max_frame=None):
        subs = []
        for decl in self.decls:
            decl_str = str(decl)
            if "next" in decl_str:  # TODO
                continue
            var = match_step_str_to_var(decl_str, self.all_vars)
            if var:
                fn = self.get_frame_number(decl_str)
                if max_frame and fn is not None and fn == max_frame:
                    subs.append(var.step_var_decl_to_next_var_sub(decl))
                else:
                    subs.append(var.step_var_decl_to_var_sub(decl))
        return subs

    def get_control_path_exprs(self):
        cp_exprs = set()
        for cp in self.filter_for_dependent_vars():
            var_enodes_0 = self.get_var_enodes_in_control_path(cp[0])
            var_enodes_1 = self.get_var_enodes_in_control_path(cp[1])
            # have to do this part so both branches know about the frames of the other
            var_strings = [v.var_string() for v in var_enodes_0 + var_enodes_1]
            var_defs = [match_step_str_to_var(v, self.all_vars) for v in var_strings]
            frames = {self.get_frame_number(vs) for vs in var_strings}
            frames.discard(None)
            if len(frames) >= 3 or ((max(frames) - min(frames)) > 1):
                break
            sub0 = self.get_single_control_path_sub(var_enodes_0, frames)
            sub1 = self.get_single_control_path_sub(var_enodes_1, frames)
            cp_exprs.add(
                (substitute(cp[0].z3_obj, sub0), substitute(cp[1].z3_obj, sub1))
            )
        return cp_exprs

    def filter_for_dependent_vars(self):
        for cp in self.control_path:
            try:
                if match_step_str_to_var(
                    cp[0].var_string(), self.all_vars
                ).is_dependent_var():
                    yield cp
            except Exception:
                pass

    def get_single_control_path_sub(self, venodes, frames):
        subs = []
        for v in venodes:
            v_str = v.var_string()
            if self.get_frame_number(v_str) == max(frames):
                subs.append(
                    (v.z3_obj, match_step_str_to_var(v_str, self.all_vars).next_var_def)
                )
            else:
                subs.append(
                    (v.z3_obj, match_step_str_to_var(v_str, self.all_vars).var_def)
                )
        return subs

    def get_var_enodes_in_control_path(self, cp):
        if cp.args:
            return self.var_enodes_help(cp.args, [])
        else:
            return [cp]

    def var_enodes_help(self, args, objs):
        for arg in args:
            if arg.args:
                self.var_enodes_help(arg.args, objs)
            else:
                if match_step_str_to_var(arg.var_string(), self.all_vars):
                    objs.append(arg)
        return objs

    def process_enode_as_expr(self, enode, var_defs, frames):
        for arg in enode.args:
            if arg.args:
                self.process_enode_as_expr(arg, var_defs, frames)
            else:
                self.process_enode_as_var(arg, var_defs, frames)

    def process_enode_as_var(self, enode, var_defs, frames):
        var_string = enode.var_string()
        var = match_step_str_to_var(var_string, self.all_vars)
        if var is None:
            return
        var_fn = self.get_frame_number(var_string)
        var_defs.append((var, var_fn))
        if var_fn is not None:
            frames.add(var_fn)

    def enodes_to_var_defs(self, enodes):
        # TODO: really only works if equality fits in a frame, either same or one step
        var_defs = []
        frames = set()
        for enode in enodes:
            if enode.args:
                self.process_enode_as_expr(enode, var_defs, frames)
            else:
                self.process_enode_as_var(enode, var_defs, frames)
        if len(frames) == 1 or len(frames) == 0:
            if self.highest_frame - max(frames) == 1:
                self.proph_next_var = True
            return [var[0].var_def for var in var_defs]
        elif len(frames) == 2 and max(frames) - min(frames) == 1:
            return [
                var[0].next_var_def if var[1] == max(frames) else var[0].var_def
                for var in var_defs
            ]
        else:
            print("Depends on equality that needs to be prophecied...")
            print(
                "Returning dummy values so interpolation can still use the History Var"
            )
            return [var[0].var_def for var in var_defs]

    def get_interpolant_clauses(self):
        if self.interp_clauses is None:
            interpolants_sexprs = self.get_interpolant_sexprs()
            interpolant_str = run_smt_interpol_from_sexprs(interpolants_sexprs)
            if interpolant_str == "SAT":
                return None
            self.all_interpolants = (
                Translate().parse_sexpr_string(interpolant_str)[0].body
            )
            for i in self.all_interpolants:
                i.cleanup_let_statements()
            important_interps = []
            for i in self.all_interpolants[self.highest_frame - 1 :]:
                vmt_interpolant = self.create_vmt_interpolant(i)
                vmt_interpolant.cleanup_let_statements()
                z3_interp = parse_sexpr_to_z3(
                    vmt_interpolant, self.all_vars, ignore_ite=True
                )
                important_interps.append(z3_interp)
            self.interp_clauses = set()
            for z3_interp in important_interps:
                if str(z3_interp.decl()) not in ["And", "Or", "Implies"]:
                    self.interp_clauses.add(z3_interp)
                else:
                    self.preprocess_final_interpolant(z3_interp)
            return self.interp_clauses
        else:
            return self.interp_clauses

    def preprocess_final_interpolant(self, interp):
        for child in interp.children():
            if str(child.decl()) in ["And", "Or", "Implies"]:
                self.preprocess_final_interpolant(child)
            elif self.is_tautology(child):
                continue
            else:
                self.interp_clauses.add(child)

    def is_tautology(self, clause):
        try:
            if str(clause.decl()) in ["<=", "=", ">=", "<", ">"]:
                children = clause.children()
                return str(children[0]) == str(children[1])
            else:
                return False
        except Exception as e:
            print(e)
            return False

    def get_all_interpolants(self):
        return self.all_interpolants

    def create_vmt_interpolant(self, int_sexp):
        """
        turn interpolant from (<= '0' (+ 'j_2' (select 'a_2' 'i_2')))
        to (<= '0' (= 'j' (Read 'a' 'i')))
        """
        frames = set()
        var_strs = set()
        self.update_frames_from_interpolant_sexpr(int_sexp, frames, var_strs)
        for step_var in var_strs:
            var, frame = step_var.split("_")
            frame_num = int(frame)
            if len(frames) == 1:
                int_sexp.replace_all_in_body(step_var, var)
            elif len(frames) == 2:
                if frame_num == max(frames):
                    int_sexp.replace_all_in_body(step_var, f"{var}_next")
                else:
                    int_sexp.replace_all_in_body(step_var, var)
            else:
                raise ValueError("Interpolant shouldn't have more than two time steps")
        return int_sexp

    def update_frames_from_interpolant_sexpr(self, int_sexp, frames, var_strs):
        if isinstance(int_sexp, Sexpr):
            self.update_frames_from_interpolant_sexpr(int_sexp.head, frames, var_strs)
            if int_sexp.body:
                for b in int_sexp.body:
                    self.update_frames_from_interpolant_sexpr(b, frames, var_strs)
                    if isinstance(b, str) and match_step_str_to_var(b, self.all_vars):
                        var_strs.add(b)
                        frames.add(int(b.split("_")[-1]))
        elif match_step_str_to_var(int_sexp, self.all_vars):
            var_strs.add(int_sexp)
            frames.add(int(int_sexp.split("_")[-1]))

    def get_interpolant_sexprs(self):
        starting_sexprs = self.starting_interpolants_sexprs()
        def_sexprs = self.get_def_interpolant_sexprs()
        assert_sexprs, interp_list = self.get_interpolant_asserts()
        ending_sexprs = self.ending_interpolants_sexprs(interp_list)
        return starting_sexprs + def_sexprs + assert_sexprs + ending_sexprs

    def get_def_interpolant_sexprs(self):
        sexprs = []
        for defn in self.z3_model:
            if str(defn) not in ["Write", "Read", "ConstArr"]:  # TODO
                def_sexpr = Translate().parse_sexpr_string(defn.sexpr())[0]
                def_sexpr.replace_all_in_current_body(
                    "Arr", Sexpr("Array", ["Int", "Int"])
                )
                sexprs.append(def_sexpr)
        for sexpr in Translate().parse_sexpr_string(self.z3_model.sexpr()):
            if sexpr.head == "declare-fun":
                sexpr.replace_all_in_current_body("Arr", Sexpr("Array", ["Int", "Int"]))
                sexprs.append(sexpr)
        return sexprs

    def starting_interpolants_sexprs(self):
        option1 = Sexpr("set-option", [":produce-proofs", "true"])
        option2 = Sexpr("set-option", [":interpolant-check-mode", "true"])
        logic = Sexpr("set-logic", ["QF_ALIA"])
        return [option1, option2, logic]

    def get_interpolant_asserts(self):
        asserts = []
        interp_names = []
        step_to_var = self.get_step_var()
        sorted_steps = sorted(step_to_var, key=lambda x: int(x))
        for step in sorted_steps:
            and_sexpr = Sexpr(head="and")
            interp_name = chr(int(step) + CHAR_OFFSET)
            interp_names.append(interp_name)
            inner_sexpr = Sexpr("!", [and_sexpr, ":named", interp_name])
            assert_sexpr = Sexpr("assert", [inner_sexpr])
            for var in step_to_var[step]:
                if step == "0":
                    initial_sexprs = self.get_initial_sexprs(var)
                    and_sexpr.extend_body(initial_sexprs)
                if step != sorted_steps[-1]:
                    trans_sexpr = self.get_trans_sexpr(var, step)
                    trans_sexpr.cleanup_let_statements()
                    for impl in trans_sexpr.body:
                        if isinstance(impl, Sexpr):
                            impl.remove_nested_single_ands()
                    and_sexpr.add_body(trans_sexpr)
            if step == sorted_steps[-1]:
                prop_sexpr_list = self.get_prop_sexpr_list()
                and_sexpr.extend_body(prop_sexpr_list)
            assert_sexpr.replace_heads_in_all_body("Write", "store")
            assert_sexpr.replace_heads_in_all_body("Read", "select")
            assert_sexpr.cleanup_let_statements()
            asserts.append(assert_sexpr)
        return asserts, interp_names

    def get_initial_sexprs(self, z3_var):
        init_sexprs = []
        str_z3_var = str(z3_var)
        val = str(self.z3_model[z3_var])
        if "-" in val:  # negative number
            val = Sexpr("-", [val.replace("-", "")])
        elif val == "False":
            return [Sexpr("not", [str_z3_var])]
        elif val == "True":
            return [str_z3_var]
        elif self.z3_model[z3_var].sort().name() == "Arr":
            for var_def in self.all_vars:
                if var_def.match_step_str(str_z3_var):
                    if var_def.init_constraints is not []:
                        for ic in var_def.init_constraints:
                            sexpr = Translate().parse_sexpr_string(ic.sexpr())[0]
                            sexpr.body[0] = sexpr.body[0] + "_0"
                            sexpr.replace_all_in_body(
                                sexpr.body[1],
                                Sexpr(
                                    body=[
                                        Sexpr(
                                            "as",
                                            ["const", Sexpr("Array", ["Int", "Int"])],
                                        ),
                                        sexpr.body[1].body[0],  # number
                                    ]
                                ),
                            )
                            init_sexprs.append(sexpr)
        init_sexprs.append(Sexpr("=", [str_z3_var, val]))
        return init_sexprs

    def get_trans_sexpr(self, var_expr, step):
        if self.is_imm_var(var_expr):
            var_sexpr = self.create_imm_var_sexpr(var_expr, int(step))
        elif self.is_pc_var(var_expr):
            var_sexpr = self.create_pc_var_sexpr(var_expr)
        else:
            # var_sexpr = self.create_state_var_sexpr(var_expr)
            cur_subs = self.get_subs_for_cex_step(int(step))
            next_subs = self.get_subs_for_next_cex_step(int(step) + 1)
            for var in self.all_vars:
                if var.match_step_str(str(var_expr)):
                    try:
                        tc = [
                            substitute(substitute(tc, cur_subs), next_subs)
                            for tc in var.get_trans_constraints()
                        ]
                    except:
                        breakpoint()
                    if len(tc) > 1:
                        tc = And(tc)
                    else:
                        tc = tc[0]
                    var_sexpr = Translate().parse_sexpr_string(tc.sexpr())[0]
                    break
        return var_sexpr

    def get_prop_sexpr_list(self):
        top_level_implies = self.props[0].arg(0)
        prop_sexpr_list = []
        antes, consequent = self.get_prop_sexpr_help(top_level_implies)
        for ante in antes:
            prop_sexpr_list.append(Translate().parse_sexpr_string(ante)[0])
        prop_sexpr_list.append(Translate().parse_sexpr_string(consequent)[0])
        return prop_sexpr_list

    def get_prop_sexpr_help(self, impl):
        ante = []
        if str(impl.arg(1).decl()) == "Implies":
            ante, prop_consequent = self.get_prop_sexpr_help(impl.arg(1))
        else:
            prop_consequent = impl.arg(1).arg(0).arg(0).sexpr()
        ante_list = [impl.arg(0).sexpr()]
        ante_list.extend(ante)
        return ante_list, prop_consequent

    def is_imm_var(self, var_step_str):
        return self.is_var_type(var_step_str, ImmutableVariable) or self.is_var_type(
            var_step_str, ProphecyVariable
        )

    def is_pc_var(self, var):
        return "pc" == str(var).split("_")[0]

    def is_state_var(self, var_step_str):
        return self.is_var_type(var_step_str, StateVariable)

    def is_var_type(self, var_step_str, var_type):
        for var in self.all_vars:
            if var.match_step_str(str(var_step_str)):
                if isinstance(var, var_type):
                    return True
        return False

    def create_imm_var_sexpr(self, var_expr, step_num):
        next_var_str = (
            f"{str(var_expr).split('_')[0]}_{int(str(var_expr).split('_')[1]) + 1}"
        )
        return Sexpr("=", [str(var_expr), next_var_str])

    def create_pc_var_sexpr(self, var_expr):
        val = str(self.z3_model[var_expr])
        return Sexpr("=", [str(var_expr), val])

    # def create_state_var_sexpr(self, var_expr):
    #     str_var_expr = str(var_expr)
    #     # for trans in self.used_transitions:
    #     #     next_var_expr = trans.arg(1)
    #     #     arg0 = str(next_var_expr.arg(0))
    #     #     arg1 = str(next_var_expr.arg(1))
    #     #     next_var_str = (
    #     #         f"{str(var_expr).split('_')[0]}_{int(str(var_expr).split('_')[1]) + 1}"
    #     #     )
    #     #     if str_var_expr == arg1:
    #     #         st = trans.arg(1).sexpr()
    #     #         parsed = Translate().parse_sexpr_string(st)[0]
    #     #         parsed.cleanup_let_statements()
    #     #         return parsed
    #     # return Sexpr("=", [str_var_expr, self.z3_model[var_expr]])

    def get_step_var(self):
        step_to_var = {}
        for expr in self.z3_model:
            step = str(expr).split("_")
            if not len(step) == 2:
                continue
            else:
                step = step[1]
                if not step in step_to_var:
                    step_to_var[step] = [expr]
                else:
                    step_to_var[step].append(expr)
        return step_to_var

    def ending_interpolants_sexprs(self, interp_list):
        check_sat = Sexpr("check-sat")
        get_interps = Sexpr("get-interpolants", interp_list)
        return [check_sat, get_interps]

    def debug_print(self, s):
        if self.debug:
            print(s)

    def get_subs_for_cex_step(self, step):
        return [var.make_step_var_sub(step) for var in self.all_vars]

    def get_subs_for_next_cex_step(self, step):
        return [var.make_step_next_var_sub(step) for var in self.all_vars]

    def __repr__(self):
        return f"Axiom: {self.axiom_instance}\nNeeded Subs: {self.needed_subs}\n\nControl Path:{self.control_path}"
