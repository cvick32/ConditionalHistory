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

class Interpolator:
    def __init__(self, exprs, props, all_vars, z3_model):
        self.exprs = exprs
        self.props = props
        self.all_vars = all_vars
        self.z3_model = z3_model
        self.sexprs = self.get_interpolant_sexprs()

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
        for step, exprs_at_step in enumerate(self.exprs):
            and_sexpr = Sexpr(head="and")
            interp_name = chr(int(step) + CHAR_OFFSET)
            interp_names.append(interp_name)
            for expr in exprs_at_step:
                sexpr = Translate().parse_sexpr_string(expr.sexpr())[0]
                and_sexpr.add_body(sexpr)
            if len(and_sexpr.body) == 1: # SMTInterpol does not allow single arity and
                and_sexpr = and_sexpr.body[0]
            if step == len(self.exprs) - 1:
                and_sexpr.extend_body(self.get_prop_as_conjunct_list())
            and_sexpr.replace_heads_in_all_body("Write", "store")
            and_sexpr.replace_heads_in_all_body("Read", "select")
            inner_sexpr = Sexpr("!", [and_sexpr, ":named", interp_name])
            assert_sexpr = Sexpr("assert", [inner_sexpr])
            assert_sexpr.cleanup_let_statements()
            asserts.append(assert_sexpr)
        return asserts, interp_names

    def get_prop_as_conjunct_list(self):
        conjuncts = []
        for p in self.props:
            sexpr = Translate().parse_sexpr_string(p.sexpr())[0]
            sexpr.cleanup_let_statements()
            for conjunct in sexpr.body[0].body:
                conjuncts.append(conjunct)
            # this takes (=> ... (and (x)) to (=> ... x)
            if len(sexpr.body[1].body) == 1:
                sexpr.body[1] = sexpr.body[1].body[0]
            conjuncts.append(Sexpr("not", [sexpr.body[1]]))
        return conjuncts

    def ending_interpolants_sexprs(self, interp_list):
        check_sat = Sexpr("check-sat")
        get_interps = Sexpr("get-interpolants", interp_list)
        return [check_sat, get_interps]

    def interpolate(self):
        interpolants_sexprs = self.get_interpolant_sexprs()
        interpolant_str = run_smt_interpol_from_sexprs(interpolants_sexprs)
        if interpolant_str == "SAT":
            return None
        print(f"Interpolants: {interpolant_str}")
        #     Translate().parse_sexpr_string(interpolant_str)[0].body
        # )
        # for i in self.all_interpolants:
        #     i.cleanup_let_statements()
        # important_interps = []
        # for i in self.all_interpolants[self.highest_frame - 1 :]:
        #     vmt_interpolant = self.create_vmt_interpolant(i)
        #     vmt_interpolant.cleanup_let_statements()
        #     z3_interp = parse_sexpr_to_z3(
        #         vmt_interpolant, self.all_vars, ignore_ite=True
        #     )
        #     important_interps.append(z3_interp)
        # self.interp_clauses = set()
        # for z3_interp in important_interps:
        #     if str(z3_interp.decl()) not in ["And", "Or", "Implies"]:
        #         self.interp_clauses.add(z3_interp)
        #     else:
        #         self.preprocess_final_interpolant(z3_interp)
        # return self.interp_clauses

