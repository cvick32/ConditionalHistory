(set-logic HORN)
(declare-fun state ((Array Int Int) Int Int Int Int (Array Int Int) Bool Bool Int (Array Int Int) Int Int Bool Bool Int Bool Int Bool Bool Bool) Bool)
(assert (forall ((|R_0| (Array Int Int)) (|S| Int) (|K_1| Int) (|G_1| Int) (|A_2| Int) (|B_2| (Array Int Int)) (|.loc.9| Bool) (|.loc.10| Bool) (|F_1| Int) (|G| (Array Int Int)) (|N_1| Int) (|I_1| Int) (|L_1| Bool) (|M_1| Bool) (|T| Int) (|H_1| Bool) (|Q_1| Int) (|P_1| Bool) (|O_1| Bool) (|E_1| Bool) (|.loc.17| Bool) (|.loc.18| Bool) (|.y.12| Int) (|.y.14| Int) (|.y.11| (Array Int Int)) (|.y.15| Int) (|.y.16| (Array Int Int)) (|.y.13| Int) (|.xtv.1| Int) (|.xtv.2| (Array Int Int)) (|.xtv.3| Int) (|.xtv.4| Int) (|.xtv.5| Bool) (|.xtv.6| Bool) (|.xtv.7| Int) (|.xtv.8| Bool) (|.xtv.9| Int) (|.xtv.10| Bool) (|.xtv.11| Bool) (|.xtv.12| Bool)) (=> (and (not .loc.10) (not .loc.9)) (state |R_0| |S| |K_1| |G_1| |A_2| |B_2| |.loc.9| |.loc.10| |F_1| |G| |N_1| |I_1| |L_1| |M_1| |T| |H_1| |Q_1| |P_1| |O_1| |E_1|))))
(assert (forall ((|R_0| (Array Int Int)) (|S| Int) (|K_1| Int) (|G_1| Int) (|A_2| Int) (|B_2| (Array Int Int)) (|.loc.9| Bool) (|.loc.10| Bool) (|F_1| Int) (|G| (Array Int Int)) (|N_1| Int) (|I_1| Int) (|L_1| Bool) (|M_1| Bool) (|T| Int) (|H_1| Bool) (|Q_1| Int) (|P_1| Bool) (|O_1| Bool) (|E_1| Bool) (|.loc.17| Bool) (|.loc.18| Bool) (|.y.12| Int) (|.y.14| Int) (|.y.11| (Array Int Int)) (|.y.15| Int) (|.y.16| (Array Int Int)) (|.y.13| Int) (|.xtv.1| Int) (|.xtv.2| (Array Int Int)) (|.xtv.3| Int) (|.xtv.4| Int) (|.xtv.5| Bool) (|.xtv.6| Bool) (|.xtv.7| Int) (|.xtv.8| Bool) (|.xtv.9| Int) (|.xtv.10| Bool) (|.xtv.11| Bool) (|.xtv.12| Bool)) (=> (and (state |R_0| |S| |K_1| |G_1| |A_2| |B_2| |.loc.9| |.loc.10| |F_1| |G| |N_1| |I_1| |L_1| |M_1| |T| |H_1| |Q_1| |P_1| |O_1| |E_1|) (let ((.def_36 (<= 0 T))) (let ((.def_38 (select R_0 S))) (let ((.def_40 (not (<= .def_38 T)))) (let ((.def_42 (not (<= 0 .def_38)))) (let ((.def_52 (not O_1))) (let ((.def_53 (not L_1))) (let ((.def_61 (= (select B_2 (+ (* 4 K_1) A_2)) 3))) (let ((.def_62 (not .def_61))) (let ((.def_64 (not P_1))) (let ((.def_65 (or .def_52 .def_64))) (let ((.def_68 (not M_1))) (let ((.def_79 (= (+ K_1 (* (- 1) F_1)) (- 1)))) (let ((.def_82 (not (<= G_1 I_1)))) (let ((.def_84 (not (<= 0 G_1)))) (let ((.def_86 (<= 0 I_1))) (let ((.def_95 (= F_1 20))) (let ((.def_103 (or .def_53 .def_68))) (let ((.def_109 (<= A_2 0))) (let ((.def_110 (not .def_109))) (let ((.def_125 (or .def_109 (not (<= (+ (* 4 K_1) A_2) 0))))) (let ((.def_146 (<= .y.15 0))) (let ((.def_153 (not .loc.18))) (let ((.def_169 (<= 0 .y.13))) (let ((.def_172 (not (<= G_1 .y.13)))) (and (not .loc.10) (or (or (and (not .loc.17) (and (and .loc.9 (and (not (and (or (not .def_36) (or .def_40 .def_42)) (or .def_36 (and .def_40 .def_42)))) (and (or (and P_1 O_1) (and L_1 M_1)) (and (or (or .def_52 .def_53) .def_62) (and (or .def_61 .def_65) (and (and (or O_1 .def_64) (and (or L_1 .def_68) (and (or .def_53 (and L_1 O_1)) (and (or .def_53 (= I_1 (ite E_1 (- 1) F_1))) (and (or .def_53 .def_79) (and (or .def_53 (= H_1 (and (or (and .def_82 .def_84) .def_86) (or (not .def_86) (or .def_82 .def_84))))) (and (or .def_53 (= E_1 .def_95)) (and (or .def_65 (= T Q_1)) (and (or .def_65 (= K_1 Q_1)) (and (or (not H_1) .def_103) (and (or .def_103 (= N_1 T)) (and (or .def_103 (= N_1 I_1)) .def_110)))))))))))) .def_125)))))) .loc.18)) (and (= (store R_0 .y.12 .y.14) .y.11) (and (= (store G (+ (* 4 F_1) .y.15) 3) .y.16) (and (not .def_146) (and (or .def_146 (not (<= (+ (* 4 F_1) .y.15) 0))) (and (= .y.13 0) (and (not .loc.9) (and .loc.17 .def_153)))))))) (and (= B_2 .y.16) (and (= A_2 .y.15) (and (= G_1 .y.14) (and (= S .y.12) (and (= R_0 .y.11) (and (= .y.13 (ite .def_95 (- 1) F_1)) (and (or (not .def_169) (or .def_84 .def_172)) (and (or .def_169 (and .def_84 .def_172)) (and .def_153 (and .loc.17 (and .loc.9 (and .def_62 (and .def_125 (and .def_79 .def_110))))))))))))))))))))))))))))))))))))))))) (state |.y.11| |.y.12| |.y.13| |.y.14| |.y.15| |.y.16| |.loc.17| |.loc.18| |.xtv.1| |.xtv.2| |.xtv.3| |.xtv.4| |.xtv.5| |.xtv.6| |.xtv.7| |.xtv.8| |.xtv.9| |.xtv.10| |.xtv.11| |.xtv.12|))))
(assert (forall ((|R_0| (Array Int Int)) (|S| Int) (|K_1| Int) (|G_1| Int) (|A_2| Int) (|B_2| (Array Int Int)) (|.loc.9| Bool) (|.loc.10| Bool) (|F_1| Int) (|G| (Array Int Int)) (|N_1| Int) (|I_1| Int) (|L_1| Bool) (|M_1| Bool) (|T| Int) (|H_1| Bool) (|Q_1| Int) (|P_1| Bool) (|O_1| Bool) (|E_1| Bool) (|.loc.17| Bool) (|.loc.18| Bool) (|.y.12| Int) (|.y.14| Int) (|.y.11| (Array Int Int)) (|.y.15| Int) (|.y.16| (Array Int Int)) (|.y.13| Int) (|.xtv.1| Int) (|.xtv.2| (Array Int Int)) (|.xtv.3| Int) (|.xtv.4| Int) (|.xtv.5| Bool) (|.xtv.6| Bool) (|.xtv.7| Int) (|.xtv.8| Bool) (|.xtv.9| Int) (|.xtv.10| Bool) (|.xtv.11| Bool) (|.xtv.12| Bool)) (=> (state |R_0| |S| |K_1| |G_1| |A_2| |B_2| |.loc.9| |.loc.10| |F_1| |G| |N_1| |I_1| |L_1| |M_1| |T| |H_1| |Q_1| |P_1| |O_1| |E_1|) (not (and .loc.10 (not .loc.9))))))
(check-sat)
