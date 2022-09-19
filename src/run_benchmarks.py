from transform_and_run import *


tools_to_run = ["CondHist", "GSpacer", "Quic3"]
num_subset = 5

def run_all_benchmarks():
    reset_test_categories()
    for tool in tools_to_run:
        print(f"Running {tool} on singles...")
        run_aeval_single(tool)
        print(f"Running {tool} on multiples...")
        run_aeval_multiple(tool)

def run_subset_benchmarks():
    reset_test_categories()
    for tool in tools_to_run:
        print(f"Running {tool} on singles...")
        run_aeval_single(tool, num=num_subset)
        print(f"Running {tool} on multiples...")
        run_aeval_multiple(tool, num=num_subset)




run_all_benchmarks()
