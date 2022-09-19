from utils import Translate, Sexpr


class MultiInvariantTransform:
    def __init__(self, los_or_filename):
        if isinstance(los_or_filename, list):
            sexprs = los_or_filename
        else:
            sexprs = Translate().get_sexprs_from_filename(los_or_filename)
        rules = self.get_rules(sexprs)[1:-1]
        if not rules:
            rules = [self.get_rules(sexprs)[0]]
        inv_to_var_names = self.get_inv_to_var_names(rules)
        init_rule = self.get_rules(sexprs)[0]
        init_sexpr = self.create_init_sexpr(init_rule, inv_to_var_names)
        trans_sexprs = []
        for tr in self.get_rules(sexprs)[1:-1]:
            trans_sexprs.append(self.create_trans_sexpr(tr, inv_to_var_names))
        prop_rule = self.get_rules(sexprs)[-1]
        prop_sexpr = self.create_prop_sexpr(prop_rule, inv_to_var_names)
        prop_sexpr, imm_vars = self.get_prop_with_imm_vars(prop_sexpr, inv_to_var_names)

        var_defs = self.get_var_defs(sexprs, imm_vars)
        self.all_sexprs = var_defs + [init_sexpr] + trans_sexprs + prop_sexpr

    def get_transformed_sexprs(self):
        return self.all_sexprs

    def get_var_defs(self, sexprs, imm_vars):
        defs = [sexpr for sexpr in sexprs if sexpr.head == "declare-var"]
        defs.append(Sexpr("declare-var", ["pc", "Int"]))
        for iv in imm_vars:
            defs.append(
                Sexpr("declare-var", [iv, "Int"])
            )  # could be a problem with assuming that it's an Int
        return defs

    def get_rules(self, sexprs):
        return [sexpr for sexpr in sexprs if sexpr.head == "rule"]

    def get_inv_to_var_names(self, rules):
        inv_name_to_var_names = {}
        for tr in rules:
            tr = tr.body[0]
            rhs = tr.body[1]
            if tr.body[0].head == "and":
                for conjunct in tr.body[0].body:
                    ch = conjunct.head
                    if "inv" in ch and not ch in inv_name_to_var_names:
                        inv_name_to_var_names[ch] = conjunct.body
        return inv_name_to_var_names

    def create_inv_sexpr(self, inv_to_var_names):
        all_var_names = set()
        for inv in inv_to_var_names:
            inv_vars = set()
            for inv_expr in inv_to_var_names[inv]:
                if isinstance(inv_expr, Sexpr):
                    inv_vars.add(inv_expr.body[0])
                    continue
                else:
                    inv_vars.add(inv_expr)
            all_var_names = all_var_names.union(inv_vars)
        v_list = sorted(all_var_names)
        v_list.append("pc")
        return Sexpr("inv", v_list)

    def old_inv_to_defs(self, old_inv, inv_to_var, next_flag):
        inv_vars = inv_to_var[old_inv.head]
        constraints = []
        for old, new in zip(old_inv.body, inv_vars):
            if isinstance(new, Sexpr):
                continue
            if old in self.get_next_inv_vars(self.create_inv_sexpr(inv_to_var)):
                continue
            if isinstance(old, Sexpr) or (old != new and old + "1" != new):
                if next_flag:
                    constraints.append(Sexpr("=", [new + "1", old]))
                else:
                    constraints.append(Sexpr("=", [new, old]))
        return constraints

    def get_trans_pc_constraints(self, starting_inv, ending_inv):
        constraints = []
        pc_num_start = starting_inv.head.replace("inv", "")
        pc_num_end = ending_inv.head.replace("inv", "")
        constraints.append(Sexpr("=", ["pc", pc_num_start]))
        if pc_num_end != pc_num_start:
            constraints.append(Sexpr("=", ["pc1", pc_num_end]))
        else:
            constraints.append(Sexpr("=", ["pc1", pc_num_start]))
        return constraints

    def create_init_sexpr(self, init_rule, inv_to_var_names):
        if not init_rule.body[0].head == "=>":
            old_inv_def = init_rule.body[0]
            conjunction = Sexpr("and", [])
        else:
            old_inv_def = init_rule.body[0].body[1]
            if init_rule.body[0].body[0].head == "and":
                conjunction = init_rule.body[0].body[0]
            else:
                conjunction = Sexpr("and", [])
                conjunction.add_body(init_rule.body[0].body[0])
        pc_num = old_inv_def.head.replace("inv", "")
        pc_constraint = Sexpr("=", ["pc", pc_num])
        conjunction.add_body(pc_constraint)
        constraints = self.old_inv_to_defs(old_inv_def, inv_to_var_names, False)
        conjunction.extend_body(constraints)
        return Sexpr(
            "rule",
            [Sexpr("=>", [conjunction, self.create_inv_sexpr(inv_to_var_names)])],
        )

    def get_next_inv_vars(self, inv_sexpr):
        next_var_list = list(inv_sexpr.body)
        return [v + "1" for v in next_var_list]

    def get_starting_inv_and_replace_with_general(self, trans_rule, inv_to_var_names):
        starting_inv = None
        old_conjunction = trans_rule.body[0].body[0]
        new_conjunction = Sexpr("and", [])
        for conjunct in old_conjunction.body:
            if "inv" in conjunct.head:
                starting_inv = conjunct
                conjunct = self.create_inv_sexpr(inv_to_var_names)
                new_conjunction.add_body(self.create_inv_sexpr(inv_to_var_names))
            else:
                new_conjunction.add_body(conjunct)
        return starting_inv, new_conjunction

    def add_next_vars_to_ending_inv(self, new_conjunction, inv_to_var_names):
        new_inv_sexpr = self.create_inv_sexpr(inv_to_var_names)
        next_inv_vars = self.get_next_inv_vars(new_inv_sexpr)
        for conjunct in new_conjunction.body:
            if conjunct.head == "=":
                if conjunct.body[0] in next_inv_vars:
                    next_var = conjunct.body[0]
                    non_next = next_var.replace("1", "")
                    new_inv_sexpr.body = [
                        next_var if i == non_next else i for i in new_inv_sexpr.body
                    ]
                if conjunct.body[1] in next_inv_vars:
                    next_var = conjunct.body[1]
                    non_next = next_var.replace("1", "")
                    new_inv_sexpr.body = [
                        next_var if i == non_next else i for i in new_inv_sexpr.body
                    ]
        return new_inv_sexpr

    def create_trans_sexpr(self, trans_rule, inv_to_var_names):
        starting_inv, new_conjunction = self.get_starting_inv_and_replace_with_general(
            trans_rule, inv_to_var_names
        )
        ending_inv = trans_rule.body[0].body[1]
        constraints = self.old_inv_to_defs(ending_inv, inv_to_var_names, True)
        pc_constraints = self.get_trans_pc_constraints(starting_inv, ending_inv)
        new_conjunction.extend_body(constraints)
        new_conjunction.extend_body(pc_constraints)
        new_inv_sexpr = self.add_next_vars_to_ending_inv(
            new_conjunction, inv_to_var_names
        )
        return Sexpr("rule", [Sexpr("=>", [new_conjunction, new_inv_sexpr])])

    def create_prop_sexpr(self, prop_rule, inv_to_var_names):
        old_conjunction = prop_rule.body[0].body[0]
        new_conjunction = Sexpr("and", [])
        new_inv_sexpr = self.create_inv_sexpr(inv_to_var_names)
        if not old_conjunction.head == "and":
            pc_num = old_conjunction.head.replace("inv", "")
        else:
            for conjunct in old_conjunction.body:
                if not "inv" in conjunct.head:
                    new_conjunction.add_body(conjunct)
                else:
                    pc_num = conjunct.head.replace("inv", "")
        pc_constraint = Sexpr("=", ["pc", pc_num])
        new_conjunction.add_to_front_of_body(pc_constraint)
        new_conjunction.add_to_front_of_body(new_inv_sexpr)
        return Sexpr("rule", [Sexpr("=>", [new_conjunction, "fail"])])

    def get_prop_with_imm_vars(self, ps, inv_to_var_names):
        ps_str = ps.writeable_string()
        next_vars = self.get_next_inv_vars(self.create_inv_sexpr(inv_to_var_names))
        need_imms = []
        for i, nv in enumerate(next_vars):
            if nv in ps_str:
                imm_var = "Z" * (len(need_imms) + 1)
                need_imms.append(imm_var)
                ps_str = ps_str.replace(nv, imm_var)
        return Translate().parse_sexpr_string(ps_str), need_imms
