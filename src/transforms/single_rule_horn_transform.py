import re
from utils import Translate, Sexpr


class SingleRuleHornTransform:
    def __init__(self, filename):
        raw_file_text = open(filename).read()
        new_text = self.process_text(raw_file_text)
        sexprs = Translate().parse_sexpr_string(new_text)
        inv_sexpr = self.get_inv_sexpr(sexprs)[0]
        inv_sexpr.body[0] = "inv"
        assert_sexprs = self.get_assert_sexprs(sexprs)

        forall_var_decls = self.get_forall_var_decls(assert_sexprs)
        var_sexprs = self.create_var_def_sexprs(forall_var_decls)
        inv_exprs, prop = self.get_inv_exprs_and_prop(assert_sexprs)
        rule_sexprs = self.create_rule_sexprs(assert_sexprs)
        new_prop = self.rewrite_property_sexpr(rule_sexprs[-1])
        self.all_sexprs = [inv_sexpr] + var_sexprs + rule_sexprs

    def process_text(self, raw_text):
        t = re.sub("\|", "", raw_text)
        t = re.sub("state", "inv", t)
        return t

    def get_assert_sexprs(self, sexprs):
        return [sexpr for sexpr in sexprs if sexpr.head == "assert"]

    def get_inv_sexpr(self, sexprs):
        return [sexpr for sexpr in sexprs if sexpr.head == "declare-fun"]

    def get_inv_exprs_and_prop(self, sexprs):
        l = [a.body[0].body[1].body[1] for a in sexprs]
        return l[:-1], l[-1]

    def get_forall_var_decls(self, assert_sexprs):
        nested_var_list = [sexpr.body[0].body[0].body for sexpr in assert_sexprs]
        flat_var_list = [item for sublist in nested_var_list for item in sublist]
        final_var_list = []
        for var in flat_var_list:
            if var not in final_var_list:
                final_var_list.append(var)
        return final_var_list

    def create_var_def_sexprs(self, var_sexprs):
        var_defs = []
        for var_sexpr in var_sexprs:
            def_sexpr = Sexpr()
            def_sexpr.add_head("declare-var")
            def_sexpr.add_body(var_sexpr.head)
            def_sexpr.add_body(var_sexpr.body[0])
            var_defs.append(def_sexpr)
        return var_defs

    def create_rule_sexprs(self, assert_sexprs):
        rule_sexprs = []
        for assert_sexpr in assert_sexprs:
            forall = assert_sexpr.body[0]
            self.process_forall(forall)
            rule_sexpr = Sexpr()
            rule_sexpr.add_head("rule")
            rule_sexpr.add_body(forall)
            rule_sexprs.append(rule_sexpr)
        return rule_sexprs

    def replace_prop_vars_with_expr(self, prop, set_vars):
        new_prop = Sexpr()
        if prop.head == "=":
            new_prop.add_head("=")
            for var_name in prop.body:
                if var_name in set_vars:
                    new_prop.add_body(set_vars[var_name])
                else:
                    new_prop.add_body(var_name)
            return new_prop
        elif prop.head == "and":
            new_prop.add_head("and")
            for prop_conjunct in prop.body:
                new_pc = Sexpr()
                if prop_conjunct.head == "=":
                    new_pc.add_head("=")
                    for var_name in prop_conjunct.body:
                        if var_name in set_vars:
                            new_pc.add_body(set_vars[var_name])
                        else:
                            new_pc.add_body(var_name)
                else:
                    new_pc = prop_conjunct
                new_prop.add_body(new_pc)
            return new_prop
        else:
            return prop

    def remove_from_list(self, l, remove):
        for r in remove:
            l.remove(r)

    def rewrite_property_sexpr(self, prop_sexpr):
        set_vars = {}
        to_remove = []
        if prop_sexpr.body[0].body[0].head == "and":
            for conjunct in prop_sexpr.body[0].body[0].body:
                if conjunct.head == "=":
                    set_vars[conjunct.body[1]] = conjunct.body[0]
                    to_remove.append(conjunct)
        self.remove_from_list(prop_sexpr.body[0].body[0].body, to_remove)
        p = prop_sexpr.body[0].body[1]
        new_prop = self.replace_prop_vars_with_expr(p, set_vars)
        not_sexpr = Sexpr()
        not_sexpr.add_head("not")
        not_sexpr.add_body(new_prop)
        prop_sexpr.body[0].body[0].add_body(not_sexpr)
        prop_sexpr.body[0].body[1] = "fail"
        return prop_sexpr

    def process_forall(self, sexpr):
        statement = sexpr.body[1]
        sexpr.head = statement.head
        new_body = []
        for conjunct in statement.body:
            conjunct.cleanup_let_statements()
            new_body.append(conjunct)
        sexpr.body = new_body

    def get_transformed_sexprs(self):
        return self.all_sexprs


"""
asdf = SingleRuleHornTransform(
    "/Users/colevick/Documents/cs/research/fall2021/tacas2021_artifact_files/artifact/benchmarks/chc-comp-2020/single-rule-horn/chc-LIA-lin-arrays_000.smt2"
)
"""
