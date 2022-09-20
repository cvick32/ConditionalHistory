(set-logic HORN)
(declare-fun state (Int (Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) Int Int (Array Int Int) (Array Int Int) Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Bool Bool Bool Bool Bool Int Int (Array Int Int) (Array Int Int)) Bool)
(assert (forall ((|A_25| Int) (|B_25| (Array Int Int)) (|C_25| (Array Int Int)) (|D_25| (Array Int Int)) (|E_25| (Array Int Int)) (|F_25| Int) (|G_25| Int) (|H_25| (Array Int Int)) (|I_25| (Array Int Int)) (|J_25| Int) (|K_25| Int) (|L_25| Int) (|M_25| Int) (|N_25| Int) (|O_25| Int) (|P_25| Int) (|Q_25| Int) (|R_25| Int) (|S_25| Int) (|T_25| Int) (|U_25| Int) (|V_25| Int) (|W_25| Int) (|X_25| Int) (|Y_25| Int) (|Z_25| Int) (|A1_25| Int) (|B1_25| Int) (|C1_25| Int) (|D1_25| Int) (|E1_25| Int) (|F1_25| Int) (|G1_25| Int) (|H1_25| Int) (|I1_25| Int) (|J1_25| Int) (|K1_25| Int) (|M1_15| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|O1_4| Int) (|N1_7| Int) (|M1_0| (Array Int Int)) (|N1_0| (Array Int Int)) (|.x.951| Int) (|.x.949| Int) (|.x.947| Int) (|.x.945| Int) (|.x.943| (Array Int Int)) (|.x.941| Int) (|.x.939| (Array Int Int)) (|.x.935| Int) (|.x.937| (Array Int Int)) (|.x.936| (Array Int Int)) (|L1_25| Bool) (|.x.954| Int) (|.x.955| Int) (|.x.959| Int) (|.x.967| Int) (|.loc.10| Bool) (|.loc.11| Bool) (|.x.962| Int) (|.x.953| Int) (|.x.970| Int) (|.loc.9| Bool) (|.x.957| Int) (|.x.956| Int) (|.loc.12| Bool) (|.x.960| Int) (|.x.938| (Array Int Int)) (|.x.961| Int) (|.x.965| Int) (|.x.966| Int) (|.x.971| Int) (|.x.963| Int) (|.x.952| Int) (|.x.964| Int) (|.x.968| Int) (|.x.969| Int) (|.x.958| Int) (|.x.942| (Array Int Int)) (|.x.940| Int) (|.x.944| Int) (|.x.946| Int) (|.x.948| Int) (|.x.950| Int) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| (Array Int Int)) (|.xtv.4| (Array Int Int))) (=> (and (and (and .loc.7 (and (not .loc.6) (not .loc.5))) (not .loc.8)) (and (and (and (and (and (and (and (and (= D_25 E_25) (not M1_15)) (= B_25 C_25)) (= H_25 I_25)) (= P_25 Q_25)) (= F_25 G_25)) (= J_25 K_25)) (= N_25 O_25)) (= L_25 M_25))) (state |A_25| |B_25| |C_25| |D_25| |E_25| |F_25| |G_25| |H_25| |I_25| |J_25| |K_25| |L_25| |M_25| |N_25| |O_25| |P_25| |Q_25| |R_25| |S_25| |T_25| |U_25| |V_25| |W_25| |X_25| |Y_25| |Z_25| |A1_25| |B1_25| |C1_25| |D1_25| |E1_25| |F1_25| |G1_25| |H1_25| |I1_25| |J1_25| |K1_25| |M1_15| |.loc.5| |.loc.6| |.loc.7| |.loc.8| |O1_4| |N1_7| |M1_0| |N1_0|))))
(assert (forall ((|A_25| Int) (|B_25| (Array Int Int)) (|C_25| (Array Int Int)) (|D_25| (Array Int Int)) (|E_25| (Array Int Int)) (|F_25| Int) (|G_25| Int) (|H_25| (Array Int Int)) (|I_25| (Array Int Int)) (|J_25| Int) (|K_25| Int) (|L_25| Int) (|M_25| Int) (|N_25| Int) (|O_25| Int) (|P_25| Int) (|Q_25| Int) (|R_25| Int) (|S_25| Int) (|T_25| Int) (|U_25| Int) (|V_25| Int) (|W_25| Int) (|X_25| Int) (|Y_25| Int) (|Z_25| Int) (|A1_25| Int) (|B1_25| Int) (|C1_25| Int) (|D1_25| Int) (|E1_25| Int) (|F1_25| Int) (|G1_25| Int) (|H1_25| Int) (|I1_25| Int) (|J1_25| Int) (|K1_25| Int) (|M1_15| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|O1_4| Int) (|N1_7| Int) (|M1_0| (Array Int Int)) (|N1_0| (Array Int Int)) (|.x.951| Int) (|.x.949| Int) (|.x.947| Int) (|.x.945| Int) (|.x.943| (Array Int Int)) (|.x.941| Int) (|.x.939| (Array Int Int)) (|.x.935| Int) (|.x.937| (Array Int Int)) (|.x.936| (Array Int Int)) (|L1_25| Bool) (|.x.954| Int) (|.x.955| Int) (|.x.959| Int) (|.x.967| Int) (|.loc.10| Bool) (|.loc.11| Bool) (|.x.962| Int) (|.x.953| Int) (|.x.970| Int) (|.loc.9| Bool) (|.x.957| Int) (|.x.956| Int) (|.loc.12| Bool) (|.x.960| Int) (|.x.938| (Array Int Int)) (|.x.961| Int) (|.x.965| Int) (|.x.966| Int) (|.x.971| Int) (|.x.963| Int) (|.x.952| Int) (|.x.964| Int) (|.x.968| Int) (|.x.969| Int) (|.x.958| Int) (|.x.942| (Array Int Int)) (|.x.940| Int) (|.x.944| Int) (|.x.946| Int) (|.x.948| Int) (|.x.950| Int) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| (Array Int Int)) (|.xtv.4| (Array Int Int))) (=> (and (state |A_25| |B_25| |C_25| |D_25| |E_25| |F_25| |G_25| |H_25| |I_25| |J_25| |K_25| |L_25| |M_25| |N_25| |O_25| |P_25| |Q_25| |R_25| |S_25| |T_25| |U_25| |V_25| |W_25| |X_25| |Y_25| |Z_25| |A1_25| |B1_25| |C1_25| |D1_25| |E1_25| |F1_25| |G1_25| |H1_25| |I1_25| |J1_25| |K1_25| |M1_15| |.loc.5| |.loc.6| |.loc.7| |.loc.8| |O1_4| |N1_7| |M1_0| |N1_0|) (let ((.def_56 (not .loc.6))) (let ((.def_57 (not .loc.5))) (let ((.def_60 (not .loc.8))) (let ((.def_107 (= B_25 .x.936))) (let ((.def_111 (= T_25 .x.954))) (let ((.def_114 (= U_25 .x.955))) (let ((.def_117 (= Y_25 .x.959))) (let ((.def_121 (not .loc.7))) (let ((.def_133 (= M1_15 L1_25))) (let ((.def_138 (not .loc.10))) (let ((.def_142 (= S_25 0))) (let ((.def_146 (and .def_117 (and .def_114 (and .def_107 .def_111))))) (let ((.def_152 (not .loc.11))) (let ((.def_157 (= B1_25 .x.962))) (let ((.def_159 (= S_25 .x.953))) (let ((.def_162 (= J1_25 .x.970))) (let ((.def_170 (select D_25 Y_25))) (let ((.def_175 (<= 5 V_25))) (let ((.def_191 (not .loc.9))) (let ((.def_196 (= W_25 .x.957))) (let ((.def_198 (= V_25 .x.956))) (let ((.def_209 (and .def_114 (and .def_111 (and .def_107 .def_159))))) (let ((.def_238 (and M1_15 .def_107))) (let ((.def_247 (and .loc.5 (and .def_162 (and .def_157 (and .def_117 (and .def_196 (and .def_198 (and .def_114 (and .def_111 (and .def_159 .def_238))))))))))) (let ((.def_261 (and .def_162 (and .def_157 (and .def_117 (and .def_196 (and .def_198 .def_209))))))) (let ((.def_262 (and .loc.5 .def_261))) (let ((.def_280 (<= L_25 Z_25))) (let ((.def_282 (and .loc.6 .def_262))) (let ((.def_303 (not .loc.12))) (let ((.def_308 (= Z_25 .x.960))) (let ((.def_310 (= D_25 .x.938))) (let ((.def_313 (= A1_25 .x.961))) (let ((.def_316 (= E1_25 .x.965))) (let ((.def_319 (= F1_25 .x.966))) (let ((.def_322 (= K1_25 .x.971))) (let ((.def_327 (select D_25 N_25))) (let ((.def_332 (select .def_327 (+ J_25 (* 4 D1_25))))) (let ((.def_353 (and .def_238 .def_310))) (let ((.def_378 (= C1_25 .x.963))) (let ((.def_380 (= R_25 .x.952))) (let ((.def_383 (= D1_25 .x.964))) (let ((.def_386 (= H1_25 .x.968))) (let ((.def_389 (= I1_25 .x.969))) (let ((.def_394 (and .def_107 .def_310))) (let ((.def_399 (and .def_196 (and .def_198 (and .def_114 (and .def_111 (and .def_159 .def_394))))))) (let ((.def_419 (and .def_196 (and .def_198 (and .def_114 (and .def_111 (and .def_159 (and .def_353 .def_380)))))))) (let ((.def_442 (<= 0 V_25))) (let ((.def_450 (and .def_196 (and .def_198 (and .def_114 (and .def_111 (and .def_159 (and .def_380 .def_394)))))))) (let ((.def_475 (= X_25 .x.958))) (let ((.def_536 (<= L_25 R_25))) (let ((.def_590 (= H_25 .x.942))) (let ((.def_592 (= F_25 .x.940))) (let ((.def_595 (= J_25 .x.944))) (let ((.def_598 (= L_25 .x.946))) (let ((.def_601 (= N_25 .x.948))) (let ((.def_604 (= P_25 .x.950))) (let ((.def_606 (= G1_25 .x.967))) (let ((.def_610 (= .x.948 0))) (let ((.def_614 (select D_25 .x.948))) (let ((.def_717 (and .def_604 (and .def_601 (and .def_598 (and .def_595 (and .def_590 (and .def_394 .def_592)))))))) (let ((.def_747 (<= N1_7 O1_4))) (let ((.def_763 (and .def_378 (and .def_157 (and .def_313 (and .def_308 (and .def_117 (and .def_475 (and .def_196 (and .def_198 (and .def_114 (and .def_111 (and .def_159 (and .def_380 .def_717)))))))))))))) (let ((.def_787 (or M1_15 (and (and (= N1_7 .def_332) (not .def_536)) (= O1_4 (select .def_327 (+ J_25 (* 4 R_25)))))))) (and (and (= Q_25 .x.951) (and (= O_25 .x.949) (and (= M_25 .x.947) (and (= K_25 .x.945) (and (= I_25 .x.943) (and (= G_25 .x.941) (and (= E_25 .x.939) (and (= A_25 .x.935) (= C_25 .x.937))))))))) (or (or (or (or (and (or (or (or (or (and (or (or (or (and (or (or (and (or (and (or (or (or (or (or (or (and (or (and (or (and (or (and (and .loc.6 (and .loc.5 (and (and (and (and .def_107 L1_25) .def_111) .def_114) .def_117))) .def_121) (and (or M1_15 (= .x.936 (store B_25 Y_25 0))) (and (and (or L1_25 (= .x.955 .x.967)) (and .def_57 (and .loc.7 .def_56))) .def_133))) (and .def_138 .loc.11)) (and (or M1_15 .def_142) (and (and .def_133 (and .def_57 (and .loc.10 (and .def_121 (and .loc.6 .def_146))))) .def_152))) (and (and (and .def_157 .def_159) .def_162) .loc.9)) (and (or M1_15 (and (= .x.962 (select .def_170 (+ T_25 (* 4 V_25)))) (and (= .x.953 .x.970) (and (not .def_175) (= .x.970 (ite (= V_25 .x.962) 1 0)))))) (and (and .def_152 (and .def_133 (and .def_56 (and .loc.10 (and .def_121 (and .loc.5 .def_146)))))) .def_191))) (and .loc.8 (and .def_196 .def_198))) (and (or L1_25 (= (+ V_25 (* (- 1) .x.956)) (- 1))) (and .def_60 (and .def_152 (and .def_133 (and .def_57 (and .def_56 (and .def_138 (and .loc.9 (and .def_121 (and .def_162 (and .def_117 .def_209)))))))))))) (and (or M1_15 (= .x.956 0)) (and .def_152 (and .def_133 (and .def_57 (and .def_56 (and .def_138 (and .loc.9 (and .def_121 (and .loc.8 (and .def_162 (and .def_157 (and .def_117 (and .def_196 .def_209)))))))))))))) (and .def_191 (and .def_133 (and .def_56 (and .def_138 (and .loc.11 (and .def_121 (and .loc.8 .def_247)))))))) (and (or M1_15 .def_175) (and .def_191 (and .def_133 (and .def_56 (and .def_138 (and .loc.11 (and .def_121 (and .loc.8 .def_262))))))))) (and .def_60 (and .def_191 (and .def_152 (and .def_133 (and .def_138 (and .loc.7 (and .loc.6 .def_247)))))))) (and (or M1_15 .def_280) (and .def_60 (and .def_191 (and .def_152 (and .def_133 (and .def_138 (and .loc.7 .def_282)))))))) .loc.12) (and (or M1_15 (not .def_142)) (and (and .def_191 (and .def_152 (and .def_133 (and .def_57 (and .def_138 (and .def_121 (and .loc.8 (and .loc.6 .def_261)))))))) .def_303))) (and (and (and (and (and .def_308 .def_310) .def_313) .def_316) .def_319) .def_322)) (and (or M1_15 (and (= .x.961 (select .def_327 (+ J_25 (* 4 Z_25)))) (= .x.938 (store D_25 N_25 (store (store .def_327 (+ J_25 (* 4 Z_25)) .def_332) (+ J_25 (* 4 D1_25)) .x.961))))) (and (or L1_25 (= (+ Z_25 (* (- 1) .x.960)) (- 1))) (and .def_303 (and .def_60 (and .def_133 (and .loc.11 (and .loc.10 (and .loc.9 (and .def_121 .def_282)))))))))) (and .def_303 (and .def_191 (and .def_152 (and .def_133 (and .def_138 (and .def_121 (and .loc.8 (and .loc.6 (and .loc.5 (and .def_322 (and .def_162 (and .def_319 (and .def_316 (and .def_157 (and .def_313 (and .def_308 (and .def_117 (and .def_196 (and .def_198 (and .def_114 (and .def_111 (and .def_159 .def_353))))))))))))))))))))))) (and (and (and (and .def_378 .def_380) .def_383) .def_386) .def_389)) (and (or M1_15 (= .x.960 0)) (and .def_303 (and .def_60 (and .def_133 (and .def_57 (and .loc.11 (and .loc.10 (and .loc.9 (and .loc.7 (and .loc.6 (and .def_162 (and .def_157 (and .def_117 .def_399)))))))))))))) (and .def_303 (and .def_60 (and .def_191 (and .def_133 (and .def_56 (and .loc.11 (and .loc.10 (and .loc.7 (and .loc.5 (and .def_322 (and .def_162 (and .def_389 (and .def_386 (and .def_319 (and .def_316 (and .def_383 (and .def_378 (and .def_157 (and .def_313 (and .def_308 (and .def_117 .def_419)))))))))))))))))))))) (and (or M1_15 (not .def_442)) (and .def_303 (and .def_60 (and .def_191 (and .def_133 (and .def_56 (and .loc.11 (and .loc.10 (and .loc.7 (and .loc.5 (and .def_322 (and .def_162 (and .def_389 (and .def_386 (and .def_319 (and .def_316 (and .def_383 (and .def_378 (and .def_157 (and .def_313 (and .def_308 (and .def_117 .def_450))))))))))))))))))))))) .def_475) (and (or M1_15 (and .def_442 (= .x.938 (store D_25 Y_25 (store .def_170 (+ T_25 (* 4 V_25)) V_25))))) (and (or L1_25 (= (+ V_25 (* (- 1) .x.956)) 1)) (and .def_303 (and .def_60 (and .def_133 (and .def_56 (and .def_138 (and .loc.11 (and .loc.9 (and .loc.7 (and .loc.5 (and .def_322 (and .def_162 (and .def_389 (and .def_386 (and .def_319 (and .def_316 (and .def_383 (and .def_378 (and .def_157 (and .def_313 (and .def_308 (and .def_117 (and .def_196 (and .def_114 (and .def_111 (and .def_159 (and .def_107 .def_380))))))))))))))))))))))))))))) (and .def_303 (and .def_60 (and .def_152 (and .def_133 (and .def_57 (and .loc.10 (and .loc.9 (and .def_121 (and .loc.6 (and .def_322 (and .def_162 (and .def_389 (and .def_386 (and .def_319 (and .def_316 (and .def_383 (and .def_378 (and .def_157 (and .def_313 (and .def_308 (and .def_117 (and .def_419 .def_475))))))))))))))))))))))) (and (or M1_15 .def_536) (and .def_303 (and .def_60 (and .def_152 (and .def_133 (and .def_57 (and .loc.10 (and .loc.9 (and .def_121 (and .loc.6 (and .def_322 (and .def_162 (and .def_389 (and .def_386 (and .def_319 (and .def_316 (and .def_383 (and .def_378 (and .def_157 (and .def_313 (and .def_308 (and .def_117 (and .def_450 .def_475)))))))))))))))))))))))) (and (or M1_15 (= (+ R_25 (* (- 1) .x.952)) (- 1))) (and .def_303 (and .def_60 (and .def_191 (and .def_152 (and .def_133 (and .def_56 (and .loc.10 (and .def_121 (and .loc.5 (and .def_322 (and .def_162 (and .def_389 (and .def_386 (and .def_319 (and .def_316 (and .def_383 (and .def_157 (and .def_313 (and .def_308 (and .def_117 (and .def_399 .def_475))))))))))))))))))))))) (and (and (and (and (and (and .def_590 .def_592) .def_595) .def_598) .def_601) .def_604) .def_606)) (and (or M1_15 (and (= (ite .def_610 0 (select B_25 .x.948)) 0) (and (= (select .def_614 (+ .x.944 4)) 0) (and (= (select .def_614 .x.944) 0) (and (= (select .def_614 (+ .x.944 16)) 0) (and (= (select .def_614 (+ .x.944 8)) 0) (and (= (select .def_614 (+ .x.944 12)) 0) (and (= .x.944 0) (and (= .x.946 5) (and (= .x.950 0) (and (not .def_610) (and (= .x.940 0) (and (= M1_0 (store (store B_25 0 0) .x.948 1)) (and (not (<= A_25 .x.948)) (= N1_0 (store H_25 .x.948 20)))))))))))))))) (and (or L1_25 (and (and (and (and (and (and (not (<= .x.935 .x.959)) (= .x.942 (store N1_0 .x.959 20))) (= .x.936 (store M1_0 .x.959 1))) (not (= .x.959 0))) (= .x.956 4)) (= .x.954 0)) (= (select M1_0 .x.959) 0))) (and .def_303 (and .def_60 (and .def_133 (and .def_57 (and .def_56 (and .def_138 (and .loc.11 (and .loc.9 (and .loc.7 (and .def_322 (and .def_162 (and .def_389 (and .def_386 (and .def_319 (and .def_316 (and .def_383 (and .def_378 (and .def_313 (and .def_308 (and .def_114 (and .def_159 (and .def_310 .def_380))))))))))))))))))))))))) (and (or M1_15 (and (= Z_25 .x.964) (and (not .def_280) (= (+ Z_25 (* (- 1) .x.952)) (- 1))))) (and .def_303 (and .def_60 (and .def_191 (and .def_152 (and .def_133 (and .loc.10 (and .loc.7 (and .loc.6 (and .loc.5 (and .def_322 (and .def_162 (and .def_389 (and .def_386 (and .def_606 (and .def_319 (and .def_316 (and .def_378 (and .def_157 (and .def_313 (and .def_308 (and .def_117 (and .def_475 (and .def_196 (and .def_198 (and .def_114 (and .def_111 (and .def_159 .def_717))))))))))))))))))))))))))))) (and (and (or L1_25 (and (not .def_747) (= .x.952 .x.964))) (and .def_303 (and .def_60 (and .def_152 (and .def_133 (and .def_57 (and .def_138 (and .loc.9 (and .def_121 (and .loc.6 (and .def_322 (and .def_162 (and .def_606 (and .def_319 (and .def_316 .def_763))))))))))))))) .def_787)) (and (or L1_25 .def_747) (and .def_787 (and .def_303 (and .def_60 (and .def_152 (and .def_133 (and .def_57 (and .def_138 (and .loc.9 (and .def_121 (and .loc.6 (and .def_322 (and .def_162 (and .def_606 (and .def_319 (and .def_316 (and .def_383 .def_763))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) (state |.x.935| |.x.936| |.x.937| |.x.938| |.x.939| |.x.940| |.x.941| |.x.942| |.x.943| |.x.944| |.x.945| |.x.946| |.x.947| |.x.948| |.x.949| |.x.950| |.x.951| |.x.952| |.x.953| |.x.954| |.x.955| |.x.956| |.x.957| |.x.958| |.x.959| |.x.960| |.x.961| |.x.962| |.x.963| |.x.964| |.x.965| |.x.966| |.x.967| |.x.968| |.x.969| |.x.970| |.x.971| |L1_25| |.loc.9| |.loc.10| |.loc.11| |.loc.12| |.xtv.1| |.xtv.2| |.xtv.3| |.xtv.4|))))
(assert (forall ((|A_25| Int) (|B_25| (Array Int Int)) (|C_25| (Array Int Int)) (|D_25| (Array Int Int)) (|E_25| (Array Int Int)) (|F_25| Int) (|G_25| Int) (|H_25| (Array Int Int)) (|I_25| (Array Int Int)) (|J_25| Int) (|K_25| Int) (|L_25| Int) (|M_25| Int) (|N_25| Int) (|O_25| Int) (|P_25| Int) (|Q_25| Int) (|R_25| Int) (|S_25| Int) (|T_25| Int) (|U_25| Int) (|V_25| Int) (|W_25| Int) (|X_25| Int) (|Y_25| Int) (|Z_25| Int) (|A1_25| Int) (|B1_25| Int) (|C1_25| Int) (|D1_25| Int) (|E1_25| Int) (|F1_25| Int) (|G1_25| Int) (|H1_25| Int) (|I1_25| Int) (|J1_25| Int) (|K1_25| Int) (|M1_15| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|O1_4| Int) (|N1_7| Int) (|M1_0| (Array Int Int)) (|N1_0| (Array Int Int)) (|.x.951| Int) (|.x.949| Int) (|.x.947| Int) (|.x.945| Int) (|.x.943| (Array Int Int)) (|.x.941| Int) (|.x.939| (Array Int Int)) (|.x.935| Int) (|.x.937| (Array Int Int)) (|.x.936| (Array Int Int)) (|L1_25| Bool) (|.x.954| Int) (|.x.955| Int) (|.x.959| Int) (|.x.967| Int) (|.loc.10| Bool) (|.loc.11| Bool) (|.x.962| Int) (|.x.953| Int) (|.x.970| Int) (|.loc.9| Bool) (|.x.957| Int) (|.x.956| Int) (|.loc.12| Bool) (|.x.960| Int) (|.x.938| (Array Int Int)) (|.x.961| Int) (|.x.965| Int) (|.x.966| Int) (|.x.971| Int) (|.x.963| Int) (|.x.952| Int) (|.x.964| Int) (|.x.968| Int) (|.x.969| Int) (|.x.958| Int) (|.x.942| (Array Int Int)) (|.x.940| Int) (|.x.944| Int) (|.x.946| Int) (|.x.948| Int) (|.x.950| Int) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| (Array Int Int)) (|.xtv.4| (Array Int Int))) (=> (state |A_25| |B_25| |C_25| |D_25| |E_25| |F_25| |G_25| |H_25| |I_25| |J_25| |K_25| |L_25| |M_25| |N_25| |O_25| |P_25| |Q_25| |R_25| |S_25| |T_25| |U_25| |V_25| |W_25| |X_25| |Y_25| |Z_25| |A1_25| |B1_25| |C1_25| |D1_25| |E1_25| |F1_25| |G1_25| |H1_25| |I1_25| |J1_25| |K1_25| |M1_15| |.loc.5| |.loc.6| |.loc.7| |.loc.8| |O1_4| |N1_7| |M1_0| |N1_0|) (not (and M1_15 (and .loc.8 (and .loc.7 (and .loc.5 (not .loc.6)))))))))
(check-sat)