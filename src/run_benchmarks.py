import argparse
from transform_and_run import *


def get_args():
    parser = argparse.ArgumentParser(description="Arguments for experiment runs.")
    parser.add_argument(
        "tool",
        choices=["all", "CondHist", "UnCondHist1", "UnCondHist2", "Quic3", "GSpacer", "Freqhorn"],
        help="Choose a tool to run.",
    )
    parser.add_argument(
        "benchmark_set",
        choices=["all", "single", "multiple"],
        help="Choose a benchmark set.",
    )
    parser.add_argument("--subset", type=int, help="Number of experiments to run.")
    parser.add_argument(
        "--only_run",
        type=str,
        help="Only run this experiment. For example: --only-run=array_copy.smt2. If the given experiment is not in the selected benchmark set, no benchmark will be run.",
    )
    args = parser.parse_args()
    return args.tool, args.benchmark_set, args.subset, args.only_run


if __name__ == "__main__":
    tool, bench_set, subset, only_run = get_args()
    reset_test_categories()
    if bench_set == "all":
        print("-----Running Single-----")
        run_aeval_single(tool, subset, only_run)
        print("-----Running Multiple-----")
        run_aeval_multiple(tool, subset, only_run)
    elif bench_set == "single":
        print("-----Running Single-----")
        run_aeval_single(tool, subset, only_run)
    elif bench_set == "multiple":
        print("-----Running Multiple-----")
        run_aeval_multiple(tool, subset, only_run)
