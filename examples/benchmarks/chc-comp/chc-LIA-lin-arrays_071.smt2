(set-logic HORN)
(declare-fun state ((Array Int Int) Int Int Int (Array Int Int) Int Bool Bool Int) Bool)
(assert (forall ((|.y.9| (Array Int Int)) (|A_4| Int) (|G_3| Int) (|.y.10| Int) (|B_3| (Array Int Int)) (|E_3| Int) (|.loc.11| Bool) (|.loc.12| Bool) (|C_1| Int) (|.loc.20| Bool) (|.loc.19| Bool) (|.y.18| Int) (|.y.15| Int) (|.y.17| (Array Int Int)) (|.y.14| Int) (|.y.16| Int) (|.y.13| (Array Int Int)) (|.xtv.1| Int)) (=> (and (not .loc.11) (not .loc.12)) (state |.y.9| |A_4| |G_3| |.y.10| |B_3| |E_3| |.loc.11| |.loc.12| |C_1|))))
(assert (forall ((|.y.9| (Array Int Int)) (|A_4| Int) (|G_3| Int) (|.y.10| Int) (|B_3| (Array Int Int)) (|E_3| Int) (|.loc.11| Bool) (|.loc.12| Bool) (|C_1| Int) (|.loc.20| Bool) (|.loc.19| Bool) (|.y.18| Int) (|.y.15| Int) (|.y.17| (Array Int Int)) (|.y.14| Int) (|.y.16| Int) (|.y.13| (Array Int Int)) (|.xtv.1| Int)) (=> (and (state |.y.9| |A_4| |G_3| |.y.10| |B_3| |E_3| |.loc.11| |.loc.12| |C_1|) (let ((.def_19 (not .loc.11))) (let ((.def_20 (not .loc.12))) (let ((.def_23 (<= A_4 0))) (let ((.def_24 (not .def_23))) (let ((.def_33 (and (not (<= 102399 G_3)) (<= (- 1) G_3)))) (let ((.def_38 (or .def_23 (not (<= (+ A_4 G_3) 0))))) (let ((.def_41 (not (= E_3 (select B_3 (+ A_4 G_3)))))) (let ((.def_51 (not (<= 102399 .y.10)))) (let ((.def_52 (<= (- 1) .y.10))) (let ((.def_57 (not .loc.19))) (let ((.def_64 (or .def_23 (not (<= (+ A_4 .y.10) 0))))) (let ((.def_69 (= (store B_3 (+ A_4 .y.10) C_1) .y.17))) (let ((.def_72 (= A_4 .y.14))) (let ((.def_97 (not .loc.20))) (or (or (and (and .def_24 .loc.20) (or (or (and (and .def_19 (and .loc.12 (and (not .def_33) (and .def_38 .def_41)))) .loc.19) (and (= G_3 .y.18) (and (and (and (not (and .def_51 .def_52)) (and (and (= .y.15 0) (and .def_20 (and .loc.11 .def_57))) .def_64)) .def_69) .def_72))) (and (= E_3 .y.18) (and (= B_3 .y.17) (and (= (+ G_3 (* (- 1) .y.15)) (- 1)) (and .def_72 (and .def_57 (and .def_19 (and .loc.12 (and .def_38 (and .def_33 .def_41))))))))))) (and (= .y.16 0) (and (= .y.9 .y.17) (and (and .def_20 (and .def_19 .loc.19)) .def_97)))) (and (= G_3 .y.15) (and (= (+ .y.10 (* (- 1) .y.16)) (- 1)) (and .def_97 (and .def_72 (and .def_69 (and .def_51 (and .def_52 (and .def_64 (and .def_20 (and .loc.19 (and .loc.11 .def_24))))))))))))))))))))))))))) (state |.y.13| |.y.14| |.y.15| |.y.16| |.y.17| |.y.18| |.loc.19| |.loc.20| |.xtv.1|))))
(assert (forall ((|.y.9| (Array Int Int)) (|A_4| Int) (|G_3| Int) (|.y.10| Int) (|B_3| (Array Int Int)) (|E_3| Int) (|.loc.11| Bool) (|.loc.12| Bool) (|C_1| Int) (|.loc.20| Bool) (|.loc.19| Bool) (|.y.18| Int) (|.y.15| Int) (|.y.17| (Array Int Int)) (|.y.14| Int) (|.y.16| Int) (|.y.13| (Array Int Int)) (|.xtv.1| Int)) (=> (state |.y.9| |A_4| |G_3| |.y.10| |B_3| |E_3| |.loc.11| |.loc.12| |C_1|) (not (and .loc.11 .loc.12)))))
(check-sat)