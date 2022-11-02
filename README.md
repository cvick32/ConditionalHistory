[![DOI](https://zenodo.org/badge/538743822.svg)](https://zenodo.org/badge/latestdoi/538743822)

# Setup from Scratch for Ubuntu

This is how I would set up the tool to run on a fresh Ubuntu instance.
Everything I download that isn't an apt package is downloaded to the
home directory: `/home/ubuntu/`.

- Clone this Repo
  - https://github.com/cvick32/ConditionalHistory.git
- Update Apt
  - `sudo apt update`
- Install IC3IA
  - `wget https://es-static.fbk.eu/people/griggio/ic3ia/ic3ia-22.07.tar.gz`
  - `tar -xvf ic3ia-22.07.tar.gz`
  - `mv ic3ia-22.07.tar.gz ic3ia`
  - Install MathSAT
    - `wget https://mathsat.fbk.eu/download.php?file=mathsat-5.6.8-linux-x86_64.tar.gz`
    - `tar -xvf 'download.php?file=mathsat-5.6.8-linux-x86_64.tar.gz'`
  - Install Cmake
    - `sudo apt install cmake`
  - Install g++
    - `sudo apt install g++`
    - `export CXX=g++`
  - Install gmp
    - `sudo apt install libgmp3-dev`
  - `cd ic3ia`
  - `mkdir build`
  - `cd build`
  - `cmake .. -DMATHSAT_DIR=/home/ubuntu/mathsat -DCMAKE_BUILD_TYPE=Release`
  - `make`
  - Copy IC3IA to `/usr/bin/`
    - `sudo cp ic3ia /usr/bin/`
- Install Python3
  - `sudo apt install python3 python3-pip python3.10-venv`
- Install Java 11 or greater
  - `sudo apt install openjdk-17-jre-headless`
- Change directory to ConditionalHistory
  - `cd ConditionalHistory`
- Create a virtual environment
  - `python3 -m venv ch`
- Activate environment
  - `source ch/bin/activate`
- Install requirements
  - `python -m pip install -r requirements.txt`
- Test that everything is working
  - `cd src`
  - `python run_benchmarks.py CondHist multiple --only_run=array_hybr_sum.smt2`

These steps must be done in order to run the tool! Make sure that in
the terminal there is an environment that precedes the command line.
For instance, for a virtual environment named `ch`, after the
environment is activated the command line of the terminal should be
preceded by `(ch)`.


# Paper Results
To see the result of each benchmark set on each tool you can look at
the corresponding python script. For example, if you want to see how
CondHist performed on the single loop benchmarks set you would open
the file:
`ConditionalHistory/paper-results/CondHist/aeval-single-results.py`.

To see the numbers from the paper for each tool, benchmark combination
run the `showPaperResults.sh` script in the top-level directory.

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

## Watching Results

If at any point a certain benchmarks hangs, you can C-c out of that
particular benchmark run and continue with the rest. The alternative
is to close the entire shell session which will kill the entire
benchmark run.

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

## Output Files

To view the output of our tool, first run a benchmark: `python
run_benchmark.py CondHist single --only_run=array_copy.smt2`.

Then, after that command terminates, view the `out.vmt` file in the
`src` directory. This file is runnable in `ic3ia` like so: `ic3ia
out.vmt`.

## "Interesting" Benchmarks

To find a benchmark that requires synthesizing a history condition you
can look in the `interp` dictionary of
`paper-results/CondHist/aeval-multiple-results.py`.

Then, to run that benchmark, for instance `array_hybr_sum.smt2`, run:

`python run_benchmarks.py CondHist multiple --only_run=array_hybr_sum.smt2`

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

Note that each of these commands will take from 1 to 2 hours to
complete. To run a subset of the benchmarks, use the `--subset`
command line argument, demonstrated above.




