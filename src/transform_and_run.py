import os

import shutil
from pstats import SortKey, Stats
from datetime import datetime
import json
from z3 import Implies, substitute
import subprocess

from transforms.multi_inv_transform import MultiInvariantTransform
from transforms.single_inv_transform import SingleInvariantTransform
from transforms.single_rule_horn_transform import SingleRuleHornTransform
from utils import Translate
from smt_problem import SmtProblem
from smt_to_vmt import SmtToVmt
from utils import timeout, is_benchmark_file, write_sexpr_list_to_file
from variable import StateVariable

GSPACER_ARGS = "-v:0 fp.spacer.use_sage=false fp.xform.slice=true fp.spacer.global=true fp.spacer.concretize=true fp.spacer.conjecture=true fp.xform.inline_linear=true fp.xform.inline_eager=true fp.xform.tail_simplifier_pve=false fp.engine=spacer fp.print_statistics=true fp.spacer.elim_aux=true fp.spacer.reach_dnf=true fp.spacer.iuc=1 fp.spacer.iuc.arith=1 fp.validate=true fp.spacer.ground_pobs=true fp.spacer.mbqi=false fp.spacer.iuc.print_farkas_stats=false fp.spacer.iuc.old_hyp_reducer=false fp.spacer.ctp=true fp.spacer.native_mbp=true fp.spacer.use_iuc=true fp.spacer.expand_bnd=false fp.spacer.q3.use_qgen=true fp.spacer.q3.instantiate=true fp.spacer.q3=true"

GSPACER = "../solvers/gspacer"

QUIC3_ARGS = "fp.spacer.q3.use_qgen=true fp.spacer.ground_pobs=false fp.spacer.mbqi=false fp.spacer.use_euf_gen=true"

QUIC3 = "../solvers/z3"

FREQHORN = "freqhorn"

FREQHORN_ARGS = ""  # no arguments specified in the paper https://www.cs.fsu.edu/~grigory/freqhorn-arrays.pdf

benchmarks = "../examples/benchmarks/"
examples = "../examples/"

sol_and_interps = "../solutions-and-interpolants/"

SINGLE = os.path.join(benchmarks, "aeval-bench-horn")
MULTIPLE = os.path.join(benchmarks, "aeval-bench-horn-multiple")

SINGLE_CMD = os.path.join("../examples/benchmarks/horn/")

TIMEOUT_TIME = 120


def run_example(file):
    filename = os.path.join(examples, "small-example.smt2")
    p = None
    with open(filename) as f:
        p = SmtProblem(f.read())
    v = SmtToVmt(p.get_all_vars(), p.prop, filename)
    run_benchmark(filename, v, TIMEOUT_TIME)


def run_aeval_single_ours(tool_name, num, only_run):
    i = 0
    for filename in os.listdir(SINGLE):
        if i >= num:
            break
        i += 1
        if not is_benchmark_file(filename):
            continue
        if only_run and filename != only_run:
            continue
        problem = None
        with open(os.path.join(SINGLE, filename)) as f:
            problem = SmtProblem(f.read())
        v = SmtToVmt(problem.get_all_vars(), problem.prop, filename)
        run_benchmark(filename, v, TIMEOUT_TIME)
    write_test_results("aeval-single", tool_name)


def run_aeval_multiple_ours(tool_name, num, only_run):
    multi_inv = []
    for filename in os.listdir(MULTIPLE):
        if not is_benchmark_file(filename):
            continue
        if only_run and filename != only_run:
            continue
        multi_inv.append(
            {
                "filename": filename,
                "sexprs": Translate().get_sexprs_from_filename(
                    os.path.join(MULTIPLE, filename)
                ),
            }
        )
    single_inv = multi_inv_to_single_inv(multi_inv)
    run_single_inv(single_inv, num)
    write_test_results("aeval-multiple", tool_name)


def run_single_horn():
    b = os.path.join(benchmarks, "chc-comp")
    si = []
    for filename in os.listdir(b):
        if not is_benchmark_file(filename):
            continue
        sexprs = SingleRuleHornTransform(os.path.join(b, filename)).all_sexprs
        si.append({"filename": filename, "sexprs": sexprs})
    run_single_inv(si)


def multi_inv_to_single_inv(multi_inv):
    single_inv = []
    for mi in multi_inv:
        mit = MultiInvariantTransform(mi["sexprs"])
        mi["sexprs"] = mit.get_transformed_sexprs()
        single_inv.append(mi)
    return single_inv


def run_single_inv(single_inv, num):
    i = 0
    for si in single_inv:
        if i >= num:
            break
        i += 1
        f = si["filename"]
        sit = SingleInvariantTransform(si["sexprs"])
        all_vars, prop, control_flow = sit.get_problem_args()
        problem = SmtToVmt(all_vars, prop, f, control_flow=control_flow)
        run_benchmark(si["filename"], problem, TIMEOUT_TIME)


def run_benchmark_cmd(tool_name, benchmark_set, write_out_name, num, only_run_file):
    q3_or_gspacer = False
    if tool_name == "Quic3":
        solver = QUIC3
        args = QUIC3_ARGS
        q3_or_gspacer = True
    elif tool_name == "GSpacer":
        solver = GSPACER
        args = GSPACER_ARGS
        q3_or_gspacer = True
    elif tool_name == "Freqhorn":
        solver = FREQHORN
        args = FREQHORN_ARGS
    args = args.split(" ")
    i = 0
    for filename in os.listdir(benchmark_set):
        if i >= num:
            break
        i += 1
        if only_run_file and filename != only_run_file:
            continue
        print(f"-----{filename}-----")
        filename = os.path.join(benchmark_set, filename)
        with timeout(TIMEOUT_TIME):
            try:
                then = datetime.now()
                full_args = [solver] + args + [filename]
                out = subprocess.run(full_args, capture_output=True)
                time = datetime.now() - then
            except TimeoutError:
                print("timeout")
                test_timeouts.append(filename)
            except Exception as v:
                test_strange[filename] = {"error": str(v)}
            else:
                stdout = out.stdout.decode()
                stdout = stdout.strip()
                if q3_or_gspacer:
                    if stdout == "sat":
                        print("sat")
                        test_good[filename] = {"time": str(time)}
                    else:
                        test_strange[filename] = {
                            "error": "FAILURE",
                            "time": str(time),
                            "out": stdout,
                        }
                else:
                    if "Success" in stdout:
                        print(stdout)
                        test_good[filename] = {"time": str(time)}
                    else:
                        test_strange[filename] = {
                            "error": "FAILURE",
                            "time": str(time),
                            "out": stdout,
                        }
    write_test_results(write_out_name, tool_name)


def run_benchmark(filename, smt_prob, timeout_time):
    with timeout(timeout_time):
        try:
            then = datetime.now()
            print(f"-----{filename}-----")
            smt_prob.run_loop(debug=False)
            time = datetime.now() - then
            print(f"Total time: {datetime.now() - then}")
        except TimeoutError:
            print("timeout")
            test_timeouts.append(filename)
            return
        except Exception as v:
            test_strange[filename] = {"error": str(v)}
            print(v)
            return
        except KeyboardInterrupt as v:
            test_interp_doesnt_cover.append(filename)
            return
        else:
            if smt_prob.num_proph > 0 and smt_prob.used_interpolants == []:
                test_proph[filename] = {
                    "time": str(time),
                    "num_refinements": smt_prob.num_refinements,
                    "num_proph": smt_prob.num_proph,
                }
            if smt_prob.used_interpolants:
                test_interp[filename] = {
                    "time": str(time),
                    "num_refinements": smt_prob.num_refinements,
                    "num_proph": smt_prob.num_proph,
                    "interpolant": str(smt_prob.used_interpolants),
                }
            else:
                test_good[filename] = {
                    "time": str(time),
                    "num_refinements": smt_prob.num_refinements
                }


def write_test_results(dataset, tool_name):
    dir_name = os.path.join("..", "results", tool_name)
    if not os.path.exists(dir_name):
        os.makedirs(dir_name)
    with open(os.path.join(dir_name, f"{dataset}-results.py"), "w+") as f:
        f.write(f"good = {json.dumps(test_good)}\n")
        f.write(f"proph = {json.dumps(test_proph)}\n")
        f.write(f"interp = {json.dumps(test_interp)}\n")
        f.write(f"strange = {json.dumps(test_strange)}\n")
        f.write(f"timeouts = {json.dumps(test_timeouts)}\n")
    reset_test_categories()


def reset_test_categories():
    global test_proph
    test_proph = {}
    global test_strange
    test_strange = {}
    global test_good
    test_good = {}
    global test_timeouts
    test_timeouts = []
    global test_interp
    test_interp = {}
    global test_interp_doesnt_cover
    test_interp_doesnt_cover = []


def run_aeval_single(tool_name, num_bench, only_run):
    if num_bench is not None:
        num = num_bench
    else:
        num = 1000
    if tool_name == "Quic3":
        run_benchmark_cmd("Quic3", SINGLE_CMD, "aeval-single", num, only_run)
    elif tool_name == "GSpacer":
        run_benchmark_cmd("GSpacer", SINGLE_CMD, "aeval-single", num, only_run)
    elif tool_name == "Freqhorn":
        run_benchmark_cmd("Freqhorn", SINGLE_CMD, "aeval-single", num, only_run)
    elif tool_name == "CondHist":
        run_aeval_single_ours(tool_name, num, only_run)
    else:
        raise ValueError(
            f"Tool {tool_name} not found. Are you on the correct branch?\nOnly Quic3, GSpacer, and CondHist are available on this branch."
        )


def run_aeval_multiple(tool_name, num_bench, only_run):
    if num_bench is not None:
        num = num_bench
    else:
        num = 1000
    if tool_name == "Quic3":
        run_benchmark_cmd("Quic3", MULTIPLE, "aeval-multiple", num, only_run)
    elif tool_name == "GSpacer":
        run_benchmark_cmd("GSpacer", MULTIPLE, "aeval-multiple", num, only_run)
    elif tool_name == "Freqhorn":
        run_benchmark_cmd("Freqhorn", MULTIPLE, "aeval-multiple", num, only_run)
    elif tool_name == "CondHist":
        run_aeval_multiple_ours(tool_name, num, only_run)
    else:
        raise ValueError(
            f"Tool {tool_name} not found. Are you on the correct branch?\nOnly Quic3, GSpacer, and CondHist are available on this branch."
        )
