good = {
    "array_nest_split_05.smt2": {"time": "0:00:00.038329"},
    "array_max_min_shift.smt2": {"time": "0:00:02.648710"},
    "array2dim_copy.smt2": {"time": "0:00:00.046607"},
    "array_init_addvar5.smt2": {"time": "0:00:19.907587"},
    "array_hybr_nest_2.smt2": {"time": "0:00:00.047642"},
    "array2dim_init_j.smt2": {"time": "0:00:00.057970"},
    "array_max_min_approx.smt2": {"time": "0:00:07.962269"},
    "array_max_min.smt2": {"time": "0:00:00.085150"},
    "array_min_and_copy.smt2": {"time": "0:00:02.005174"},
    "array2dim_rec2.smt2": {"time": "0:00:00.050233"},
    "array_nest_split_01.smt2": {"time": "0:00:00.035924"},
    "array_init_both_ends_multiple.smt2": {"time": "0:00:08.747683"},
    "array_hybr_add.smt2": {"time": "0:00:01.626588"},
    "array2dim_init.smt2": {"time": "0:00:00.047450"},
    "array2dim_init_i.smt2": {"time": "0:00:00.055959"},
    "array_horn_copy2.smt2": {"time": "0:00:00.528356"},
    "array_bubble_sort_rev.smt2": {"time": "0:00:00.013461"},
    "array_min_and_copy_inverse.smt2": {"time": "0:00:07.220477"},
    "array_init_addvar7.smt2": {"time": "0:00:00.277383"},
    "array_hybr_nest_3.smt2": {"time": "0:00:00.046130"},
    "array_nest_split_04.smt2": {"time": "0:00:00.036510"},
    "array_hybr_nest_1.smt2": {"time": "0:00:00.045406"},
    "array_hybr_nest_5.smt2": {"time": "0:00:00.046446"},
    "array_hybr_nest_4.smt2": {"time": "0:00:00.045808"},
    "array_bubble_sort.smt2": {"time": "0:00:00.012005"},
    "array_min_and_copy_shift.smt2": {"time": "0:00:01.237520"},
    "array_nest_split_03.smt2": {"time": "0:00:00.036500"},
    "array_nest_split_02.smt2": {"time": "0:00:00.036142"},
    "array2dim_rec1.smt2": {"time": "0:00:00.048745"},
}
proph = {"array_init_addvar5.smt2": {"time": "0:00:19.907587"}}
interp = {}
strange = {
    "array_tiling_poly6.smt2": {"error": "IC3IA gives 'Unknown'"},
    "array_init_pair_symmetr4.smt2": {"error": "IC3IA gives 'Unknown'"},
    "array_equiv_2.smt2": {"error": "IC3IA gives 'Unknown'"},
}
timeouts = [
    "array_init_reverse_mult.smt2"
    "array_hybr_sum.smt2",
    "array_init_increm_twice_const.smt2",
    "array_tiling_poly4.smt2",
    "array_tiling_poly2.smt2",
    "array_init_addvar.smt2",
    "array_init_increm_two_arrs_antisym_const.smt2",
    "array_init_increm_twice.smt2",
    "array_init_increm.smt2",
    "array_init_addvar2.smt2",
    "array_init_pair_sum.smt2",
    "array_equiv_1.smt2",
    "array_init_nondet_vars_plus_ind.smt2",
    "array_init_doubl2.smt2",
    "array_two_counters_sum.smt2",
    "array_init_increm_two_arrs_const.smt2",
    "array_double_inverse.smt2",
    "array_init_both_ends_multiple_sum.smt2",
    "array_zero_sum_m2.smt2",
    "array_init_and_copy_const.smt2",
    "array_init_pair_symmetr.smt2",
    "array_init_and_copy_inverse.smt2",
    "array_init_doubl.smt2",
    "array_init_doubl3.smt2",
    "array_copy_nondet_add.smt2",
    "array_init_symmetr_swap_const.smt2",
    "array_init_increm_two_arrs_antisym.smt2",
    "array_init_pair_sum_const.smt2",
    "array_max_reverse_min.smt2",
    "array_standard_copy4.smt2",
    "array_init_addvar4.smt2",
    "array_init_symmetr_swap.smt2",
    "array_init_pair_symmetr3.smt2",
    "array_init_and_copy.smt2",
    "array_init_addvar3.smt2",
    "array_min_and_copy_shift_sum_add.smt2",
    "array_min_and_copy_shift_sum.smt2",
    "array_init_increm_const.smt2",
    "array_init_addvar6.smt2",
    "array_init_pair_symmetr2.smt2",
    "array_init_increm_two_arrs.smt2",
    "array_two_counters_add.smt2",
    "array_equiv_3.smt2",
]

print(
    f"UnCondHist2 Multiple | good: {len(good)}, proph: {len(proph)}, timeout: {len(timeouts)}, error: {len(strange)}"
)
