import z3
import sys, os

# how to translate from old z3 fixedpoint format to new CHC format

def get_diff_format(fname):
    z3.set_param(verbose=1)
    p = z3.Fixedpoint()
    q = p.parse_file(fname)
    p.set(engine='pdr')
    p.set(print_fixedpoint_extensions=False)
    return p.to_string(q)

def main():
    bench_dir = "../../examples/benchmarks/aeval-bench-horn/"
    for fname in os.listdir(bench_dir):
        if "DS_Store" in fname:
            continue

        try:
            format_string = get_diff_format(os.path.join(bench_dir, fname))
        except:
            print(f"{fname} does not work")
            continue
        with open(os.path.join("../../examples/benchmarks/horn/", fname), "w+") as new_file:
            new_file.write(format_string)


if __name__ == '__main__':
    main()
