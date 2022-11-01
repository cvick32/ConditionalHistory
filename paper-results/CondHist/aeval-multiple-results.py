good = {
    "array_init_addvar7.smt2": {"time": "0:00:00.199157"},
    "array2dim_init_j.smt2": {"time": "0:00:00.047453"},
    "array_hybr_nest_2.smt2": {"time": "0:00:00.047454"},
    "array_init_increm_two_arrs_antisym_const.smt2": {"time": "0:00:06.472273"},
    "array_hybr_nest_3.smt2": {"time": "0:00:00.044024"},
    "array_init_pair_symmetr.smt2": {"time": "0:00:06.884634"},
    "array_hybr_add.smt2": {"time": "0:00:01.720023"},
    "array_max_min_shift.smt2": {"time": "0:00:02.148216"},
    "array_hybr_nest_4.smt2": {"time": "0:00:00.045901"},
    "array_max_min.smt2": {"time": "0:00:00.076223"},
    "array_init_increm_two_arrs_antisym.smt2": {"time": "0:00:07.433242"},
    "array2dim_init.smt2": {"time": "0:00:00.048400"},
    "array_hybr_nest_5.smt2": {"time": "0:00:00.049771"},
    "array_nest_split_01.smt2": {"time": "0:00:00.034938"},
    "array2dim_rec2.smt2": {"time": "0:00:00.045364"},
    "array_min_and_copy.smt2": {"time": "0:00:02.086990"},
    "array_nest_split_02.smt2": {"time": "0:00:00.037108"},
    "array2dim_rec1.smt2": {"time": "0:00:00.049860"},
    "array_two_counters_sum.smt2": {"time": "0:00:07.318031"},
    "array2dim_copy.smt2": {"time": "0:00:00.045950"},
    "array_bubble_sort_rev.smt2": {"time": "0:00:00.019527"},
    "array_init_both_ends_multiple.smt2": {"time": "0:00:14.166834"},
    "array_init_reverse_mult.smt2": {"time": "0:00:03.377909"},
    "array_double_inverse.smt2": {"time": "0:00:39.866421"},
    "array_nest_split_03.smt2": {"time": "0:00:00.077010"},
    "array_equiv_1.smt2": {"time": "0:00:37.465860"},
    "array_bubble_sort.smt2": {"time": "0:00:00.018486"},
    "array_min_and_copy_shift.smt2": {"time": "0:00:01.112491"},
    "array_nest_split_04.smt2": {"time": "0:00:00.041842"},
    "array_horn_copy2.smt2": {"time": "0:00:00.586944"},
    "array_nest_split_05.smt2": {"time": "0:00:00.038915"},
    "array_max_min_approx.smt2": {"time": "0:00:08.108525"},
    "array2dim_init_i.smt2": {"time": "0:00:00.053057"},
    "array_hybr_nest_1.smt2": {"time": "0:00:00.049293"},
}
proph = {}
interp = {
    "array_hybr_sum.smt2": {"time": "0:00:13.211851", "interpolant": "[j >= 0]"},
    "array_min_and_copy_shift_sum_add.smt2": {
        "time": "0:00:10.602361",
        "interpolant": "[k >= 0]",
    },
    "array_max_reverse_min.smt2": {
        "time": "0:00:45.695412",
        "interpolant": "[Not(Read(c_next, Z_next) <= max_next)]",
    },
    "array_init_increm_twice_const.smt2": {
        "time": "0:00:12.450948",
        "interpolant": "[Z == i, Read(a, i) >= 0, Z == i + 1]",
    },
    "array_init_pair_sum.smt2": {
        "time": "0:00:08.169889",
        "interpolant": "[Read(c, Z) + -3 >= 0]",
    },
    "array_init_doubl.smt2": {
        "time": "0:00:07.873325",
        "interpolant": "[Not(Read(a_next, Z_next) + -2 >= 0)]",
    },
    "array_init_addvar6.smt2": {
        "time": "0:00:41.016524",
        "interpolant": "[3*j + Read(a, 1) <= -4]",
    },
    "array_init_increm_two_arrs_const.smt2": {
        "time": "0:00:18.458612",
        "interpolant": "[Not(Read(b_next, Z_next) <= Read(a_next, Z_next))]",
    },
    "array_min_and_copy_shift_sum.smt2": {
        "time": "0:01:56.892255",
        "interpolant": "[Read(b, i) >= 0, k >= 0]",
    },
    "array_init_increm_twice.smt2": {
        "time": "0:00:11.436630",
        "interpolant": "[Z == i, Not(Read(a_next, Z_next) + -2 >= 0), Not(Read(a, Z) == Read(a, i))]",
    },
    "array_init_and_copy.smt2": {
        "time": "0:00:06.382177",
        "interpolant": "[Not(Read(b_next, Z_next) + -1 == 0)]",
    },
    "array_init_nondet_vars_plus_ind.smt2": {
        "time": "0:00:13.368500",
        "interpolant": "[Not(Read(c_next, Z_next) <= -16304)]",
    },
    "array_init_symmetr_swap_const.smt2": {
        "time": "0:00:17.020173",
        "interpolant": "[Read(b, i) + x == 0]",
    },
    "array_init_addvar.smt2": {
        "time": "0:00:09.603282",
        "interpolant": "[Not(Read(a_next, Z_next) + -2 >= 0)]",
    },
    "array_init_pair_sum_const.smt2": {
        "time": "0:00:08.761340",
        "interpolant": "[Read(c, Z) + -3 >= 0]",
    },
    "array_init_pair_symmetr3.smt2": {
        "time": "0:00:18.145803",
        "interpolant": "[Not(N_next == Read(c_next, Z_next)), N == Read(c, Z)]",
    },
    "array_init_addvar3.smt2": {
        "time": "0:00:08.163053",
        "interpolant": "[Not(Read(a_next, Z_next) <= 0)]",
    },
    "array_init_addvar2.smt2": {
        "time": "0:00:10.482344",
        "interpolant": "[Read(a, Z) >= 0]",
    },
    "array_init_increm_two_arrs.smt2": {
        "time": "0:00:20.008090",
        "interpolant": "[Not(Read(b_next, Z_next) <= Read(a_next, Z_next))]",
    },
    "array_init_pair_symmetr2.smt2": {
        "time": "0:00:19.208544",
        "interpolant": "[Not(Read(c_next, Z_next) + -1 >= 0)]",
    },
    "array_init_increm_const.smt2": {
        "time": "0:00:07.820006",
        "interpolant": "[Not(Read(a_next, Z_next) + -1 >= 0)]",
    },
    "array_init_doubl2.smt2": {"time": "0:00:09.184978", "interpolant": "[Z == 1]"},
    "array_copy_nondet_add.smt2": {
        "time": "0:01:11.433885",
        "interpolant": "[Read(b, 1) == Read(a, Z) + j, Read(a, Z) <= Read(c, Z) + -8]",
    },
    "array_init_both_ends_multiple_sum.smt2": {
        "time": "0:00:32.835464",
        "interpolant": "[sum <= -1, sum == 0]",
    },
    "array_init_and_copy_const.smt2": {
        "time": "0:00:06.769081",
        "interpolant": "[Not(Read(b_next, Z_next) + -1 == 0)]",
    },
    "array_init_increm.smt2": {
        "time": "0:00:08.376059",
        "interpolant": "[Not(Read(a_next, Z_next) + -1 >= 0)]",
    },
    "array_init_addvar4.smt2": {
        "time": "0:00:10.318649",
        "interpolant": "[j + Read(a, i) <= -2]",
    },
    "array_init_doubl3.smt2": {
        "time": "0:00:12.124372",
        "interpolant": "[Read(a, Z) <= 3]",
    },
    "array_init_symmetr_swap.smt2": {
        "time": "0:00:20.511278",
        "interpolant": "[Z == 1]",
    },
    "array_init_addvar5.smt2": {
        "time": "0:00:19.266137",
        "interpolant": "[Read(a, 1) + j <= -52953]",
    },
}
strange = {
    "array_equiv_2.smt2": {"error": "IC3IA gives 'Unknown'"},
    "array_tiling_poly6.smt2": {"error": "IC3IA gives 'Unknown'"},
    "array_init_pair_symmetr4.smt2": {"error": "IC3IA gives 'Unknown'"},
}
timeouts = [
    "array_standard_copy4.smt2",
    "array_equiv_3.smt2",
    "array_init_and_copy_inverse.smt2",
    "array_min_and_copy_inverse.smt2",
    "array_zero_sum_m2.smt2",
    "array_tiling_poly4.smt2",
    "array_two_counters_add.smt2",
    "array_tiling_poly2.smt2",
]


print(
    f"CondHist Multiple | good: {len(good)}, proph: {len(proph)}, interp: {len(interp)}, timeout: {len(timeouts)}, error: {len(strange)}"
)
