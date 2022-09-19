(set-logic HORN)
(declare-fun state (Int Int Int Int Int Bool Bool (Array Int Int) (Array Int Int)) Bool)
(assert (forall ((|C_3| Int) (|E_3| Int) (|F_3| Int) (|v_6| Int) (|A_3| Int) (|.loc.8| Bool) (|.loc.9| Bool) (|B_3| (Array Int Int)) (|B| (Array Int Int)) (|.loc.16| Bool) (|.loc.15| Bool) (|.y.10| Int) (|.y.13| Int) (|.y.12| Int) (|.y.11| Int) (|.y.14| Int) (|.xtv.1| (Array Int Int)) (|.xiv.1| (Array Int Int))) (=> (and (and (not .loc.9) (not .loc.8)) (and (= C_3 0) (= A_3 (select B v_6)))) (state |C_3| |E_3| |F_3| |v_6| |A_3| |.loc.8| |.loc.9| |B_3| |B|))))
(assert (forall ((|C_3| Int) (|E_3| Int) (|F_3| Int) (|v_6| Int) (|A_3| Int) (|.loc.8| Bool) (|.loc.9| Bool) (|B_3| (Array Int Int)) (|B| (Array Int Int)) (|.loc.16| Bool) (|.loc.15| Bool) (|.y.10| Int) (|.y.13| Int) (|.y.12| Int) (|.y.11| Int) (|.y.14| Int) (|.xtv.1| (Array Int Int)) (|.xiv.1| (Array Int Int))) (=> (and (state |C_3| |E_3| |F_3| |v_6| |A_3| |.loc.8| |.loc.9| |B_3| |B|) (let ((.def_20 (not .loc.8))) (let ((.def_28 (select B_3 C_3))) (let ((.def_42 (<= F_3 C_3))) (let ((.def_43 (not .def_42))) (let ((.def_50 (not .loc.15))) (let ((.def_55 (not .loc.16))) (let ((.def_59 (= v_6 .y.13))) (let ((.def_62 (= F_3 .y.12))) (let ((.def_65 (= E_3 .y.11))) (let ((.def_67 (select B_3 v_6))) (let ((.def_69 (= .def_67 .y.14))) (let ((.def_71 (= A_3 .def_67))) (let ((.def_85 (= (+ C_3 (* (- 1) .y.10)) (- 1)))) (and (not .loc.9) (or (or (or (and (and (and .loc.8 (and (not (= (+ (* 2 C_3) (+ E_3 (* (- 1) .def_28))) 0)) (and (and (= C_3 v_6) (= A_3 .def_28)) .def_43))) .loc.16) .def_50) (and (= .y.10 0) (and (and (and (and (and (and .def_20 (and (and .def_42 .loc.15) .def_55)) .def_59) .def_62) .def_65) .def_69) .def_71))) (and (and .def_71 (and .def_69 (and .def_65 (and .def_62 (and .def_59 (and .def_55 (and .loc.15 (and .loc.8 .def_43)))))))) .def_85)) (and (= .y.14 (select (store B_3 C_3 (+ (* 2 C_3) E_3)) v_6)) (and .def_85 (and .def_71 (and .def_65 (and .def_62 (and .def_59 (and .def_20 (and .def_55 (and .def_43 .def_50))))))))))))))))))))))))) (state |.y.10| |.y.11| |.y.12| |.y.13| |.y.14| |.loc.15| |.loc.16| |.xtv.1| |.xiv.1|))))
(assert (forall ((|C_3| Int) (|E_3| Int) (|F_3| Int) (|v_6| Int) (|A_3| Int) (|.loc.8| Bool) (|.loc.9| Bool) (|B_3| (Array Int Int)) (|B| (Array Int Int)) (|.loc.16| Bool) (|.loc.15| Bool) (|.y.10| Int) (|.y.13| Int) (|.y.12| Int) (|.y.11| Int) (|.y.14| Int) (|.xtv.1| (Array Int Int)) (|.xiv.1| (Array Int Int))) (=> (state |C_3| |E_3| |F_3| |v_6| |A_3| |.loc.8| |.loc.9| |B_3| |B|) (not (and .loc.9 (not .loc.8))))))
(check-sat)
