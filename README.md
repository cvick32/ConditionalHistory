# Running
- create a virtual environment
  - `python3 -m venv abstract`
- activate environment
  - `source abstract/bin/activate`
- install requirements
  - `python3 -m pip install -r requirements.txt`

# Files
- array_axioms.py
  - definitions for the array axioms we allow
- axiom.py
  - defintion of the Axiom object
- egraph.py
  - handles the instantiation of the egraph from a z3 model and finds axiom violations in the model
- smallExample.py
  - a simple array program in z3 that satisfies its specification
- smtToVmt.py
  - handles the translation of examples into vmt and running BMC with current counterexample bound
  - updates the example with axiom violations and new counterexamples

# Operation
- `run_loop` in smtToVmt.py is the main entrypoint
 - in `run_loop` we start by running ic3ia
  - this gives us a counterexample
 - we then run BMC with the length of the counterexample as a bound
  - check for axiom violations in the BMC model
  - enforce violations as constraints in the original model
