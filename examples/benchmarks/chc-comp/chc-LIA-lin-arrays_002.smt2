(set-logic HORN)
(declare-fun state (Int Int (Array Int Int) Int (Array Int Int) Int (Array Int Int) Bool Bool Int Int Int Int Int) Bool)
(assert (forall ((|H_3| Int) (|O_1| Int) (|P_1| (Array Int Int)) (|K_3| Int) (|.y.10| (Array Int Int)) (|A_3| Int) (|I_3| (Array Int Int)) (|.loc.11| Bool) (|.loc.12| Bool) (|J_3| Int) (|M_3| Int) (|L_3| Int) (|N_2| Int) (|Q_1| Int) (|.loc.20| Bool) (|.y.16| Int) (|.y.15| (Array Int Int)) (|.y.14| Int) (|.y.19| (Array Int Int)) (|.y.18| Int) (|.y.13| Int) (|.loc.21| Bool) (|.y.17| (Array Int Int)) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| Int) (|.xtv.4| Int) (|.xtv.5| Int)) (=> (and (not .loc.11) (not .loc.12)) (state |H_3| |O_1| |P_1| |K_3| |.y.10| |A_3| |I_3| |.loc.11| |.loc.12| |J_3| |M_3| |L_3| |N_2| |Q_1|))))
(assert (forall ((|H_3| Int) (|O_1| Int) (|P_1| (Array Int Int)) (|K_3| Int) (|.y.10| (Array Int Int)) (|A_3| Int) (|I_3| (Array Int Int)) (|.loc.11| Bool) (|.loc.12| Bool) (|J_3| Int) (|M_3| Int) (|L_3| Int) (|N_2| Int) (|Q_1| Int) (|.loc.20| Bool) (|.y.16| Int) (|.y.15| (Array Int Int)) (|.y.14| Int) (|.y.19| (Array Int Int)) (|.y.18| Int) (|.y.13| Int) (|.loc.21| Bool) (|.y.17| (Array Int Int)) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| Int) (|.xtv.4| Int) (|.xtv.5| Int)) (=> (and (state |H_3| |O_1| |P_1| |K_3| |.y.10| |A_3| |I_3| |.loc.11| |.loc.12| |J_3| |M_3| |L_3| |N_2| |Q_1|) (let ((.def_24 (not .loc.11))) (let ((.def_25 (not .loc.12))) (let ((.def_34 (<= O_1 0))) (let ((.def_41 (* (- 1) J_3))) (let ((.def_65 (not .def_34))) (let ((.def_67 (<= H_3 0))) (let ((.def_68 (not .def_67))) (let ((.def_70 (<= K_3 A_3))) (let ((.def_75 (or .def_67 (not (<= J_3 0))))) (let ((.def_92 (not .loc.20))) (let ((.def_97 (<= A_3 O_1))) (let ((.def_100 (= H_3 .y.13))) (let ((.def_154 (= K_3 .y.16))) (let ((.def_168 (not .loc.21))) (let ((.def_178 (<= K_3 0))) (or (or (and (or (or (and (and .def_24 (and .loc.12 (and (not (= (select I_3 J_3) (select P_1 Q_1))) (and (and (or (not (<= Q_1 0)) .def_34) (and (and (and (and (= (+ K_3 (* (- 1) L_3)) 1) (and (= (+ H_3 (+ .def_41 M_3)) 0) (and (= (+ M_3 (+ (* (- 1) L_3) N_2)) 0) (and (= (+ O_1 (+ N_2 (* (- 1) Q_1))) 0) (and (not (<= K_3 M_3)) (not (<= M_3 (- 1)))))))) .def_65) .def_68) .def_70)) .def_75)))) .loc.20) (and (= A_3 .y.16) (and (= .y.10 .y.15) (and (= K_3 .y.14) (and (and (and (= P_1 .y.19) (and (= .y.18 0) (and .def_25 (and .loc.11 .def_92)))) .def_97) .def_100))))) (and (and (= P_1 .y.15) (and (= O_1 .y.14) (and (or .def_34 (not (<= M_3 0))) (and (or .def_67 (not (<= N_2 0))) (and (= (+ A_3 (+ .def_41 L_3)) 0) (and (= (+ K_3 .def_41) 1) (and (= (+ O_1 (+ (* (- 1) M_3) L_3)) 0) (and (= (+ H_3 (+ A_3 (* (- 1) N_2))) 0) (and (= .y.19 (store I_3 N_2 (select P_1 M_3))) (and (= (+ A_3 (* (- 1) .y.18)) (- 1)) (and .def_100 (and .def_92 (and .def_24 (and .loc.12 (and (not .def_70) (and .def_65 .def_68)))))))))))))))) .def_154)) .loc.21) (and (not (<= .y.16 0)) (and (not (<= .y.13 0)) (and (not (<= .y.18 0)) (and (= .y.14 0) (and (and .def_25 (and .def_24 .loc.20)) .def_168)))))) (and (= A_3 .y.18) (and (or (not (<= L_3 0)) .def_178) (and (not .def_97) (and (= (+ H_3 (+ O_1 .def_41)) 0) (and (= (+ O_1 (+ K_3 (* (- 1) L_3))) 0) (and (not .def_178) (and (= (store .y.10 L_3 M_3) .y.17) (and (= .y.15 (store P_1 J_3 M_3)) (and (= (+ O_1 (* (- 1) .y.14)) (- 1)) (and .def_168 (and .def_154 (and .def_100 (and .def_25 (and .loc.20 (and .loc.11 (and .def_68 .def_75))))))))))))))))))))))))))))))))) (state |.y.13| |.y.14| |.y.15| |.y.16| |.y.17| |.y.18| |.y.19| |.loc.20| |.loc.21| |.xtv.1| |.xtv.2| |.xtv.3| |.xtv.4| |.xtv.5|))))
(assert (forall ((|H_3| Int) (|O_1| Int) (|P_1| (Array Int Int)) (|K_3| Int) (|.y.10| (Array Int Int)) (|A_3| Int) (|I_3| (Array Int Int)) (|.loc.11| Bool) (|.loc.12| Bool) (|J_3| Int) (|M_3| Int) (|L_3| Int) (|N_2| Int) (|Q_1| Int) (|.loc.20| Bool) (|.y.16| Int) (|.y.15| (Array Int Int)) (|.y.14| Int) (|.y.19| (Array Int Int)) (|.y.18| Int) (|.y.13| Int) (|.loc.21| Bool) (|.y.17| (Array Int Int)) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| Int) (|.xtv.4| Int) (|.xtv.5| Int)) (=> (state |H_3| |O_1| |P_1| |K_3| |.y.10| |A_3| |I_3| |.loc.11| |.loc.12| |J_3| |M_3| |L_3| |N_2| |Q_1|) (not (and .loc.11 .loc.12)))))
(check-sat)
