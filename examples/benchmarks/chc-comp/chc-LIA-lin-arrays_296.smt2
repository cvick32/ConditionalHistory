(set-logic HORN)
(declare-fun state (Int (Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) Int Int (Array Int Int) (Array Int Int) Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Bool Bool Bool Bool Bool Bool (Array Int Int)) Bool)
(assert (forall ((|A_48| Int) (|B_48| (Array Int Int)) (|C_48| (Array Int Int)) (|D_48| (Array Int Int)) (|E_48| (Array Int Int)) (|F_48| Int) (|G_48| Int) (|H_48| (Array Int Int)) (|I_48| (Array Int Int)) (|J_48| Int) (|K_48| Int) (|L_48| Int) (|M_48| Int) (|N_48| Int) (|O_48| Int) (|P_48| Int) (|Q_48| Int) (|R_48| Int) (|S_48| Int) (|T_48| Int) (|U_48| Int) (|V_48| Int) (|W_48| Int) (|X_48| Int) (|Y_48| Int) (|Z_48| Int) (|A1_48| Int) (|B1_48| Int) (|C1_48| Int) (|D1_48| Int) (|E1_48| Int) (|F1_48| Int) (|G1_48| Int) (|H1_48| Int) (|I1_48| Int) (|J1_48| Int) (|K1_48| Int) (|L1_48| Int) (|M1_48| Int) (|N1_48| Int) (|O1_48| Int) (|P1_48| Int) (|Q1_48| Int) (|R1_48| Int) (|S1_48| Int) (|T1_48| Int) (|U1_48| Int) (|V1_48| Int) (|W1_48| Int) (|X1_48| Int) (|Y1_48| Int) (|Z1_48| Int) (|A2_48| Int) (|C2_28| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|.loc.9| Bool) (|.loc.10| Bool) (|C2_0| (Array Int Int)) (|.x.2550| Int) (|.x.2548| (Array Int Int)) (|.x.2546| Int) (|.x.2544| (Array Int Int)) (|.x.2540| Int) (|.x.2542| (Array Int Int)) (|.x.2541| (Array Int Int)) (|B2_48| Bool) (|.x.2552| Int) (|.x.2553| Int) (|.x.2556| Int) (|.x.2557| Int) (|.x.2562| Int) (|.x.2563| Int) (|.x.2564| Int) (|.x.2565| Int) (|.x.2566| Int) (|.x.2570| Int) (|.x.2573| Int) (|.x.2576| Int) (|.x.2579| Int) (|.x.2581| Int) (|.x.2584| Int) (|.x.2587| Int) (|.x.2588| Int) (|.x.2589| Int) (|.loc.12| Bool) (|.x.2567| Int) (|.x.2555| Int) (|.x.2569| Int) (|.x.2590| Int) (|.loc.13| Bool) (|.loc.11| Bool) (|.x.2582| Int) (|.x.2580| Int) (|.x.2568| Int) (|.x.2543| (Array Int Int)) (|.x.2577| Int) (|.x.2578| Int) (|.loc.15| Bool) (|.loc.14| Bool) (|.x.2575| Int) (|.x.2574| Int) (|.x.2572| Int) (|.x.2571| Int) (|.x.2586| Int) (|.x.2583| Int) (|.x.2585| Int) (|.x.2560| Int) (|.x.2591| Int) (|.x.2561| Int) (|.x.2592| Int) (|.x.2558| Int) (|.x.2559| Int) (|.x.2551| Int) (|.x.2554| Int) (|.x.2549| Int) (|.x.2545| Int) (|.x.2547| (Array Int Int)) (|.xtv.1| (Array Int Int))) (=> (and (and (and (and (and .loc.6 (not .loc.7)) (not .loc.8)) (not .loc.9)) (not .loc.10)) (and (and (and (and (and (= D_48 E_48) (not C2_28)) (= F_48 G_48)) (= J_48 K_48)) (= H_48 I_48)) (= B_48 C_48))) (state |A_48| |B_48| |C_48| |D_48| |E_48| |F_48| |G_48| |H_48| |I_48| |J_48| |K_48| |L_48| |M_48| |N_48| |O_48| |P_48| |Q_48| |R_48| |S_48| |T_48| |U_48| |V_48| |W_48| |X_48| |Y_48| |Z_48| |A1_48| |B1_48| |C1_48| |D1_48| |E1_48| |F1_48| |G1_48| |H1_48| |I1_48| |J1_48| |K1_48| |L1_48| |M1_48| |N1_48| |O1_48| |P1_48| |Q1_48| |R1_48| |S1_48| |T1_48| |U1_48| |V1_48| |W1_48| |X1_48| |Y1_48| |Z1_48| |A2_48| |C2_28| |.loc.6| |.loc.7| |.loc.8| |.loc.9| |.loc.10| |C2_0|))))
(assert (forall ((|A_48| Int) (|B_48| (Array Int Int)) (|C_48| (Array Int Int)) (|D_48| (Array Int Int)) (|E_48| (Array Int Int)) (|F_48| Int) (|G_48| Int) (|H_48| (Array Int Int)) (|I_48| (Array Int Int)) (|J_48| Int) (|K_48| Int) (|L_48| Int) (|M_48| Int) (|N_48| Int) (|O_48| Int) (|P_48| Int) (|Q_48| Int) (|R_48| Int) (|S_48| Int) (|T_48| Int) (|U_48| Int) (|V_48| Int) (|W_48| Int) (|X_48| Int) (|Y_48| Int) (|Z_48| Int) (|A1_48| Int) (|B1_48| Int) (|C1_48| Int) (|D1_48| Int) (|E1_48| Int) (|F1_48| Int) (|G1_48| Int) (|H1_48| Int) (|I1_48| Int) (|J1_48| Int) (|K1_48| Int) (|L1_48| Int) (|M1_48| Int) (|N1_48| Int) (|O1_48| Int) (|P1_48| Int) (|Q1_48| Int) (|R1_48| Int) (|S1_48| Int) (|T1_48| Int) (|U1_48| Int) (|V1_48| Int) (|W1_48| Int) (|X1_48| Int) (|Y1_48| Int) (|Z1_48| Int) (|A2_48| Int) (|C2_28| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|.loc.9| Bool) (|.loc.10| Bool) (|C2_0| (Array Int Int)) (|.x.2550| Int) (|.x.2548| (Array Int Int)) (|.x.2546| Int) (|.x.2544| (Array Int Int)) (|.x.2540| Int) (|.x.2542| (Array Int Int)) (|.x.2541| (Array Int Int)) (|B2_48| Bool) (|.x.2552| Int) (|.x.2553| Int) (|.x.2556| Int) (|.x.2557| Int) (|.x.2562| Int) (|.x.2563| Int) (|.x.2564| Int) (|.x.2565| Int) (|.x.2566| Int) (|.x.2570| Int) (|.x.2573| Int) (|.x.2576| Int) (|.x.2579| Int) (|.x.2581| Int) (|.x.2584| Int) (|.x.2587| Int) (|.x.2588| Int) (|.x.2589| Int) (|.loc.12| Bool) (|.x.2567| Int) (|.x.2555| Int) (|.x.2569| Int) (|.x.2590| Int) (|.loc.13| Bool) (|.loc.11| Bool) (|.x.2582| Int) (|.x.2580| Int) (|.x.2568| Int) (|.x.2543| (Array Int Int)) (|.x.2577| Int) (|.x.2578| Int) (|.loc.15| Bool) (|.loc.14| Bool) (|.x.2575| Int) (|.x.2574| Int) (|.x.2572| Int) (|.x.2571| Int) (|.x.2586| Int) (|.x.2583| Int) (|.x.2585| Int) (|.x.2560| Int) (|.x.2591| Int) (|.x.2561| Int) (|.x.2592| Int) (|.x.2558| Int) (|.x.2559| Int) (|.x.2551| Int) (|.x.2554| Int) (|.x.2549| Int) (|.x.2545| Int) (|.x.2547| (Array Int Int)) (|.xtv.1| (Array Int Int))) (=> (and (state |A_48| |B_48| |C_48| |D_48| |E_48| |F_48| |G_48| |H_48| |I_48| |J_48| |K_48| |L_48| |M_48| |N_48| |O_48| |P_48| |Q_48| |R_48| |S_48| |T_48| |U_48| |V_48| |W_48| |X_48| |Y_48| |Z_48| |A1_48| |B1_48| |C1_48| |D1_48| |E1_48| |F1_48| |G1_48| |H1_48| |I1_48| |J1_48| |K1_48| |L1_48| |M1_48| |N1_48| |O1_48| |P1_48| |Q1_48| |R1_48| |S1_48| |T1_48| |U1_48| |V1_48| |W1_48| |X1_48| |Y1_48| |Z1_48| |A2_48| |C2_28| |.loc.6| |.loc.7| |.loc.8| |.loc.9| |.loc.10| |C2_0|) (let ((.def_70 (not .loc.7))) (let ((.def_72 (not .loc.8))) (let ((.def_74 (not .loc.9))) (let ((.def_76 (not .loc.10))) (let ((.def_108 (= B_48 .x.2541))) (let ((.def_112 (= M_48 .x.2552))) (let ((.def_115 (= N_48 .x.2553))) (let ((.def_118 (= Q_48 .x.2556))) (let ((.def_121 (= R_48 .x.2557))) (let ((.def_124 (= W_48 .x.2562))) (let ((.def_127 (= X_48 .x.2563))) (let ((.def_130 (= Y_48 .x.2564))) (let ((.def_133 (= Z_48 .x.2565))) (let ((.def_136 (= A1_48 .x.2566))) (let ((.def_139 (= E1_48 .x.2570))) (let ((.def_142 (= H1_48 .x.2573))) (let ((.def_145 (= K1_48 .x.2576))) (let ((.def_148 (= N1_48 .x.2579))) (let ((.def_151 (= P1_48 .x.2581))) (let ((.def_154 (= S1_48 .x.2584))) (let ((.def_157 (= V1_48 .x.2587))) (let ((.def_160 (= W1_48 .x.2588))) (let ((.def_163 (= X1_48 .x.2589))) (let ((.def_165 (not .loc.6))) (let ((.def_183 (= C2_28 B2_48))) (let ((.def_191 (= P_48 0))) (let ((.def_194 (and .def_115 (and .def_108 .def_112)))) (let ((.def_210 (and .def_163 (and .def_160 (and .def_157 (and .def_154 (and .def_151 (and .def_148 (and .def_145 (and .def_142 (and .def_139 (and .def_136 (and .def_133 (and .def_130 (and .def_127 (and .def_124 (and .def_121 (and .def_118 .def_194)))))))))))))))))) (let ((.def_214 (not .loc.12))) (let ((.def_220 (= B1_48 .x.2567))) (let ((.def_222 (= P_48 .x.2555))) (let ((.def_225 (= D1_48 .x.2569))) (let ((.def_228 (= Y1_48 .x.2590))) (let ((.def_233 (not .loc.11))) (let ((.def_239 (select D_48 P1_48))) (let ((.def_244 (select D_48 W1_48))) (let ((.def_249 (<= 100000 Q1_48))) (let ((.def_266 (not .loc.13))) (let ((.def_271 (= Q1_48 .x.2582))) (let ((.def_273 (= O1_48 .x.2580))) (let ((.def_284 (and .def_121 (and .def_118 (and .def_194 .def_222))))) (let ((.def_289 (and .def_136 (and .def_133 (and .def_130 (and .def_127 (and .def_124 .def_284))))))) (let ((.def_312 (and .def_220 .def_289))) (let ((.def_319 (and .def_151 (and .def_273 (and .def_148 (and .def_145 (and .def_142 (and .def_139 (and .def_225 .def_312))))))))) (let ((.def_335 (and C2_28 .def_108))) (let ((.def_359 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_145 (and .def_142 (and .def_139 (and .def_225 (and .def_220 (and .def_136 (and .def_133 (and .def_130 (and .def_127 (and .def_124 (and .def_121 (and .def_118 (and .def_222 (and .def_115 (and .def_112 .def_335)))))))))))))))))))))))))) (let ((.def_375 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 (and .def_271 .def_319)))))))) (let ((.def_397 (and .def_70 (and .def_165 (and .loc.10 .def_375))))) (let ((.def_403 (<= 100000 L1_48))) (let ((.def_404 (or C2_28 .def_403))) (let ((.def_408 (= C1_48 .x.2568))) (let ((.def_410 (= D_48 .x.2543))) (let ((.def_413 (= L1_48 .x.2577))) (let ((.def_416 (= M1_48 .x.2578))) (let ((.def_419 (* 4 L1_48))) (let ((.def_421 (select D_48 E1_48))) (let ((.def_427 (not .def_403))) (let ((.def_438 (or B2_48 (= (+ L1_48 (* (- 1) .x.2577)) (- 1))))) (let ((.def_451 (and .def_121 (and .def_118 (and .def_222 (and .def_115 (and .def_112 (and .def_108 .def_410)))))))) (let ((.def_460 (and .def_139 (and .def_225 (and .def_408 (and .def_220 (and .def_136 (and .def_133 (and .def_130 (and .def_127 (and .def_124 .def_451))))))))))) (let ((.def_461 (and .def_142 .def_460))) (let ((.def_462 (and .def_145 .def_461))) (let ((.def_473 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_413 .def_462))))))))))))) (let ((.def_482 (not .loc.15))) (let ((.def_491 (and .def_121 (and .def_118 (and .def_222 (and .def_115 (and .def_112 (and .def_335 .def_410)))))))) (let ((.def_500 (and .def_139 (and .def_225 (and .def_408 (and .def_220 (and .def_136 (and .def_133 (and .def_130 (and .def_127 (and .def_124 .def_491))))))))))) (let ((.def_501 (and .def_142 .def_500))) (let ((.def_513 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_413 (and .def_145 .def_501)))))))))))))) (let ((.def_546 (or C2_28 (= .x.2577 0)))) (let ((.def_550 (not .loc.14))) (let ((.def_578 (= J1_48 .x.2575))) (let ((.def_580 (= I1_48 .x.2574))) (let ((.def_584 (select D_48 R_48))) (let ((.def_594 (and .def_139 (and .def_225 (and .def_312 .def_408))))) (let ((.def_595 (and .def_142 .def_594))) (let ((.def_623 (and .def_145 (and .def_578 (and .def_461 .def_580))))) (let ((.def_698 (= G1_48 .x.2572))) (let ((.def_700 (= F1_48 .x.2571))) (let ((.def_704 (select D_48 N1_48))) (let ((.def_743 (and .def_145 (and .def_578 (and .def_580 (and .def_142 (and .def_698 (and .def_460 .def_700)))))))) (let ((.def_748 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 .def_743))))))) (let ((.def_778 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_413 (and .def_145 (and .def_578 (and .def_580 (and .def_142 (and .def_698 (and .def_500 .def_700)))))))))))))) (let ((.def_801 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_413 .def_743)))))))) (let ((.def_821 (= U1_48 .x.2586))) (let ((.def_823 (= R1_48 .x.2583))) (let ((.def_827 (select D_48 A1_48))) (let ((.def_844 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_145 (and .def_578 (and .def_580 (and .def_142 (and .def_698 (and .def_594 .def_700))))))))))))) (let ((.def_924 (= T1_48 .x.2585))) (let ((.def_926 (= U_48 .x.2560))) (let ((.def_930 (select D_48 N_48))) (let ((.def_958 (and .def_451 .def_926))) (let ((.def_973 (and .def_145 (and .def_578 (and .def_580 (and .def_142 (and .def_698 (and .def_700 (and .def_139 (and .def_225 (and .def_408 (and .def_220 (and .def_136 (and .def_133 (and .def_130 (and .def_127 (and .def_124 .def_958))))))))))))))))) (let ((.def_1000 (and .def_491 .def_926))) (let ((.def_1070 (= Z1_48 .x.2591))) (let ((.def_1072 (= V_48 .x.2561))) (let ((.def_1076 (select D_48 Z_48))) (let ((.def_1083 (and .def_284 .def_926))) (let ((.def_1141 (and .def_145 (and .def_578 (and .def_580 (and .def_142 (and .def_698 (and .def_700 (and .def_139 (and .def_225 (and .def_408 (and .def_220 (and .def_136 (and .def_133 (and .def_130 (and .def_127 (and .def_124 (and .def_958 .def_1072)))))))))))))))))) (let ((.def_1241 (= A2_48 .x.2592))) (let ((.def_1243 (= S_48 .x.2558))) (let ((.def_1315 (and .def_145 (and .def_578 (and .def_580 (and .def_142 (and .def_698 (and .def_700 (and .def_139 (and .def_225 (and .def_408 (and .def_220 (and .def_136 (and .def_133 (and .def_130 (and .def_127 (and .def_124 (and .def_1072 (and .def_926 (and .def_451 .def_1243)))))))))))))))))))) (let ((.def_1390 (<= 100000 O_48))) (let ((.def_1582 (store C2_0 .x.2581 1))) (let ((.def_1586 (store .def_1582 .x.2565 1))) (let ((.def_1590 (store .def_1586 .x.2553 1))) (let ((.def_1591 (store .def_1590 .x.2566 1))) (let ((.def_1592 (store .def_1591 .x.2579 1))) (let ((.def_1596 (store .def_1592 .x.2557 1))) (let ((.def_1597 (store .def_1596 .x.2570 1))) (and (and (= K_48 .x.2550) (and (= I_48 .x.2548) (and (= G_48 .x.2546) (and (= E_48 .x.2544) (and (= A_48 .x.2540) (= C_48 .x.2542)))))) (or (and (or (and (or (or (or (or (and (or (or (or (or (and (or (or (or (or (and (or (or (or (or (and (or (or (or (or (and (or (or (or (or (and (or (or (and (or (and .def_74 (or (or (and (or (and (or (or (or (or (or (or (and (or (and (or (and (or (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and .def_108 B2_48) .def_112) .def_115) .def_118) .def_121) .def_124) .def_127) .def_130) .def_133) .def_136) .def_139) .def_142) .def_145) .def_148) .def_151) .def_154) .def_157) .def_160) .def_163) .def_165) (and (or C2_28 (and (= .x.2589 0) (= .x.2541 (store (store (store (store (store (store (store (store B_48 P1_48 0) Z_48 0) N_48 0) A1_48 0) N1_48 0) R_48 0) E1_48 0) W1_48 0)))) (and (and .loc.6 (or B2_48 (= .x.2563 .x.2589))) .def_183))) (and (and .loc.8 .def_70) .loc.12)) (and (or C2_28 .def_191) (and .def_72 (and (and .def_183 (and .loc.7 (and .loc.6 .def_210))) .def_214)))) (and (and (and (and (and .def_220 .def_222) .def_225) .def_228) .loc.13) .def_233)) (and (or C2_28 (and (= .x.2569 (select .def_239 (+ (* 4 Q1_48) S1_48))) (and (= .x.2567 (select .def_244 (+ W_48 (* 4 Q1_48)))) (and (= .x.2555 .x.2590) (and (not .def_249) (= .x.2590 (ite (= .x.2567 .x.2569) 1 0))))))) (and (and .def_72 (and .def_183 (and .loc.12 (and .loc.11 (and .def_165 (and .loc.7 .def_210)))))) .def_266))) (and .loc.10 (and .def_271 .def_273))) (and (or B2_48 (= (+ Q1_48 (* (- 1) .x.2582)) (- 1))) (and .def_76 (and .def_266 (and .def_72 (and .def_183 (and .def_233 (and .loc.12 (and .def_70 (and .def_165 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 (and .def_151 (and .def_148 (and .def_145 (and .def_142 (and .def_139 .def_289)))))))))))))))))))) (and (or C2_28 (= .x.2582 0)) (and .def_266 (and .def_72 (and .def_183 (and .def_233 (and .loc.12 (and .def_70 (and .loc.10 (and .loc.6 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 .def_319))))))))))))))) (and .def_72 (and .def_214 (and .def_183 (and .loc.13 (and .loc.11 (and .def_165 (and .loc.10 (and .loc.7 .def_359))))))))) (and (or C2_28 .def_249) (and .def_72 (and .def_214 (and .def_183 (and .loc.13 (and .loc.11 (and .def_165 (and .loc.10 (and .loc.7 .def_375)))))))))) (and .def_266 (and .def_72 (and .def_214 (and .def_183 (and .loc.11 (and .def_70 (and .def_165 (and .loc.10 .def_359))))))))) (and (and .def_266 (and .def_72 (and .def_214 (and .def_183 (and .loc.11 .def_397))))) .def_404)) (and (and (and .def_408 .def_410) .def_413) .def_416)) (and (or C2_28 (and (= .x.2543 (store D_48 W1_48 (store .def_244 (+ W_48 .def_419) (select .def_421 (+ H1_48 .def_419))))) .def_427)) (and (and .def_266 (and .def_72 (and .def_214 (and .def_183 (and .def_233 .def_397))))) .def_438))) .loc.15) (and (or C2_28 (not .def_191)) (and (and .def_266 (and .def_72 (and .def_214 (and .def_183 (and .def_233 (and .loc.10 (and .loc.7 (and .loc.6 .def_473)))))))) .def_482))) (and .def_482 (and .def_266 (and .def_214 (and .def_183 (and .def_233 (and .def_70 (and .def_165 (and .loc.10 (and .loc.8 .def_513))))))))))) (and (and .def_76 (and .def_266 (and .def_214 (and .def_183 (and .def_233 (and .loc.15 (and .loc.9 (and .loc.8 (and .loc.7 (and .loc.6 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 .def_462)))))))))))))))))))) .def_546)) .def_550) (and .def_482 (and .def_76 (and .def_183 (and .loc.14 (and .loc.13 (and .loc.12 (and .loc.11 (and .def_165 (and .loc.9 (and .loc.8 (and .loc.7 .def_513)))))))))))) (and .def_482 (and .def_404 (and .def_76 (and .def_183 (and .loc.14 (and .loc.13 (and .loc.12 (and .loc.11 (and .def_165 (and .loc.9 (and .loc.8 (and .loc.7 .def_473))))))))))))) (and .def_578 .def_580)) (and (or C2_28 (and .def_427 (= .x.2543 (store D_48 E1_48 (store .def_421 (+ H1_48 .def_419) (select .def_584 (+ .def_419 V1_48))))))) (and .def_482 (and .def_438 (and .def_76 (and .def_183 (and .def_233 (and .loc.14 (and .loc.13 (and .loc.12 (and .def_165 (and .loc.9 (and .loc.8 (and .loc.7 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_145 .def_595))))))))))))))))))))))))) (and .def_546 (and .def_482 (and .def_76 (and .def_183 (and .def_233 (and .loc.14 (and .loc.13 (and .loc.12 (and .def_70 (and .loc.9 (and .loc.8 (and .loc.6 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 .def_623))))))))))))))))))))))) (and .def_482 (and .def_76 (and .def_214 (and .def_183 (and .loc.14 (and .loc.13 (and .loc.11 (and .def_70 (and .def_165 (and .loc.9 (and .loc.8 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_413 (and .def_145 (and .def_578 (and .def_501 .def_580)))))))))))))))))))))))))) (and .def_482 (and .def_404 (and .def_76 (and .def_214 (and .def_183 (and .loc.14 (and .loc.13 (and .loc.11 (and .def_70 (and .def_165 (and .loc.9 (and .loc.8 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_413 .def_623)))))))))))))))))))))))) (and .def_698 .def_700)) (and (or C2_28 (and .def_427 (= .x.2543 (store D_48 R_48 (store .def_584 (+ .def_419 V1_48) (select .def_704 (+ Q_48 .def_419))))))) (and .def_482 (and .def_438 (and .def_76 (and .def_214 (and .def_183 (and .def_233 (and .loc.14 (and .loc.13 (and .def_70 (and .def_165 (and .loc.9 (and .loc.8 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_145 (and .def_578 (and .def_580 .def_595))))))))))))))))))))))))))) (and .def_546 (and .def_482 (and .def_76 (and .def_72 (and .def_214 (and .def_183 (and .def_233 (and .loc.14 (and .loc.13 (and .loc.9 (and .loc.7 (and .loc.6 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 .def_748)))))))))))))))))) (and .def_482 (and .def_76 (and .def_266 (and .def_72 (and .def_183 (and .loc.14 (and .loc.12 (and .loc.11 (and .def_165 (and .loc.9 (and .loc.7 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 .def_778))))))))))))))))) (and .def_482 (and .def_404 (and .def_76 (and .def_266 (and .def_72 (and .def_183 (and .loc.14 (and .loc.12 (and .loc.11 (and .def_165 (and .loc.9 (and .loc.7 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 .def_801)))))))))))))))))) (and .def_821 .def_823)) (and (or C2_28 (and .def_427 (= .x.2543 (store D_48 N1_48 (store .def_704 (+ Q_48 .def_419) (select .def_827 (+ K1_48 .def_419))))))) (and .def_482 (and .def_438 (and .def_76 (and .def_266 (and .def_72 (and .def_183 (and .def_233 (and .loc.14 (and .loc.12 (and .def_165 (and .loc.9 (and .loc.7 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_154 .def_844))))))))))))))))))) (and .def_546 (and .def_482 (and .def_76 (and .def_266 (and .def_72 (and .def_183 (and .def_233 (and .loc.14 (and .loc.12 (and .def_70 (and .loc.9 (and .loc.6 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_154 (and .def_748 .def_823)))))))))))))))))))) (and .def_482 (and .def_76 (and .def_266 (and .def_72 (and .def_214 (and .def_183 (and .loc.14 (and .loc.11 (and .def_70 (and .def_165 (and .loc.9 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_154 (and .def_778 .def_823))))))))))))))))))) (and .def_482 (and .def_404 (and .def_76 (and .def_266 (and .def_72 (and .def_214 (and .def_183 (and .loc.14 (and .loc.11 (and .def_70 (and .def_165 (and .loc.9 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_154 (and .def_801 .def_823)))))))))))))))))))) (and .def_924 .def_926)) (and (or C2_28 (and .def_427 (= .x.2543 (store D_48 A1_48 (store .def_827 (+ K1_48 .def_419) (select .def_930 (+ Y_48 .def_419))))))) (and .def_482 (and .def_438 (and .def_76 (and .def_266 (and .def_72 (and .def_214 (and .def_183 (and .def_233 (and .loc.14 (and .def_70 (and .def_165 (and .loc.9 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_154 (and .def_823 .def_844))))))))))))))))))))) (and .def_546 (and .def_482 (and .def_76 (and .def_266 (and .def_214 (and .def_183 (and .def_233 (and .loc.14 (and .def_74 (and .loc.8 (and .loc.7 (and .loc.6 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_924 (and .def_154 (and .def_823 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 .def_973)))))))))))))))))))))))))) (and .def_482 (and .def_76 (and .def_183 (and .def_550 (and .loc.13 (and .loc.12 (and .loc.11 (and .def_74 (and .def_165 (and .loc.8 (and .loc.7 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_924 (and .def_154 (and .def_823 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_413 (and .def_145 (and .def_578 (and .def_580 (and .def_142 (and .def_698 (and .def_700 (and .def_139 (and .def_225 (and .def_408 (and .def_220 (and .def_136 (and .def_133 (and .def_130 (and .def_127 (and .def_124 .def_1000))))))))))))))))))))))))))))))))))))))))) (and .def_482 (and .def_404 (and .def_76 (and .def_183 (and .def_550 (and .loc.13 (and .loc.12 (and .loc.11 (and .def_74 (and .def_165 (and .loc.8 (and .loc.7 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_924 (and .def_154 (and .def_823 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_413 .def_973))))))))))))))))))))))))))) (and .def_1070 .def_1072)) (and (or C2_28 (and .def_427 (= .x.2543 (store D_48 N_48 (store .def_930 (+ Y_48 .def_419) (select .def_1076 (+ M_48 .def_419))))))) (and .def_482 (and .def_438 (and .def_76 (and .def_183 (and .def_550 (and .def_233 (and .loc.13 (and .loc.12 (and .def_74 (and .def_165 (and .loc.8 (and .loc.7 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_924 (and .def_154 (and .def_823 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_145 (and .def_578 (and .def_580 (and .def_142 (and .def_698 (and .def_700 (and .def_139 (and .def_225 (and .def_408 (and .def_220 (and .def_136 (and .def_133 (and .def_130 (and .def_127 (and .def_124 .def_1083)))))))))))))))))))))))))))))))))))))))))) (and .def_546 (and .def_482 (and .def_76 (and .def_183 (and .def_550 (and .def_233 (and .loc.13 (and .loc.12 (and .def_74 (and .def_70 (and .loc.8 (and .loc.6 (and .def_1070 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_924 (and .def_154 (and .def_823 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 .def_1141))))))))))))))))))))))))))) (and .def_482 (and .def_76 (and .def_214 (and .def_183 (and .def_550 (and .loc.13 (and .loc.11 (and .def_74 (and .def_70 (and .def_165 (and .loc.8 (and .def_1070 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_924 (and .def_154 (and .def_823 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_413 (and .def_145 (and .def_578 (and .def_580 (and .def_142 (and .def_698 (and .def_700 (and .def_139 (and .def_225 (and .def_408 (and .def_220 (and .def_136 (and .def_133 (and .def_130 (and .def_127 (and .def_124 (and .def_1000 .def_1072))))))))))))))))))))))))))))))))))))))))))) (and .def_482 (and .def_404 (and .def_76 (and .def_214 (and .def_183 (and .def_550 (and .loc.13 (and .loc.11 (and .def_74 (and .def_70 (and .def_165 (and .loc.8 (and .def_1070 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_924 (and .def_154 (and .def_823 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_413 .def_1141)))))))))))))))))))))))))))) (and .def_1241 .def_1243)) (and (or C2_28 (and .def_427 (= .x.2543 (store D_48 Z_48 (store .def_1076 (+ M_48 .def_419) (select .def_239 (+ .def_419 S1_48))))))) (and .def_482 (and .def_438 (and .def_76 (and .def_214 (and .def_183 (and .def_550 (and .def_233 (and .loc.13 (and .def_74 (and .def_70 (and .def_165 (and .loc.8 (and .def_1070 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_924 (and .def_154 (and .def_823 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_145 (and .def_578 (and .def_580 (and .def_142 (and .def_698 (and .def_700 (and .def_139 (and .def_225 (and .def_408 (and .def_220 (and .def_136 (and .def_133 (and .def_130 (and .def_127 (and .def_124 (and .def_1072 .def_1083)))))))))))))))))))))))))))))))))))))))))))) (and .def_546 (and .def_482 (and .def_76 (and .def_72 (and .def_214 (and .def_183 (and .def_550 (and .def_233 (and .loc.13 (and .def_74 (and .loc.7 (and .loc.6 (and .def_1241 (and .def_1070 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_924 (and .def_154 (and .def_823 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 .def_1315)))))))))))))))))))))))))))) (and .def_482 (and .def_76 (and .def_266 (and .def_72 (and .def_183 (and .def_550 (and .loc.12 (and .loc.11 (and .def_74 (and .def_165 (and .loc.7 (and .def_1241 (and .def_1070 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_924 (and .def_154 (and .def_823 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_413 (and .def_145 (and .def_578 (and .def_580 (and .def_142 (and .def_698 (and .def_700 (and .def_139 (and .def_225 (and .def_408 (and .def_220 (and .def_136 (and .def_133 (and .def_130 (and .def_127 (and .def_124 (and .def_1072 (and .def_926 (and .def_491 .def_1243)))))))))))))))))))))))))))))))))))))))))))))) (and (or C2_28 .def_1390) (and .def_482 (and .def_76 (and .def_266 (and .def_72 (and .def_183 (and .def_550 (and .loc.12 (and .loc.11 (and .def_74 (and .def_165 (and .loc.7 (and .def_1241 (and .def_1070 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_924 (and .def_154 (and .def_823 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_413 .def_1315))))))))))))))))))))))))))))) (and (= T_48 .x.2559) (and (= L_48 .x.2551) (= O_48 .x.2554)))) (and (or C2_28 (and (= .x.2543 (store D_48 P1_48 (store .def_239 (+ (* 4 O_48) S1_48) L_48))) (and (<= (- 2147483648) L_48) (and (<= L_48 2147483647) (not .def_1390))))) (and (or B2_48 (= (+ O_48 (* (- 1) .x.2554)) (- 1))) (and .def_482 (and .def_76 (and .def_266 (and .def_72 (and .def_183 (and .def_550 (and .def_233 (and .loc.12 (and .def_74 (and .def_165 (and .loc.7 (and .def_1241 (and .def_1070 (and .def_228 (and .def_163 (and .def_160 (and .def_157 (and .def_821 (and .def_924 (and .def_154 (and .def_823 (and .def_271 (and .def_151 (and .def_273 (and .def_148 (and .def_416 (and .def_413 (and .def_145 (and .def_578 (and .def_580 (and .def_142 (and .def_698 (and .def_700 (and .def_139 (and .def_225 (and .def_408 (and .def_220 (and .def_136 (and .def_133 (and .def_130 (and .def_127 (and .def_124 (and .def_1072 (and .def_926 (and .def_284 .def_1243)))))))))))))))))))))))))))))))))))))))))))))))) (and (= J_48 .x.2549) (and (= F_48 .x.2545) (= H_48 .x.2547)))) (and (or C2_28 (and (and (= .x.2549 0) (= .x.2545 0)) (= C2_0 (store B_48 0 0)))) (and (or B2_48 (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (not (<= .x.2540 .x.2557)) (not (<= .x.2540 .x.2553))) (not (<= .x.2540 .x.2565))) (not (<= .x.2540 .x.2566))) (not (<= .x.2540 .x.2570))) (not (<= .x.2540 .x.2579))) (not (<= .x.2540 .x.2581))) (not (<= .x.2540 .x.2588))) (= .x.2552 0)) (= .x.2554 0)) (= .x.2556 0)) (not (= .x.2557 0))) (= .x.2562 0)) (= .x.2564 0)) (not (= .x.2566 0))) (not (= .x.2570 0))) (= .x.2573 0)) (= .x.2576 0)) (not (= .x.2579 0))) (= .x.2587 0)) (not (= .x.2588 0))) (= .x.2584 0)) (not (= .x.2553 0))) (not (= .x.2565 0))) (not (= .x.2581 0))) (= (select C2_0 .x.2581) 0)) (= (select .def_1582 .x.2565) 0)) (= (select .def_1586 .x.2553) 0)) (= (select .def_1592 .x.2557) 0)) (= (select .def_1597 .x.2588) 0)) (= (select .def_1590 .x.2566) 0)) (= (select .def_1591 .x.2579) 0)) (= (select .def_1596 .x.2570) 0)) (= .x.2547 (store (store (store (store (store (store (store (store H_48 .x.2581 400000) .x.2565 400000) .x.2553 400000) .x.2566 400000) .x.2579 400000) .x.2557 400000) .x.2570 400000) .x.2588 400000))) (= .x.2541 (store .def_1597 .x.2588 1)))) (and .def_482 (and .def_76 (and .def_266 (and .def_72 (and .def_183 (and .def_550 (and .def_233 (and .loc.12 (and .def_74 (and .def_70 (and .loc.6 (and .def_228 (and .def_127 (and .def_222 .def_410)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) (state |.x.2540| |.x.2541| |.x.2542| |.x.2543| |.x.2544| |.x.2545| |.x.2546| |.x.2547| |.x.2548| |.x.2549| |.x.2550| |.x.2551| |.x.2552| |.x.2553| |.x.2554| |.x.2555| |.x.2556| |.x.2557| |.x.2558| |.x.2559| |.x.2560| |.x.2561| |.x.2562| |.x.2563| |.x.2564| |.x.2565| |.x.2566| |.x.2567| |.x.2568| |.x.2569| |.x.2570| |.x.2571| |.x.2572| |.x.2573| |.x.2574| |.x.2575| |.x.2576| |.x.2577| |.x.2578| |.x.2579| |.x.2580| |.x.2581| |.x.2582| |.x.2583| |.x.2584| |.x.2585| |.x.2586| |.x.2587| |.x.2588| |.x.2589| |.x.2590| |.x.2591| |.x.2592| |B2_48| |.loc.11| |.loc.12| |.loc.13| |.loc.14| |.loc.15| |.xtv.1|))))
(assert (forall ((|A_48| Int) (|B_48| (Array Int Int)) (|C_48| (Array Int Int)) (|D_48| (Array Int Int)) (|E_48| (Array Int Int)) (|F_48| Int) (|G_48| Int) (|H_48| (Array Int Int)) (|I_48| (Array Int Int)) (|J_48| Int) (|K_48| Int) (|L_48| Int) (|M_48| Int) (|N_48| Int) (|O_48| Int) (|P_48| Int) (|Q_48| Int) (|R_48| Int) (|S_48| Int) (|T_48| Int) (|U_48| Int) (|V_48| Int) (|W_48| Int) (|X_48| Int) (|Y_48| Int) (|Z_48| Int) (|A1_48| Int) (|B1_48| Int) (|C1_48| Int) (|D1_48| Int) (|E1_48| Int) (|F1_48| Int) (|G1_48| Int) (|H1_48| Int) (|I1_48| Int) (|J1_48| Int) (|K1_48| Int) (|L1_48| Int) (|M1_48| Int) (|N1_48| Int) (|O1_48| Int) (|P1_48| Int) (|Q1_48| Int) (|R1_48| Int) (|S1_48| Int) (|T1_48| Int) (|U1_48| Int) (|V1_48| Int) (|W1_48| Int) (|X1_48| Int) (|Y1_48| Int) (|Z1_48| Int) (|A2_48| Int) (|C2_28| Bool) (|.loc.6| Bool) (|.loc.7| Bool) (|.loc.8| Bool) (|.loc.9| Bool) (|.loc.10| Bool) (|C2_0| (Array Int Int)) (|.x.2550| Int) (|.x.2548| (Array Int Int)) (|.x.2546| Int) (|.x.2544| (Array Int Int)) (|.x.2540| Int) (|.x.2542| (Array Int Int)) (|.x.2541| (Array Int Int)) (|B2_48| Bool) (|.x.2552| Int) (|.x.2553| Int) (|.x.2556| Int) (|.x.2557| Int) (|.x.2562| Int) (|.x.2563| Int) (|.x.2564| Int) (|.x.2565| Int) (|.x.2566| Int) (|.x.2570| Int) (|.x.2573| Int) (|.x.2576| Int) (|.x.2579| Int) (|.x.2581| Int) (|.x.2584| Int) (|.x.2587| Int) (|.x.2588| Int) (|.x.2589| Int) (|.loc.12| Bool) (|.x.2567| Int) (|.x.2555| Int) (|.x.2569| Int) (|.x.2590| Int) (|.loc.13| Bool) (|.loc.11| Bool) (|.x.2582| Int) (|.x.2580| Int) (|.x.2568| Int) (|.x.2543| (Array Int Int)) (|.x.2577| Int) (|.x.2578| Int) (|.loc.15| Bool) (|.loc.14| Bool) (|.x.2575| Int) (|.x.2574| Int) (|.x.2572| Int) (|.x.2571| Int) (|.x.2586| Int) (|.x.2583| Int) (|.x.2585| Int) (|.x.2560| Int) (|.x.2591| Int) (|.x.2561| Int) (|.x.2592| Int) (|.x.2558| Int) (|.x.2559| Int) (|.x.2551| Int) (|.x.2554| Int) (|.x.2549| Int) (|.x.2545| Int) (|.x.2547| (Array Int Int)) (|.xtv.1| (Array Int Int))) (=> (state |A_48| |B_48| |C_48| |D_48| |E_48| |F_48| |G_48| |H_48| |I_48| |J_48| |K_48| |L_48| |M_48| |N_48| |O_48| |P_48| |Q_48| |R_48| |S_48| |T_48| |U_48| |V_48| |W_48| |X_48| |Y_48| |Z_48| |A1_48| |B1_48| |C1_48| |D1_48| |E1_48| |F1_48| |G1_48| |H1_48| |I1_48| |J1_48| |K1_48| |L1_48| |M1_48| |N1_48| |O1_48| |P1_48| |Q1_48| |R1_48| |S1_48| |T1_48| |U1_48| |V1_48| |W1_48| |X1_48| |Y1_48| |Z1_48| |A2_48| |C2_28| |.loc.6| |.loc.7| |.loc.8| |.loc.9| |.loc.10| |C2_0|) (not (and C2_28 (and .loc.10 (and (not .loc.9) (and .loc.8 (and .loc.7 (not .loc.6))))))))))
(check-sat)