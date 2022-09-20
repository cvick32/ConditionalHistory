(set-logic HORN)
(declare-fun state ((Array Int Int) Int Int (Array Int Int) Int Int (Array Int Int) Int Int Bool Bool Int Int) Bool)
(assert (forall ((|A_3| (Array Int Int)) (|.y.7| Int) (|.y.8| Int) (|B_3| (Array Int Int)) (|C_2| Int) (|D_2| Int) (|.y.9| (Array Int Int)) (|.y.10| Int) (|.y.11| Int) (|.loc.12| Bool) (|.loc.13| Bool) (|F_1| Int) (|F_2| Int) (|.x.6| (Array Int Int)) (|v_5| Int) (|.x.8| Int) (|E_1| (Array Int Int)) (|.x.7| (Array Int Int)) (|.loc.19| Bool) (|.loc.18| Bool) (|.y.16| Int) (|.y.17| Int) (|.y.14| Int) (|.y.15| Int) (|.xtv.1| Int) (|.xpv.1| Int)) (=> (and (and (not .loc.12) (not .loc.13)) (= .y.7 0)) (state |A_3| |.y.7| |.y.8| |B_3| |C_2| |D_2| |.y.9| |.y.10| |.y.11| |.loc.12| |.loc.13| |F_1| |F_2|))))
(assert (forall ((|A_3| (Array Int Int)) (|.y.7| Int) (|.y.8| Int) (|B_3| (Array Int Int)) (|C_2| Int) (|D_2| Int) (|.y.9| (Array Int Int)) (|.y.10| Int) (|.y.11| Int) (|.loc.12| Bool) (|.loc.13| Bool) (|F_1| Int) (|F_2| Int) (|.x.6| (Array Int Int)) (|v_5| Int) (|.x.8| Int) (|E_1| (Array Int Int)) (|.x.7| (Array Int Int)) (|.loc.19| Bool) (|.loc.18| Bool) (|.y.16| Int) (|.y.17| Int) (|.y.14| Int) (|.y.15| Int) (|.xtv.1| Int) (|.xpv.1| Int)) (=> (and (state |A_3| |.y.7| |.y.8| |B_3| |C_2| |D_2| |.y.9| |.y.10| |.y.11| |.loc.12| |.loc.13| |F_1| |F_2|) (let ((.def_23 (not .loc.12))) (let ((.def_24 (not .loc.13))) (let ((.def_33 (<= D_2 C_2))) (let ((.def_67 (not .loc.18))) (let ((.def_76 (not .loc.19))) (let ((.def_79 (<= .y.8 .y.7))) (or (and (= A_3 .x.6) (or (or (and (or (and .def_24 (and .loc.12 (and (and (= v_5 0) .def_33) (= D_2 .x.8)))) (and (not (<= F_1 .y.10)) (and (= (store .y.9 .y.10 (+ F_1 (select B_3 .y.10))) E_1) (and (not (<= .y.11 .y.10)) (and (= (+ .y.10 (* (- 1) v_5)) (- 1)) (and (and .loc.13 .def_23) (= .y.11 .x.8))))))) (and (and (= B_3 .x.7) .loc.19) .def_67)) (and (= .y.16 0) (and (and (= .y.8 .y.17) (and (and .def_23 (and .def_24 .loc.18)) .def_76)) .def_79))) (and (not (<= F_1 C_2)) (and (= .x.7 (store B_3 C_2 (+ F_1 (select A_3 C_2)))) (and (= (+ C_2 (* (- 1) .y.16)) (- 1)) (and (= D_2 .y.17) (and .def_76 (and .loc.18 (and .def_24 (and .loc.12 (not .def_33))))))))))) (and (not (<= F_1 .y.7)) (and (= .x.6 (store A_3 .y.7 F_1)) (and (not .def_79) (and (= (+ .y.7 (* (- 1) .y.14)) (- 1)) (and (= .y.8 .y.15) (and .def_76 (and .def_23 (and .def_24 .def_67)))))))))))))))) (state |.x.6| |.y.14| |.y.15| |.x.7| |.y.16| |.y.17| |E_1| |v_5| |.x.8| |.loc.18| |.loc.19| |.xtv.1| |.xpv.1|))))
(assert (forall ((|A_3| (Array Int Int)) (|.y.7| Int) (|.y.8| Int) (|B_3| (Array Int Int)) (|C_2| Int) (|D_2| Int) (|.y.9| (Array Int Int)) (|.y.10| Int) (|.y.11| Int) (|.loc.12| Bool) (|.loc.13| Bool) (|F_1| Int) (|F_2| Int) (|.x.6| (Array Int Int)) (|v_5| Int) (|.x.8| Int) (|E_1| (Array Int Int)) (|.x.7| (Array Int Int)) (|.loc.19| Bool) (|.loc.18| Bool) (|.y.16| Int) (|.y.17| Int) (|.y.14| Int) (|.y.15| Int) (|.xtv.1| Int) (|.xpv.1| Int)) (=> (state |A_3| |.y.7| |.y.8| |B_3| |C_2| |D_2| |.y.9| |.y.10| |.y.11| |.loc.12| |.loc.13| |F_1| |F_2|) (not (and (and .loc.13 (not .loc.12)) (and (and (and (<= .y.11 .y.10) (not (<= F_2 0))) (<= (select .y.9 F_2) (select A_3 F_2))) (not (<= .y.11 F_2))))))))
(check-sat)