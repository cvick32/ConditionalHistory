import argparse
from transform_and_run import *

def get_args():
    parser = argparse.ArgumentParser(description='Arguments for experiment runs.')
    parser.add_argument('tool', choices=['all', 'CondHist', 'UnCondHist1', 'UnCondHist2', 'Quic3', 'GSpacer'],
                        help='Choose a tool to run.')
    parser.add_argument('benchmark_set', choices=['all', 'single', 'multiple'],
                        help='Choose a benchmark set.')
    parser.add_argument('--subset', type=int, help='Number of experiments to run.')
    args = parser.parse_args()
    return args.tool, args.benchmark_set, args.subset


if __name__ == "__main__":
    tool, bench_set, subset = get_args()
    reset_test_categories()
    if bench_set == "all":
        print("-----Running Single-----")
        run_aeval_single(tool, subset)
        print("-----Running Multiple-----")
        run_aeval_multiple(tool, subset)
    elif bench_set == "single":
        print("-----Running Single-----")
        run_aeval_single(tool, subset)
    elif bench_set == "multiple":
        print("-----Running Multiple-----")
        run_aeval_multiple(tool, subset)



