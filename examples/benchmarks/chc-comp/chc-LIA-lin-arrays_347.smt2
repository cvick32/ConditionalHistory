(set-logic HORN)
(declare-fun state ((Array Int Int) Int Int Int Bool Bool Int) Bool)
(assert (forall ((|A_1| (Array Int Int)) (|B_1| Int) (|C_0| Int) (|.y.4| Int) (|.loc.5| Bool) (|.loc.6| Bool) (|D_3| Int) (|.loc.8| Bool) (|v_3| Int) (|.x.3| Int) (|.x.2| (Array Int Int)) (|.loc.9| Bool) (|.y.7| Int) (|.xpv.1| Int)) (=> (and (and (not .loc.5) (not .loc.6)) (= B_1 0)) (state |A_1| |B_1| |C_0| |.y.4| |.loc.5| |.loc.6| |D_3|))))
(assert (forall ((|A_1| (Array Int Int)) (|B_1| Int) (|C_0| Int) (|.y.4| Int) (|.loc.5| Bool) (|.loc.6| Bool) (|D_3| Int) (|.loc.8| Bool) (|v_3| Int) (|.x.3| Int) (|.x.2| (Array Int Int)) (|.loc.9| Bool) (|.y.7| Int) (|.xpv.1| Int)) (=> (and (state |A_1| |B_1| |C_0| |.y.4| |.loc.5| |.loc.6| |D_3|) (let ((.def_17 (not .loc.5))) (let ((.def_18 (not .loc.6))) (let ((.def_28 (<= C_0 B_1))) (let ((.def_31 (= C_0 .x.3))) (let ((.def_36 (<= .y.4 C_0))) (let ((.def_42 (= (+ B_1 (* (- 1) v_3)) (- 1)))) (let ((.def_46 (= A_1 .x.2))) (let ((.def_52 (not .def_28))) (let ((.def_56 (not .loc.9))) (let ((.def_72 (= B_1 v_3))) (let ((.def_77 (select A_1 B_1))) (let ((.def_78 (select A_1 C_0))) (or (or (and (and .def_18 (not .loc.8)) (or (and (or (and .def_17 (and (and (= v_3 0) .def_28) .def_31)) (and (and (and .loc.5 (= .y.4 .x.3)) .def_36) .def_42)) (and .def_46 .loc.9)) (and (= .x.2 (store A_1 B_1 B_1)) (and (and .def_42 (and .def_17 (and .def_31 .def_52))) .def_56)))) (and (= (+ B_1 (* (- 1) .x.3)) (- 1)) (and (and (= C_0 .y.7) (and .def_56 (and .loc.8 (and .def_17 (and .loc.6 (and .def_46 .def_52)))))) .def_72))) (and (not .def_36) (and (= .x.2 (ite (<= .def_77 .def_78) A_1 (store (store A_1 B_1 .def_78) C_0 .def_77))) (and (= (+ C_0 (* (- 1) .x.3)) (- 1)) (and (= .y.4 .y.7) (and .def_72 (and .def_56 (and .loc.8 (and .loc.5 .def_18)))))))))))))))))))))) (state |.x.2| |v_3| |.x.3| |.y.7| |.loc.8| |.loc.9| |.xpv.1|))))
(assert (forall ((|A_1| (Array Int Int)) (|B_1| Int) (|C_0| Int) (|.y.4| Int) (|.loc.5| Bool) (|.loc.6| Bool) (|D_3| Int) (|.loc.8| Bool) (|v_3| Int) (|.x.3| Int) (|.x.2| (Array Int Int)) (|.loc.9| Bool) (|.y.7| Int) (|.xpv.1| Int)) (=> (state |A_1| |B_1| |C_0| |.y.4| |.loc.5| |.loc.6| |D_3|) (not (and (and .loc.6 (not .loc.5)) (and (and (<= C_0 B_1) (and (not (<= D_3 0)) (not (= D_3 (select A_1 D_3))))) (not (<= C_0 D_3))))))))
(check-sat)