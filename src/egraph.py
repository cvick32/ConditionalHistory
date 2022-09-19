from collections import defaultdict
import copy
import itertools
from z3 import *
from functools import lru_cache

from utils import match_step_str_to_var, ENode

from array_axioms import ARRAY_AXIOMS, V, L, Z, A_ax
from violation import Violation
from variable import ImmutableVariable, ProphecyVariable


class EGraph:
    def __init__(self, z3_model, exprs, props, all_vars, cur_cex_steps, debug):
        self.enode_to_id_class = {}
        self.id_class_to_enodes = defaultdict(list)
        self.model = z3_model
        self.exprs = exprs
        self.props = props
        self.all_vars = all_vars
        self.cur_cex_steps = cur_cex_steps
        self.axioms = ARRAY_AXIOMS
        self.match_against_enodes = []
        self.control_path = set()
        self.violations = []
        self.seen_subs = []
        self.z3_expr_to_id_memo = {}
        self.imm_var_to_id = {}
        self.debug = debug

        self.constarr_terms = []
        self.constarr_term_set = set([])
        self.write_terms = []
        self.write_term_set = set([])
        self.index_terms = []
        self.index_term_set = set([])
        self.used_transitions = []
        for expr in exprs:
            self.add_to_egraph(expr)
        for prop in props:
            self.add_to_egraph(prop)
        self.enodes = [e for e in self.enode_to_id_class.keys()]
        self.set_match_term()

    def add_to_egraph(self, z3_def):
        head = self.get_head_from_def(z3_def)
        args = self.get_args_from_def(z3_def)
        id_num = self.get_id_for_cur_def(z3_def)
        enode = ENode(head, args, z3_def)
        self.enode_to_id_class[enode] = id_num
        if enode not in self.id_class_to_enodes[id_num]:
            self.id_class_to_enodes[id_num].append(enode)
        head_str = str(head)
        if head_str == "Write":
            if z3_def not in self.write_term_set:
                self.write_term_set.add(z3_def)
                self.write_terms.append(z3_def)
                self.add_index_term(args[1])
        elif head_str == "Read":
            self.add_index_term(args[1])
        elif head_str == "ConstArr":
            if z3_def not in self.constarr_term_set:
                self.constarr_term_set.add(z3_def)
                self.constarr_terms.append(z3_def)
        return enode
    
    def check_violated(self, violated):
        s = Solver()
        flags = []
        cnstrs = list(self.exprs) + [Not(And(self.props))]
        for idx, exp in enumerate(violated):
            flag = Const("$fl{}".format(idx), BoolSort())
            flags.append(flag)
            cnstrs.append(Implies(flag, exp))
        cond = And(cnstrs)
        s.add(cond)
        check = s.check(flags)
        if str(check) == "unsat":
            used = []
            core = s.unsat_core()
            for fl, exp in zip(flags, violated):
                if fl in core:
                    used.append(exp)
            return used
        else:
            self.model = s.model()
            return None

    def add_index_term(self, node):
        z3_def = node.z3_obj
        if z3_def not in self.index_term_set:
            self.index_term_set.add(z3_def)
            self.index_terms.append(z3_def)
    @lru_cache
    def get_id_for_cur_def(self, z3_def):
        cur_z3_expr = z3_def
        cur_id = z3_def.get_id()
        while True:
            try:
                return self.model[cur_z3_expr].get_id()
            except Exception:
                new_z3_expr = self.model.eval(cur_z3_expr)
                new_z3_id = new_z3_expr.get_id()
            if cur_id == new_z3_id:
                return cur_id
            else:
                cur_id = new_z3_id
                cur_z3_expr = new_z3_expr
        return cur_id

    def get_head_from_def(self, z3_def):
        if z3_def.num_args():
            return z3_def.decl()
        else:
            return z3_def

    def get_args_from_def(self, z3_def):
        args = []
        for i in range(0, z3_def.num_args()):
            cur_arg = z3_def.arg(i)
            arg_enode = self.add_to_egraph(cur_arg)
            args.append(arg_enode)
        return args

    def get_args(self, ax):
        args = []
        for i in range(0, ax.num_args()):
            args.append(ax.arg(i))
        return args

    def get_args_from_def_set_match(self, z3_def):
        args = []
        for i in range(0, z3_def.num_args()):
            cur_arg = z3_def.arg(i)
            arg_enode = self.push_on_match_term_stack_help(cur_arg)
            args.append(arg_enode)
        return args

    def push_on_match_term_stack(self, z3_expr_list, prop=False):
        self.new_match = []
        for z3_expr in z3_expr_list:
            self.push_on_match_term_stack_help(z3_expr)
        if prop:
            inner_prop = z3_expr_list[0].children()[0].children()[1]  # Implies, RHS
            for var in self.get_vars_from_z3_expr(inner_prop):
                if var.is_dependent_var():
                    for trans in self.used_transitions:
                        if var.name not in str(trans.children()[-1]):
                            # if var isn't in rhs of transition
                            continue
                        if var.match_z3_trans_constraint(trans):
                            self.push_on_match_term_stack_help(trans.children()[1])
        self.match_against_enodes.append(self.new_match)

    def push_on_match_term_stack_help(self, z3_def):
        id_num = self.get_id_for_cur_def(z3_def)
        head = self.get_head_from_def(z3_def)
        args = self.get_args_from_def_set_match(z3_def)
        enode = ENode(head, args, z3_def)
        var = match_step_str_to_var(str(head), self.all_vars)
        self.enode_to_id_class[enode] = id_num
        if enode not in self.id_class_to_enodes[id_num]:
            self.id_class_to_enodes[id_num].append(enode)
        if enode not in self.new_match:
            self.new_match.append(enode)
        return enode

    def set_match_term(self):
        self.violations = []
        self.match_against_enodes = []
        self.push_on_match_term_stack(self.props, prop=True)

    def get_axiom_violations(self, needed_subs=[]):
        violated = []
        while True:
            new_violated = []
            for constarr in self.constarr_terms:
                val = self.get_args_from_def(constarr)[0].z3_obj
                for idx in self.index_terms:
                    axiom = substitute(self.axioms[0].z3_def, [(V, val), (L, idx)])
                    if not self.model.eval(axiom):
                        new_violated.append(axiom)
            for write in self.write_terms:
                arr = self.get_args_from_def(write)[0].z3_obj
                wid = self.get_args_from_def(write)[1].z3_obj
                val = self.get_args_from_def(write)[2].z3_obj
                axiom = substitute(
                    self.axioms[1].z3_def, [(A_ax, arr), (V, val), (L, wid)]
                )
                if not self.model.eval(axiom):
                    new_violated.append(axiom)
                for idx in self.index_terms:
                    axiom = substitute(
                        self.axioms[2].z3_def,
                        [(A_ax, arr), (V, val), (L, wid), (Z, idx)],
                    )
                    if not self.model.eval(axiom):
                        new_violated.append(axiom)
            if len(new_violated) == 0:
                print("no new violations")
                exit(1)
                break
            violated.extend(new_violated)
            used = self.check_violated(violated)
            if used is not None:
                for thing in used:
                    print("violation: {}".format(thing))
                break
        for axiom in used:
            self.violations.append(
                Violation(
                    axiom,
                    [],
                    self,
                )
            )
        return self.violations

    def match_axiom(self, axiom, match_term, cur_sub, needed_subs):
        axiom_violations = []
        tested = []
        for sub in self.match_term(match_term, cur_sub):
            if not sub or not all(sub.values()) or sub in self.seen_subs:
                continue
            self.seen_subs.append(sub)
            subs = self.get_sub_from_sub_list(sub)
            substitution = substitute(axiom.z3_def, subs)
            self.debug_print(f"Full Sub: {sub}")
            if not self.eval_to_bool(substitution):
                self.debug_print(f"AXIOM VIOLATION: {substitution}")
                needed_subs.append(sub)
                axiom_violations.append(Violation(substitution, needed_subs, self))
                return axiom_violations
            else:
                self.debug_print(f"Valid Axiom Instansiation: {substitution}")
                if not axiom.recur_term == None:
                    recur_sub = substitute(axiom.recur_term, subs)
                    if recur_sub.children():
                        self.push_on_match_term_stack([recur_sub])
                        needed_subs.append(sub)
                        self.get_axiom_violations(needed_subs)
        return axiom_violations

    def eval_to_bool(self, expr):
        cur_expr = expr
        while not (str(cur_expr) == "True" or str(cur_expr) == "False"):
            cur_expr = self.model.eval(cur_expr)
        return cur_expr

    def get_sub_from_sub_list(self, sub):
        ret_sub = []
        for x in sub:
            ret_sub.append((x, sub[x][0].z3_obj))
            # new_sub = self.find_immutable_term(sub, x)
            # if new_sub is not None:
            #     ret_sub.append(new_sub)
            # else:
            #     ret_sub.append((x, sub[x][0].z3_obj))
        return ret_sub

    def find_immutable_term(self, sub, x):
        for potential_sub in sub[x]:
            if (
                isinstance(
                    match_step_str_to_var(str(potential_sub.z3_obj), self.all_vars),
                    (ImmutableVariable, ProphecyVariable),
                )
                and not potential_sub.z3_obj.children()
            ):
                return (x, potential_sub.z3_obj)
            eval_res = self.model.eval(potential_sub.z3_obj)
            enode = ENode(eval_res, [], eval_res)
            if enode in self.enode_to_id_class:
                imm_var = self.get_immutable_var_in_eclass(enode)
                if imm_var:
                    potential_sub = ENode(imm_var.z3_obj, [], imm_var.z3_obj)
            elif potential_sub.z3_obj.children():
                # currently only goes down to a depth of 1
                for i, child in enumerate(potential_sub.z3_obj.children()):
                    eval_res = self.model.eval(child)
                    enode = ENode(eval_res, [], eval_res)
                    if enode not in self.enode_to_id_class:
                        continue
                    imm_var = self.get_immutable_var_in_eclass(enode)
                    if imm_var:
                        print(potential_sub)
                        args = potential_sub.args
                        args[i] = imm_var.z3_obj
                        potential_sub = ENode(
                            potential_sub.head,
                            args,
                            substitute(potential_sub.z3_obj, (child, imm_var.z3_obj)),
                        )

    def match_term(self, t, sub):
        func, args = self.get_func_and_args_from_term(t)
        seen = []
        for enode in self.get_enodes_matching_head(func):
            for phi in self.match_list(args, enode.args, sub):
                if not phi in seen:
                    seen.append(phi)
                    yield phi

    def match_list(self, args, enode_args, sub):
        if len(args) == 0:
            yield sub
        else:
            if enode_args:
                for phi in self.match(args[0], enode_args[0], sub):
                    for psi in self.match_list(args[1:], enode_args[1:], phi):
                        yield psi

    def match(self, t, enode, sub):
        if t.num_args() == 0:
            yield self.get_sub_for_single_term(t, enode, sub)
        else:
            func, args = self.get_func_and_args_from_term(t)
            for en in self.get_equiv_enodes_with_matching_head(enode, func):
                self.debug_print(f"previous enode: {enode}")
                self.debug_print(f"enode matching head: {en}")
                for phi in self.match_list(args, en.args, sub):
                    if phi:
                        # required enode be equal to the matching head en
                        self.control_path.add((enode, en))
                        yield phi
                    else:
                        continue

    def get_sub_for_single_term(self, t, enode, sub):
        self.debug_print(f"get_sub: {t} {sub} {enode}")
        if t not in sub.keys():
            new_sub = dict(sub)
            new_sub[t] = [enode]
            return new_sub
        if self.enode_to_id_class[enode] == self.enode_to_id_class[sub[t][0]]:
            # check if enode is in e-class of current sub for t
            # store fact that sub is dependent being in eclass of t
            # by appending to the list of matches
            new_sub = dict(sub)
            new_list = list(new_sub[t])
            new_list.append(enode)
            new_sub[t] = new_list
            return new_sub
        else:
            return

    def get_immutable_var_in_eclass(self, enode):
        if isinstance(
            match_step_str_to_var(enode.var_string(), self.all_vars), ImmutableVariable
        ):
            return enode
        for en in self.get_enodes_in_equiv_class(enode):
            if isinstance(
                match_step_str_to_var(en.var_string(), self.all_vars), ImmutableVariable
            ):
                return en

    def get_enodes_matching_head(self, head):
        str_head = str(head)
        for enode in self.match_against_enodes[-1]:
            if str(enode.head) == str_head:
                yield enode

    def get_equiv_enodes_with_matching_head(self, enode, head):
        str_head = str(head)
        for en in self.get_enodes_in_equiv_class(enode):
            if str(en.head) == str_head:
                yield en

    def get_enodes_in_equiv_class(self, enode):
        class_id = self.enode_to_id_class[enode]
        return self.id_class_to_enodes[class_id]

    def get_func_and_args_from_term(self, t):
        return self.get_head_from_def(t), self.get_args(t)

    def get_vars_from_z3_expr(self, z3_expr):
        while str(z3_expr.decl()) == "Implies":
            z3_expr = z3_expr.children()[1]
        while len(z3_expr.children()) == 1:
            z3_expr = z3_expr.children()[0]
        vars = []
        to_consider = z3_expr.children()
        for child in to_consider:
            if len(child.children()) > 0:
                to_consider.extend(child.children())
            var = match_step_str_to_var(str(child), self.all_vars)
            if var:
                vars.append(var)
        return vars

    def debug_print(self, s):
        if self.debug:
            print(s)

    def __repr__(self):
        return f"Current EGraph: {self.enode_to_id_class}\nCurrent Memo: {self.id_class_to_enodes}"
