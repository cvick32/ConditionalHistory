(set-logic HORN)
(declare-fun state (Int (Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) Int Int (Array Int Int) (Array Int Int) Int Int (Array Int Int) (Array Int Int) Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Bool Bool Bool Bool Bool Int (Array Int Int)) Bool)
(assert (forall ((|A_12| Int) (|B_12| (Array Int Int)) (|C_12| (Array Int Int)) (|D_12| (Array Int Int)) (|E_12| (Array Int Int)) (|F_12| (Array Int Int)) (|G_12| (Array Int Int)) (|H_12| Int) (|I_12| Int) (|J_12| (Array Int Int)) (|K_12| (Array Int Int)) (|L_12| Int) (|M_12| Int) (|N_12| (Array Int Int)) (|O_12| (Array Int Int)) (|P_12| Int) (|Q_12| Int) (|R_12| Int) (|S_12| Int) (|T_12| Int) (|U_12| Int) (|V_12| Int) (|W_12| Int) (|X_12| Int) (|Y_12| Int) (|Z_12| Int) (|A2_9| Int) (|B1_12| Int) (|C1_12| Int) (|D1_12| Int) (|E1_12| Int) (|F1_12| Int) (|G1_12| Int) (|H1_12| Int) (|I1_12| Int) (|J1_12| Int) (|K1_12| Int) (|L1_12| Int) (|M1_12| Int) (|N1_12| Int) (|O1_12| Int) (|P1_12| Int) (|Q1_12| Int) (|R1_12| Int) (|S1_12| Int) (|T1_12| Int) (|U1_12| Int) (|V1_12| Int) (|W1_12| Int) (|X1_12| Int) (|Y1_12| Int) (|Z1_12| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|A2_26| Int) (|A2_0| (Array Int Int)) (|.x.845| Int) (|.x.823| Int) (|.x.817| (Array Int Int)) (|.x.815| Int) (|.x.813| (Array Int Int)) (|.x.811| Int) (|.x.809| (Array Int Int)) (|.x.807| (Array Int Int)) (|.x.803| Int) (|.x.805| (Array Int Int)) (|.x.829| Int) (|.x.854| Bool) (|.x.844| Int) (|.loc.10| Bool) (|.x.846| Int) (|.loc.9| Bool) (|.x.850| Int) (|.x.835| Int) (|.x.831| Int) (|.x.838| Int) (|.x.842| Int) (|.loc.11| Bool) (|.x.816| (Array Int Int)) (|.x.804| (Array Int Int)) (|.x.808| (Array Int Int)) (|.x.853| Int) (|.x.834| Int) (|.x.828| Int) (|.x.819| Int) (|.loc.12| Bool) (|.x.852| Int) (|.x.825| Int) (|.x.820| Int) (|.x.827| Int) (|.x.833| Int) (|.x.836| Int) (|.x.841| Int) (|.x.851| Int) (|.x.843| Int) (|.x.822| Int) (|.x.812| (Array Int Int)) (|.x.806| (Array Int Int)) (|.x.826| Int) (|.x.830| Int) (|.x.832| Int) (|.x.847| Int) (|.x.814| Int) (|.x.810| Int) (|.x.818| Int) (|.x.821| Int) (|.x.824| Int) (|.x.837| Int) (|.x.839| Int) (|.x.840| Int) (|.x.848| Int) (|.x.849| Int) (|.xtv.1| Int) (|.xtv.2| (Array Int Int))) (=> (and (and (and (and .loc.5 (not .loc.6)) (not .loc.7)) (not .loc.8)) (and (and (and (and (and (and (and (= N_12 O_12) (not Z1_12)) (= H_12 I_12)) (= L_12 M_12)) (= D_12 E_12)) (= J_12 K_12)) (= F_12 G_12)) (= B_12 C_12))) (state |A_12| |B_12| |C_12| |D_12| |E_12| |F_12| |G_12| |H_12| |I_12| |J_12| |K_12| |L_12| |M_12| |N_12| |O_12| |P_12| |Q_12| |R_12| |S_12| |T_12| |U_12| |V_12| |W_12| |X_12| |Y_12| |Z_12| |A2_9| |B1_12| |C1_12| |D1_12| |E1_12| |F1_12| |G1_12| |H1_12| |I1_12| |J1_12| |K1_12| |L1_12| |M1_12| |N1_12| |O1_12| |P1_12| |Q1_12| |R1_12| |S1_12| |T1_12| |U1_12| |V1_12| |W1_12| |X1_12| |Y1_12| |Z1_12| |.loc.5| |.loc.6| |.loc.7| |.loc.8| |A2_26| |A2_0|))))
(assert (forall ((|A_12| Int) (|B_12| (Array Int Int)) (|C_12| (Array Int Int)) (|D_12| (Array Int Int)) (|E_12| (Array Int Int)) (|F_12| (Array Int Int)) (|G_12| (Array Int Int)) (|H_12| Int) (|I_12| Int) (|J_12| (Array Int Int)) (|K_12| (Array Int Int)) (|L_12| Int) (|M_12| Int) (|N_12| (Array Int Int)) (|O_12| (Array Int Int)) (|P_12| Int) (|Q_12| Int) (|R_12| Int) (|S_12| Int) (|T_12| Int) (|U_12| Int) (|V_12| Int) (|W_12| Int) (|X_12| Int) (|Y_12| Int) (|Z_12| Int) (|A2_9| Int) (|B1_12| Int) (|C1_12| Int) (|D1_12| Int) (|E1_12| Int) (|F1_12| Int) (|G1_12| Int) (|H1_12| Int) (|I1_12| Int) (|J1_12| Int) (|K1_12| Int) (|L1_12| Int) (|M1_12| Int) (|N1_12| Int) (|O1_12| Int) (|P1_12| Int) (|Q1_12| Int) (|R1_12| Int) (|S1_12| Int) (|T1_12| Int) (|U1_12| Int) (|V1_12| Int) (|W1_12| Int) (|X1_12| Int) (|Y1_12| Int) (|Z1_12| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|A2_26| Int) (|A2_0| (Array Int Int)) (|.x.845| Int) (|.x.823| Int) (|.x.817| (Array Int Int)) (|.x.815| Int) (|.x.813| (Array Int Int)) (|.x.811| Int) (|.x.809| (Array Int Int)) (|.x.807| (Array Int Int)) (|.x.803| Int) (|.x.805| (Array Int Int)) (|.x.829| Int) (|.x.854| Bool) (|.x.844| Int) (|.loc.10| Bool) (|.x.846| Int) (|.loc.9| Bool) (|.x.850| Int) (|.x.835| Int) (|.x.831| Int) (|.x.838| Int) (|.x.842| Int) (|.loc.11| Bool) (|.x.816| (Array Int Int)) (|.x.804| (Array Int Int)) (|.x.808| (Array Int Int)) (|.x.853| Int) (|.x.834| Int) (|.x.828| Int) (|.x.819| Int) (|.loc.12| Bool) (|.x.852| Int) (|.x.825| Int) (|.x.820| Int) (|.x.827| Int) (|.x.833| Int) (|.x.836| Int) (|.x.841| Int) (|.x.851| Int) (|.x.843| Int) (|.x.822| Int) (|.x.812| (Array Int Int)) (|.x.806| (Array Int Int)) (|.x.826| Int) (|.x.830| Int) (|.x.832| Int) (|.x.847| Int) (|.x.814| Int) (|.x.810| Int) (|.x.818| Int) (|.x.821| Int) (|.x.824| Int) (|.x.837| Int) (|.x.839| Int) (|.x.840| Int) (|.x.848| Int) (|.x.849| Int) (|.xtv.1| Int) (|.xtv.2| (Array Int Int))) (=> (and (state |A_12| |B_12| |C_12| |D_12| |E_12| |F_12| |G_12| |H_12| |I_12| |J_12| |K_12| |L_12| |M_12| |N_12| |O_12| |P_12| |Q_12| |R_12| |S_12| |T_12| |U_12| |V_12| |W_12| |X_12| |Y_12| |Z_12| |A2_9| |B1_12| |C1_12| |D1_12| |E1_12| |F1_12| |G1_12| |H1_12| |I1_12| |J1_12| |K1_12| |L1_12| |M1_12| |N1_12| |O1_12| |P1_12| |Q1_12| |R1_12| |S1_12| |T1_12| |U1_12| |V1_12| |W1_12| |X1_12| |Y1_12| |Z1_12| |.loc.5| |.loc.6| |.loc.7| |.loc.8| |A2_26| |A2_0|) (let ((.def_68 (not .loc.6))) (let ((.def_70 (not .loc.7))) (let ((.def_72 (not .loc.8))) (let ((.def_123 (= Z1_12 .x.854))) (let ((.def_126 (not .loc.5))) (let ((.def_128 (= A2_9 .x.829))) (let ((.def_132 (= P1_12 .x.844))) (let ((.def_139 (= A2_26 2))) (let ((.def_145 (not .loc.10))) (let ((.def_149 (select F_12 J1_12))) (let ((.def_150 (select .def_149 N1_12))) (let ((.def_153 (= N1_12 0))) (let ((.def_155 (= J1_12 0))) (let ((.def_159 (or Z1_12 (and (= A2_26 .def_150) (or (not .def_153) (not .def_155)))))) (let ((.def_163 (= R1_12 .x.846))) (let ((.def_166 (= A2_26 1))) (let ((.def_179 (not .loc.9))) (let ((.def_181 (= V1_12 .x.850))) (let ((.def_194 (= .x.850 0))) (let ((.def_207 (= G1_12 .x.835))) (let ((.def_209 (= C1_12 .x.831))) (let ((.def_212 (= J1_12 .x.838))) (let ((.def_215 (= N1_12 .x.842))) (let ((.def_216 (and (and (and .def_207 .def_209) .def_212) .def_215))) (let ((.def_221 (+ N1_12 4))) (let ((.def_223 (select .x.816 J1_12))) (let ((.def_225 (= .x.842 (select .def_223 .def_221)))) (let ((.def_228 (select .x.804 J1_12))) (let ((.def_230 (= .x.838 (select .def_228 .def_221)))) (let ((.def_242 (not .loc.11))) (let ((.def_246 (= N_12 .x.816))) (let ((.def_247 (= B_12 .x.804))) (let ((.def_249 (= F_12 .x.808))) (let ((.def_251 (and .def_246 (and .def_247 .def_249)))) (let ((.def_253 (= Y1_12 .x.853))) (let ((.def_258 (= A2_26 3))) (let ((.def_274 (select B_12 J1_12))) (let ((.def_279 (select N_12 J1_12))) (let ((.def_292 (or Z1_12 (and (= .x.804 (store B_12 J1_12 (store .def_274 N1_12 (select .def_228 N1_12)))) (and (= .x.816 (store N_12 J1_12 (store .def_279 N1_12 (select .def_223 N1_12)))) (and (= .x.808 (store F_12 J1_12 (store .def_149 N1_12 3))) (= A2_26 (select (select .x.808 L1_12) T1_12)))))))) (let ((.def_301 (and .def_132 (and .def_207 (and .def_209 .def_251))))) (let ((.def_317 (= F1_12 .x.834))) (let ((.def_319 (= Z_12 .x.828))) (let ((.def_341 (and .def_246 (and .def_249 (and Z1_12 .def_247))))) (let ((.def_372 (and .def_123 (and .def_253 (and .def_181 (and .def_163 (and .def_132 (and .def_215 (and .def_212 (and .def_207 (and .def_317 (and .def_209 (and .def_251 .def_319))))))))))))) (let ((.def_382 (or Z1_12 (and .def_153 .def_155)))) (let ((.def_386 (= Q_12 .x.819))) (let ((.def_390 (= Q_12 0))) (let ((.def_400 (not .loc.12))) (let ((.def_412 (and .def_207 (and .def_317 (and .def_209 (and .def_319 (and .def_251 .def_386))))))) (let ((.def_430 (= X1_12 .x.852))) (let ((.def_432 (= X1_12 3))) (let ((.def_438 (and .def_181 (and .def_163 (and .def_132 (and .def_215 (and .def_212 .def_412))))))) (let ((.def_440 (and .def_123 (and .def_253 .def_438)))) (let ((.def_464 (and .def_123 (and .def_253 (and .def_430 (and .def_181 (and .def_163 (and .def_132 (and .def_215 (and .def_212 (and .def_207 (and .def_317 (and .def_209 (and .def_319 (and .def_341 .def_386))))))))))))))) (let ((.def_477 (and .def_123 (and .def_253 (and .def_430 .def_438))))) (let ((.def_541 (= W_12 .x.825))) (let ((.def_543 (= R_12 .x.820))) (let ((.def_546 (= Y_12 .x.827))) (let ((.def_549 (= E1_12 .x.833))) (let ((.def_552 (= H1_12 .x.836))) (let ((.def_555 (= M1_12 .x.841))) (let ((.def_558 (= W1_12 .x.851))) (let ((.def_562 (= H1_12 0))) (let ((.def_565 (and (not .def_562) (= .x.836 0)))) (let ((.def_570 (select N_12 .x.825))) (let ((.def_571 (+ .x.841 4))) (let ((.def_576 (select B_12 .x.825))) (let ((.def_586 (= .x.808 (store F_12 .x.825 (store (select F_12 .x.825) .def_571 (select (select .x.808 .x.825) .def_571)))))) (let ((.def_619 (or Z1_12 (and (and (= J1_12 .x.825) (and (= .x.838 (select .def_274 .def_221)) (and (= .x.842 (select .def_279 .def_221)) (= N1_12 .x.841)))) (not .def_432))))) (let ((.def_623 (= O1_12 .x.843))) (let ((.def_625 (= T_12 .x.822))) (let ((.def_630 (= .x.836 1))) (let ((.def_668 (= J_12 .x.812))) (let ((.def_670 (= D_12 .x.806))) (let ((.def_673 (= X_12 .x.826))) (let ((.def_676 (= B1_12 .x.830))) (let ((.def_679 (= D1_12 .x.832))) (let ((.def_682 (= S1_12 .x.847))) (let ((.def_760 (= L_12 .x.814))) (let ((.def_762 (= H_12 .x.810))) (let ((.def_765 (= P_12 .x.818))) (let ((.def_768 (= S_12 .x.821))) (let ((.def_771 (= V_12 .x.824))) (let ((.def_774 (= I1_12 .x.837))) (let ((.def_777 (= K1_12 .x.839))) (let ((.def_780 (= L1_12 .x.840))) (let ((.def_783 (= T1_12 .x.848))) (let ((.def_786 (= U1_12 .x.849))) (let ((.def_824 (= .x.838 .x.840))) (let ((.def_825 (= .x.842 .x.848))) (let ((.def_859 (and .def_765 (and .def_760 (and .def_668 (and .def_670 .def_762)))))) (let ((.def_902 (= .x.816 (store N_12 .x.838 (store (select N_12 .x.838) .x.842 (select (select .x.816 .x.838) .x.842)))))) (let ((.def_909 (= .x.804 (store B_12 .x.838 (store (select B_12 .x.838) .x.842 (select (select .x.804 .x.838) .x.842)))))) (let ((.def_911 (select F_12 .x.838))) (let ((.def_956 (and .def_400 (and .def_72 (and .def_242 (and .def_70 (and .def_145 (and .def_128 (and .def_179 (and .loc.6 (and .loc.5 (and .def_123 (and .def_253 (and .def_430 (and .def_558 (and .def_181 (and .def_786 (and .def_783 (and .def_682 (and .def_163 (and .def_132 (and .def_623 (and .def_215 (and .def_555 (and .def_780 (and .def_777 (and .def_212 (and .def_774 (and .def_207 (and .def_317 (and .def_549 (and .def_679 (and .def_209 (and .def_676 (and .def_319 (and .def_546 (and .def_673 (and .def_541 (and .def_771 (and .def_625 (and .def_768 (and .def_543 .def_859)))))))))))))))))))))))))))))))))))))))))) (let ((.def_959 (or Z1_12 (not .def_390)))) (and (and (= Q1_12 .x.845) (and (= U_12 .x.823) (and (= O_12 .x.817) (and (= M_12 .x.815) (and (= K_12 .x.813) (and (= I_12 .x.811) (and (= G_12 .x.809) (and (= E_12 .x.807) (and (= A_12 .x.803) (= C_12 .x.805)))))))))) (or (or (or (or (and (or (and (or (and (or (and (or (or (or (or (or (or (or (and (or (or (and (or (or (or (and (or (or (and (or (and (or (or (and (or (and (or (and (or (and .loc.5 (and (or Z1_12 (= V1_12 .x.829)) .def_123)) (and (and .x.854 .def_126) .def_128)) (and (and .def_68 (and .loc.7 .def_132)) .loc.10)) (and (and (or .x.854 (not .def_139)) (and .def_70 (and (and .def_128 (and .def_126 (and .loc.6 .def_123))) .def_145))) .def_159)) .def_163) (and (or .x.854 (not .def_166)) (and .def_159 (and .def_70 (and .def_145 (and .def_128 (and .def_126 (and .def_68 (and .def_123 .def_132))))))))) (and .def_179 .def_181)) (and .def_145 (and .def_128 (and .def_126 (and .loc.9 (and .def_68 (and .loc.7 (and .def_123 (and .def_163 (and Z1_12 .def_132)))))))))) (and (or Z1_12 .def_194) (and .def_70 (and .def_145 (and .def_128 (and .loc.9 (and .loc.6 (and .loc.5 (and .def_123 (and .def_132 .def_163)))))))))) (and .def_216 .loc.11)) (and (or .x.854 (and (and .def_139 .def_225) .def_230)) (and (and .def_159 (and .def_70 (and .def_128 (and .def_126 (and .def_179 (and .loc.10 (and .loc.6 (and .def_123 (and .def_163 .def_181))))))))) .def_242))) (and .loc.8 (and .def_251 .def_253))) (and (and (or .x.854 (and .def_194 .def_258)) (and .def_72 (and .def_145 (and .def_128 (and .def_126 (and .loc.11 (and .loc.9 (and .def_68 (and .loc.7 (and .def_123 (and .def_163 (and .def_132 .def_216)))))))))))) .def_292)) (and (or Z1_12 (and (= T_12 .x.842) (= O1_12 .x.838))) (and .def_242 (and .def_70 (and .def_128 (and .def_179 (and .loc.10 (and .def_68 (and .loc.8 (and .loc.5 (and .def_123 (and .def_253 (and .def_181 (and .def_163 .def_301)))))))))))))) (and .def_317 .def_319)) (and (or .x.854 (and .def_225 (and .def_166 .def_230))) (and .def_242 (and .def_159 (and .def_70 (and .def_145 (and .def_128 (and .def_126 (and .def_179 (and .def_68 (and .loc.8 (and .def_123 (and .def_253 (and .def_181 .def_301)))))))))))))) (and .def_242 (and .def_70 (and .def_128 (and .def_126 (and .loc.10 (and .loc.9 (and .loc.8 (and .loc.6 (and .def_123 (and .def_253 (and .def_181 (and .def_163 (and .def_132 (and .def_215 (and .def_212 (and .def_207 (and .def_317 (and .def_209 (and .def_319 .def_341)))))))))))))))))))) (and (and .def_242 (and .def_70 (and .def_128 (and .def_126 (and .loc.10 (and .loc.9 (and .loc.8 (and .loc.6 .def_372)))))))) .def_382)) (and .def_386 .loc.12)) (and (or Z1_12 .def_390) (and (and .def_72 (and .def_70 (and .def_145 (and .def_128 (and .def_179 (and .loc.11 (and .loc.6 (and .loc.5 .def_372)))))))) .def_400))) (and (or Z1_12 (and (= W1_12 .x.842) (= Y_12 .x.838))) (and .def_72 (and .def_242 (and .def_145 (and .def_128 (and .def_179 (and .loc.12 (and .loc.7 (and .loc.6 (and .loc.5 (and .def_123 (and .def_253 (and .def_181 (and .def_163 (and .def_132 .def_412)))))))))))))))) .def_430) (and (or Z1_12 .def_432) (and .def_400 (and .def_72 (and .def_128 (and .def_126 (and .loc.11 (and .loc.10 (and .loc.9 (and .loc.7 (and .loc.6 .def_440))))))))))) (and .def_242 (and .def_70 (and .def_145 (and .def_128 (and .def_126 (and .loc.12 (and .loc.9 (and .def_68 (and .loc.8 .def_464)))))))))) (and .def_382 (and .def_242 (and .def_70 (and .def_145 (and .def_128 (and .def_126 (and .loc.12 (and .loc.9 (and .def_68 (and .loc.8 .def_477))))))))))) (and .def_400 (and .def_72 (and .def_70 (and .def_145 (and .def_128 (and .def_126 (and .def_179 (and .loc.11 (and .loc.6 .def_464)))))))))) (and (or Z1_12 (and (<= Q_12 2147483647) (<= (- 2147483648) Q_12))) (and .def_400 (and .def_72 (and .def_242 (and .def_70 (and .def_128 (and .def_126 (and .loc.10 (and .loc.9 (and .loc.6 .def_477))))))))))) (and .def_400 (and .def_72 (and .def_128 (and .loc.11 (and .loc.10 (and .loc.9 (and .def_68 (and .loc.7 (and .loc.5 .def_464)))))))))) (and (or Z1_12 (= .def_150 .x.852)) (and .def_400 (and .def_72 (and .def_128 (and .def_179 (and .loc.11 (and .loc.10 (and .def_68 (and .loc.7 (and .loc.5 .def_440))))))))))) (and (and (and (and (and (and .def_541 .def_543) .def_546) .def_549) .def_552) .def_555) .def_558)) (and (and (or .x.854 (and (and (and (and (and (= .x.825 .x.827) .def_565) (= .x.841 .x.851)) (= .x.816 (store N_12 .x.825 (store .def_570 .def_571 W1_12)))) (= .x.804 (store B_12 .x.825 (store .def_576 .def_571 Y_12)))) .def_586)) (and .def_400 (and .def_72 (and .def_145 (and .def_128 (and .def_126 (and .loc.11 (and .loc.9 (and .loc.7 (and .loc.6 (and .def_123 (and .def_253 (and .def_181 (and .def_163 (and .def_132 (and .def_207 (and .def_317 (and .def_209 (and .def_319 .def_386))))))))))))))))))) .def_619)) (and .def_623 .def_625)) (and (or .x.854 (and .def_586 (and (and (and (and (and .def_562 (= .x.825 .x.843)) .def_630) (= .x.841 .x.822)) (= .x.804 (store B_12 .x.825 (store .def_576 .def_571 O1_12)))) (= .x.816 (store N_12 .x.825 (store .def_570 .def_571 T_12)))))) (and .def_619 (and .def_400 (and .def_72 (and .def_145 (and .def_128 (and .def_126 (and .loc.11 (and .loc.9 (and .loc.7 (and .loc.6 (and .def_123 (and .def_253 (and .def_558 (and .def_181 (and .def_163 (and .def_132 (and .def_207 (and .def_317 (and .def_209 (and .def_319 (and .def_386 .def_546))))))))))))))))))))))) (and (and (and (and (and .def_668 .def_670) .def_673) .def_676) .def_679) .def_682)) (and (or Z1_12 (and (= .x.806 (store D_12 .x.826 1)) (and (= .x.812 (store J_12 .x.826 8)) (and (= (select D_12 .x.826) 0) (and (not (= .x.826 0)) (and (= .x.847 0) (and (= .x.825 .x.826) (and (not (<= .x.826 A_12)) (= .x.841 .x.847))))))))) (and (or (or .x.854 (not (= .x.841 0))) (not (= .x.825 0))) (and (or .x.854 (and (and (and (and .def_225 .def_230) (= .x.816 (store N_12 J1_12 (store .def_279 .def_221 .x.841)))) (= .x.808 (store F_12 J1_12 (store .def_149 .def_221 (select (select .x.808 J1_12) .def_221))))) (= .x.804 (store B_12 J1_12 (store .def_274 .def_221 .x.825))))) (and .def_400 (and .def_72 (and .def_242 (and .def_70 (and .def_128 (and .def_126 (and .def_179 (and .loc.10 (and .def_68 (and .def_123 (and .def_253 (and .def_430 (and .def_558 (and .def_181 (and .def_163 (and .def_132 (and .def_623 (and .def_552 (and .def_207 (and .def_317 (and .def_549 (and .def_209 (and .def_319 (and .def_546 (and .def_625 (and .def_386 .def_543)))))))))))))))))))))))))))))) (and (and (and (and (and (and (and (and (and .def_760 .def_762) .def_765) .def_768) .def_771) .def_774) .def_777) .def_780) .def_783) .def_786)) (and (or Z1_12 (and (and (= .x.814 0) (= .x.810 0)) (= A2_0 (store D_12 0 0)))) (and (or .x.854 (and (and (and (and (and (and (and .def_630 (and (not (<= .x.824 .x.803)) (not (= .x.824 0)))) (= .x.839 .x.848)) (= .x.824 .x.840)) (= .x.839 0)) (= (select A2_0 .x.824) 0)) (= .x.812 (store J_12 .x.824 8))) (= .x.806 (store A2_0 .x.824 1)))) (and (or (or .x.854 (not (= .x.848 0))) (not (= .x.840 0))) (and (or .x.854 (and .def_824 .def_825)) (and .def_400 (and .def_72 (and .def_242 (and .def_70 (and .def_128 (and .def_179 (and .loc.10 (and .def_68 (and .loc.5 (and .def_123 .def_251))))))))))))))) (and (or .x.854 (and (and (and .def_630 (and .def_824 (and .def_825 (and (= .x.843 0) (and (= .x.822 0) (= .x.851 0)))))) (= .x.827 0)) (not .def_258))) (and .def_400 (and .def_292 (and .def_72 (and .def_145 (and .def_128 (and .def_126 (and .loc.11 (and .loc.9 (and .def_68 (and .loc.7 (and .def_123 (and .def_430 (and .def_181 (and .def_786 (and .def_783 (and .def_682 (and .def_163 (and .def_132 (and .def_555 (and .def_780 (and .def_777 (and .def_774 (and .def_207 (and .def_317 (and .def_549 (and .def_679 (and .def_209 (and .def_676 (and .def_319 (and .def_673 (and .def_541 (and .def_771 (and .def_768 (and .def_543 (and .def_386 .def_859))))))))))))))))))))))))))))))))))))) (and (and (or .x.854 (and (and (and .def_565 .def_902) .def_909) (= .x.808 (store F_12 .x.838 (store .def_911 .x.842 1))))) .def_956) .def_959)) (and (or .x.854 (and .def_909 (and .def_902 (and (and .def_562 .def_630) (= .x.808 (store F_12 .x.838 (store .def_911 .x.842 2))))))) (and .def_956 .def_959))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) (state |.x.803| |.x.804| |.x.805| |.x.806| |.x.807| |.x.808| |.x.809| |.x.810| |.x.811| |.x.812| |.x.813| |.x.814| |.x.815| |.x.816| |.x.817| |.x.818| |.x.819| |.x.820| |.x.821| |.x.822| |.x.823| |.x.824| |.x.825| |.x.826| |.x.827| |.x.828| |.x.829| |.x.830| |.x.831| |.x.832| |.x.833| |.x.834| |.x.835| |.x.836| |.x.837| |.x.838| |.x.839| |.x.840| |.x.841| |.x.842| |.x.843| |.x.844| |.x.845| |.x.846| |.x.847| |.x.848| |.x.849| |.x.850| |.x.851| |.x.852| |.x.853| |.x.854| |.loc.9| |.loc.10| |.loc.11| |.loc.12| |.xtv.1| |.xtv.2|))))
(assert (forall ((|A_12| Int) (|B_12| (Array Int Int)) (|C_12| (Array Int Int)) (|D_12| (Array Int Int)) (|E_12| (Array Int Int)) (|F_12| (Array Int Int)) (|G_12| (Array Int Int)) (|H_12| Int) (|I_12| Int) (|J_12| (Array Int Int)) (|K_12| (Array Int Int)) (|L_12| Int) (|M_12| Int) (|N_12| (Array Int Int)) (|O_12| (Array Int Int)) (|P_12| Int) (|Q_12| Int) (|R_12| Int) (|S_12| Int) (|T_12| Int) (|U_12| Int) (|V_12| Int) (|W_12| Int) (|X_12| Int) (|Y_12| Int) (|Z_12| Int) (|A2_9| Int) (|B1_12| Int) (|C1_12| Int) (|D1_12| Int) (|E1_12| Int) (|F1_12| Int) (|G1_12| Int) (|H1_12| Int) (|I1_12| Int) (|J1_12| Int) (|K1_12| Int) (|L1_12| Int) (|M1_12| Int) (|N1_12| Int) (|O1_12| Int) (|P1_12| Int) (|Q1_12| Int) (|R1_12| Int) (|S1_12| Int) (|T1_12| Int) (|U1_12| Int) (|V1_12| Int) (|W1_12| Int) (|X1_12| Int) (|Y1_12| Int) (|Z1_12| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|A2_26| Int) (|A2_0| (Array Int Int)) (|.x.845| Int) (|.x.823| Int) (|.x.817| (Array Int Int)) (|.x.815| Int) (|.x.813| (Array Int Int)) (|.x.811| Int) (|.x.809| (Array Int Int)) (|.x.807| (Array Int Int)) (|.x.803| Int) (|.x.805| (Array Int Int)) (|.x.829| Int) (|.x.854| Bool) (|.x.844| Int) (|.loc.10| Bool) (|.x.846| Int) (|.loc.9| Bool) (|.x.850| Int) (|.x.835| Int) (|.x.831| Int) (|.x.838| Int) (|.x.842| Int) (|.loc.11| Bool) (|.x.816| (Array Int Int)) (|.x.804| (Array Int Int)) (|.x.808| (Array Int Int)) (|.x.853| Int) (|.x.834| Int) (|.x.828| Int) (|.x.819| Int) (|.loc.12| Bool) (|.x.852| Int) (|.x.825| Int) (|.x.820| Int) (|.x.827| Int) (|.x.833| Int) (|.x.836| Int) (|.x.841| Int) (|.x.851| Int) (|.x.843| Int) (|.x.822| Int) (|.x.812| (Array Int Int)) (|.x.806| (Array Int Int)) (|.x.826| Int) (|.x.830| Int) (|.x.832| Int) (|.x.847| Int) (|.x.814| Int) (|.x.810| Int) (|.x.818| Int) (|.x.821| Int) (|.x.824| Int) (|.x.837| Int) (|.x.839| Int) (|.x.840| Int) (|.x.848| Int) (|.x.849| Int) (|.xtv.1| Int) (|.xtv.2| (Array Int Int))) (=> (state |A_12| |B_12| |C_12| |D_12| |E_12| |F_12| |G_12| |H_12| |I_12| |J_12| |K_12| |L_12| |M_12| |N_12| |O_12| |P_12| |Q_12| |R_12| |S_12| |T_12| |U_12| |V_12| |W_12| |X_12| |Y_12| |Z_12| |A2_9| |B1_12| |C1_12| |D1_12| |E1_12| |F1_12| |G1_12| |H1_12| |I1_12| |J1_12| |K1_12| |L1_12| |M1_12| |N1_12| |O1_12| |P1_12| |Q1_12| |R1_12| |S1_12| |T1_12| |U1_12| |V1_12| |W1_12| |X1_12| |Y1_12| |Z1_12| |.loc.5| |.loc.6| |.loc.7| |.loc.8| |A2_26| |A2_0|) (not (and Z1_12 (and .loc.8 (and .loc.7 (and .loc.6 (not .loc.5)))))))))
(check-sat)