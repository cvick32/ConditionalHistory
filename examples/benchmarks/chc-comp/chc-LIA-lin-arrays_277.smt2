(set-logic HORN)
(declare-fun state (Int (Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) Int Int (Array Int Int) (Array Int Int) Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Bool Bool Bool Bool Bool Int Int (Array Int Int)) Bool)
(assert (forall ((|A_9| Int) (|B_9| (Array Int Int)) (|C_9| (Array Int Int)) (|D_9| (Array Int Int)) (|E_9| (Array Int Int)) (|F_9| Int) (|G_9| Int) (|H_9| (Array Int Int)) (|I_9| (Array Int Int)) (|J_9| Int) (|K_9| Int) (|L_9| Int) (|M_9| Int) (|G1_5| Int) (|O_9| Int) (|P_9| Int) (|Q_9| Int) (|R_9| Int) (|S_9| Int) (|T_9| Int) (|U_9| Int) (|V_9| Int) (|W_9| Int) (|X_9| Int) (|Y_9| Int) (|H1_4| Int) (|A1_9| Int) (|B1_9| Int) (|I1_2| Int) (|D1_9| Int) (|E1_9| Int) (|F1_9| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|J1_0| Int) (|I1_1| Int) (|G1_0| (Array Int Int)) (|.x.547| Int) (|.x.545| (Array Int Int)) (|.x.543| Int) (|.x.541| (Array Int Int)) (|.x.537| Int) (|.x.539| (Array Int Int)) (|.x.550| Int) (|.x.562| Int) (|.x.565| Int) (|.x.538| (Array Int Int)) (|F1_17| Bool) (|.x.548| Int) (|.x.549| Int) (|.x.554| Int) (|.x.557| Int) (|.x.559| Int) (|.x.564| Int) (|.x.566| Int) (|.x.567| Int) (|.loc.11| Bool) (|.loc.10| Bool) (|.loc.9| Bool) (|.x.563| Int) (|.x.555| Int) (|.x.551| Int) (|.loc.12| Bool) (|.x.556| Int) (|.x.553| Int) (|.x.552| Int) (|.x.561| Int) (|.x.560| Int) (|.x.544| (Array Int Int)) (|.x.542| Int) (|.x.546| Int) (|.x.558| Int) (|.x.540| (Array Int Int)) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| (Array Int Int))) (=> (and (and (and (and .loc.5 .loc.6) (not .loc.7)) (not .loc.8)) (and (and (and (and (and (= D_9 E_9) (not F1_9)) (= F_9 G_9)) (= J_9 K_9)) (= H_9 I_9)) (= B_9 C_9))) (state |A_9| |B_9| |C_9| |D_9| |E_9| |F_9| |G_9| |H_9| |I_9| |J_9| |K_9| |L_9| |M_9| |G1_5| |O_9| |P_9| |Q_9| |R_9| |S_9| |T_9| |U_9| |V_9| |W_9| |X_9| |Y_9| |H1_4| |A1_9| |B1_9| |I1_2| |D1_9| |E1_9| |F1_9| |.loc.5| |.loc.6| |.loc.7| |.loc.8| |J1_0| |I1_1| |G1_0|))))
(assert (forall ((|A_9| Int) (|B_9| (Array Int Int)) (|C_9| (Array Int Int)) (|D_9| (Array Int Int)) (|E_9| (Array Int Int)) (|F_9| Int) (|G_9| Int) (|H_9| (Array Int Int)) (|I_9| (Array Int Int)) (|J_9| Int) (|K_9| Int) (|L_9| Int) (|M_9| Int) (|G1_5| Int) (|O_9| Int) (|P_9| Int) (|Q_9| Int) (|R_9| Int) (|S_9| Int) (|T_9| Int) (|U_9| Int) (|V_9| Int) (|W_9| Int) (|X_9| Int) (|Y_9| Int) (|H1_4| Int) (|A1_9| Int) (|B1_9| Int) (|I1_2| Int) (|D1_9| Int) (|E1_9| Int) (|F1_9| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|J1_0| Int) (|I1_1| Int) (|G1_0| (Array Int Int)) (|.x.547| Int) (|.x.545| (Array Int Int)) (|.x.543| Int) (|.x.541| (Array Int Int)) (|.x.537| Int) (|.x.539| (Array Int Int)) (|.x.550| Int) (|.x.562| Int) (|.x.565| Int) (|.x.538| (Array Int Int)) (|F1_17| Bool) (|.x.548| Int) (|.x.549| Int) (|.x.554| Int) (|.x.557| Int) (|.x.559| Int) (|.x.564| Int) (|.x.566| Int) (|.x.567| Int) (|.loc.11| Bool) (|.loc.10| Bool) (|.loc.9| Bool) (|.x.563| Int) (|.x.555| Int) (|.x.551| Int) (|.loc.12| Bool) (|.x.556| Int) (|.x.553| Int) (|.x.552| Int) (|.x.561| Int) (|.x.560| Int) (|.x.544| (Array Int Int)) (|.x.542| Int) (|.x.546| Int) (|.x.558| Int) (|.x.540| (Array Int Int)) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| (Array Int Int))) (=> (and (state |A_9| |B_9| |C_9| |D_9| |E_9| |F_9| |G_9| |H_9| |I_9| |J_9| |K_9| |L_9| |M_9| |G1_5| |O_9| |P_9| |Q_9| |R_9| |S_9| |T_9| |U_9| |V_9| |W_9| |X_9| |Y_9| |H1_4| |A1_9| |B1_9| |I1_2| |D1_9| |E1_9| |F1_9| |.loc.5| |.loc.6| |.loc.7| |.loc.8| |J1_0| |I1_1| |G1_0|) (let ((.def_50 (not .loc.7))) (let ((.def_52 (not .loc.8))) (let ((.def_85 (= .x.550 0))) (let ((.def_87 (<= V_9 S_9))) (let ((.def_91 (and (not .def_87) (= .x.550 .x.562)))) (let ((.def_112 (select (select D_9 D1_9) (+ (* 4 S_9) E1_9)))) (let ((.def_115 (or F1_9 (and (and .def_91 (= .x.562 (ite (<= 0 (+ P_9 (+ S_9 (+ (* (- 1) V_9) (* (- 1) .x.565))))) 1 0))) (= .x.565 .def_112))))) (let ((.def_120 (= I1_2 .x.565))) (let ((.def_122 (= H1_4 .x.562))) (let ((.def_124 (= G1_5 .x.550))) (let ((.def_128 (= B_9 .x.538))) (let ((.def_132 (= L_9 .x.548))) (let ((.def_135 (= M_9 .x.549))) (let ((.def_138 (= R_9 .x.554))) (let ((.def_141 (= U_9 .x.557))) (let ((.def_144 (= W_9 .x.559))) (let ((.def_147 (= B1_9 .x.564))) (let ((.def_150 (= D1_9 .x.566))) (let ((.def_153 (= E1_9 .x.567))) (let ((.def_155 (not .loc.5))) (let ((.def_173 (= F1_9 F1_17))) (let ((.def_180 (not .loc.10))) (let ((.def_183 (= G1_5 0))) (let ((.def_186 (and .def_135 (and .def_128 .def_132)))) (let ((.def_189 (and .def_144 (and .def_141 (and .def_138 .def_186))))) (let ((.def_192 (and .def_153 (and .def_150 (and .def_147 .def_189))))) (let ((.def_201 (not .loc.11))) (let ((.def_203 (not .loc.6))) (let ((.def_208 (not .loc.9))) (let ((.def_210 (= A1_9 .x.563))) (let ((.def_232 (= S_9 .x.555))) (let ((.def_234 (= O_9 .x.551))) (let ((.def_253 (not .loc.12))) (let ((.def_258 (or F1_17 (= (+ S_9 (* (- 1) .x.555)) (- 1))))) (let ((.def_262 (= T_9 .x.556))) (let ((.def_264 (and .def_186 .def_234))) (let ((.def_265 (and .def_138 .def_264))) (let ((.def_292 (and .loc.5 (and .def_153 (and .def_150 (and .def_147 (and .def_210 (and .def_144 (and .def_141 (and .def_262 .def_265)))))))))) (let ((.def_305 (or F1_9 (= .x.555 0)))) (let ((.def_324 (and .def_234 (and .def_135 (and .def_132 (and F1_9 .def_128)))))) (let ((.def_333 (and .def_153 (and .def_150 (and .def_147 (and .def_210 (and .def_144 (and .def_141 (and .def_262 (and .def_232 (and .def_138 .def_324))))))))))) (let ((.def_354 (and .def_153 (and .def_150 (and .def_147 (and .def_210 (and .def_144 (and .def_141 (and .def_262 (and .def_232 .def_265)))))))))) (let ((.def_367 (or F1_9 .def_87))) (let ((.def_384 (<= 100000 P_9))) (let ((.def_413 (and .loc.6 .def_354))) (let ((.def_428 (= Q_9 .x.553))) (let ((.def_430 (= P_9 .x.552))) (let ((.def_560 (= H_9 .x.544))) (let ((.def_562 (= F_9 .x.542))) (let ((.def_565 (= J_9 .x.546))) (let ((.def_568 (= V_9 .x.558))) (let ((.def_610 (store G1_0 .x.549 1))) (let ((.def_611 (store .def_610 .x.557 1))) (let ((.def_643 (= D_9 .x.540))) (let ((.def_648 (= J1_0 I1_1))) (let ((.def_702 (or F1_9 (and (and (= I1_1 (select (select D_9 U_9) (+ L_9 (* 4 P_9)))) (not .def_384)) (= J1_0 (select (select D_9 M_9) (+ (* 4 P_9) B1_9))))))) (and (and (= K_9 .x.547) (and (= I_9 .x.545) (and (= G_9 .x.543) (and (= E_9 .x.541) (and (= A_9 .x.537) (= C_9 .x.539)))))) (or (or (and (or (and (or (or (or (or (or (and (or (or (or (or (or (or (or (or (or (and (or (and (or (and (or (and (or (and (or (and .def_52 (and .loc.7 (and (or F1_9 .def_85) .def_115))) (and (and (and (and .loc.8 .def_50) .def_120) .def_122) .def_124)) (and (and (and (and (and (and (and (and (and (and .def_128 F1_17) .def_132) .def_135) .def_138) .def_141) .def_144) .def_147) .def_150) .def_153) .def_155)) (and (or F1_9 (and (= .x.538 (store (store (store B_9 M_9 0) U_9 0) D1_9 0)) (= .x.559 0))) (and (and (or F1_17 (= .x.554 .x.559)) (and .def_124 (and .def_122 (and .def_120 (and .def_50 (and .loc.5 .loc.8)))))) .def_173))) (and (and .loc.6 .loc.11) .def_180)) (and (or F1_9 .def_183) (and (and (and .def_173 (and .def_124 (and .def_122 (and .def_120 (and .def_50 (and .loc.10 (and .loc.8 (and .loc.5 .def_192)))))))) .def_201) .def_203))) (and .def_208 .def_210)) (and (or F1_9 (and (= .x.562 (ite (<= S_9 .x.563) 1 0)) (and .def_91 (= .def_112 .x.563)))) (and .def_203 (and .def_201 (and .def_173 (and .def_120 (and .def_50 (and .def_180 (and .loc.9 (and .def_155 (and .loc.8 .def_192))))))))))) (and (and .def_232 .def_234) .loc.12)) (and (and (and .def_203 (and .def_173 (and .def_124 (and .def_122 (and .def_50 (and .def_208 (and .loc.11 (and .loc.10 (and .def_52 (and .loc.5 (and .def_153 (and .def_150 (and .def_147 (and .def_189 .def_210)))))))))))))) .def_253) .def_258)) .def_262) (and .def_258 (and .def_203 (and .def_201 (and .def_173 (and .def_124 (and .def_122 (and .def_120 (and .def_50 (and .def_180 (and .def_208 (and .loc.12 (and .def_52 (and .def_155 (and .def_153 (and .def_150 (and .def_147 (and .def_144 (and .def_141 .def_265))))))))))))))))))) (and (and .def_253 (and .def_203 (and .def_173 (and .def_124 (and .def_122 (and .def_120 (and .def_208 (and .loc.11 (and .loc.10 (and .def_52 (and .loc.7 .def_292))))))))))) .def_305)) (and .def_305 (and .def_201 (and .def_173 (and .def_124 (and .def_122 (and .def_120 (and .def_180 (and .def_208 (and .loc.12 (and .def_52 (and .loc.7 (and .loc.6 .def_292))))))))))))) (and .def_203 (and .def_201 (and .def_173 (and .def_124 (and .def_122 (and .def_120 (and .def_50 (and .loc.12 (and .loc.10 (and .loc.9 (and .def_155 (and .loc.8 .def_333))))))))))))) (and (and .def_203 (and .def_201 (and .def_173 (and .def_124 (and .def_122 (and .def_120 (and .def_50 (and .loc.12 (and .loc.10 (and .loc.9 (and .def_155 (and .loc.8 .def_354)))))))))))) .def_367)) (and .def_253 (and .def_203 (and .def_173 (and .def_124 (and .def_122 (and .def_120 (and .def_180 (and .loc.11 (and .loc.9 (and .def_52 (and .def_155 (and .loc.7 .def_333))))))))))))) (and (or F1_9 .def_384) (and .def_253 (and .def_203 (and .def_173 (and .def_124 (and .def_122 (and .def_120 (and .def_180 (and .loc.11 (and .loc.9 (and .def_52 (and .def_155 (and .loc.7 .def_354)))))))))))))) (and .def_253 (and .def_173 (and .def_124 (and .def_122 (and .def_120 (and .loc.11 (and .loc.10 (and .loc.9 (and .def_52 (and .def_155 (and .loc.7 (and .loc.6 .def_333))))))))))))) (and .def_367 (and .def_253 (and .def_173 (and .def_124 (and .def_122 (and .def_120 (and .loc.11 (and .loc.10 (and .loc.9 (and .def_52 (and .def_155 (and .loc.7 .def_413))))))))))))) (and .def_428 .def_430)) (and (or F1_9 (= (+ P_9 (* (- 1) .x.552)) (- 1))) (and .def_253 (and .def_173 (and .def_124 (and .def_122 (and .def_120 (and .def_50 (and .def_180 (and .def_208 (and .loc.11 (and .def_52 (and .def_155 .def_413))))))))))))) (and (or F1_17 (not .def_85)) (and .def_253 (and .def_201 (and .def_173 (and .def_180 (and .loc.9 (and .def_52 (and .def_155 (and .loc.7 (and .loc.6 (and .def_153 (and .def_150 (and .def_147 (and .def_210 (and .def_144 (and .def_141 (and .def_262 (and .def_232 (and .def_138 (and .def_428 (and .def_430 (and .def_234 (and .def_135 (and .def_132 (and .def_115 .def_128)))))))))))))))))))))))))) (and .def_253 (and .def_201 (and .def_180 (and .loc.9 (and .def_52 (and .def_155 (and .loc.7 (and .loc.6 (and .def_153 (and .def_150 (and .def_147 (and .def_210 (and .def_144 (and .def_141 (and .def_262 (and .def_232 (and .def_138 (and .def_428 (and .def_430 (and .def_234 (and .def_135 (and .def_132 (and .def_128 (and .def_115 (and F1_9 F1_17)))))))))))))))))))))))))) (and (or F1_9 (not .def_183)) (and .def_253 (and .def_203 (and .def_201 (and .def_173 (and .def_124 (and .def_122 (and .def_120 (and .def_50 (and .def_180 (and .def_208 (and .loc.8 (and .loc.5 (and .def_153 (and .def_150 (and .def_147 (and .def_210 (and .def_144 (and .def_141 (and .def_262 (and .def_232 (and .def_138 (and .def_428 (and .def_264 .def_430))))))))))))))))))))))))) (and .def_253 (and .def_201 (and .def_173 (and .def_124 (and .def_122 (and .def_120 (and .def_50 (and .def_180 (and .def_208 (and .def_155 (and .loc.8 (and .loc.6 (and .def_153 (and .def_150 (and .def_147 (and .def_210 (and .def_144 (and .def_141 (and .def_262 (and .def_232 (and .def_138 (and .def_428 (and .def_324 .def_430)))))))))))))))))))))))) (and (= Y_9 .x.561) (and (= X_9 .x.560) (and (and (and .def_560 .def_562) .def_565) .def_568)))) (and (or F1_9 (and (and (= .x.546 0) (= .x.542 0)) (= G1_0 (store B_9 0 0)))) (and (or F1_17 (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (not (<= .x.537 .x.566)) (not (<= .x.537 .x.549))) (not (<= .x.537 .x.557))) (= .x.548 0)) (= .x.552 0)) (= .x.567 0)) (= .x.558 0)) (not (= .x.549 0))) (not (= .x.566 0))) (= .x.564 0)) (not (= .x.557 0))) (= (select G1_0 .x.549) 0)) (= (select .def_611 .x.566) 0)) (= (select .def_610 .x.557) 0)) (= .x.544 (store (store (store H_9 .x.549 400000) .x.557 400000) .x.566 400000))) (= .x.538 (store .def_611 .x.566 1)))) (and .def_253 (and .def_173 (and .def_124 (and .def_122 (and .def_50 (and .def_180 (and .def_208 (and .loc.11 (and .def_52 (and .loc.6 (and .loc.5 .def_138)))))))))))))) .def_643) (and (and (or F1_17 (and (and (= (+ V_9 (* (- 1) .x.558)) (- 1)) .def_648) (= .x.540 (store D_9 .x.566 (store (select D_9 .x.566) (+ (* 4 V_9) .x.567) .x.552))))) (and .def_253 (and .def_203 (and .def_201 (and .def_173 (and .def_124 (and .def_122 (and .def_120 (and .def_208 (and .loc.10 (and .def_52 (and .def_155 (and .loc.7 (and .def_153 (and .def_150 (and .def_147 (and .def_210 (and .def_144 (and .def_141 (and .def_262 (and .def_232 (and .def_138 (and .def_428 (and .def_430 (and .def_234 (and .def_135 (and .def_132 (and .def_565 (and .def_560 (and .def_128 .def_562)))))))))))))))))))))))))))))) .def_702)) (and (or F1_17 (not .def_648)) (and .def_702 (and .def_253 (and .def_203 (and .def_201 (and .def_173 (and .def_124 (and .def_122 (and .def_120 (and .def_208 (and .loc.10 (and .def_52 (and .def_155 (and .loc.7 (and .def_153 (and .def_150 (and .def_147 (and .def_210 (and .def_144 (and .def_568 (and .def_141 (and .def_262 (and .def_232 (and .def_138 (and .def_428 (and .def_430 (and .def_234 (and .def_135 (and .def_132 (and .def_565 (and .def_560 (and .def_562 (and .def_128 .def_643)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) (state |.x.537| |.x.538| |.x.539| |.x.540| |.x.541| |.x.542| |.x.543| |.x.544| |.x.545| |.x.546| |.x.547| |.x.548| |.x.549| |.x.550| |.x.551| |.x.552| |.x.553| |.x.554| |.x.555| |.x.556| |.x.557| |.x.558| |.x.559| |.x.560| |.x.561| |.x.562| |.x.563| |.x.564| |.x.565| |.x.566| |.x.567| |F1_17| |.loc.9| |.loc.10| |.loc.11| |.loc.12| |.xtv.1| |.xtv.2| |.xtv.3|))))
(assert (forall ((|A_9| Int) (|B_9| (Array Int Int)) (|C_9| (Array Int Int)) (|D_9| (Array Int Int)) (|E_9| (Array Int Int)) (|F_9| Int) (|G_9| Int) (|H_9| (Array Int Int)) (|I_9| (Array Int Int)) (|J_9| Int) (|K_9| Int) (|L_9| Int) (|M_9| Int) (|G1_5| Int) (|O_9| Int) (|P_9| Int) (|Q_9| Int) (|R_9| Int) (|S_9| Int) (|T_9| Int) (|U_9| Int) (|V_9| Int) (|W_9| Int) (|X_9| Int) (|Y_9| Int) (|H1_4| Int) (|A1_9| Int) (|B1_9| Int) (|I1_2| Int) (|D1_9| Int) (|E1_9| Int) (|F1_9| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|J1_0| Int) (|I1_1| Int) (|G1_0| (Array Int Int)) (|.x.547| Int) (|.x.545| (Array Int Int)) (|.x.543| Int) (|.x.541| (Array Int Int)) (|.x.537| Int) (|.x.539| (Array Int Int)) (|.x.550| Int) (|.x.562| Int) (|.x.565| Int) (|.x.538| (Array Int Int)) (|F1_17| Bool) (|.x.548| Int) (|.x.549| Int) (|.x.554| Int) (|.x.557| Int) (|.x.559| Int) (|.x.564| Int) (|.x.566| Int) (|.x.567| Int) (|.loc.11| Bool) (|.loc.10| Bool) (|.loc.9| Bool) (|.x.563| Int) (|.x.555| Int) (|.x.551| Int) (|.loc.12| Bool) (|.x.556| Int) (|.x.553| Int) (|.x.552| Int) (|.x.561| Int) (|.x.560| Int) (|.x.544| (Array Int Int)) (|.x.542| Int) (|.x.546| Int) (|.x.558| Int) (|.x.540| (Array Int Int)) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| (Array Int Int))) (=> (state |A_9| |B_9| |C_9| |D_9| |E_9| |F_9| |G_9| |H_9| |I_9| |J_9| |K_9| |L_9| |M_9| |G1_5| |O_9| |P_9| |Q_9| |R_9| |S_9| |T_9| |U_9| |V_9| |W_9| |X_9| |Y_9| |H1_4| |A1_9| |B1_9| |I1_2| |D1_9| |E1_9| |F1_9| |.loc.5| |.loc.6| |.loc.7| |.loc.8| |J1_0| |I1_1| |G1_0|) (not (and F1_9 (and .loc.8 (and .loc.7 (and (not .loc.5) (not .loc.6)))))))))
(check-sat)