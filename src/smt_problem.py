import pprint
import sys
from io import StringIO

from variable import (
    StateVariable,
    ImmutableVariable,
    LocalVariable,
    Property,
)
from z3_defs import *
from utils import Translate


class SmtProblem:
    def __init__(self, smt_string):
        self.sexprs = Translate().parse_sexpr_string(smt_string)
        self.var_names_and_sorts = self.get_var_names_and_sorts()
        self.var_names = [v[0] for v in self.var_names_and_sorts]
        self.rel_names = self.get_rel_names()
        self.var_name_to_var = {}
        # looks like there's always 3 'rules' in the benchmarks
        (
            self.init_constraint,
            self.trans_constraint,
            self.prop_constraint,
        ) = self.get_constraint_bodies()
        self.var_to_next = dict(self.get_trans_inv_vars())
        self.non_safety_imm_var_names = []
        self.state_vars, self.local_vars, self.immutable_vars = self.create_variables()
        self.safety_var = ImmutableVariable("Z", Pos)
        self.immutable_vars.append(self.safety_var)
        self.all_vars = self.state_vars + self.local_vars + self.immutable_vars
        self.prop = Property()
        self.process_init_constraint()
        self.process_trans_constraint()
        self.process_prop_constraint()

    def process_init_constraint(self):
        if self.init_constraint.head == "=>":
            if self.init_constraint.body[0].head == "and":
                for conjunct in self.init_constraint.body[0].body:
                    self.process_antecendent_init_constraint(conjunct)
            else:
                self.process_antecendent_init_constraint(self.init_constraint.body[0])
        for init, inv in zip(self.get_init_inv(), self.get_prop_inv()):
            if init not in self.var_names:
                if not isinstance(init, str) and init.head is None:
                    if "as" in str(init.body[0].head):
                        init.head = "Constarr"
                    else:
                        raise Exception("Double paren is not Constarr")
                inv_var = self.var_name_to_var[inv]
                inv_var.add_init_value(parse_sexpr_to_z3(init, list(self.all_vars)))
            elif self.var_name_to_var[init] != self.var_name_to_var[inv]:
                init_var = self.var_name_to_var[init]
                inv_var = self.var_name_to_var[inv]
                for init_constraint in init_var.get_init_constraints():
                    inv_var.sub_and_add_init_constraint(
                        init_constraint, init_var.var_def
                    )

    def get_all_vars(self):
        return list(self.all_vars)

    def process_antecendent_init_constraint(self, aic):
        var = self.get_var_for_constraint(aic)
        var.add_init_constraint(parse_sexpr_to_z3(aic, list(self.all_vars)))

    def process_trans_constraint(self):
        for conjunct in self.trans_constraint.body[0].body:
            if not "inv" in conjunct.head:
                head = conjunct.head
                if head == "or":
                    var = self.get_var_for_constraint(conjunct.body[0])
                    var.add_full_trans_constraint(z3_expr)
                elif head == "=":
                    self.process_trans_equality(conjunct)
                else:
                    z3_expr = parse_sexpr_to_z3(conjunct, list(self.all_vars))
                    var = self.get_var_for_constraint(conjunct)
                    var.add_full_trans_constraint(z3_expr)

    def process_trans_equality(self, conjunct):
        var = self.get_var_for_constraint(conjunct)
        v, expr = self.get_next_var(conjunct.body)
        if (
            not isinstance(expr, str) and expr.head == "ite"
        ):  # only going to work for top-level if:
            z3_expr = parse_sexpr_to_z3(
                expr, list(self.all_vars), ite_var=var.get_next_var_def()
            )
            var.add_full_trans_constraint(z3_expr)
            # var.set_dependent_var(self.get_if_cond(z3_expr))
        else:
            z3_expr = parse_sexpr_to_z3(expr, list(self.all_vars))
            var.add_trans_constraint(z3_expr)

    def process_prop_constraint(self):
        """
        Relying on the property we want being the last conjunct instead
         of it always being the one with Not at the head
        (dont even know if these are always in order)
        """
        inv_vars = self.get_prop_inv()
        for i, conjunct in enumerate(self.prop_constraint.body[0].body):
            if not "inv" in conjunct.head:
                pc = parse_sexpr_to_z3(
                    conjunct,
                    list(self.all_vars),
                    bound_vars=inv_vars,
                    safety_var=self.safety_var,
                )
                if not i == len(self.prop_constraint.body[0].body) - 1:
                    self.prop.add_antecedent(pc)
                else:
                    self.prop.add_consequent(Not(pc))

    def get_trans_inv_vars(self):
        starting_inv = None
        for conjunct in self.trans_constraint.body[0].body:
            if "inv" in conjunct.head:
                starting_inv = conjunct.body
                break  # only 1 inv
        final_inv = self.trans_constraint.body[1].body
        return zip(starting_inv, final_inv)

    def get_prop_inv(self):
        for conjunct in self.prop_constraint.body[0].body:
            if "inv" in conjunct.head:
                return conjunct.body

    def get_init_inv(self):
        if self.init_constraint.head == "=>":
            # brittle
            return self.init_constraint.body[1].body
        else:
            return self.init_constraint.body

    def get_var_for_constraint(self, c):
        for b in c.body:
            if b in self.var_names:
                return self.var_name_to_var[b]

    def get_if_cond(self, ite_expr):
        """
        This selects the if cond from an ite_expr:
        And(Implies(____,..), Implies(Not(...).....))
        """
        return ite_expr.children()[0].children()[0]

    def get_next_var(self, args):
        if args[0] in self.var_names:
            return (args[0], args[1])
        else:
            return (args[1], args[0])

    def get_all_trans_equality_exprs(self):
        trans_equality_expr = []
        for conjunct in self.trans_constraint.body[0].body:
            if conjunct.head == "=":
                trans_equality_expr.append(conjunct.body[0])
                trans_equality_expr.append(conjunct.body[1])
        return trans_equality_expr

    def create_variables(self):
        state_vars = []
        local_vars = []
        immutable_vars = []
        for var_name_and_sort in self.var_names_and_sorts:
            name, sort = var_name_and_sort
            if name in self.var_to_next:
                if name in self.var_to_next.values():
                    i = ImmutableVariable(name, sort)
                    self.var_name_to_var[name] = i
                    self.var_name_to_var[name + "1"] = i
                    immutable_vars.append(i)
                    self.non_safety_imm_var_names.append(name)
                else:
                    s = StateVariable(name, sort, None)
                    self.var_name_to_var[name] = s
                    self.var_name_to_var[self.var_to_next[name]] = s
                    state_vars.append(s)
            elif self.var_has_init_constraint(name):
                i = ImmutableVariable(name, sort)
                self.var_name_to_var[name] = i
                self.var_name_to_var[name + "1"] = i
                immutable_vars.append(i)
                self.non_safety_imm_var_names.append(name)
            elif not name in self.var_to_next.values():
                l = LocalVariable(name, sort)
                self.var_name_to_var[name] = l
                local_vars.append(l)
        return state_vars, local_vars, immutable_vars

    def var_has_init_constraint(self, var_name):
        if self.init_constraint.head == "=>":
            if self.init_constraint.body[0].head == "and":
                for conjunct in self.init_constraint.body[0].body:
                    if var_name in conjunct.body:
                        return True
            else:
                if var_name in self.init_constraint.body[0].body:
                    return True

    def get_var_names_and_sorts(self):
        return [
            (sexpr.body[0], self.get_sort_from_string(str(sexpr.body[1])))
            for sexpr in self.sexprs
            if sexpr.head == "declare-var"
        ]

    def get_sort_from_string(self, s):
        if "Array" in s:
            return Arr
        elif "Bool" in s:
            return Bool
        else:
            return Pos

    def get_rel_names(self):
        return [sexpr.body[0] for sexpr in self.sexprs if sexpr.head == "declare-rel"]

    def get_constraint_bodies(self):
        return [sexpr.body[0] for sexpr in self.sexprs if sexpr.head == "rule"]

    def __repr__(self):
        return f"{self.var_names_and_sorts}\n{self.rel_names}\n{self.init_constraint}\n{self.trans_constraint}\n{self.prop_constraint}"
