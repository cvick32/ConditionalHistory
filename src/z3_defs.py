from z3 import (
    Sort,
    IntSort,
    BoolSort,
    ArraySort,
    Function,
    Const,
    DeclareSort,
    Not,
    And,
    Implies,
    Or,
    substitute,
)


from utils import Sexpr

Val = IntSort()
Pos = IntSort()

Arr = DeclareSort("Arr")
ArrOfArr = DeclareSort("ArrOfArr")
Bool = BoolSort()

ConstArr = Function("ConstArr", Val, Arr)
Read = Function("Read", Arr, Pos, Val)
ArrRead = Function("ArrRead", ArrOfArr, Pos, Arr)

Write = Function("Write", Arr, Pos, Val, Arr)
ArrWrite = Function("ArrWrite", ArrOfArr, Pos, Arr, ArrOfArr)

all_sorts = [Arr, ArrOfArr]
all_funcs = [ConstArr, Read, ArrRead, ArrWrite, Write]


def get_arg_z3_expr(sexpr, all_vars, bound_vars, ite_var, safety_var, ignore_ite):
    var_name_to_var = {var.get_name(): var for var in all_vars}
    next_var_name_to_var = {var.get_smt2_next_name(): var for var in all_vars}
    if isinstance(sexpr, Sexpr) or (
        not sexpr in var_name_to_var and not sexpr in next_var_name_to_var
    ):
        return parse_sexpr_to_z3(
            sexpr,
            all_vars,
            bound_vars=bound_vars,
            ite_var=ite_var,
            safety_var=safety_var,
            ignore_ite=ignore_ite,
        )
    else:
        if bound_vars is not None:
            if not sexpr in bound_vars:
                return safety_var.var_def
            else:
                return var_name_to_var[sexpr].var_def
        else:
            if not sexpr in var_name_to_var and sexpr in next_var_name_to_var:
                return next_var_name_to_var[sexpr].next_var_def
            else:
                return var_name_to_var[sexpr].var_def


def get_ite_if_and_else_expr(args, ite_var):
    """
    Accounts for nested structure in some if statements.
    Basically, we've already processed the nested if
    in the right form so we don't need to set ite_var
    equal in these cases.
    """
    if (
        not isinstance(args[1], str)
        and not isinstance(args[1], int)
        and str(args[1].decl()) == "And"
    ):
        if_branch = args[1]
    else:
        if_branch = args[1] == ite_var
    if (
        not isinstance(args[2], str)
        and not isinstance(args[2], int)
        and str(args[2].decl()) == "And"
    ):
        else_branch = args[2]
    else:
        else_branch = args[2] == ite_var
    return if_branch, else_branch


def get_args(sexpr, all_vars, bound_vars, ite_var, safety_var, ignore_ite):
    args = []
    for i in range(len(sexpr.body)):
        s_body = sexpr.body[i]
        if not isinstance(s_body, str) and s_body.head == "as":
            args.append(None)
            continue
        args.append(
            get_arg_z3_expr(
                s_body, all_vars, bound_vars, ite_var, safety_var, ignore_ite
            )
        )
    return args


def parse_sexpr_to_z3(
    sexpr, all_vars, bound_vars=None, ite_var=None, safety_var=None, ignore_ite=None
):
    if isinstance(sexpr, str):
        if sexpr.strip("-").isnumeric():
            return int(sexpr)
        elif sexpr == "false":
            return False
        elif sexpr == "true":
            return True
    head = sexpr.head
    args = get_args(sexpr, all_vars, bound_vars, ite_var, safety_var, ignore_ite)
    if head == "store":
        if str(args[0].sort()) == "ArrOfArr":
            return ArrWrite(args[0], args[1], args[2])
        else:
            return Write(args[0], args[1], args[2])
    elif head == "select":
        if str(args[0].sort()) == "ArrOfArr":
            return ArrRead(args[0], args[1])
        else:
            return Read(args[0], args[1])
    elif head == "+":
        # how to generate this automatically?
        if len(args) == 3:
            return args[0] + args[1] + args[2]
        else:
            return args[0] + args[1]
    elif head == "-":
        if len(args) == 3:
            return args[0] - args[1] - args[2]
        elif len(args) == 1:
            return args[0] * -1
        else:
            return args[0] - args[1]
    elif head == "*":
        return args[0] * args[1]
    elif head == "=>":
        return Implies(args[0], args[1])
    elif head == "or":
        return Or(args[0], args[1])
    elif head == "not":
        return Not(args[0])
    elif head == ">=":
        return args[0] >= args[1]
    elif head == "<=":
        return args[0] <= args[1]
    elif head == "<":
        return args[0] < args[1]
    elif head == ">":
        return args[0] > args[1]
    elif head == "=":
        return args[0] == args[1]
    elif head == "ite":
        if ignore_ite:
            return And(Implies(args[0], args[1]), Implies(Not(args[0]), args[2]))
        else:
            assert ite_var is not None, "Expected non-None ite_var"
            if_branch, else_branch = get_ite_if_and_else_expr(args, ite_var)
            return And(Implies(args[0], if_branch), Implies(Not(args[0]), else_branch))
    elif head == "and":
        if len(args) == 1:
            return args[0]
        return And(args[0], args[1])
    elif head == "mod":
        return args[0] % args[1]
    elif head == "Constarr":
        return ConstArr(args[1])
    elif head == "" and sexpr.body[0].head == "as":
        return ConstArr(sexpr.body[1])
    else:
        print(f"Unimplemented function call: {head}")
