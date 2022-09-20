# Setup
- Create a virtual environment
  - `python3 -m venv ch`
- Activate environment
  - `source ch/bin/activate`
- Install requirements
  - `python -m pip install -r requirements.txt`

# Running Experiments
There are 3 different branches in this git repository. The main branch
contains the code to run the following tools: CondHist, GSpacer, and
Quic3. The UnCondHist1 branch contains the code for the UnCondHist1
variant and the branch UnCondHist1 contains the code for the
UnCondHist2 variant.

Everytime an experiment is run it will update the python script that
logs the results of that run in `./results/{tool_name}/`.

- Change directories to `src`
  - `cd src`
- Run all benchmarks on our tool
  - `python run_benchmarks.py CondHist all`
- Run 20 single-loop benchmarks on our tool
  - `python run_benchmarks.py CondHist single --subset=20`
- Run 5 multi-loop benchmarks on Quic3
  - `python run_benchmarks.py Quic3 multiple --subset=5`
- Run the `array_copy.smt2` benchmark on our tool
  - `python run_benchmarks.py CondHist single --only_run=array_copy.smt2`

All results will be in python files that can be viewed in the
top-level directory under `results/{tool_name}/`.

## run_benchmarks.py Arguments

- Tool Name
  - one of {CondHist, Quic3, GSpacer, UnCondHist1, UnCondHist2}
- Benchmark set
  - one of {all, single, multiple}
- Subset of benchmarks
  - defaults to all
  - run specified number of benchmarks
- Only run a particular file

## Other Branches

The versions of our tool that introduce unconditional history
variables are on separate branches. To run `UnCondHist1`, which is our
implementation of the algorithm described
[here](https://cs.stanford.edu/~padon/arrays-prophecy-tacas2021.pdf),
run the following command: `git switch UnCondHist1`.

To run `UnCondHist2`, which uses our algorithm for finding axiom
violations but unconditional history variables, run: `git switch
UnCondHist2`.

Once you have switched branches, you can use the `run_benchmark.py`
script detailed above to try the tool with the different benchmark
sets.

To get back to the main branch run: `git switch main`.

# Reproducing Results
To reproduce all the results from the paper in full you will need to
run the following commands:

- on branch `main`
  - `python run_benchmarks.py CondHist all`
  - `python run_benchmarks.py GSpacer all`
  - `python run_benchmarks.py Quic3 all`

- on branch `UnCondHist1`
  - `python run_benchmarks.py UnCondHist1 all`

- on branch `UnCondHist2`
  - `python run_benchmarks.py UnCondHist2 all`

Note that these commands will take multiple hours to complete. To run
a subset of the benchmarks, use the `--subset` command line argument,
demonstrated above.




