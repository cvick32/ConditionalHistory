from z3 import Const, And, Implies, Or, Not, substitute, Bool, IntNumRef
from copy import copy

from utils import regex_var_matcher


class Variable:
    def __init__(self, var_def, next_var_def):
        self.var_def = var_def
        self.sort_sexpr = self.var_def.sort().sexpr()
        self.name = str(self.var_def)
        self.next_var_def = next_var_def
        self.next_name = str(self.next_var_def)
        self.init_constraints = None
        self.trans_constraints = None
        self.init_z3_constraints = None
        self.trans_z3_constraints = None

    def get_def_sexpr(self):
        return f"(declare-fun {self.name} () {self.sort_sexpr})\n(declare-fun {self.next_name} () {self.sort_sexpr})\n(define-fun .{self.name} () {self.sort_sexpr} (! {self.name} :next {self.next_name}))"

    def get_name(self):
        return self.name

    def get_next_name(self):
        return self.next_name

    def get_smt2_next_name(self):
        return self.name + "1"

    def match_name(self, test_name):
        return test_name == self.name

    def match_next_name(self, test_name):
        return test_name == self.next_name

    def match_step_str(self, step_str):
        return step_str.split("_")[0] == self.name

    def get_init_condition_sexpr(self):
        return None

    def get_trans_condition_sexpr(self):
        return None

    def get_init_constraints(self):
        return None

    def get_trans_constraints(self):
        return None

    def get_prop_antecedent(self):
        return None

    def make_step_var_sub(self, step):
        """
        For translating IC3IA defs to Z3.
        """
        return (self.var_def, Const(f"{self.name}_{step}", self.var_def.sort()))

    def make_step_next_var_sub(self, step):
        """
        For translating IC3IA defs to Z3.
        """
        return (self.next_var_def, Const(f"{self.name}_{step}", self.var_def.sort()))

    def step_var_decl_to_var_sub(self, decl):
        """
        For translating Z3 axiom violations to IC3IA
        """
        frame = str(decl).split("_")[1]
        return (Const(f"{self.name}_{frame}", self.var_def.sort()), self.var_def)

    def make_cur_var_to_next_sub(self):
        return (self.var_def, self.next_var_def)

    def step_var_decl_to_next_var_sub(self, decl):
        """
        For translating Z3 axiom violations to IC3IA
        """
        frame = str(decl).split("_")[1]
        return (Const(f"{self.name}_{frame}", self.var_def.sort()), self.next_var_def)

    def store_z3_constraints(self, subs):
        if self.init_constraints:
            self.init_z3_constraints = [
                substitute(constraint, subs[0]) for constraint in self.init_constraints
            ]
        if self.trans_constraints:
            if not self.trans_z3_constraints:
                self.trans_z3_constraints = []
                self.seen_subs = []
            for sub in subs[1:]:
                if sub not in self.seen_subs:
                    trans = [
                        substitute(constraint, sub)
                        for constraint in self.trans_constraints
                    ]
                    self.trans_z3_constraints.extend(trans)
                    self.seen_subs.append(sub)

    def is_dependent_var(self):
        return False

    def __repr__(self):
        return f"{self.var_def.__repr__()} => {self.next_var_def.__repr__()}"


class StateVariable(Variable):
    def __init__(self, var_name, var_sort, init_value=None):
        var_def = Const(var_name, var_sort)
        next_var_def = Const(f"{var_name}_next", var_sort)
        super().__init__(var_def, next_var_def)
        self.init_constraints = []
        self.trans_constraints = []
        self.dependent_conditionals = []
        self.dependent_var = False
        if init_value is not None:
            self.add_init_value(init_value)

    def add_init_constraint(self, ic):
        self.init_constraints.append(ic)

    def add_init_value(self, val):
        self.init_constraints.append(self.var_def == val)

    def add_trans_constraint(self, tc):
        self.trans_constraints.append(tc == self.next_var_def)

    def add_full_trans_constraint(self, tc, dependent_conditional=None):
        self.trans_constraints.append(tc)
        if dependent_conditional is not None:
            self.set_dependent_var(dependent_conditional)

    def add_ife_trans_constraint(self, if_cond, if_branch, else_branch):
        if else_branch is None:
            self.trans_constraints.append(
                Implies(if_cond, if_branch == self.next_var_def)
            )
        else:
            self.trans_constraints.append(
                And(
                    Implies(if_cond, if_branch == self.next_var_def),
                    Implies(Not(if_cond), else_branch == self.next_var_def),
                )
            )

    def get_init_condition_sexpr(self):
        return f"{[i.sexpr() for i in self.init_constraints]}"

    def sub_and_add_init_constraint(self, ic, var_to_sub):
        self.init_constraints.append(substitute(ic, (var_to_sub, self.var_def)))

    def get_trans_condition_sexpr(self):
        return f"{[t.sexpr() for t in self.trans_constraints]}"

    def get_init_constraints(self):
        return self.init_constraints

    def get_trans_constraints(self):
        return self.trans_constraints

    def match_z3_trans_constraint(self, z3_tc):
        str_z3_tc = str(z3_tc)
        for tc in self.trans_z3_constraints:
            if str_z3_tc == str(tc):
                return True
        return False

    def set_dependent_var(self, if_cond):
        self.dependent_var = True
        self.dependent_conditionals.append(if_cond)

    def is_dependent_var(self):
        return self.dependent_var

    def get_next_var_def(self):
        return self.next_var_def

    def get_dependent_conditionals(self):
        return self.dependent_conditionals

    def __repr__(self):
        return f"State Variable: {self.var_def}\n{self.get_init_condition_sexpr()}\n{self.get_trans_condition_sexpr()}"


class LocalVariable(Variable):
    def __init__(self, var_name, var_sort):
        var_def = Const(var_name, var_sort)
        next_var_def = Const(f"{var_name}_next", var_sort)
        super().__init__(var_def, next_var_def)
        self.init_constraints = []
        self.trans_constraints = []

    def add_init_constraint(self, ic):
        self.init_constraints.append(ic)

    def add_full_trans_constraint(self, tc, dependent_conditional=None):
        self.trans_constraints.append(tc)

    def add_trans_constraint(self, tc):
        self.trans_constraints.append(self.var_def == tc)

    def get_trans_constraints(self):
        return self.trans_constraints

    def get_next_var_def(self):
        return self.var_def

    def __repr__(self):
        return f"Local Variable: {self.var_def} {self.trans_constraints}"


class ImmutableVariable(Variable):
    def __init__(self, var_name, var_sort):
        var_def = Const(var_name, var_sort)
        next_var_def = Const(f"{var_name}_next", var_sort)
        super().__init__(var_def, next_var_def)
        self.init_constraints = []
        self.trans_constraints = [var_def == next_var_def]

    def add_init_constraint(self, ic):
        try:
            if str(ic.decl()) == "==":
                num = None
                if isinstance(ic.arg(0), IntNumRef):
                    num = ic.arg(0).as_long()
                if isinstance(ic.arg(1), IntNumRef):
                    num = ic.arg(1).as_long()
                if num > 50:
                    self.init_constraints.append(self.var_def > 1)
                else:
                    self.init_constraints.append(ic)
            else:
                self.init_constraints.append(ic)
        except:
            self.init_constraints.append(ic)

    def add_init_value(self, val):
        try:
            if val > 50:
                self.init_constraints.append(self.var_def > 1)
            else:
                self.init_constraints.append(self.var_def == val)
        except:
            self.init_constraints.append(self.var_def == val)

    def get_init_constraints(self):
        return self.init_constraints

    def add_full_trans_constraint(self, tc, dependent_conditional=None):
        self.trans_constraints.append(tc)

    def get_trans_condition_sexpr(self):
        return f"{[t.sexpr() for t in self.trans_constraints]}"

    def get_trans_constraints(self):
        return self.trans_constraints

    def __repr__(self):
        return f"Immutable Variable: {self.get_trans_condition_sexpr()}"


class Capture(Variable):
    def __init__(self, hist_var_name):
        name = f"capture{hist_var_name}"
        var_def = Bool(name)
        next_var_def = Bool(f"{name}_next")
        self.name = name
        self.next_name = f"{name}_next"
        super().__init__(var_def, next_var_def)
        self.init_constraints = [Not(var_def)]
        self.trans_constraints = [Implies(var_def, next_var_def)]

    def get_history_antecedent(self):
        return Not(self.var_def)

    def get_trans_sexpr(self):
        return f"(=> {self.name} {self.next_name})"

    def get_trans_constraints(self):
        return self.trans_constraints

    def get_init_sexpr(self):
        return f"(not {self.name})"

    def get_history_consequent_for_capture(self):
        return self.next_var_def

    def get_history_consequent_for_not_capture(self):
        return self.var_def == self.next_var_def


class HistoryVariable(Variable):
    """
    Could keep a list of needed equalities here and
    cycle through if we're not making refinement progress.
    """

    def __init__(
        self,
        var_to_proph,
        needed_equality,
        control_path_exprs,
        pc_var,
        pc_val,
        num_proph,
        proph_next_var,
    ):
        self.var_to_proph = var_to_proph
        name = f"{var_to_proph.name}H{num_proph}"
        var_def = Const(name, var_to_proph.var_def.sort())
        next_var_def = Const(f"{name}_next", var_to_proph.var_def.sort())
        self.cap = Capture(f"{var_to_proph.name}H{num_proph}")
        super().__init__(var_def, next_var_def)
        self.antecedents = []
        self.capture_consequents = []
        self.else_consequents = []
        if proph_next_var:
            self.proph_expr = self.var_to_proph.next_var_def
        else:
            self.proph_expr = self.var_to_proph.var_def
        self.trans_constraints = self.build_trans(
            needed_equality, control_path_exprs, pc_var, pc_val
        )
        self.is_trigger = False

    def build_trans(self, ne, cpes, pc_var, pc_val):
        if cpes:
            cpe_expr = And([cpe[0] == cpe[1] for cpe in cpes])
        else:
            cpe_expr = True
        self.pc_ante = []
        if pc_var is not None and pc_val is not None:
            self.pc_ante = [pc_var.var_def == pc_val]

        self.antecedents = [ne[0] == ne[1], cpe_expr]
        self.capture_consequents = [self.proph_expr == self.next_var_def]
        self.else_consequents = [self.var_def == self.next_var_def]
        self.current_history_cond = And(self.antecedents + self.pc_ante)
        return [
            Implies(
                And(
                    self.antecedents
                    + self.pc_ante
                    + [self.cap.get_history_antecedent()]
                ),
                And(
                    self.capture_consequents[0],
                    self.cap.get_history_consequent_for_capture(),
                ),
            ),
            Implies(
                Not(And(self.antecedents + self.pc_ante)),
                And(
                    self.else_consequents[0],
                    self.cap.get_history_consequent_for_not_capture(),
                ),
            ),
        ]

    def get_trans_constraints(self):
        return self.trans_constraints

    def get_current_history_condition(self):
        return self.current_history_cond

    def set_safe_interp_trans(self, interp):
        new_ante = copy(self.pc_ante)
        new_ante.append(interp)
        new_ante.append(self.cap.get_history_antecedent())
        new_cap_cons = copy(self.capture_consequents)
        new_cap_cons.append(self.cap.get_history_consequent_for_capture())
        new_else_cons = copy(self.else_consequents)
        new_else_cons.append(self.cap.get_history_consequent_for_not_capture())
        self.trans_constraints = [
            Implies(And(new_ante), And(new_cap_cons)),
            Implies(Not(And(new_ante)), And(new_else_cons)),
        ]
        return self.trans_constraints

    def set_trigger_interp_trans(self, interp):
        new_ante = copy(self.pc_ante)
        new_ante.append(interp)
        new_cap_cons = copy(self.capture_consequents)
        new_else_cons = copy(self.else_consequents)
        self.trans_constraints = [
            Implies(And(new_ante), And(new_cap_cons)),
            Implies(Not(And(new_ante)), And(new_else_cons)),
        ]
        self.is_trigger = True
        self.cap.init_constraints = []
        self.cap.trans_constraints = []
        return self.trans_constraints


class ProphecyVariable(Variable):
    def __init__(self, var_to_proph, expr_to_proph, hist_var, num_proph):
        name = f"{var_to_proph.name}P{num_proph}"
        var_def = Const(name, var_to_proph.var_def.sort())
        next_var_def = Const(f"{name}_next", var_to_proph.var_def.sort())
        super().__init__(var_def, next_var_def)
        self.expr_to_proph = expr_to_proph
        self.prop_antecedent = var_def == hist_var.var_def
        self.trans_constraints = [next_var_def == var_def]

    def get_trans_constraints(self):
        return self.trans_constraints

    def get_prop_antecedent(self):
        return self.prop_antecedent

    def get_expr_to_proph(self):
        return self.expr_to_proph

    def get_synthesis_formula(self, model):
        # this is the H value, not sure how to
        #  interpret this now, could be how many
        #  history vars we needed for this prophecy
        synthesis_formula = False
        for i in range(0, 3):  # h=3
            pass
            concrete_val = model.eval(self.expr_to_proph)
            symbolic_hist_val = 0
            # inner_formula = Or(inner_formula, concrete_val == )


class FunctionDef:
    def __init__(self, function_def):
        self.function_def = function_def

    def get_def_sexpr(self):
        return self.function_def.sexpr()


class Property:
    def __init__(self):
        self.antecedents = []
        self.consequents = []

    def get_sexpr(self):
        if self.antecedents:
            return Implies(And(self.antecedents), And(self.consequents)).sexpr()
        else:
            return [c.sexpr() for c in self.consequents]

    def get_property(self):
        if self.antecedents:
            return [Implies(And(self.antecedents), And(self.consequents))]
        else:
            return self.consequents

    def add_antecedent(self, ant):
        self.antecedents.append(ant)

    def add_consequent(self, con):
        self.consequents.append(con)

    def __repr__(self):
        return Implies(And(self.antecedents), And(self.consequents)).sexpr()


class ControlFlow:
    def __init__(self):
        self.control_flow_predicates = []

    def add_control_flow_predicate(self, cfp):
        if str(cfp) not in [str(c) for c in self.control_flow_predicates]:
            self.control_flow_predicates.append(cfp)

    def get_control_flow_predicate(self):
        return Or(self.control_flow_predicates)
