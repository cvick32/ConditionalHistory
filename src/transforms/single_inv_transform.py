from utils import Translate, Sexpr
from variable import (
    StateVariable,
    LocalVariable,
    ImmutableVariable,
    Property,
    ControlFlow,
)
from smt_to_vmt import SmtToVmt
from z3_defs import *


NEXT_VAR_POSTFIX = "1"


class SingleInvariantTransform:
    def __init__(self, los_or_filename):
        if isinstance(los_or_filename, list):
            sexprs = los_or_filename
        else:
            sexprs = Translate().get_sexprs_from_filename(los_or_filename)

        all_vars, safety_var = self.create_vars(sexprs)
        self.process_init_constraint(self.get_init_rule(sexprs), all_vars)
        control_flow = ControlFlow()
        for i, tc in enumerate(self.get_trans_rules(sexprs)):
            (
                predicates,
                control_flow_pred,
                equalities,
            ) = self.get_predicates_and_equalities_for_trans_constraint(tc, all_vars)
            self.process_trans_constraint(
                And(predicates), control_flow_pred, equalities, all_vars
            )
            control_flow.add_control_flow_predicate(control_flow_pred)
            final = i == (len(self.get_trans_rules(sexprs)) - 1)
            self.add_negated_loop_pred_constraint(
                predicates, control_flow_pred, all_vars, final
            )
        start_inv, end_inv = self.get_inv_vars(sexprs)
        inv_vars = start_inv + end_inv
        prop = self.process_prop_constraint(
            self.get_prop_rule(sexprs), all_vars, inv_vars, safety_var
        )
        all_vars = self.remove_next_references(all_vars)
        self.all_vars, self.prop, self.control_flow = all_vars, prop, control_flow

    def get_problem_args(self):
        return self.all_vars, self.prop, self.control_flow

    def get_sort_from_string(self, s):
        if "Array" in s:
            if len(s.replace("Array", "")) == len(s) - 10:  # Array appears twice in def
                return ArrOfArr
            return Arr
        elif "Bool" in s:
            return Bool
        else:
            return Pos

    def get_var_names_and_sorts(self, sexprs):
        return [
            (sexpr.body[0], self.get_sort_from_string(str(sexpr.body[1])))
            for sexpr in sexprs
            if sexpr.head == "declare-var" and "1" != sexpr.body[0][-1]
        ]

    def get_init_rule(self, sexprs):
        return [sexpr for sexpr in sexprs if sexpr.head == "rule"][0]

    def get_trans_rules(self, sexprs):
        return [sexpr for sexpr in sexprs if sexpr.head == "rule"][1:-1]

    def get_prop_rule(self, sexprs):
        return [sexpr for sexpr in sexprs if sexpr.head == "rule"][-1]

    def get_inv_vars(self, sexprs):
        """
        This works because we assume the invariant has been normalized
        """
        transition = self.get_trans_rules(sexprs)[0]
        starting_inv = None
        for conjunct in transition.body[0].body[0].body:
            if conjunct.head == "inv":
                starting_inv = conjunct.body
        ending_inv = transition.body[0].body[1].body
        return starting_inv, ending_inv

    def get_all_ending_inv_vars(self, sexprs):
        transitions = self.get_trans_rules(sexprs)
        ending_inv_set = set()
        for transition in transitions:
            # may fail if transition is not implication
            ending_inv_set = ending_inv_set.union(set(transition.body[0].body[1].body))
        return ending_inv_set

    def get_all_starting_inv_vars(self, sexprs):
        transitions = self.get_trans_rules(sexprs)
        starting_inv_set = set()
        for transition in transitions:
            # may fail if transition is not conjunction
            for conjunct in transition.body[0].body[0].body:
                if conjunct.head == "inv":
                    starting_inv_set = starting_inv_set.union(set(conjunct.body))
        return starting_inv_set

    def is_state_var(self, var_name, ending_invs):
        if var_name + NEXT_VAR_POSTFIX in ending_invs:
            return True
        return False

    def is_imm_var(self, var_name, starting_invs, ending_invs):
        if var_name in starting_invs and not var_name + NEXT_VAR_POSTFIX in ending_invs:
            return True
        return False

    def create_vars(self, sexprs):
        var_names_and_sorts = self.get_var_names_and_sorts(sexprs)
        vars = []
        start = self.get_all_starting_inv_vars(sexprs)
        end = self.get_all_ending_inv_vars(sexprs)
        for var_name, var_sort in var_names_and_sorts:
            if var_name == "Z":
                continue
            if self.is_state_var(var_name, end):
                s = StateVariable(var_name, var_sort)
                vars.append(s)
            elif self.is_imm_var(var_name, start, end):
                i = ImmutableVariable(var_name, var_sort)
                vars.append(i)
            else:
                l = LocalVariable(var_name, var_sort)
                vars.append(l)
        safety_var = ImmutableVariable("Z", Pos)
        vars.append(safety_var)
        return vars, safety_var

    def get_var_from_sexpr(self, sexpr, all_vars):
        var_names = {var.name: var for var in all_vars}
        for b in sexpr.body:
            if b in var_names:
                return var_names[b]

    def check_if_predicate(self, sexpr, all_vars):
        next_var_names = [var.get_smt2_next_name() for var in all_vars]
        if sexpr.head == "=":
            for b in sexpr.body:
                if b in next_var_names:
                    return False
        return True

    def get_equality_var_from_sexpr(self, sexpr, all_vars):
        next_var_names = {var.get_smt2_next_name(): var for var in all_vars}
        for b in sexpr.body:
            if not isinstance(b, Sexpr) and b in next_var_names:
                return next_var_names[b]

    def process_init_constraint(self, ic, all_vars):
        for conjunct in ic.body[0].body[0].body:
            if "inv" in conjunct.head:
                continue
            var = self.get_var_from_sexpr(conjunct, all_vars)
            var.add_init_constraint(parse_sexpr_to_z3(conjunct, all_vars))

    def check_if_ite(self, conjunct, all_vars):
        var_names = {var.name: var for var in all_vars}
        next_var_names = {var.get_smt2_next_name(): var for var in all_vars}
        var_names.update(next_var_names)
        ite_expr = None
        var = None
        if conjunct.head == "=":
            if isinstance(conjunct.body[0], Sexpr) and conjunct.body[0].head == "ite":
                ite_expr = conjunct.body[0]
                var = var_names[conjunct.body[1]]
            elif isinstance(conjunct.body[1], Sexpr) and conjunct.body[1].head == "ite":
                ite_expr = conjunct.body[1]
                var = var_names[conjunct.body[0]]
        return var, ite_expr

    def get_predicates_and_equalities_for_trans_constraint(self, tc, all_vars):
        full_predicate = []
        control_flow_pred = None
        equalities = {}
        for conjunct in tc.body[0].body[0].body:
            if "inv" in conjunct.head:
                continue
            if self.check_if_predicate(conjunct, all_vars):
                var, ite_expr = self.check_if_ite(conjunct, all_vars)
                if conjunct.head == "=" and ite_expr is not None:
                    z3_expr = parse_sexpr_to_z3(ite_expr, all_vars, ite_var=var.var_def)
                else:
                    z3_expr = parse_sexpr_to_z3(conjunct, all_vars)
                if "=" == conjunct.head and "pc" in conjunct.body:
                    control_flow_pred = z3_expr
                else:
                    full_predicate.append(z3_expr)
            else:
                var, ite_expr = self.check_if_ite(conjunct, all_vars)
                var = self.get_equality_var_from_sexpr(conjunct, all_vars)
                if conjunct.head == "=" and ite_expr is not None:
                    equalities[var] = parse_sexpr_to_z3(
                        ite_expr, all_vars, ite_var=var.next_var_def
                    )
                else:
                    equality = parse_sexpr_to_z3(conjunct, all_vars)
                    if equality.arg(0).children() == [] and "_next" in str(
                        equality.arg(0)
                    ):
                        equality = equality.arg(1) == equality.arg(0)
                    equalities[var] = equality
        return full_predicate, control_flow_pred, equalities

    def process_trans_constraint(self, predicate, control_flow, equalities, all_vars):
        pred_expr = And(predicate, control_flow)
        for var in [var for var in all_vars if not isinstance(var, ImmutableVariable)]:
            if var in equalities:
                next_val = equalities[var]
                if str(next_val.decl()) == "And":
                    for nv in next_val.children():
                        if str(nv.decl()) == "Implies":
                            pred = And(nv.arg(0), pred_expr)
                            expr = nv.arg(1)
                        else:
                            pred = pred_expr
                            expr = nv
                        var.add_full_trans_constraint(
                            Implies(pred, expr),
                            dependent_conditional=pred_expr,
                        )
                else:
                    var.add_full_trans_constraint(
                        Implies(pred_expr, next_val),
                        dependent_conditional=pred_expr,
                    )
            else:
                var.add_full_trans_constraint(
                    Implies(pred_expr, var.var_def == var.next_var_def),
                    dependent_conditional=pred_expr,
                )

    def add_negated_loop_pred_constraint(
        self, z3_predicates, control_flow_pred, all_vars, final
    ):
        """
        For every non-immutable variable just say that if the loop
        conditions are not satisfied, the all variables must stay
        the same. This mainly gets us around local variables not being
        set correctly with respect to the loop predicates, forces us
        to make progress through the transistion system.

        Generates constraints like this:

        (let ((a!1 (and (= pc 4) (or (not (> j i)) (not (< i N))))))
          (=> a!1 (= pc pc_next)))
        """
        if not final:
            z3_predicates = [
                p for p in z3_predicates if self.local_var_in_body(p, all_vars)
            ]
        neg_pred = self.create_disjunct_of_negations(z3_predicates)
        if neg_pred is None:
            return

        for var in [var for var in all_vars if not isinstance(var, ImmutableVariable)]:
            next_val = var.var_def == var.next_var_def
            pred = And(control_flow_pred, neg_pred)
            var.add_full_trans_constraint(Implies(pred, next_val))

    def local_var_in_body(self, z3_obj, all_vars):
        var_names = {var.name: var for var in all_vars}
        children = [
            var_names[str(c)] if len(str(c)) == 1 and str(c).isalpha() else None
            for c in z3_obj.children()
        ]
        if len(children) != 2:
            return False
        return isinstance(children[0], LocalVariable) or isinstance(
            children[1], LocalVariable
        )

    def create_disjunct_of_negations(self, preds):
        neg_pred = None
        for pred in preds:
            if neg_pred is None:
                neg_pred = Not(pred)
            else:
                neg_pred = Or(Not(pred), neg_pred)
        return neg_pred

    def process_prop_constraint(self, pc, all_vars, inv_vars, safety_var):
        prop = Property()
        len_prop = len(pc.body[0].body[0].body) - 1
        for i, conjunct in enumerate(pc.body[0].body[0].body):
            if "inv" in conjunct.head:
                continue
            pc_z3 = parse_sexpr_to_z3(
                conjunct, all_vars, bound_vars=inv_vars, safety_var=safety_var
            )
            if not i == len_prop:
                prop.add_antecedent(pc_z3)
            else:
                prop.add_consequent(Not(pc_z3))
        return prop

    def remove_next_references(self, all_vars):
        rmap = defaultdict(list)
        for v in all_vars:
            if isinstance(v,StateVariable):
                for tr in v.trans_constraints:
                    if str(tr.decl()) == "Implies":
                        rhs = tr.arg(1)
                        if str(rhs.decl()) == "==":
                            erhs = rhs.arg(1)
                            if str(erhs) == v.get_next_name():
                                rmap[tr.arg(0)].append((erhs,rhs.arg(0)))
        new_vars = []
        for v in all_vars:
            if isinstance(v,StateVariable) and v.trans_constraints is not None:
                new_trs = []
                for tr in v.trans_constraints:
                    if str(tr.decl()) == "Implies":
                        cond = tr.arg(0)
                        asg = tr.arg(1)
                        if str(asg.decl()) == "==":
                            val = asg.arg(0)
                            var = asg.arg(1)
                            if cond in rmap:
                                subs = rmap[cond].copy()
                                tr = Implies(cond,substitute(val,subs)==var)
                    new_trs.append(tr)
                v.trans_constraints = new_trs
        return all_vars
