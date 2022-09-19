"""synthesis formula:

forall countermodels x=1..n such that there exists a violation
m=1..vx, forall necessary prophecy terms Txmt (where t is number of
prophey in cm x, axiom violation m), there exists a symbolic history
expression i \in 1..h such that

eval(T_xmt, X_x) == HE(c_i, u_i, len(X_x))

HE(c_i, u_i, 0) == sym_eval(u_i, 0)
HE(c_i, u_i, f) == sym_eval(c_i, f) ? eval(u_i, f) : HE(c_i, u_i, f-1)

def history_eval(condition, term_to_store, frame):
  if frame == 0:
    sym_eval(


"""


class CounterModel:
    def __init__(self, model, violations):
        self.model = model
        self.violations = violations

    def get_synthesis_formula(self):
        synth_formula = False
        for v in self.violations:
            synth_formula = Or(synth_formula, v.get_synthesis_formula(self.model))
        return synth_formula

    def get_interpolant_clauses(self):
        return self.violations[0].get_interpolant_clauses()

    def __eq__(self, other):
        if isinstance(other, CounterModel):
            if len(other.violations) == len(self.violations):
                for ov, sv in zip(other.violations, self.violations):
                    if ov.axiom_instance.sexpr() != sv.axiom_instance.sexpr():
                        return False
                return True
        return False
