(set-logic HORN)
(declare-fun state (Int (Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) Int Int (Array Int Int) (Array Int Int) Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Bool Bool Bool Bool Bool (Array Int Int)) Bool)
(assert (forall ((|A_16| Int) (|F1_7| (Array Int Int)) (|C_16| (Array Int Int)) (|D_16| (Array Int Int)) (|E_16| (Array Int Int)) (|F_16| Int) (|G_16| Int) (|H_16| (Array Int Int)) (|I_16| (Array Int Int)) (|J_16| Int) (|K_16| Int) (|L_16| Int) (|G1_5| Int) (|N_16| Int) (|O_16| Int) (|P_16| Int) (|Q_16| Int) (|R_16| Int) (|S_16| Int) (|T_16| Int) (|H1_2| Int) (|V_16| Int) (|W_16| Int) (|I1_0| Int) (|Y_16| Int) (|J1_0| Int) (|K1_0| Int) (|B1_16| Int) (|C1_16| Int) (|D1_16| Int) (|E1_16| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|F1_0| (Array Int Int)) (|.x.710| Int) (|.x.708| (Array Int Int)) (|.x.706| Int) (|.x.704| (Array Int Int)) (|.x.700| Int) (|.x.702| (Array Int Int)) (|.loc.9| Bool) (|.loc.10| Bool) (|.x.719| Int) (|.x.726| Int) (|.x.730| Bool) (|.x.701| (Array Int Int)) (|.x.713| Int) (|.x.724| Int) (|.x.727| Int) (|.x.728| Int) (|.x.721| Int) (|.x.723| Int) (|.x.703| (Array Int Int)) (|.x.720| Int) (|.x.718| Int) (|.x.712| Int) (|.x.725| Int) (|.x.722| Int) (|.loc.12| Bool) (|.loc.11| Bool) (|.x.716| Int) (|.x.715| Int) (|.x.729| Int) (|.x.717| Int) (|.x.711| Int) (|.x.714| Int) (|.x.709| Int) (|.x.705| Int) (|.x.707| (Array Int Int)) (|.xtv.1| (Array Int Int))) (=> (and (and (and (and .loc.5 .loc.6) (not .loc.7)) (not .loc.8)) (and (and (and (and (and (= D_16 E_16) (not E1_16)) (= F_16 G_16)) (= J_16 K_16)) (= H_16 I_16)) (= F1_7 C_16))) (state |A_16| |F1_7| |C_16| |D_16| |E_16| |F_16| |G_16| |H_16| |I_16| |J_16| |K_16| |L_16| |G1_5| |N_16| |O_16| |P_16| |Q_16| |R_16| |S_16| |T_16| |H1_2| |V_16| |W_16| |I1_0| |Y_16| |J1_0| |K1_0| |B1_16| |C1_16| |D1_16| |E1_16| |.loc.5| |.loc.6| |.loc.7| |.loc.8| |F1_0|))))
(assert (forall ((|A_16| Int) (|F1_7| (Array Int Int)) (|C_16| (Array Int Int)) (|D_16| (Array Int Int)) (|E_16| (Array Int Int)) (|F_16| Int) (|G_16| Int) (|H_16| (Array Int Int)) (|I_16| (Array Int Int)) (|J_16| Int) (|K_16| Int) (|L_16| Int) (|G1_5| Int) (|N_16| Int) (|O_16| Int) (|P_16| Int) (|Q_16| Int) (|R_16| Int) (|S_16| Int) (|T_16| Int) (|H1_2| Int) (|V_16| Int) (|W_16| Int) (|I1_0| Int) (|Y_16| Int) (|J1_0| Int) (|K1_0| Int) (|B1_16| Int) (|C1_16| Int) (|D1_16| Int) (|E1_16| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|F1_0| (Array Int Int)) (|.x.710| Int) (|.x.708| (Array Int Int)) (|.x.706| Int) (|.x.704| (Array Int Int)) (|.x.700| Int) (|.x.702| (Array Int Int)) (|.loc.9| Bool) (|.loc.10| Bool) (|.x.719| Int) (|.x.726| Int) (|.x.730| Bool) (|.x.701| (Array Int Int)) (|.x.713| Int) (|.x.724| Int) (|.x.727| Int) (|.x.728| Int) (|.x.721| Int) (|.x.723| Int) (|.x.703| (Array Int Int)) (|.x.720| Int) (|.x.718| Int) (|.x.712| Int) (|.x.725| Int) (|.x.722| Int) (|.loc.12| Bool) (|.loc.11| Bool) (|.x.716| Int) (|.x.715| Int) (|.x.729| Int) (|.x.717| Int) (|.x.711| Int) (|.x.714| Int) (|.x.709| Int) (|.x.705| Int) (|.x.707| (Array Int Int)) (|.xtv.1| (Array Int Int))) (=> (and (state |A_16| |F1_7| |C_16| |D_16| |E_16| |F_16| |G_16| |H_16| |I_16| |J_16| |K_16| |L_16| |G1_5| |N_16| |O_16| |P_16| |Q_16| |R_16| |S_16| |T_16| |H1_2| |V_16| |W_16| |I1_0| |Y_16| |J1_0| |K1_0| |B1_16| |C1_16| |D1_16| |E1_16| |.loc.5| |.loc.6| |.loc.7| |.loc.8| |F1_0|) (let ((.def_47 (not .loc.7))) (let ((.def_49 (not .loc.8))) (let ((.def_81 (not .loc.9))) (let ((.def_98 (= N_16 .x.713))) (let ((.def_101 (= Y_16 .x.724))) (let ((.def_104 (= B1_16 .x.727))) (let ((.def_107 (= C1_16 .x.728))) (let ((.def_109 (= E1_16 .x.730))) (let ((.def_131 (= .x.721 .x.718))) (let ((.def_140 (and (and (and (and (= .x.728 (select (select .x.703 .x.720) (+ (* 4 .x.721) .x.723))) (= .x.713 .x.727)) (= .x.727 (ite (= .x.724 .x.728) 1 0))) (not .def_131)) (= .x.724 (select (select .x.703 .x.725) (+ (* 4 .x.721) .x.712)))))) (let ((.def_142 (= .x.713 0))) (let ((.def_144 (not .loc.5))) (let ((.def_148 (= K1_0 .x.726))) (let ((.def_150 (= J1_0 .x.725))) (let ((.def_152 (= I1_0 .x.723))) (let ((.def_154 (= H1_2 .x.720))) (let ((.def_156 (= T_16 .x.719))) (let ((.def_158 (= G1_5 .x.712))) (let ((.def_160 (= F1_7 .x.701))) (let ((.def_163 (<= 200000 V_16))) (let ((.def_165 (or E1_16 (not .def_163)))) (let ((.def_169 (and E1_16 .def_98))) (let ((.def_183 (not .loc.10))) (let ((.def_190 (and .def_109 (and .def_107 (and .def_104 (and .def_98 .def_101)))))) (let ((.def_204 (= W_16 .x.722))) (let ((.def_205 (= V_16 .x.721))) (let ((.def_206 (and .def_204 .def_205))) (let ((.def_230 (and .def_204 (and .def_98 .def_205)))) (let ((.def_244 (not .loc.12))) (let ((.def_247 (not .loc.6))) (let ((.def_277 (and .def_109 (and .def_107 (and .def_104 (and .def_101 .def_230)))))) (let ((.def_337 (not .loc.11))) (let ((.def_361 (and .loc.6 .def_277))) (let ((.def_376 (<= 200000 Q_16))) (let ((.def_377 (or E1_16 .def_376))) (let ((.def_381 (= Q_16 .x.716))) (let ((.def_383 (= P_16 .x.715))) (let ((.def_388 (= (+ Q_16 (* (- 1) .x.716)) (- 1)))) (let ((.def_406 (= .x.716 0))) (let ((.def_408 (and .def_98 .def_383))) (let ((.def_413 (and .def_107 (and .def_104 (and .def_101 (and .def_204 (and .def_205 .def_408))))))) (let ((.def_433 (= D1_16 .x.729))) (let ((.def_434 (= D_16 .x.703))) (let ((.def_446 (= .x.718 .x.716))) (let ((.def_473 (not .def_376))) (let ((.def_474 (or E1_16 .def_473))) (let ((.def_478 (and .def_98 .def_434))) (let ((.def_487 (and .def_109 (and .def_433 (and .def_107 (and .def_104 (and .def_101 (and .def_204 (and .def_205 (and .def_381 (and .def_383 .def_478))))))))))) (let ((.def_565 (store D_16 H1_2 (store (select D_16 H1_2) (+ (* 4 Q_16) I1_0) L_16)))) (let ((.def_644 (store F1_0 .x.720 1))) (and (and (= K_16 .x.710) (and (= I_16 .x.708) (and (= G_16 .x.706) (and (= E_16 .x.704) (and (= A_16 .x.700) (= C_16 .x.702)))))) (or (and (or (and (or (or (or (or (and (or (or (and (or (or (and (or (or (or (or (and (or (and (or (and (or (or (and (and .def_81 .loc.10) (or (and .loc.5 (and (or (= .x.719 .x.726) .x.730) (and (and (and (and (and (or E1_16 (and (= (store (store F1_7 H1_2 0) J1_0 0) .x.701) (= .x.726 0))) .def_98) .def_101) .def_104) .def_107) .def_109))) (and (and (and (and (and (and (and (and (and (or E1_16 .def_140) (and (or E1_16 .def_142) (and .x.730 .def_144))) .def_148) .def_150) .def_152) .def_154) .def_156) .def_158) .def_160) .def_165))) (and (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_144 (and .loc.9 (and .def_109 (and .def_107 (and .def_104 (and .def_101 .def_169))))))))))))) .def_183)) (and (or E1_16 .def_163) (and .def_183 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_144 (and .loc.9 .def_190)))))))))))) (and .loc.8 .def_206)) (and (or E1_16 (= (+ V_16 (* (- 1) .x.721)) (- 1))) (and .def_49 (and .def_183 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_81 (and .loc.5 .def_190))))))))))))) .loc.12) (and (and .def_49 (and .def_183 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_144 (and .loc.9 (and .def_109 (and .def_104 .def_230))))))))))))) .def_244)) (and .def_47 .def_247)) (and (or E1_16 (= .x.721 0)) (and .def_49 (and .def_183 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_81 (and .loc.12 (and .loc.7 (and .loc.6 (and .loc.5 (and .def_109 (and .def_107 (and .def_104 (and .def_101 (and .def_98 .def_204))))))))))))))))))))) (and (or .x.730 .def_131) (and .def_244 (and .def_183 (and .def_165 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_144 (and .loc.9 (and .def_47 (and .def_247 (and .loc.8 .def_277))))))))))))))))) (and (or .x.730 .def_140) (and (or .x.730 (not .def_142)) (and .def_244 (and .def_183 (and .def_165 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_144 (and .def_81 (and .def_47 (and .def_247 (and .loc.8 (and .def_109 .def_206))))))))))))))))))) (and .def_244 (and .def_183 (and .def_165 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_144 (and .def_81 (and .def_47 (and .def_247 (and .loc.8 (and .def_204 (and .def_205 (and E1_16 .x.730))))))))))))))))))) .def_337) (and .def_244 (and .def_49 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_144 (and .loc.11 (and .loc.10 (and .loc.9 (and .loc.7 (and .loc.6 (and .def_109 (and .def_107 (and .def_104 (and .def_101 (and .def_204 (and .def_169 .def_205)))))))))))))))))))))) (and (and .def_244 (and .def_49 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_144 (and .loc.11 (and .loc.10 (and .loc.9 (and .loc.7 .def_361)))))))))))))) .def_377)) (and .def_381 .def_383)) (and (or E1_16 .def_388) (and .def_244 (and .def_49 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_144 (and .def_81 (and .loc.11 (and .loc.10 (and .def_47 .def_361)))))))))))))))) (and (or E1_16 .def_406) (and .def_244 (and .def_49 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_81 (and .loc.11 (and .loc.10 (and .def_247 (and .loc.7 (and .loc.5 (and .def_109 .def_413)))))))))))))))))) (and .def_433 .def_434)) (and (and (or .x.730 (and (= .x.703 (store D_16 .x.725 (store (select D_16 .x.725) (+ .x.712 (* 4 .x.716)) (select (select D_16 .x.720) (+ .x.723 (* 4 .x.716)))))) (not .def_446))) (and .def_244 (and .def_49 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_144 (and .def_337 (and .def_81 (and .loc.10 (and .loc.7 (and .loc.6 (and .def_109 (and .def_107 (and .def_104 (and .def_101 (and .def_204 (and .def_205 (and .def_381 .def_408))))))))))))))))))))))) .def_474)) (and (or .x.730 .def_446) (and .def_474 (and .def_244 (and .def_49 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_144 (and .def_337 (and .def_81 (and .loc.10 (and .loc.7 (and .loc.6 .def_487)))))))))))))))))) (and .def_244 (and .def_49 (and .def_183 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_144 (and .loc.11 (and .loc.9 (and .def_247 (and .loc.7 (and .def_109 (and .def_433 (and .def_107 (and .def_104 (and .def_101 (and .def_204 (and .def_205 (and .def_381 (and .def_383 (and .def_98 (and E1_16 .def_434))))))))))))))))))))))))))) (and .def_377 (and .def_244 (and .def_49 (and .def_183 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_144 (and .loc.11 (and .loc.9 (and .def_247 (and .loc.7 .def_487))))))))))))))))) (and (= R_16 .x.717) (and (= L_16 .x.711) (= O_16 .x.714)))) (and (or E1_16 (and (= .x.703 (store .def_565 J1_0 (store (select .def_565 J1_0) (+ G1_5 (* 4 Q_16)) O_16))) (and (<= (- 2147483648) O_16) (and (<= (- 2147483648) L_16) (and .def_473 (and (<= L_16 2147483647) (<= O_16 2147483647))))))) (and (or .x.730 .def_388) (and .def_244 (and .def_49 (and .def_183 (and .def_160 (and .def_158 (and .def_156 (and .def_154 (and .def_152 (and .def_150 (and .def_148 (and .def_144 (and .def_81 (and .loc.11 (and .def_247 (and .loc.7 (and .def_109 (and .def_413 .def_433)))))))))))))))))))) (and (= S_16 .x.718) (and (= J_16 .x.709) (and (= F_16 .x.705) (= H_16 .x.707))))) (and (or E1_16 (and (and (= .x.709 0) (= .x.705 0)) (= F1_0 (store F1_7 0 0)))) (and (or .x.730 (and (and (and (and (and (and (and (and (and .def_406 (and (and (not (<= .x.700 .x.720)) (not (<= .x.700 .x.725))) (= .x.712 0))) (= .x.718 150000)) (= .x.723 0)) (not (= .x.725 0))) (not (= .x.720 0))) (= (select F1_0 .x.720) 0)) (= (select .def_644 .x.725) 0)) (= .x.701 (store .def_644 .x.725 1))) (= .x.707 (store (store H_16 .x.720 800000) .x.725 800000)))) (and .def_244 (and .def_49 (and .def_183 (and .def_156 (and .def_81 (and .loc.11 (and .def_47 (and .loc.6 (and .loc.5 (and .def_109 (and .def_104 .def_478)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) (state |.x.700| |.x.701| |.x.702| |.x.703| |.x.704| |.x.705| |.x.706| |.x.707| |.x.708| |.x.709| |.x.710| |.x.711| |.x.712| |.x.713| |.x.714| |.x.715| |.x.716| |.x.717| |.x.718| |.x.719| |.x.720| |.x.721| |.x.722| |.x.723| |.x.724| |.x.725| |.x.726| |.x.727| |.x.728| |.x.729| |.x.730| |.loc.9| |.loc.10| |.loc.11| |.loc.12| |.xtv.1|))))
(assert (forall ((|A_16| Int) (|F1_7| (Array Int Int)) (|C_16| (Array Int Int)) (|D_16| (Array Int Int)) (|E_16| (Array Int Int)) (|F_16| Int) (|G_16| Int) (|H_16| (Array Int Int)) (|I_16| (Array Int Int)) (|J_16| Int) (|K_16| Int) (|L_16| Int) (|G1_5| Int) (|N_16| Int) (|O_16| Int) (|P_16| Int) (|Q_16| Int) (|R_16| Int) (|S_16| Int) (|T_16| Int) (|H1_2| Int) (|V_16| Int) (|W_16| Int) (|I1_0| Int) (|Y_16| Int) (|J1_0| Int) (|K1_0| Int) (|B1_16| Int) (|C1_16| Int) (|D1_16| Int) (|E1_16| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|F1_0| (Array Int Int)) (|.x.710| Int) (|.x.708| (Array Int Int)) (|.x.706| Int) (|.x.704| (Array Int Int)) (|.x.700| Int) (|.x.702| (Array Int Int)) (|.loc.9| Bool) (|.loc.10| Bool) (|.x.719| Int) (|.x.726| Int) (|.x.730| Bool) (|.x.701| (Array Int Int)) (|.x.713| Int) (|.x.724| Int) (|.x.727| Int) (|.x.728| Int) (|.x.721| Int) (|.x.723| Int) (|.x.703| (Array Int Int)) (|.x.720| Int) (|.x.718| Int) (|.x.712| Int) (|.x.725| Int) (|.x.722| Int) (|.loc.12| Bool) (|.loc.11| Bool) (|.x.716| Int) (|.x.715| Int) (|.x.729| Int) (|.x.717| Int) (|.x.711| Int) (|.x.714| Int) (|.x.709| Int) (|.x.705| Int) (|.x.707| (Array Int Int)) (|.xtv.1| (Array Int Int))) (=> (state |A_16| |F1_7| |C_16| |D_16| |E_16| |F_16| |G_16| |H_16| |I_16| |J_16| |K_16| |L_16| |G1_5| |N_16| |O_16| |P_16| |Q_16| |R_16| |S_16| |T_16| |H1_2| |V_16| |W_16| |I1_0| |Y_16| |J1_0| |K1_0| |B1_16| |C1_16| |D1_16| |E1_16| |.loc.5| |.loc.6| |.loc.7| |.loc.8| |F1_0|) (not (and E1_16 (and .loc.8 (and (not .loc.7) (and .loc.6 (not .loc.5)))))))))
(check-sat)