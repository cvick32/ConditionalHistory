from collections import defaultdict
import copy
import itertools
from z3 import *

from z3_defs import Write, Read
from utils import match_step_str_to_var, ENode

from array_axioms import ARRAY_AXIOMS
from violation import Violation
from variable import ImmutableVariable, ProphecyVariable


class EGraph:
    def __init__(self, z3_model, props, all_vars, cur_cex_steps, debug):
        self.enode_to_id_class = {}
        self.id_class_to_enodes = defaultdict(list)
        self.model = z3_model
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

        self.all_entries = []

        for decl in self.model.decls():
            self.add_to_egraph(decl)

        for prop in props:
            self.add_to_egraph(prop)
        for entry in self.all_entries:
            # processsing function interpretations
            self.process_func_entry(entry)
        self.enodes = [e for e in self.enode_to_id_class.keys()]
        self.set_match_term()

    def add_to_egraph(self, z3_decl):
        is_func = False
        try:
            is_func = isinstance(self.model[z3_decl], FuncInterp)
        except:
            pass
        if is_func:
            func_name = str(z3_decl)
            for entry in self.model[z3_decl].as_list():
                self.all_entries.append([func_name, entry])
                if not isinstance(entry, list):
                    # this is the "else" case of a function
                    # just eval the function to get this?
                    continue
                if func_name == "Write":
                    full_z3_term = Write(entry[0], entry[1], entry[2]) == entry[3]
                elif func_name == "Read":
                    full_z3_term = Read(entry[0], entry[1]) == entry[2]
                else:
                    print(f"new func: {func_name}")
                    breakpoint()
                self.add_to_egraph(full_z3_term)
        else:
            head = self.get_head_from_def(z3_decl)
            args = self.get_args_from_def(z3_decl)
            id_num = self.get_id_for_cur_def(z3_decl)
            enode = ENode(head, args, z3_decl)
            self.enode_to_id_class[enode] = id_num
            if enode not in self.id_class_to_enodes[id_num]:
                self.id_class_to_enodes[id_num].append(enode)
            return enode

    def process_func_entry(self, entry):
        func_name, terms = entry
        if func_name == "Write":
            pass
        elif func_name == "Read":
            pass

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
        if isinstance(z3_def, FuncDeclRef):
            return z3_def
        elif z3_def.num_args():
            return z3_def.decl()
        else:
            return z3_def

    def get_args_from_def(self, z3_def):
        args = []
        if isinstance(z3_def, FuncDeclRef):
            return []
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
            inner_prop = z3_expr_list[0].children()[1]
            for enode in self.get_enodes_from_z3_expr(inner_prop):
                self.add_to_egraph(enode.z3_obj)
                for ec_enode in self.get_enodes_in_equiv_class(enode):
                    self.push_on_match_term_stack_help(enode.z3_obj)
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
        for axiom in self.axioms:
            ns = needed_subs.copy()
            self.debug_print(f"Matching Axiom: {axiom}")
            violations = self.match_axiom(axiom, axiom.trigger, {}, ns)
            self.violations.extend(violations)
            if violations:
                return self.violations
        self.control_path = set()
        self.debug_print(f"Match against enodes: {self.match_against_enodes}")
        self.match_against_enodes = self.match_against_enodes[:-1]
        return self.violations

    def match_axiom(self, axiom, match_term, cur_sub, needed_subs):
        axiom_violations = []
        tested = []
        for sub in self.match_term(match_term, cur_sub):
            if not sub or not all(sub.values()) or sub in self.seen_subs:
                continue
            self.debug_print(f"Full Sub: {sub}")
            sub = self.replace_sub_terms_with_variables(sub)
            self.debug_print(f"Full Sub after Var replacement: {sub}")
            self.seen_subs.append(sub)
            subs = self.get_sub_from_sub_list(sub)
            substitution = substitute(axiom.z3_def, subs)
            if not self.eval_to_bool(substitution):
                self.debug_print(f"AXIOM VIOLATION: {substitution}")
                print(self.match_against_enodes)
                needed_subs.append(sub)
                axiom_violations.append(Violation(substitution, needed_subs, self))
                return axiom_violations
            else:
                self.debug_print(f"Valid Axiom Instansiation: {substitution}")
                if not axiom.recur_term == None:
                    recur_sub = substitute(axiom.recur_term, subs)
                    print(f"Recur sub: {recur_sub}")
                    if recur_sub.children():
                        self.push_on_match_term_stack([recur_sub])
                        needed_subs.append(sub)
                        self.get_axiom_violations(needed_subs)
        return axiom_violations

    def replace_sub_terms_with_variables(self, substitution):
        new_sub = {}
        for k in substitution.keys():
            new_sub[k] = []
            for sub_val in substitution[k]:
                var = match_step_str_to_var(sub_val.var_string(), self.all_vars)
                if var is not None:
                    new_sub[k].append(sub_val)
                term_enode = self.get_term_enode_in_eclass(sub_val)
                if term_enode != sub_val:
                    new_sub[k].append(term_enode)
            if new_sub[k] == []:
                # at this point the given constant is in its own
                # e-class, we need to start guessing how we got that
                # constant from the model
                term_enode = self.find_var_term_for_constant(substitution[k][0].z3_obj)
                new_sub[k] = [term_enode]
        return new_sub

    def find_var_term_for_constant(self, constant):
        neg = constant * -1
        res_enode = ENode(self.model.eval(neg))
        try:
            eclass = self.get_enodes_in_equiv_class(res_enode)
        except:
            return
        if eclass:
            for enode in eclass:
                var = match_step_str_to_var(enode.var_string(), self.all_vars)
                if var:
                    return var
                elif enode.args:
                    z3_term = enode.z3_obj
                    subs = []
                    for child in z3_term.children():
                        sub = (child, self.get_var_enode_in_eclass(ENode(child)).z3_obj)
                        subs.append(sub)
                    z3_sub = substitute(z3_term, subs)
                    full_term = z3_sub * -1
                    return ENode(full_term)
                else:
                    # enode is another constant
                    pass

    def eval_to_bool(self, expr):
        cur_expr = expr
        while not (str(cur_expr) == "True" or str(cur_expr) == "False"):
            cur_expr = self.model.eval(cur_expr)
        return cur_expr

    def get_sub_from_sub_list(self, sub):
        ret_sub = []
        for x in sub:
            ret_sub.append((x, sub[x][0].z3_obj))
        return ret_sub

    def match_term(self, t, sub):
        func, args = self.get_func_and_args_from_term(t)
        seen = []
        for enode in self.get_enodes_matching_head(func):
            print(f"enode matching head: {enode}")
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
            print("NO")
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

    def get_term_enode_in_eclass(self, enode):
        for en in self.get_enodes_in_equiv_class(enode):
            if str(en.head) in ["Read", "Write", "ConstArr"]:
                z3_func = self.get_array_func_from_str(str(en.head))
                term_args = []
                for arg in en.args:
                    term_args.append(self.get_term_enode_in_eclass(arg))
                z3_term = z3_func([t.z3_obj for t in term_args])
                return ENode(en.head, term_args, z3_term)
            else:
                var = match_step_str_to_var(en.var_string(), self.all_vars)
                if var is not None:
                    frame = en.var_string().split("_")[-1]
                    var_expr = var.get_z3_var_for_step(frame)
                    return ENode(var_expr, [], var_expr)
        return enode

    def get_array_func_from_str(self, string):
        if string == "Read":
            return Read
        elif string == "Write":
            return Write
        elif string == "ConstArr":
            return ConstArr

    def get_enodes_matching_head(self, head):
        str_head = str(head)
        for enode in self.match_against_enodes[-1]:
            if str(enode.head) == str_head:
                yield enode

    def get_equiv_enodes_with_matching_head(self, enode, head):
        str_head = str(head)
        for en in self.get_enodes_in_equiv_class(enode):
            if str(en.head) == str_head:
                print(f"in equiv with matching head: {en}")
                yield en

    def get_enodes_in_equiv_class(self, enode):
        class_id = self.enode_to_id_class[enode]
        return self.id_class_to_enodes[class_id]

    def get_func_and_args_from_term(self, t):
        return self.get_head_from_def(t), self.get_args(t)

    def get_enodes_from_z3_expr(self, z3_expr):
        while str(z3_expr.decl()) == "Implies":
            z3_expr = z3_expr.children()[1]
        while len(z3_expr.children()) == 1:
            z3_expr = z3_expr.children()[0]
        enodes = []
        to_consider = z3_expr.children()
        for child in to_consider:
            if len(child.children()) > 0:
                to_consider.extend(child.children())
            enodes.append(self.add_to_egraph(child))
        return enodes

    def debug_print(self, s):
        if self.debug:
            print(s)

    def __repr__(self):
        return f"Current EGraph: {self.enode_to_id_class}\nCurrent Memo: {self.id_class_to_enodes}"
