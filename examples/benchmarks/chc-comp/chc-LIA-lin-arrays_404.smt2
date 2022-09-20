(set-logic HORN)
(declare-fun state (Int Int Int Int Int Bool Bool (Array Int Int) (Array Int Int)) Bool)
(assert (forall ((|C_3| Int) (|E_3| Int) (|F_3| Int) (|v_6| Int) (|A_3| Int) (|.loc.8| Bool) (|.loc.9| Bool) (|B_3| (Array Int Int)) (|B| (Array Int Int)) (|.loc.16| Bool) (|.loc.15| Bool) (|.y.10| Int) (|.y.13| Int) (|.y.12| Int) (|.y.11| Int) (|.y.14| Int) (|.xtv.1| (Array Int Int)) (|.xiv.1| (Array Int Int))) (=> (and (and (not .loc.9) (not .loc.8)) (and (= C_3 0) (= A_3 (select B v_6)))) (state |C_3| |E_3| |F_3| |v_6| |A_3| |.loc.8| |.loc.9| |B_3| |B|))))
(assert (forall ((|C_3| Int) (|E_3| Int) (|F_3| Int) (|v_6| Int) (|A_3| Int) (|.loc.8| Bool) (|.loc.9| Bool) (|B_3| (Array Int Int)) (|B| (Array Int Int)) (|.loc.16| Bool) (|.loc.15| Bool) (|.y.10| Int) (|.y.13| Int) (|.y.12| Int) (|.y.11| Int) (|.y.14| Int) (|.xtv.1| (Array Int Int)) (|.xiv.1| (Array Int Int))) (=> (and (state |C_3| |E_3| |F_3| |v_6| |A_3| |.loc.8| |.loc.9| |B_3| |B|) (let ((.def_20 (not .loc.8))) (let ((.def_28 (select B_3 C_3))) (let ((.def_34 (<= F_3 C_3))) (let ((.def_35 (not .def_34))) (let ((.def_42 (not .loc.15))) (let ((.def_47 (not .loc.16))) (let ((.def_51 (= v_6 .y.13))) (let ((.def_54 (= F_3 .y.12))) (let ((.def_57 (= E_3 .y.11))) (let ((.def_59 (select B_3 v_6))) (let ((.def_61 (= .def_59 .y.14))) (let ((.def_63 (= A_3 .def_59))) (let ((.def_79 (= (+ C_3 (* (- 1) .y.10)) (- 1)))) (and (not .loc.9) (or (or (or (and (and (and .loc.8 (and (not (= E_3 .def_28)) (and (and (= C_3 v_6) (= A_3 .def_28)) .def_35))) .loc.16) .def_42) (and (= .y.10 0) (and (and (and (and (and (and .def_20 (and (and .def_34 .loc.15) .def_47)) .def_51) .def_54) .def_57) .def_61) .def_63))) (and (and .def_63 (and .def_61 (and .def_57 (and .def_54 (and .def_51 (and .def_47 (and .loc.15 (and .loc.8 .def_35)))))))) .def_79)) (and (= .y.14 (select (store B_3 C_3 E_3) v_6)) (and .def_79 (and .def_63 (and .def_57 (and .def_54 (and .def_51 (and .def_20 (and .def_47 (and .def_35 .def_42))))))))))))))))))))))))) (state |.y.10| |.y.11| |.y.12| |.y.13| |.y.14| |.loc.15| |.loc.16| |.xtv.1| |.xiv.1|))))
(assert (forall ((|C_3| Int) (|E_3| Int) (|F_3| Int) (|v_6| Int) (|A_3| Int) (|.loc.8| Bool) (|.loc.9| Bool) (|B_3| (Array Int Int)) (|B| (Array Int Int)) (|.loc.16| Bool) (|.loc.15| Bool) (|.y.10| Int) (|.y.13| Int) (|.y.12| Int) (|.y.11| Int) (|.y.14| Int) (|.xtv.1| (Array Int Int)) (|.xiv.1| (Array Int Int))) (=> (state |C_3| |E_3| |F_3| |v_6| |A_3| |.loc.8| |.loc.9| |B_3| |B|) (not (and .loc.9 (not .loc.8))))))
(check-sat)