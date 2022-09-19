(set-logic HORN)
(declare-fun state ((Array Int Int) Int Int Int (Array Int Int) Int Int Int Int Bool Bool) Bool)
(assert (forall ((|A_3| (Array Int Int)) (|.y.6| Int) (|.y.7| Int) (|.y.8| Int) (|B_3| (Array Int Int)) (|C_3| Int) (|D_2| Int) (|E_2| Int) (|.y.9| Int) (|.loc.10| Bool) (|.loc.11| Bool) (|.x.9| (Array Int Int)) (|v_5_0| Int) (|v_6| Int) (|.x.12| Int) (|.x.10| (Array Int Int)) (|.x.11| Int) (|.loc.16| Bool) (|.loc.15| Bool) (|.y.13| Int) (|.y.12| Int) (|.y.14| Int)) (=> (and (and (not .loc.10) (not .loc.11)) (= .y.6 0)) (state |A_3| |.y.6| |.y.7| |.y.8| |B_3| |C_3| |D_2| |E_2| |.y.9| |.loc.10| |.loc.11|))))
(assert (forall ((|A_3| (Array Int Int)) (|.y.6| Int) (|.y.7| Int) (|.y.8| Int) (|B_3| (Array Int Int)) (|C_3| Int) (|D_2| Int) (|E_2| Int) (|.y.9| Int) (|.loc.10| Bool) (|.loc.11| Bool) (|.x.9| (Array Int Int)) (|v_5_0| Int) (|v_6| Int) (|.x.12| Int) (|.x.10| (Array Int Int)) (|.x.11| Int) (|.loc.16| Bool) (|.loc.15| Bool) (|.y.13| Int) (|.y.12| Int) (|.y.14| Int)) (=> (and (state |A_3| |.y.6| |.y.7| |.y.8| |B_3| |C_3| |D_2| |E_2| |.y.9| |.loc.10| |.loc.11|) (let ((.def_21 (not .loc.10))) (let ((.def_22 (not .loc.11))) (let ((.def_30 (= v_5_0 0))) (let ((.def_31 (<= E_2 C_3))) (let ((.def_59 (= (+ C_3 (* (- 1) v_5_0)) (- 1)))) (let ((.def_67 (= D_2 .x.11))) (let ((.def_72 (not .loc.15))) (let ((.def_80 (not .loc.16))) (let ((.def_84 (<= .y.8 .y.6))) (let ((.def_105 (select A_3 .y.6))) (and (= A_3 .x.9) (or (or (or (and (or (and .def_22 (and .loc.10 (and (and (and .def_30 .def_31) (= v_6 0)) (= E_2 .x.12)))) (and (not (<= .y.9 C_3)) (and (= (+ C_3 (+ E_2 (+ (* (- 1) v_6) (select B_3 C_3)))) 0) (and (and (and .loc.11 .def_21) (= .y.9 .x.12)) .def_59)))) (and (and (and (= B_3 .x.10) .def_67) .loc.16) .def_72)) (and (and (= .y.7 .x.11) (and (= .y.8 v_6) (and (and .def_21 (and .loc.15 (and .def_22 .def_30))) .def_80))) .def_84)) (and (= .x.10 (store B_3 C_3 (+ (* (- 1) D_2) (select A_3 C_3)))) (and (= E_2 v_6) (and .def_80 (and .def_59 (and .loc.15 (and .def_22 (and .loc.10 (and .def_67 (not .def_31)))))))))) (and (not .def_84) (and (= (ite (<= .y.7 .def_105) .y.7 .def_105) .y.13) (and (= (+ .y.6 (* (- 1) .y.12)) (- 1)) (and (= .y.8 .y.14) (and .def_80 (and .def_21 (and .def_22 .def_72)))))))))))))))))))) (state |.x.9| |.y.12| |.y.13| |.y.14| |.x.10| |v_5_0| |.x.11| |v_6| |.x.12| |.loc.15| |.loc.16|))))
(assert (forall ((|A_3| (Array Int Int)) (|.y.6| Int) (|.y.7| Int) (|.y.8| Int) (|B_3| (Array Int Int)) (|C_3| Int) (|D_2| Int) (|E_2| Int) (|.y.9| Int) (|.loc.10| Bool) (|.loc.11| Bool) (|.x.9| (Array Int Int)) (|v_5_0| Int) (|v_6| Int) (|.x.12| Int) (|.x.10| (Array Int Int)) (|.x.11| Int) (|.loc.16| Bool) (|.loc.15| Bool) (|.y.13| Int) (|.y.12| Int) (|.y.14| Int)) (=> (state |A_3| |.y.6| |.y.7| |.y.8| |B_3| |C_3| |D_2| |E_2| |.y.9| |.loc.10| |.loc.11|) (not (and (and .loc.11 (not .loc.10)) (and (<= .y.9 C_3) (not (<= 0 E_2))))))))
(check-sat)
