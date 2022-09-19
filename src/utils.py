import re
import signal
import os
import sys
import subprocess

import pprint
from io import StringIO
from contextlib import contextmanager
from datetime import datetime

regex_var_matcher = re.compile("_(1[0-9][0-9]|2[0-4][0-9]|[1-9][0-9]|[0-9])")


class Capturing(list):
    def __enter__(self):
        self._stdout = sys.stdout
        sys.stdout = self._stringio = StringIO()
        return self

    def __exit__(self, *args):
        self.extend(self._stringio.getvalue().splitlines())
        del self._stringio  # free up some memory
        sys.stdout = self._stdout


@contextmanager
def timeout(time):
    # Register a function to raise a TimeoutError on the signal.
    signal.signal(signal.SIGALRM, raise_timeout)
    # Schedule the signal to be sent after ``time``.
    signal.alarm(time)

    try:
        yield
    except TimeoutError:
        print("Timed Out")
    finally:
        # Unregister the signal so it won't be triggered
        # if the timeout is not reached.
        signal.signal(signal.SIGALRM, signal.SIG_IGN)


def raise_timeout(signum, frame):
    raise TimeoutError


def is_benchmark_file(filename):
    return filename.split(".")[-1] == "smt2"


def match_step_str_to_var(expr_str, all_vars):
    if expr_str is None:
        return
    for var in all_vars:
        if var.match_step_str(expr_str):
            return var


def write_list_to_file(filename, l):
    with open(filename, "w") as f:
        for line in l:
            f.write(str(line) + "\n")


def write_sexpr_list_to_file(filename, sexprs):
    with open(filename, "w+") as f:
        for sexpr in sexprs:
            f.write(sexpr.writeable_string() + "\n")


def unabstract_out_vmt():
    lines = open("out.vmt").readlines()
    lines = lines[7:]
    new_text = ""
    for l in lines:
        l = l.replace("Arr", "(Array Int Int)")
        l = l.replace("Write", "store")
        l = l.replace("Read", "select")
        l = l.replace("ArrRead", "select")
        l = l.replace("ArrWrite", "store")
        l = l.replace("ConstArr", "(as const (Array Int Int))")
        new_text += l
    return new_text


def run_smt_interpol_from_sexprs(sexprs):
    with open("interp-out.smt2", "w+") as f:
        for sexpr in sexprs:
            if isinstance(sexpr, Sexpr):
                s = sexpr.writeable_string()
            else:
                s = sexpr
            f.write(s + "\n")
    print("Running SMTInterpol...")
    out = subprocess.run(
        [
            "java",
            "-jar",
            "../solvers/smtinterpol.jar",
            "-w",
            "-no-success",
            "interp-out.smt2",
        ],
        capture_output=True,
    )
    if out.returncode == 0:
        out_str = out.stdout.decode().split("\n")
        if out_str[0] == "unsat":
            return out_str[1]
        else:
            print("Counterexample was SAT in SMTInterpol!")
            return "SAT"
            # raise ValueError("Counterexample was SAT in SMTInterpol!")
    else:
        print("SMTInterpol failed!")
        # raise ValueError("SMTInterpol failed!")


class Translate:
    def parse_sexpr_string(self, str):
        complete_sexp = []
        working_sexp = []
        cur_str = ""
        count = 0
        head = False
        comment = False
        for c in str:
            if comment and not c == "\n":
                continue
            elif comment and c == "\n":
                comment = False
            elif c == ";":
                comment = True
            elif c == "(":
                working_sexp.append(Sexpr())
                count += 1
                head = True
            elif c == ")":
                cur_sexp = working_sexp[-1]
                count -= 1
                cur_str, head = self.add_str_to_sexp(cur_str, cur_sexp, head)
                if count == 0:
                    complete_sexp.append(cur_sexp)
                else:
                    working_sexp[-2].add_body(cur_sexp)
                working_sexp = working_sexp[:-1]
                head = False
            elif c == " ":
                cur_sexp = working_sexp[-1]
                cur_str, head = self.add_str_to_sexp(cur_str, cur_sexp, head)
            elif not c == "\n" and not c == "\t":
                cur_str += c
        return complete_sexp

    def add_str_to_sexp(self, s, sexp, head_flag):
        if s == "":
            return "", head_flag
        if head_flag:
            sexp.add_head(s)
            head_flag = False
        else:
            sexp.add_body(s)
            head_flag = False
        return "", head_flag

    def get_sexprs_from_filename(self, filename):
        with open(filename) as f:
            return self.parse_sexpr_string(f.read())


class Sexpr:
    def __init__(self, head=None, body=None):
        if head is None:
            self.head = ""
        else:
            self.head = head
        if body is None:
            self.body = []
        else:
            self.body = body

    def add_head(self, str_head):
        self.head = str_head

    def add_body(self, body_part):
        self.body.append(body_part)

    def add_to_front_of_body(self, body_part):
        new_body = [body_part] + self.body.copy()
        self.body = new_body

    def extend_body(self, body_part):
        self.body.extend(body_part)

    def replace_all_in_current_body(self, old, new):
        new_body = []
        for b in self.body:
            if b == old:
                new_body.append(new)
            else:
                new_body.append(b)
        self.body = new_body

    def replace_all_in_body(self, old, new):
        new_body = []
        for b in self.body:
            if b == old:
                new_body.append(new)
            else:
                new_body.append(b)
            if isinstance(b, Sexpr):
                b.replace_all_in_body(old, new)
        self.body = new_body

    def replace_heads_in_all_body(self, old_head, new_head):
        if self.head == old_head:
            self.head = new_head
        for b in self.body:
            if isinstance(b, Sexpr):
                b.replace_heads_in_all_body(old_head, new_head)

    def remove_nested_single_ands(self):
        if self.head == "and" and len(self.body) == 1:
            if isinstance(self.body[0], Sexpr):
                self.head = self.body[0].head
                self.body = self.body[0].body
            else:
                self.head = self.body[0]
                self.body = []
        for b in self.body:
            if isinstance(b, Sexpr):
                b.remove_nested_single_ands()

    def cleanup_let_statements(self):
        # call this one
        self._simplify_all_let_expressions([])
        self._remove_all_let()

    def _simplify_all_let_expressions(self, lets):
        for l in lets:
            self.replace_all_in_body(l.head, l.body[0])
        new_body = []
        if self.head == "let":
            lets.extend(self.body[0].body)
            self.body[1]._simplify_all_let_expressions(lets)
            new_body.append(self.body[1])
            self = self.body[1]
        else:
            for b in self.body:
                if isinstance(b, Sexpr):
                    b._simplify_all_let_expressions(lets)

    def _remove_all_let(self):
        new_body = []
        for b in self.body:
            if isinstance(b, Sexpr):
                if b.head == "let":
                    b.body[1]._remove_all_let()
                    new_body.append(b.body[1])
                else:
                    b._remove_all_let()
                    new_body.append(b)
            else:
                new_body.append(b)
        if self.head == "let":
            new_head = new_body[1].head
            new_body = new_body[1].body
        else:
            new_head = self.head
        self.head = new_head
        self.body = new_body

    def __eq__(self, other):
        if isinstance(other, Sexpr):
            return self.head == other.head and self.body == other.body

    def __hash__(self):
        return hash(self.head) + hash(tuple(self.body))

    def writeable_string(self):
        s = self.__repr__()
        return s.replace("'", "")

    def __repr__(self):
        body_text = ""
        if self.head:
            head_text = self.head
        else:
            head_text = ""
        for i, b in enumerate(self.body):
            if i == len(self.body) - 1:
                body_text += f"{b.__repr__()}"
            else:
                body_text += f"{b.__repr__()} "
        body_text = body_text.replace("(None )", "()")
        return f"({self.head} {body_text})"


class ENode:
    def __init__(self, head, args, z3_obj):
        self.head = head
        self.args = args
        str_arg = ""
        if self.args:
            str_arg = " " + str(self.args).replace("[", "").replace("]", "")
        self.repr_str = f"({str(self.head)}{str_arg})"
        self.z3_obj = z3_obj

    def var_string(self):
        return str(self.head)

    def __repr__(self):
        return self.repr_str

    def __hash__(self):
        return hash(self.__repr__())

    def __eq__(self, other):
        try:
            return self.repr_str == other.repr_str
        except Exception:
            return False
