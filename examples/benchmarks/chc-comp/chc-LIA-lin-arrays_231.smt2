(set-logic HORN)
(declare-fun state (Int (Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) Int Int (Array Int Int) (Array Int Int) Int Int Int Int Int Int Int Int Int Bool Bool Bool (Array Int Int)) Bool)
(assert (forall ((|A| Int) (|T| (Array Int Int)) (|C| (Array Int Int)) (|D| (Array Int Int)) (|E| (Array Int Int)) (|U| Int) (|G| Int) (|H| (Array Int Int)) (|I| (Array Int Int)) (|V| Int) (|K| Int) (|L| Int) (|M| Int) (|N| Int) (|O| Int) (|P| Int) (|Q| Int) (|R| Int) (|S| Bool) (|.loc.3| Bool) (|.loc.4| Bool) (|T_0| (Array Int Int)) (|.x.75| Int) (|.x.73| (Array Int Int)) (|.x.71| Int) (|.x.69| (Array Int Int)) (|.x.65| Int) (|.x.67| (Array Int Int)) (|.loc.5| Bool) (|.loc.6| Bool) (|.x.77| Int) (|.x.79| Int) (|.x.81| Int) (|.x.68| (Array Int Int)) (|.x.66| (Array Int Int)) (|.x.72| (Array Int Int)) (|.x.82| Int) (|.x.80| Int) (|.x.70| Int) (|.x.74| Int) (|S_3| Bool) (|.x.76| Int) (|.x.78| Int) (|.xtv.1| (Array Int Int))) (=> (and (and (not .loc.4) (not .loc.3)) (and (and (and (and (and (= D E) (not S)) (= U G)) (= V K)) (= H I)) (= T C))) (state |A| |T| |C| |D| |E| |U| |G| |H| |I| |V| |K| |L| |M| |N| |O| |P| |Q| |R| |S| |.loc.3| |.loc.4| |T_0|))))
(assert (forall ((|A| Int) (|T| (Array Int Int)) (|C| (Array Int Int)) (|D| (Array Int Int)) (|E| (Array Int Int)) (|U| Int) (|G| Int) (|H| (Array Int Int)) (|I| (Array Int Int)) (|V| Int) (|K| Int) (|L| Int) (|M| Int) (|N| Int) (|O| Int) (|P| Int) (|Q| Int) (|R| Int) (|S| Bool) (|.loc.3| Bool) (|.loc.4| Bool) (|T_0| (Array Int Int)) (|.x.75| Int) (|.x.73| (Array Int Int)) (|.x.71| Int) (|.x.69| (Array Int Int)) (|.x.65| Int) (|.x.67| (Array Int Int)) (|.loc.5| Bool) (|.loc.6| Bool) (|.x.77| Int) (|.x.79| Int) (|.x.81| Int) (|.x.68| (Array Int Int)) (|.x.66| (Array Int Int)) (|.x.72| (Array Int Int)) (|.x.82| Int) (|.x.80| Int) (|.x.70| Int) (|.x.74| Int) (|S_3| Bool) (|.x.76| Int) (|.x.78| Int) (|.xtv.1| (Array Int Int))) (=> (and (state |A| |T| |C| |D| |E| |U| |G| |H| |I| |V| |K| |L| |M| |N| |O| |P| |Q| |R| |S| |.loc.3| |.loc.4| |T_0|) (let ((.def_33 (not .loc.3))) (let ((.def_71 (= .x.77 0))) (let ((.def_77 (select D .x.81))) (let ((.def_127 (and (= (store D .x.81 (store .def_77 (+ .x.79 8) 4)) .x.68) (and (= (store T_0 .x.81 1) .x.66) (and (= (store H .x.81 12) .x.72) (and (= (select .def_77 (+ .x.79 4)) 2) (and (= (select .def_77 (+ .x.79 8)) 3) (and (= (select .def_77 .x.79) 1) (and (= (select T_0 .x.81) 0) (and (not (= .x.81 0)) (and (= .x.79 0) (and (= .x.77 .x.82) (and (= .x.82 (ite (= .x.80 4) 1 0)) (and (= .x.80 (select (select .x.68 .x.81) (+ .x.79 8))) (not (<= .x.65 .x.81)))))))))))))))) (let ((.def_137 (or S (and (= T_0 (store T 0 0)) (and (= .x.70 0) (= .x.74 0)))))) (let ((.def_141 (= L .x.76))) (let ((.def_161 (= S S_3))) (let ((.def_179 (not .loc.6))) (and (and (not .loc.4) (and (= K .x.75) (and (= I .x.73) (and (= G .x.71) (and (= E .x.69) (and (= A .x.65) (= C .x.67))))))) (or (or (and (and (not .loc.5) .loc.6) (or (and .def_33 (and (or S .def_71) (and (or S .def_127) (and (and .def_137 S_3) .def_141)))) (and (or S (and (= .x.78 0) (= .x.66 (store T Q 0)))) (and (= D .x.68) (and (= U .x.70) (and (= H .x.72) (and (= V .x.74) (and (= M .x.77) (and (= R .x.82) (and (and .loc.3 (or S_3 (= .x.76 .x.78))) .def_161)))))))))) (and (or .def_127 S_3) (and (or S_3 (not .def_71)) (and (and .def_161 (and .loc.5 (and .def_33 (and .def_137 .def_141)))) .def_179)))) (and .def_179 (and .loc.5 (and .def_33 (and .def_141 (and .def_137 (and S S_3))))))))))))))))) (state |.x.65| |.x.66| |.x.67| |.x.68| |.x.69| |.x.70| |.x.71| |.x.72| |.x.73| |.x.74| |.x.75| |.x.76| |.x.77| |.x.78| |.x.79| |.x.80| |.x.81| |.x.82| |S_3| |.loc.5| |.loc.6| |.xtv.1|))))
(assert (forall ((|A| Int) (|T| (Array Int Int)) (|C| (Array Int Int)) (|D| (Array Int Int)) (|E| (Array Int Int)) (|U| Int) (|G| Int) (|H| (Array Int Int)) (|I| (Array Int Int)) (|V| Int) (|K| Int) (|L| Int) (|M| Int) (|N| Int) (|O| Int) (|P| Int) (|Q| Int) (|R| Int) (|S| Bool) (|.loc.3| Bool) (|.loc.4| Bool) (|T_0| (Array Int Int)) (|.x.75| Int) (|.x.73| (Array Int Int)) (|.x.71| Int) (|.x.69| (Array Int Int)) (|.x.65| Int) (|.x.67| (Array Int Int)) (|.loc.5| Bool) (|.loc.6| Bool) (|.x.77| Int) (|.x.79| Int) (|.x.81| Int) (|.x.68| (Array Int Int)) (|.x.66| (Array Int Int)) (|.x.72| (Array Int Int)) (|.x.82| Int) (|.x.80| Int) (|.x.70| Int) (|.x.74| Int) (|S_3| Bool) (|.x.76| Int) (|.x.78| Int) (|.xtv.1| (Array Int Int))) (=> (state |A| |T| |C| |D| |E| |U| |G| |H| |I| |V| |K| |L| |M| |N| |O| |P| |Q| |R| |S| |.loc.3| |.loc.4| |T_0|) (not (and S (and .loc.4 (not .loc.3)))))))
(check-sat)