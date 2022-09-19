(set-logic HORN)
(declare-fun state (Int (Array Int Int) Int Int Int Bool Bool Bool Bool Bool Bool Bool Int Int Int Int Int Int Int) Bool)
(assert (forall ((|B_1| Int) (|E_1| (Array Int Int)) (|H_1| Int) (|F_1| Int) (|A_2| Int) (|.loc.8| Bool) (|.loc.9| Bool) (|N| Bool) (|M_0| Bool) (|I_0| Bool) (|K_0| Bool) (|A_1| Bool) (|L_0| Int) (|H_0| Int) (|O| Int) (|G_0| Int) (|F_0| Int) (|E_0| Int) (|C_0| Int) (|.loc.15| Bool) (|.loc.16| Bool) (|.y.14| Int) (|.y.13| Int) (|.y.10| Int) (|.y.12| Int) (|.y.11| (Array Int Int)) (|.xtv.1| Bool) (|.xtv.2| Bool) (|.xtv.3| Bool) (|.xtv.4| Bool) (|.xtv.5| Bool) (|.xtv.6| Int) (|.xtv.7| Int) (|.xtv.8| Int) (|.xtv.9| Int) (|.xtv.10| Int) (|.xtv.11| Int) (|.xtv.12| Int)) (=> (and (not .loc.9) (not .loc.8)) (state |B_1| |E_1| |H_1| |F_1| |A_2| |.loc.8| |.loc.9| |N| |M_0| |I_0| |K_0| |A_1| |L_0| |H_0| |O| |G_0| |F_0| |E_0| |C_0|))))
(assert (forall ((|B_1| Int) (|E_1| (Array Int Int)) (|H_1| Int) (|F_1| Int) (|A_2| Int) (|.loc.8| Bool) (|.loc.9| Bool) (|N| Bool) (|M_0| Bool) (|I_0| Bool) (|K_0| Bool) (|A_1| Bool) (|L_0| Int) (|H_0| Int) (|O| Int) (|G_0| Int) (|F_0| Int) (|E_0| Int) (|C_0| Int) (|.loc.15| Bool) (|.loc.16| Bool) (|.y.14| Int) (|.y.13| Int) (|.y.10| Int) (|.y.12| Int) (|.y.11| (Array Int Int)) (|.xtv.1| Bool) (|.xtv.2| Bool) (|.xtv.3| Bool) (|.xtv.4| Bool) (|.xtv.5| Bool) (|.xtv.6| Int) (|.xtv.7| Int) (|.xtv.8| Int) (|.xtv.9| Int) (|.xtv.10| Int) (|.xtv.11| Int) (|.xtv.12| Int)) (=> (and (state |B_1| |E_1| |H_1| |F_1| |A_2| |.loc.8| |.loc.9| |N| |M_0| |I_0| |K_0| |A_1| |L_0| |H_0| |O| |G_0| |F_0| |E_0| |C_0|) (let ((.def_35 (= B_1 0))) (let ((.def_55 (not .loc.16))) (let ((.def_66 (<= F_1 0))) (let ((.def_67 (not M_0))) (let ((.def_72 (not K_0))) (let ((.def_79 (not N))) (let ((.def_80 (or .def_67 .def_79))) (let ((.def_94 (not .def_66))) (and (not .loc.9) (or (or (and (not .loc.15) (and (and .loc.8 (and (not .def_35) (= (ite (not (<= (select E_1 F_1) H_1)) 1 0) 0))) .loc.16)) (and (= B_1 .y.14) (and (not (<= .y.13 0)) (and (= .y.10 0) (and (not .loc.8) (and .loc.15 .def_55)))))) (and (= A_2 .y.14) (and (= F_1 .y.13) (and (or (not (<= E_0 0)) (or .def_66 .def_67)) (and (or (not (<= G_0 0)) (or .def_66 .def_72)) (and (or (not A_1) (or .def_35 .def_67)) (and (or (= H_1 O) .def_80) (and (or .def_72 (= L_0 .y.12)) (and (or .def_72 (= (+ (* 4 B_1) (+ F_1 (* (- 1) G_0))) 0)) (and (or .def_72 .def_94) (and (or .def_67 (= I_0 (not (<= F_0 H_1)))) (and (or .def_67 (= A_2 C_0)) (and (or .def_67 (= (+ (* 4 B_1) (+ F_1 (* (- 1) E_0))) 0)) (and (or .def_67 .def_94) (and (= (+ B_1 (* (- 1) .y.10)) (- 1)) (and (or .def_67 (= (store E_1 E_0 F_0) .y.11)) (and (or .def_72 (= H_0 (select .y.11 G_0))) (and (or .def_80 (= O .y.12)) (and .def_55 (and .loc.15 (and .loc.8 (and (or K_0 (and N M_0)) (and (or .def_72 (= L_0 H_0)) (and (or M_0 .def_79) (and (or .def_67 (and M_0 A_1)) (and (or .def_72 (and M_0 K_0)) (and (or (or .def_67 .def_72) (not I_0)) (or I_0 .def_80)))))))))))))))))))))))))))))))))))))) (state |.y.10| |.y.11| |.y.12| |.y.13| |.y.14| |.loc.15| |.loc.16| |.xtv.1| |.xtv.2| |.xtv.3| |.xtv.4| |.xtv.5| |.xtv.6| |.xtv.7| |.xtv.8| |.xtv.9| |.xtv.10| |.xtv.11| |.xtv.12|))))
(assert (forall ((|B_1| Int) (|E_1| (Array Int Int)) (|H_1| Int) (|F_1| Int) (|A_2| Int) (|.loc.8| Bool) (|.loc.9| Bool) (|N| Bool) (|M_0| Bool) (|I_0| Bool) (|K_0| Bool) (|A_1| Bool) (|L_0| Int) (|H_0| Int) (|O| Int) (|G_0| Int) (|F_0| Int) (|E_0| Int) (|C_0| Int) (|.loc.15| Bool) (|.loc.16| Bool) (|.y.14| Int) (|.y.13| Int) (|.y.10| Int) (|.y.12| Int) (|.y.11| (Array Int Int)) (|.xtv.1| Bool) (|.xtv.2| Bool) (|.xtv.3| Bool) (|.xtv.4| Bool) (|.xtv.5| Bool) (|.xtv.6| Int) (|.xtv.7| Int) (|.xtv.8| Int) (|.xtv.9| Int) (|.xtv.10| Int) (|.xtv.11| Int) (|.xtv.12| Int)) (=> (state |B_1| |E_1| |H_1| |F_1| |A_2| |.loc.8| |.loc.9| |N| |M_0| |I_0| |K_0| |A_1| |L_0| |H_0| |O| |G_0| |F_0| |E_0| |C_0|) (not (and .loc.9 (not .loc.8))))))
(check-sat)
