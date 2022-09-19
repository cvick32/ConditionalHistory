from z3 import Const, Implies, Not
from z3_defs import *


class Axiom:
    def __init__(self, z3_def, trigger, recur_term):
        self.z3_def = z3_def
        self.trigger = trigger
        self.recur_term = recur_term

    def __repr__(self):
        return str(self.z3_def)


A_ax = Const("A_ax", Arr)
B_ax = Const("B_ax", Arr)

V = Const("V", Val)
L = Const("L", Pos)
Z = Const("Z", Pos)

constarr_rd = Read(ConstArr(V), L) == V
A_1 = Axiom(constarr_rd, Read(ConstArr(V), L), None)

read_after_write = Read(Write(A_ax, L, V), L) == V
A_2 = Axiom(read_after_write, Read(Write(A_ax, L, V), L), V)

read_after_write_2 = Implies(Not(L == Z), Read(Write(A_ax, L, V), Z) == Read(A_ax, Z))
A_3 = Axiom(read_after_write_2, Read(Write(A_ax, L, V), Z), Read(A_ax, Z))

ARRAY_AXIOMS = [A_1, A_2, A_3]
