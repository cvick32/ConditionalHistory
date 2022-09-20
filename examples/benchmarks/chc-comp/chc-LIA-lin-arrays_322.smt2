(set-logic HORN)
(declare-fun state (Int Int Int (Array Int Int) Int Int Int Int Int Bool Bool Bool Bool) Bool)
(assert (forall ((|A_3| Int) (|B_3| Int) (|C_3| Int) (|D_3| (Array Int Int)) (|K_2| Int) (|F_3| Int) (|G_3| Int) (|H_3| Int) (|L_0| Int) (|J_3| Bool) (|.loc.4| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.x.90| (Array Int Int)) (|.x.88| Int) (|.x.93| Int) (|.x.91| Int) (|.x.95| Int) (|J_9| Bool) (|.x.89| Int) (|.x.92| Int) (|.loc.8| Bool) (|.loc.9| Bool) (|.x.87| Int) (|.loc.7| Bool) (|.x.94| Int)) (=> (and (and (and .loc.4 (not .loc.5)) (not .loc.6)) (not J_3)) (state |A_3| |B_3| |C_3| |D_3| |K_2| |F_3| |G_3| |H_3| |L_0| |J_3| |.loc.4| |.loc.5| |.loc.6|))))
(assert (forall ((|A_3| Int) (|B_3| Int) (|C_3| Int) (|D_3| (Array Int Int)) (|K_2| Int) (|F_3| Int) (|G_3| Int) (|H_3| Int) (|L_0| Int) (|J_3| Bool) (|.loc.4| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.x.90| (Array Int Int)) (|.x.88| Int) (|.x.93| Int) (|.x.91| Int) (|.x.95| Int) (|J_9| Bool) (|.x.89| Int) (|.x.92| Int) (|.loc.8| Bool) (|.loc.9| Bool) (|.x.87| Int) (|.loc.7| Bool) (|.x.94| Int)) (=> (and (state |A_3| |B_3| |C_3| |D_3| |K_2| |F_3| |G_3| |H_3| |L_0| |J_3| |.loc.4| |.loc.5| |.loc.6|) (let ((.def_23 (not .loc.5))) (let ((.def_25 (not .loc.6))) (let ((.def_30 (= D_3 .x.90))) (let ((.def_32 (= B_3 .x.88))) (let ((.def_35 (= G_3 .x.93))) (let ((.def_39 (= .x.91 0))) (let ((.def_50 (+ B_3 (* (- 4294967296) (to_int (* (/ 1 4294967296) (to_real B_3))))))) (let ((.def_56 (or J_3 (and (= .x.91 .x.95) (= .x.95 (ite (<= 5 .def_50) 0 1)))))) (let ((.def_60 (= C_3 .x.89))) (let ((.def_63 (= F_3 .x.92))) (let ((.def_74 (not .loc.4))) (let ((.def_77 (= J_3 J_9))) (let ((.def_79 (= L_0 .x.95))) (let ((.def_81 (= K_2 .x.91))) (let ((.def_86 (not .loc.8))) (let ((.def_99 (not .loc.9))) (let ((.def_103 (= A_3 .x.87))) (let ((.def_112 (= (+ A_3 (* (- 256) (to_int (* (/ 1 256) (to_real A_3))))) 0))) (let ((.def_138 (not .loc.7))) (let ((.def_184 (= H_3 .x.94))) (let ((.def_186 (= .x.88 0))) (let ((.def_218 (or J_3 (not .def_112)))) (or (or (or (and (or (or (and (and (and .def_30 .def_32) .def_35) (or (and (or (and (or (and (or (and .def_25 (and .loc.5 (and .loc.4 (and (or J_3 .def_39) (and (and (and .def_56 J_9) .def_60) .def_63))))) (and (or J_3 (= .x.92 1)) (and (and (and (and (or J_9 (= .x.89 .x.92)) (and (and .loc.6 .def_23) .def_74)) .def_77) .def_79) .def_81))) (and .def_86 .loc.9)) (and (and .def_81 (and .def_79 (and .def_77 (and .def_74 (and .loc.8 (and .def_25 (and .loc.5 (and .def_63 (and J_3 .def_60))))))))) .def_99)) .def_103) (and (or J_3 .def_112) (and .def_99 (and .def_81 (and .def_79 (and .def_77 (and .def_74 (and .loc.8 (and .def_25 (and .loc.5 (and .def_60 .def_63))))))))))) .loc.7) (and (or J_9 (not .def_39)) (and (and .def_77 (and .def_86 (and .loc.9 (and .def_25 (and .loc.5 (and .loc.4 (and .def_63 (and .def_60 (and .def_56 .def_103))))))))) .def_138)))) (and (or J_3 (and (= .x.90 (store D_3 (ite (<= .def_50 2147483647) .def_50 (+ (- 4294967296) .def_50)) 0)) (= (+ B_3 (* (- 1) .x.88)) (- 1)))) (and .def_138 (and .def_99 (and .def_81 (and .def_79 (and .def_77 (and .def_74 (and .def_23 (and .loc.8 (and .def_25 (and .def_63 (and .def_60 .def_103))))))))))))) (and .def_138 (and .def_86 (and .loc.9 (and .def_25 (and .loc.5 (and .loc.4 (and .def_35 (and .def_63 (and .def_30 (and .def_60 (and .def_32 (and .def_103 (and .def_56 (and J_3 J_9))))))))))))))) .def_184) (and (or J_3 .def_186) (and .def_138 (and .def_99 (and .def_81 (and .def_79 (and .def_77 (and .def_23 (and .loc.8 (and .def_25 (and .loc.4 .def_60))))))))))) (and (and (or J_9 (and .def_186 (= .def_50 4))) (and .def_138 (and .def_99 (and .def_81 (and .def_79 (and .def_77 (and .def_74 (and .def_86 (and .def_25 (and .loc.5 (and .def_184 (and .def_35 (and .def_63 (and .def_30 .def_60)))))))))))))) .def_218)) (and (or J_9 (not (= (+ .x.88 (* (- 4294967296) (to_int (* (/ 1 4294967296) (to_real .x.88))))) 4))) (and .def_218 (and .def_138 (and .def_99 (and .def_81 (and .def_79 (and .def_77 (and .def_74 (and .def_86 (and .def_25 (and .loc.5 (and .def_184 (and .def_35 (and .def_63 (and .def_30 (and .def_32 .def_60)))))))))))))))))))))))))))))))))))))))) (state |.x.87| |.x.88| |.x.89| |.x.90| |.x.91| |.x.92| |.x.93| |.x.94| |.x.95| |J_9| |.loc.7| |.loc.8| |.loc.9|))))
(assert (forall ((|A_3| Int) (|B_3| Int) (|C_3| Int) (|D_3| (Array Int Int)) (|K_2| Int) (|F_3| Int) (|G_3| Int) (|H_3| Int) (|L_0| Int) (|J_3| Bool) (|.loc.4| Bool) (|.loc.5| Bool) (|.loc.6| Bool) (|.x.90| (Array Int Int)) (|.x.88| Int) (|.x.93| Int) (|.x.91| Int) (|.x.95| Int) (|J_9| Bool) (|.x.89| Int) (|.x.92| Int) (|.loc.8| Bool) (|.loc.9| Bool) (|.x.87| Int) (|.loc.7| Bool) (|.x.94| Int)) (=> (state |A_3| |B_3| |C_3| |D_3| |K_2| |F_3| |G_3| |H_3| |L_0| |J_3| |.loc.4| |.loc.5| |.loc.6|) (not (and J_3 (and .loc.6 (and .loc.4 (not .loc.5))))))))
(check-sat)