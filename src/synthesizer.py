from z3 import substitute, Not, And
from collections import defaultdict


class Synthesizer:
    def __init__(self, clauses, model, all_vars, step, prop, hist, length):
        cond = hist.pc_ante[0]
        self.all_clauses = set(clauses)
        self.safe_clauses = set(clauses)
        self.trigger_clauses = set(clauses)
        self.model = model
        self.prop = prop
        self.all_vars = all_vars
        sbst = self.get_subs_for_var_to_next_var()
        self.safe_clauses.update(
            Not(substitute(interp, sbst)) for interp in list(self.safe_clauses)
        )
        for i in range(0, step):
            self.check_clauses_on_model_and_step(
                self.safe_clauses, i, negate=True, cond=cond
            )
        self.check_clauses_on_model_and_step(
            self.safe_clauses, step, negate=False, cond=cond
        )
        self.check_clauses_on_model_and_step(
            self.trigger_clauses, step, negate=False, cond=cond
        )
        for i in range(step + 1, length - 1):
            self.check_clauses_on_model_and_step(
                self.trigger_clauses, i, negate=True, cond=cond
            )
        self.used_vars = defaultdict(int)
        self.used_funcs = defaultdict(int)
        self.used_consts = defaultdict(int)
        inner_prop = self.prop.consequents[-1].children()[0].children()[0]
        self.setup_ranking_dicts(inner_prop)
        self.rank_clauses()

    def check_clauses_on_model_and_step(self, clauses, step, negate, cond):
        old_clauses = list(clauses)
        clauses.clear()
        for cur_clause in old_clauses:
            sub_clause = substitute(
                substitute(And(cur_clause, cond), self.get_subs_for_cex_step(step)),
                self.get_subs_for_next_cex_step(step + 1),
            )
            eval_bool = self.model.eval(sub_clause)
            if negate and not eval_bool or not negate and eval_bool:
                clauses.add(cur_clause)

    def get_top_interpolant(self):
        try:
            top = sorted(self.ranking)[-1]
            top_interp = self.ranking[top]
            if top_interp in self.trigger_clauses:
                return "trigger", top_interp
            else:
                return "safe", top_interp
        except IndexError as e:
            return "trigger", list(self.all_clauses)[-1]

    # def generate_interpolants(self):
    #     print("TRIGGERS:")
    #     for tc in self.trigger_clauses:
    #         print(tc)
    #     print("SAFE:")
    #     for sc in self.safe_clauses:
    #         print(sc)
    #     ranking = self.rank_clauses()
    #     print(f"Prop: {self.prop.consequents}")
    #     pprint.pprint(ranking)
    #     for rank in reversed(sorted(ranking)):
    #         interp = ranking[rank]
    #         if interp in self.safe_clauses:
    #             yield "safe", interp
    #         else:
    #             yield "trigger", interp

    def setup_ranking_dicts(self, cur_prop_term):
        if cur_prop_term.children():
            self.used_funcs[str(cur_prop_term.decl())] += 1
            for child in cur_prop_term.children():
                self.setup_ranking_dicts(child)
        else:
            str_term = str(cur_prop_term)
            if self.is_var(str_term):
                self.used_vars[str_term] += 1
            else:
                self.used_consts[str_term] += 1

    def is_var(self, term):
        for var in self.all_vars:
            if var.match_name(term):
                return True
        return False

    def rank_clauses(self):
        ranking = {}
        for clause in self.trigger_clauses:
            # prefer triggers
            ranking[self.get_rank(clause) * 2] = clause
        for clause in self.safe_clauses:
            ranking[self.get_rank(clause)] = clause
        self.ranking = ranking

    def get_rank(self, clause):
        str_clause = str(clause)
        rank = -1 * len(str_clause)  # prefer shorter
        for v in self.used_vars:
            if v in str_clause:
                rank += 20 * self.used_vars[v]
        for f in self.used_funcs:
            if f in str_clause:
                rank += 15 * self.used_funcs[f]
        for c in self.used_consts:
            if c in str_clause:
                rank += 10 * self.used_consts[c]
        return rank

    def get_subs_for_cex_step(self, step):
        return [var.make_step_var_sub(step) for var in self.all_vars]

    def get_subs_for_next_cex_step(self, step):
        return [var.make_step_next_var_sub(step) for var in self.all_vars]

    def get_subs_for_var_to_next_var(self):
        return [var.make_cur_var_to_next_sub() for var in self.all_vars]
