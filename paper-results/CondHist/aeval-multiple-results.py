good = {
    "array_tiling_poly2.smt2": {"time": "0:00:16.747730"},
    "array_nest_split_05.smt2": {"time": "0:00:00.039509"},
    "array_max_min_shift.smt2": {"time": "0:00:08.850161"},
    "array2dim_copy.smt2": {"time": "0:00:00.164415"},
    "array_hybr_nest_2.smt2": {"time": "0:00:00.176223"},
    "array2dim_init_j.smt2": {"time": "0:00:00.209989"},
    "array_max_min_approx.smt2": {"time": "0:00:11.528205"},
    "array_init_reverse_mult.smt2": {"time": "0:00:01.818537"},
    "array_two_counters_sum.smt2": {"time": "0:01:37.807628"},
    "array_max_min.smt2": {"time": "0:00:00.308595"},
    "array_min_and_copy.smt2": {"time": "0:00:06.615748"},
    "array2dim_rec2.smt2": {"time": "0:00:00.181601"},
    "array_nest_split_01.smt2": {"time": "0:00:00.132008"},
    "array_init_both_ends_multiple.smt2": {"time": "0:00:26.921325"},
    "array_hybr_add.smt2": {"time": "0:00:05.726110"},
    "array2dim_init.smt2": {"time": "0:00:00.181008"},
    "array_init_pair_symmetr.smt2": {"time": "0:00:17.708086"},
    "array2dim_init_i.smt2": {"time": "0:00:00.058976"},
    "array_horn_copy2.smt2": {"time": "0:00:01.799246"},
    "array_bubble_sort_rev.smt2": {"time": "0:00:00.014819"},
    "array_init_increm_two_arrs_antisym.smt2": {"time": "0:00:21.866362"},
    "array_init_addvar7.smt2": {"time": "0:00:00.997197"},
    "array_init_symmetr_swap.smt2": {"time": "0:00:37.842383"},
    "array_hybr_nest_3.smt2": {"time": "0:00:00.172243"},
    "array_nest_split_04.smt2": {"time": "0:00:00.133320"},
    "array_hybr_nest_1.smt2": {"time": "0:00:00.049619"},
    "array_hybr_nest_5.smt2": {"time": "0:00:00.050318"},
    "array_hybr_nest_4.smt2": {"time": "0:00:00.049886"},
    "array_bubble_sort.smt2": {"time": "0:00:00.014272"},
    "array_min_and_copy_shift.smt2": {"time": "0:00:04.778467"},
    "array_nest_split_03.smt2": {"time": "0:00:00.132887"},
    "array_nest_split_02.smt2": {"time": "0:00:00.132086"},
    "array2dim_rec1.smt2": {"time": "0:00:00.174133"},
}
proph = {}
interp = {
    "array_hybr_sum.smt2": {
        "time": "0:00:23.066481",
        "interpolant": "[Not(j_next >= 0), j >= 0]",
    },
    "array_init_addvar.smt2": {
        "time": "0:00:29.905091",
        "interpolant": "[Not(Read(a_next, Z_next) + -2 >= 0), Not(Read(a_next, Z_next) + -2 >= 0)]",
    },
    "array_init_addvar5.smt2": {
        "time": "0:01:27.443839",
        "interpolant": "[Not(Read(a_next, Z_next) <= -3), Not(Read(a_next, Z_next) <= -3)]",
    },
    "array_init_increm_twice.smt2": {
        "time": "0:01:15.539468",
        "interpolant": "[Read(a, Z) + -2 >= 0, Not(Read(a_next, Z_next) + -2 >= 0), Not(Read(a_next, Z_next) + -2 >= 0)]",
    },
    "array_init_increm.smt2": {
        "time": "0:00:10.598245",
        "interpolant": "[Not(Read(a_next, Z_next) + -1 >= 0)]",
    },
    "array_init_addvar2.smt2": {
        "time": "0:00:11.932492",
        "interpolant": "[Not(Read(a_next, Z_next) + -3 >= 0)]",
    },
    "array_init_pair_sum.smt2": {
        "time": "0:00:10.273495",
        "interpolant": "[Read(c, Z) + -3 >= 0, Read(c, Z) + -3 >= 0]",
    },
    "array_init_nondet_vars_plus_ind.smt2": {
        "time": "0:01:02.076869",
        "interpolant": "[Not(Read(c_next, Z_next) <= -7720)]",
    },
    "array_init_and_copy_const.smt2": {
        "time": "0:00:24.305343",
        "interpolant": "[Not(Read(b_next, Z_next) + -1 == 0)]",
    },
    "array_init_doubl.smt2": {
        "time": "0:00:34.069200",
        "interpolant": "[Not(Read(a_next, Z_next) + -2 >= 0)]",
    },
    "array_max_reverse_min.smt2": {
        "time": "0:01:56.365064",
        "interpolant": "[Not(Read(c_next, Z_next) <= max_next)]",
    },
    "array_init_addvar4.smt2": {
        "time": "0:00:12.685774",
        "interpolant": "[Not(Read(a_next, Z_next) <= -2)]",
    },
    "array_init_pair_symmetr3.smt2": {
        "time": "0:00:47.014692",
        "interpolant": "[Not(N_next == Read(c_next, Z_next))]",
    },
    "array_init_and_copy.smt2": {
        "time": "0:00:24.003222",
        "interpolant": "[Not(Read(b_next, Z_next) + -1 == 0)]",
    },
    "array_init_addvar6.smt2": {
        "time": "0:01:22.725574",
        "interpolant": "[Not(Read(a_next, Z_next) <= -4), Not(Read(a_next, Z_next) <= -4), Not(Read(a_next, Z_next) <= -4)]",
    },
    "array_init_pair_symmetr2.smt2": {
        "time": "0:01:22.409577",
        "interpolant": "[Not(Read(c_next, Z_next) + -1 >= 0), Not(Read(c_next, Z_next) + -1 >= 0)]",
    },
    "array_init_increm_two_arrs.smt2": {
        "time": "0:01:00.092427",
        "interpolant": "[Not(Read(b_next, Z_next) <= Read(a_next, Z_next))]",
    },
    "array_init_doubl2.smt2": {
        "time": "0:00:20.024221",
        "interpolant": "[Z == 1]",
    },
}
strange = {
    "array_tiling_poly6.smt2": {"error": "IC3IA gives 'Unknown'"},
    "array_init_doubl3.smt2": {"error": "IC3IA gives 'Unknown'"},
    "array_init_pair_symmetr4.smt2": {"error": "IC3IA gives 'Unknown'"},
    "array_init_addvar3.smt2": {"error": "IC3IA gives 'Unknown'"},
    "array_two_counters_add.smt2": {"error": "IC3IA gives 'Unknown'"},
    "array_equiv_2.smt2": {"error": "IC3IA gives 'Unknown'"},
}
timeouts = [
    "array_tiling_poly4.smt2",
    "array_equiv_3.smt2",
    "array_init_increm_twice_const.smt2",
    "array_init_increm_two_arrs_antisym_const.smt2",
    "array_equiv_1.smt2",
    "array_init_increm_two_arrs_const.smt2",
    "array_double_inverse.smt2",
    "array_init_both_ends_multiple_sum.smt2",
    "array_zero_sum_m2.smt2",
    "array_init_and_copy_inverse.smt2",
    "array_copy_nondet_add.smt2",
    "array_init_symmetr_swap_const.smt2",
    "array_min_and_copy_inverse.smt2",
    "array_init_pair_sum_const.smt2",
    "array_standard_copy4.smt2",
    "array_min_and_copy_shift_sum_add.smt2",
    "array_min_and_copy_shift_sum.smt2",
    "array_init_increm_const.smt2",
]

print(
    f"CondHist Multiple | good: {len(good)}, proph: {len(proph)}, interp: {len(interp)}, timeout: {len(timeouts)}, error: {len(strange)}"
)
