(set-logic HORN)
(declare-fun state (Int Int Int (Array Int Int) Int Bool Bool Int Int Int Int Int Int Int Int Int Int) Bool)
(assert (forall ((|A_4| Int) (|B_4| Int) (|C_3| Int) (|D_3| (Array Int Int)) (|.y.4| Int) (|.loc.5| Bool) (|.loc.6| Bool) (|M_3| Int) (|K_4| Int) (|Q_1| Int) (|P_2| Int) (|O_2| Int) (|Q_2| Int) (|K_5| Int) (|P_3| Int) (|M_4| Int) (|O_3| Int) (|.x.11| (Array Int Int)) (|L_3| Int) (|.x.9| Int) (|.x.10| Int) (|.loc.8| Bool) (|.y.7| Int) (|.loc.9| Bool) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| Int) (|.xtv.4| Int) (|.xtv.5| Int) (|.xpv.1| Int) (|.xpv.2| Int) (|.xpv.3| Int) (|.xpv.4| Int) (|.xpv.5| Int)) (=> (and (not .loc.5) (not .loc.6)) (state |A_4| |B_4| |C_3| |D_3| |.y.4| |.loc.5| |.loc.6| |M_3| |K_4| |Q_1| |P_2| |O_2| |Q_2| |K_5| |P_3| |M_4| |O_3|))))
(assert (forall ((|A_4| Int) (|B_4| Int) (|C_3| Int) (|D_3| (Array Int Int)) (|.y.4| Int) (|.loc.5| Bool) (|.loc.6| Bool) (|M_3| Int) (|K_4| Int) (|Q_1| Int) (|P_2| Int) (|O_2| Int) (|Q_2| Int) (|K_5| Int) (|P_3| Int) (|M_4| Int) (|O_3| Int) (|.x.11| (Array Int Int)) (|L_3| Int) (|.x.9| Int) (|.x.10| Int) (|.loc.8| Bool) (|.y.7| Int) (|.loc.9| Bool) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| Int) (|.xtv.4| Int) (|.xtv.5| Int) (|.xpv.1| Int) (|.xpv.2| Int) (|.xpv.3| Int) (|.xpv.4| Int) (|.xpv.5| Int)) (=> (and (state |A_4| |B_4| |C_3| |D_3| |.y.4| |.loc.5| |.loc.6| |M_3| |K_4| |Q_1| |P_2| |O_2| |Q_2| |K_5| |P_3| |M_4| |O_3|) (let ((.def_27 (not .loc.5))) (let ((.def_28 (not .loc.6))) (let ((.def_45 (<= (to_int (* (/ 1 2) (to_real (to_int (* (/ 1 16777216) (to_real (* 16777216 B_4))))))) C_3))) (let ((.def_48 (<= A_4 0))) (let ((.def_50 (not (<= K_4 0)))) (let ((.def_88 (not .def_48))) (let ((.def_96 (or .def_48 (not (<= Q_1 0))))) (let ((.def_100 (= A_4 .x.9))) (let ((.def_103 (and .def_100 (= B_4 .x.10)))) (let ((.def_104 (and .loc.6 .def_103))) (let ((.def_110 (not .loc.8))) (let ((.def_114 (= .y.7 0))) (let ((.def_119 (<= (to_int (* (/ 1 16777216) (to_real (* 16777216 .y.4)))) C_3))) (let ((.def_158 (= (+ C_3 (* (- 1) .y.7)) (- 1)))) (let ((.def_178 (not .loc.9))) (let ((.def_184 (<= B_4 0))) (or (or (and (or (and (= D_3 .x.11) (or (and (or (and .def_27 (and (= L_3 0) .def_45)) (and (and (or .def_48 .def_50) (and (= (+ A_4 (+ (* (- 1) Q_1) P_2)) 0) (and (= (+ (* 16777216 B_4) (* (- 1) M_3)) 0) (and (= (+ A_4 (+ .y.4 (* (- 1) K_4))) 0) (and (and (not (<= (to_int (* (/ 1 2) (to_real (to_int (* (/ 1 16777216) (to_real (* 16777216 B_4))))))) .y.4)) (and (= (+ .y.4 (* (- 1) L_3)) (- 1)) (and (= (+ .y.4 (+ O_2 (* (- 1) (to_int (* (/ 1 16777216) (to_real M_3)))))) 0) (and (= (select D_3 K_4) (select D_3 Q_1)) (and .loc.5 (= (+ P_2 (* (- 1) O_2)) (- 1))))))) .def_88))))) .def_96)) (and .def_104 .loc.8)) (and (= .y.4 .x.10) (and (= B_4 .x.9) (and (and (and .def_28 (and .loc.5 .def_110)) .def_114) .def_119))))) (and (or .def_48 (not (<= P_2 0))) (and (not .def_45) (and (= (+ A_4 (+ (* (- 1) P_2) O_2)) 0) (and (= (+ A_4 (+ C_3 (* (- 1) Q_1))) 0) (and (= (+ M_3 (* (- 1) O_2)) 1) (and (= (+ (* 16777216 B_4) (* (- 1) K_4)) 0) (and (= (+ C_3 (+ M_3 (* (- 1) (to_int (* (/ 1 16777216) (to_real K_4)))))) 0) (and (and (= .x.11 (store D_3 Q_1 (select D_3 P_2))) (and .def_110 (and .def_96 (and .def_88 (and .def_27 .def_104))))) .def_158))))))))) .loc.9) (and (not (<= .x.10 0)) (and (not (<= L_3 0)) (and (and .def_114 (and .def_28 (and .loc.8 (and .def_27 .def_100)))) .def_178)))) (and (= .y.4 L_3) (and (or .def_50 .def_184) (and (not .def_119) (and (= (+ B_4 (+ C_3 (* (- 1) K_4))) 0) (and (not .def_184) (and (= .x.11 (store D_3 K_4 M_3)) (and .def_178 (and .def_158 (and .def_28 (and .loc.8 (and .loc.5 .def_103))))))))))))))))))))))))))))) (state |.x.9| |.x.10| |.y.7| |.x.11| |L_3| |.loc.8| |.loc.9| |.xtv.1| |.xtv.2| |.xtv.3| |.xtv.4| |.xtv.5| |.xpv.1| |.xpv.2| |.xpv.3| |.xpv.4| |.xpv.5|))))
(assert (forall ((|A_4| Int) (|B_4| Int) (|C_3| Int) (|D_3| (Array Int Int)) (|.y.4| Int) (|.loc.5| Bool) (|.loc.6| Bool) (|M_3| Int) (|K_4| Int) (|Q_1| Int) (|P_2| Int) (|O_2| Int) (|Q_2| Int) (|K_5| Int) (|P_3| Int) (|M_4| Int) (|O_3| Int) (|.x.11| (Array Int Int)) (|L_3| Int) (|.x.9| Int) (|.x.10| Int) (|.loc.8| Bool) (|.y.7| Int) (|.loc.9| Bool) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| Int) (|.xtv.4| Int) (|.xtv.5| Int) (|.xpv.1| Int) (|.xpv.2| Int) (|.xpv.3| Int) (|.xpv.4| Int) (|.xpv.5| Int)) (=> (state |A_4| |B_4| |C_3| |D_3| |.y.4| |.loc.5| |.loc.6| |M_3| |K_4| |Q_1| |P_2| |O_2| |Q_2| |K_5| |P_3| |M_4| |O_3|) (let ((.def_48 (<= A_4 0))) (not (and (and .loc.5 .loc.6) (and (and (and (not (= (select D_3 K_5) (select D_3 Q_2))) (and (and (= (+ P_3 (* (- 1) O_3)) (- 1)) (and (and (= (+ .y.4 (+ O_3 (* (- 1) (to_int (* (/ 1 16777216) (to_real M_4)))))) 0) (and (and (not (<= (to_int (* (/ 1 2) (to_real (to_int (* (/ 1 16777216) (to_real (* 16777216 B_4))))))) .y.4)) (not .def_48)) (= (+ A_4 (+ .y.4 (* (- 1) K_5))) 0))) (= (+ (* 16777216 B_4) (* (- 1) M_4)) 0))) (= (+ A_4 (+ (* (- 1) Q_2) P_3)) 0))) (or .def_48 (not (<= K_5 0)))) (or .def_48 (not (<= Q_2 0))))))))))
(check-sat)