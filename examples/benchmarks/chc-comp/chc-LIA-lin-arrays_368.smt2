(set-logic HORN)
(declare-fun state (Int (Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) Int Int (Array Int Int) (Array Int Int) Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Bool Bool Bool Bool Bool Int Int (Array Int Int)) Bool)
(assert (forall ((|A_13| Int) (|F1_7| (Array Int Int)) (|C_13| (Array Int Int)) (|D_13| (Array Int Int)) (|E_13| (Array Int Int)) (|F_13| Int) (|G_13| Int) (|H_13| (Array Int Int)) (|I_13| (Array Int Int)) (|J_13| Int) (|K_13| Int) (|G1_6| Int) (|M_13| Int) (|N_13| Int) (|O_13| Int) (|P_13| Int) (|Q_13| Int) (|R_13| Int) (|S_13| Int) (|T_13| Int) (|H1_2| Int) (|V_13| Int) (|I1_1| Int) (|X_13| Int) (|Y_13| Int) (|Z_13| Int) (|A1_13| Int) (|B1_13| Int) (|C1_13| Int) (|D1_13| Int) (|E1_13| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|J1_0| Int) (|K1_0| Int) (|F1_0| (Array Int Int)) (|.x.675| Int) (|.x.673| (Array Int Int)) (|.x.671| Int) (|.x.669| (Array Int Int)) (|.x.665| Int) (|.x.667| (Array Int Int)) (|.x.679| Int) (|.x.687| Int) (|.x.695| Bool) (|.x.666| (Array Int Int)) (|.x.677| Int) (|.x.684| Int) (|.x.692| Int) (|.x.693| Int) (|.x.685| Int) (|.x.676| Int) (|.x.689| Int) (|.x.682| Int) (|.loc.10| Bool) (|.loc.12| Bool) (|.loc.9| Bool) (|.x.683| Int) (|.x.680| Int) (|.loc.11| Bool) (|.x.678| Int) (|.x.672| (Array Int Int)) (|.x.670| Int) (|.x.674| Int) (|.x.681| Int) (|.x.686| Int) (|.x.688| Int) (|.x.690| Int) (|.x.691| Int) (|.x.694| Int) (|.x.668| (Array Int Int)) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| (Array Int Int))) (=> (and (and (and .loc.7 (and .loc.5 (not .loc.6))) (not .loc.8)) (and (and (and (and (and (= D_13 E_13) (not E1_13)) (= F_13 G_13)) (= J_13 K_13)) (= H_13 I_13)) (= F1_7 C_13))) (state |A_13| |F1_7| |C_13| |D_13| |E_13| |F_13| |G_13| |H_13| |I_13| |J_13| |K_13| |G1_6| |M_13| |N_13| |O_13| |P_13| |Q_13| |R_13| |S_13| |T_13| |H1_2| |V_13| |I1_1| |X_13| |Y_13| |Z_13| |A1_13| |B1_13| |C1_13| |D1_13| |E1_13| |.loc.5| |.loc.6| |.loc.7| |.loc.8| |J1_0| |K1_0| |F1_0|))))
(assert (forall ((|A_13| Int) (|F1_7| (Array Int Int)) (|C_13| (Array Int Int)) (|D_13| (Array Int Int)) (|E_13| (Array Int Int)) (|F_13| Int) (|G_13| Int) (|H_13| (Array Int Int)) (|I_13| (Array Int Int)) (|J_13| Int) (|K_13| Int) (|G1_6| Int) (|M_13| Int) (|N_13| Int) (|O_13| Int) (|P_13| Int) (|Q_13| Int) (|R_13| Int) (|S_13| Int) (|T_13| Int) (|H1_2| Int) (|V_13| Int) (|I1_1| Int) (|X_13| Int) (|Y_13| Int) (|Z_13| Int) (|A1_13| Int) (|B1_13| Int) (|C1_13| Int) (|D1_13| Int) (|E1_13| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|J1_0| Int) (|K1_0| Int) (|F1_0| (Array Int Int)) (|.x.675| Int) (|.x.673| (Array Int Int)) (|.x.671| Int) (|.x.669| (Array Int Int)) (|.x.665| Int) (|.x.667| (Array Int Int)) (|.x.679| Int) (|.x.687| Int) (|.x.695| Bool) (|.x.666| (Array Int Int)) (|.x.677| Int) (|.x.684| Int) (|.x.692| Int) (|.x.693| Int) (|.x.685| Int) (|.x.676| Int) (|.x.689| Int) (|.x.682| Int) (|.loc.10| Bool) (|.loc.12| Bool) (|.loc.9| Bool) (|.x.683| Int) (|.x.680| Int) (|.loc.11| Bool) (|.x.678| Int) (|.x.672| (Array Int Int)) (|.x.670| Int) (|.x.674| Int) (|.x.681| Int) (|.x.686| Int) (|.x.688| Int) (|.x.690| Int) (|.x.691| Int) (|.x.694| Int) (|.x.668| (Array Int Int)) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| (Array Int Int))) (=> (and (state |A_13| |F1_7| |C_13| |D_13| |E_13| |F_13| |G_13| |H_13| |I_13| |J_13| |K_13| |G1_6| |M_13| |N_13| |O_13| |P_13| |Q_13| |R_13| |S_13| |T_13| |H1_2| |V_13| |I1_1| |X_13| |Y_13| |Z_13| |A1_13| |B1_13| |C1_13| |D1_13| |E1_13| |.loc.5| |.loc.6| |.loc.7| |.loc.8| |J1_0| |K1_0| |F1_0|) (let ((.def_48 (not .loc.6))) (let ((.def_51 (not .loc.8))) (let ((.def_95 (= M_13 .x.677))) (let ((.def_98 (= T_13 .x.684))) (let ((.def_101 (= B1_13 .x.692))) (let ((.def_104 (= C1_13 .x.693))) (let ((.def_106 (= E1_13 .x.695))) (let ((.def_110 (= .x.677 0))) (let ((.def_114 (= I1_1 .x.687))) (let ((.def_117 (= H1_2 .x.685))) (let ((.def_119 (= O_13 .x.679))) (let ((.def_122 (= G1_6 .x.676))) (let ((.def_124 (= F1_7 .x.666))) (let ((.def_129 (select D_13 H1_2))) (let ((.def_142 (<= 100000 Y_13))) (let ((.def_148 (or E1_13 (and (= .x.684 (select .def_129 (+ G1_6 (* 4 Y_13)))) (and (= .x.677 .x.692) (and (= .x.692 (ite (<= .x.693 .x.684) 1 0)) (and (= .x.693 (select .def_129 (+ G1_6 (* 4 P_13)))) (not .def_142)))))))) (let ((.def_152 (= Y_13 .x.689))) (let ((.def_154 (= R_13 .x.682))) (let ((.def_162 (not .loc.9))) (let ((.def_171 (and .def_106 (and .def_95 .def_101)))) (let ((.def_179 (not .loc.12))) (let ((.def_181 (not .loc.10))) (let ((.def_183 (not .loc.5))) (let ((.def_187 (and E1_13 .def_95))) (let ((.def_205 (<= 100000 P_13))) (let ((.def_207 (and .def_95 .def_154))) (let ((.def_208 (and .def_98 .def_207))) (let ((.def_212 (and .def_106 (and .def_104 (and .def_101 (and .def_152 .def_208)))))) (let ((.def_246 (= S_13 .x.683))) (let ((.def_248 (= P_13 .x.680))) (let ((.def_269 (not .loc.7))) (let ((.def_299 (and .def_106 (and .def_104 (and .def_101 (and .def_152 (and .def_98 (and .def_246 (and .def_154 (and .def_187 .def_248)))))))))) (let ((.def_321 (and .def_106 (and .def_104 (and .def_101 (and .def_152 (and .def_98 (and .def_246 (and .def_154 (and .def_95 .def_248)))))))))) (let ((.def_322 (and .loc.5 .def_321))) (let ((.def_377 (not .loc.11))) (let ((.def_393 (= V_13 0))) (let ((.def_424 (<= 100000 N_13))) (let ((.def_442 (= N_13 .x.678))) (let ((.def_463 (= H_13 .x.672))) (let ((.def_465 (= F_13 .x.670))) (let ((.def_468 (= J_13 .x.674))) (let ((.def_469 (and (and .def_463 .def_465) .def_468))) (let ((.def_471 (= Q_13 .x.681))) (let ((.def_474 (= V_13 .x.686))) (let ((.def_477 (= X_13 .x.688))) (let ((.def_480 (= Z_13 .x.690))) (let ((.def_483 (= A1_13 .x.691))) (let ((.def_486 (= D1_13 .x.694))) (let ((.def_498 (= .x.686 1))) (let ((.def_534 (and .def_95 .def_469))) (let ((.def_564 (= D_13 .x.668))) (let ((.def_566 (<= K1_0 J1_0))) (let ((.def_570 (select D_13 .x.685))) (let ((.def_618 (or E1_13 (and (and (= K1_0 (select .def_129 (+ G1_6 (* 4 N_13)))) (not .def_424)) (= J1_0 (select .def_129 (+ (+ G1_6 (* 4 N_13)) (- 4)))))))) (and (and (= K_13 .x.675) (and (= I_13 .x.673) (and (= G_13 .x.671) (and (= E_13 .x.669) (and (= A_13 .x.665) (= C_13 .x.667)))))) (or (or (and (or (or (and (or (and (or (or (or (or (and (or (or (or (or (or (and (or (and (or (or (or (or (and (or (and .loc.8 (and (or (= .x.679 .x.687) .x.695) (and (and (and (and (and (or E1_13 (and (= (store F1_7 H1_2 0) .x.666) (= .x.687 0))) .def_95) .def_98) .def_101) .def_104) .def_106))) (and (and (and (and (and (and (and (or E1_13 .def_110) (and .def_51 .x.695)) .def_114) .def_117) .def_119) .def_122) .def_124) .def_148)) (and (and (and (and .loc.5 (and .def_152 .def_154)) .loc.10) .loc.12) .def_162)) (and (or .x.695 (= (+ Y_13 (* (- 1) .x.689)) (- 1))) (and (and (and (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .def_51 (and .loc.9 .def_171))))))) .def_179) .def_181) .def_183))) (and .def_183 (and .def_181 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .loc.12 (and .loc.9 (and .loc.8 (and .def_106 (and .def_104 (and .def_101 (and .def_152 (and .def_98 (and .def_154 .def_187))))))))))))))))) (and (or E1_13 .def_205) (and .def_183 (and .def_181 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .loc.12 (and .loc.9 (and .loc.8 .def_212)))))))))))) (and (or E1_13 (and (not .def_205) (= (+ P_13 (* (- 1) .x.689)) (- 1)))) (and .def_183 (and .def_181 (and .def_179 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .loc.9 (and .loc.8 (and .def_106 (and .def_104 (and .def_101 .def_208))))))))))))))) (and .def_48 (and .def_246 .def_248))) (and (or E1_13 (= (+ P_13 (* (- 1) .x.680)) (- 1))) (and .def_183 (and .def_181 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .def_51 (and .def_162 (and .loc.12 (and .loc.6 .def_212))))))))))))) .def_269) (and (or E1_13 (= .x.680 0)) (and .def_181 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .def_51 (and .def_162 (and .loc.12 (and .loc.7 (and .loc.6 (and .loc.5 (and .def_106 (and .def_104 (and .def_101 (and .def_98 (and .def_207 .def_246))))))))))))))))))) (and .def_179 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .def_51 (and .def_162 (and .loc.10 (and .def_269 (and .def_48 (and .loc.5 .def_299))))))))))))) (and (or E1_13 .def_142) (and .def_179 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .def_51 (and .def_162 (and .loc.10 (and .def_269 (and .def_48 .def_322))))))))))))) (and (or .x.695 (not .def_110)) (and .def_181 (and .def_179 (and .def_148 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .def_51 (and .def_162 (and .def_269 (and .def_48 (and .loc.5 (and .def_106 (and .def_152 (and .def_246 (and .def_154 .def_248))))))))))))))))))) (and .def_181 (and .def_179 (and .def_148 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .def_51 (and .def_162 (and .def_269 (and .def_48 (and .loc.5 (and .def_152 (and .def_246 (and .def_154 (and .def_248 (and E1_13 .x.695))))))))))))))))))) .def_377) (and .def_183 (and .def_179 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .def_51 (and .loc.11 (and .loc.10 (and .loc.9 (and .loc.7 (and .loc.6 .def_299)))))))))))))) (and (or E1_13 .def_393) (and .def_183 (and .def_179 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .def_51 (and .loc.11 (and .loc.10 (and .loc.9 (and .loc.7 (and .loc.6 .def_321))))))))))))))) (and .def_183 (and .def_179 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .def_51 (and .def_162 (and .loc.11 (and .loc.10 (and .def_48 (and .loc.7 .def_299)))))))))))))) (and (or E1_13 .def_424) (and .def_183 (and .def_179 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .def_51 (and .def_162 (and .loc.11 (and .loc.10 (and .def_48 (and .loc.7 .def_321))))))))))))))) .def_442) (and (or E1_13 (= (+ N_13 (* (- 1) .x.678)) (- 1))) (and .def_181 (and .def_179 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .def_51 (and .def_162 (and .loc.11 (and .def_269 (and .loc.6 .def_322)))))))))))))) (and (and (and (and (and (and .def_469 .def_471) .def_474) .def_477) .def_480) .def_483) .def_486)) (and (or E1_13 (and (and (= .x.674 0) (= .x.670 0)) (= F1_0 (store F1_7 0 0)))) (and (or .x.695 (and (and (and (and (and (and (not (<= .x.665 .x.685)) .def_498) (not (= .x.685 0))) (= .x.676 0)) (= (select F1_0 .x.685) 0)) (= .x.672 (store H_13 .x.685 400000))) (= .x.666 (store F1_0 .x.685 1)))) (and .def_179 (and .def_119 (and .def_51 (and .def_162 (and .loc.11 (and .loc.10 (and .def_48 (and .loc.7 (and .loc.5 .def_171)))))))))))) (and (or E1_13 (and (not .def_393) (and (= .x.686 0) (= .x.678 1)))) (and .def_183 (and .def_181 (and .def_179 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .def_51 (and .def_162 (and .loc.11 (and .loc.7 (and .loc.6 (and .def_106 (and .def_486 (and .def_104 (and .def_101 (and .def_483 (and .def_480 (and .def_152 (and .def_477 (and .def_98 (and .def_246 (and .def_154 (and .def_471 (and .def_248 .def_534)))))))))))))))))))))))))))) .def_564) (and (and (or .x.695 (and (and .def_498 (and (not .def_566) (= .x.681 (select .def_570 (+ .x.676 (* 4 .x.678)))))) (= .x.668 (store D_13 .x.685 (store (store .def_570 (+ .x.676 (* 4 .x.678)) (select .def_570 (+ (+ .x.676 (* 4 .x.678)) (- 4)))) (+ (+ .x.676 (* 4 .x.678)) (- 4)) .x.681))))) (and .def_183 (and .def_179 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .def_51 (and .def_377 (and .loc.10 (and .loc.9 (and .def_48 (and .loc.7 (and .def_106 (and .def_104 (and .def_101 (and .def_152 (and .def_98 (and .def_246 (and .def_154 (and .def_248 (and .def_442 .def_534))))))))))))))))))))))) .def_618)) (and (or .x.695 .def_566) (and .def_618 (and .def_183 (and .def_179 (and .def_124 (and .def_122 (and .def_119 (and .def_117 (and .def_114 (and .def_51 (and .def_377 (and .loc.10 (and .loc.9 (and .def_48 (and .loc.7 (and .def_106 (and .def_486 (and .def_104 (and .def_101 (and .def_152 (and .def_477 (and .def_474 (and .def_98 (and .def_246 (and .def_154 (and .def_471 (and .def_248 (and .def_442 (and .def_95 (and .def_468 (and .def_463 (and .def_465 .def_564))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) (state |.x.665| |.x.666| |.x.667| |.x.668| |.x.669| |.x.670| |.x.671| |.x.672| |.x.673| |.x.674| |.x.675| |.x.676| |.x.677| |.x.678| |.x.679| |.x.680| |.x.681| |.x.682| |.x.683| |.x.684| |.x.685| |.x.686| |.x.687| |.x.688| |.x.689| |.x.690| |.x.691| |.x.692| |.x.693| |.x.694| |.x.695| |.loc.9| |.loc.10| |.loc.11| |.loc.12| |.xtv.1| |.xtv.2| |.xtv.3|))))
(assert (forall ((|A_13| Int) (|F1_7| (Array Int Int)) (|C_13| (Array Int Int)) (|D_13| (Array Int Int)) (|E_13| (Array Int Int)) (|F_13| Int) (|G_13| Int) (|H_13| (Array Int Int)) (|I_13| (Array Int Int)) (|J_13| Int) (|K_13| Int) (|G1_6| Int) (|M_13| Int) (|N_13| Int) (|O_13| Int) (|P_13| Int) (|Q_13| Int) (|R_13| Int) (|S_13| Int) (|T_13| Int) (|H1_2| Int) (|V_13| Int) (|I1_1| Int) (|X_13| Int) (|Y_13| Int) (|Z_13| Int) (|A1_13| Int) (|B1_13| Int) (|C1_13| Int) (|D1_13| Int) (|E1_13| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|J1_0| Int) (|K1_0| Int) (|F1_0| (Array Int Int)) (|.x.675| Int) (|.x.673| (Array Int Int)) (|.x.671| Int) (|.x.669| (Array Int Int)) (|.x.665| Int) (|.x.667| (Array Int Int)) (|.x.679| Int) (|.x.687| Int) (|.x.695| Bool) (|.x.666| (Array Int Int)) (|.x.677| Int) (|.x.684| Int) (|.x.692| Int) (|.x.693| Int) (|.x.685| Int) (|.x.676| Int) (|.x.689| Int) (|.x.682| Int) (|.loc.10| Bool) (|.loc.12| Bool) (|.loc.9| Bool) (|.x.683| Int) (|.x.680| Int) (|.loc.11| Bool) (|.x.678| Int) (|.x.672| (Array Int Int)) (|.x.670| Int) (|.x.674| Int) (|.x.681| Int) (|.x.686| Int) (|.x.688| Int) (|.x.690| Int) (|.x.691| Int) (|.x.694| Int) (|.x.668| (Array Int Int)) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| (Array Int Int))) (=> (state |A_13| |F1_7| |C_13| |D_13| |E_13| |F_13| |G_13| |H_13| |I_13| |J_13| |K_13| |G1_6| |M_13| |N_13| |O_13| |P_13| |Q_13| |R_13| |S_13| |T_13| |H1_2| |V_13| |I1_1| |X_13| |Y_13| |Z_13| |A1_13| |B1_13| |C1_13| |D1_13| |E1_13| |.loc.5| |.loc.6| |.loc.7| |.loc.8| |J1_0| |K1_0| |F1_0|) (not (and E1_13 (and .loc.8 (and (not .loc.7) (and .loc.6 (not .loc.5)))))))))
(check-sat)
