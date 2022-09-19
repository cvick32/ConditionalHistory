(set-logic HORN)
(declare-fun state ((Array Int Int) Int Int Int (Array Int Int) Int Int Int (Array Int Int) Int Int Int Bool Bool Int) Bool)
(assert (forall ((|A_3| (Array Int Int)) (|.y.9| Int) (|.y.10| Int) (|.y.11| Int) (|B_3| (Array Int Int)) (|C_3| Int) (|D_2| Int) (|E_2| Int) (|.y.12| (Array Int Int)) (|.y.13| Int) (|.y.14| Int) (|.y.15| Int) (|.loc.16| Bool) (|.loc.17| Bool) (|G_1| Int) (|.x.9| (Array Int Int)) (|.x.12| Int) (|v_6| Int) (|.x.11| Int) (|F_1| (Array Int Int)) (|.x.10| (Array Int Int)) (|.loc.25| Bool) (|.loc.24| Bool) (|.y.21| Int) (|.y.22| Int) (|.y.23| Int) (|.y.19| Int) (|.y.18| Int) (|.y.20| Int) (|.xpv.1| Int)) (=> (and (and (not .loc.16) (not .loc.17)) (= .y.9 0)) (state |A_3| |.y.9| |.y.10| |.y.11| |B_3| |C_3| |D_2| |E_2| |.y.12| |.y.13| |.y.14| |.y.15| |.loc.16| |.loc.17| |G_1|))))
(assert (forall ((|A_3| (Array Int Int)) (|.y.9| Int) (|.y.10| Int) (|.y.11| Int) (|B_3| (Array Int Int)) (|C_3| Int) (|D_2| Int) (|E_2| Int) (|.y.12| (Array Int Int)) (|.y.13| Int) (|.y.14| Int) (|.y.15| Int) (|.loc.16| Bool) (|.loc.17| Bool) (|G_1| Int) (|.x.9| (Array Int Int)) (|.x.12| Int) (|v_6| Int) (|.x.11| Int) (|F_1| (Array Int Int)) (|.x.10| (Array Int Int)) (|.loc.25| Bool) (|.loc.24| Bool) (|.y.21| Int) (|.y.22| Int) (|.y.23| Int) (|.y.19| Int) (|.y.18| Int) (|.y.20| Int) (|.xpv.1| Int)) (=> (and (state |A_3| |.y.9| |.y.10| |.y.11| |B_3| |C_3| |D_2| |E_2| |.y.12| |.y.13| |.y.14| |.y.15| |.loc.16| |.loc.17| |G_1|) (let ((.def_25 (not .loc.16))) (let ((.def_26 (not .loc.17))) (let ((.def_37 (<= E_2 C_3))) (let ((.def_71 (not .loc.24))) (let ((.def_82 (not .loc.25))) (let ((.def_86 (<= .y.11 .y.9))) (let ((.def_110 (select A_3 .y.9))) (and (= A_3 .x.9) (or (or (or (and (or (and .def_26 (and .loc.16 (and (= E_2 .x.12) (and (and (= v_6 0) .def_37) (= D_2 .x.11))))) (and (not (<= .y.15 .y.13)) (and (= (+ .y.13 (* (- 1) v_6)) (- 1)) (and (= (store .y.12 .y.13 (* (- 1) (select B_3 .y.13))) F_1) (and (= .y.14 .x.11) (and (and .loc.17 .def_25) (= .y.15 .x.12))))))) (and (and (= B_3 .x.10) .loc.25) .def_71)) (and (= .y.21 0) (and (and (= .y.10 .y.22) (and (= .y.11 .y.23) (and (and .def_25 (and .def_26 .loc.24)) .def_82))) .def_86))) (and (= (+ C_3 (* (- 1) .y.21)) (- 1)) (and (= .x.10 (store B_3 C_3 (* (- 1) (select A_3 C_3)))) (and (= D_2 .y.22) (and (= E_2 .y.23) (and .def_82 (and .loc.24 (and .def_26 (and .loc.16 (not .def_37)))))))))) (and (not .def_86) (and (= (ite (<= .def_110 .y.10) .y.10 .def_110) .y.19) (and (= (+ .y.9 (* (- 1) .y.18)) (- 1)) (and (= .y.11 .y.20) (and .def_82 (and .def_25 (and .def_26 .def_71))))))))))))))))) (state |.x.9| |.y.18| |.y.19| |.y.20| |.x.10| |.y.21| |.y.22| |.y.23| |F_1| |v_6| |.x.11| |.x.12| |.loc.24| |.loc.25| |.xpv.1|))))
(assert (forall ((|A_3| (Array Int Int)) (|.y.9| Int) (|.y.10| Int) (|.y.11| Int) (|B_3| (Array Int Int)) (|C_3| Int) (|D_2| Int) (|E_2| Int) (|.y.12| (Array Int Int)) (|.y.13| Int) (|.y.14| Int) (|.y.15| Int) (|.loc.16| Bool) (|.loc.17| Bool) (|G_1| Int) (|.x.9| (Array Int Int)) (|.x.12| Int) (|v_6| Int) (|.x.11| Int) (|F_1| (Array Int Int)) (|.x.10| (Array Int Int)) (|.loc.25| Bool) (|.loc.24| Bool) (|.y.21| Int) (|.y.22| Int) (|.y.23| Int) (|.y.19| Int) (|.y.18| Int) (|.y.20| Int) (|.xpv.1| Int)) (=> (state |A_3| |.y.9| |.y.10| |.y.11| |B_3| |C_3| |D_2| |E_2| |.y.12| |.y.13| |.y.14| |.y.15| |.loc.16| |.loc.17| |G_1|) (not (and (and .loc.17 (not .loc.16)) (and (not (<= G_1 0)) (and (and (<= .y.15 .y.13) (not (<= .y.15 G_1))) (not (<= (select .y.12 G_1) .y.14)))))))))
(check-sat)
