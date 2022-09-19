(set-logic HORN)
(declare-fun state (Int (Array Int Int) Int (Array Int Int) Bool Int Int (Array Int Int) (Array Int Int) (Array Int Int) Int (Array Int Int)) Bool)
(assert (forall ((|B_24| Int) (|C_24| (Array Int Int)) (|A_24| Int) (|E_20| (Array Int Int)) (|.loc.46| Bool) (|E_21| Int) (|D_24| Int) (|G_8| (Array Int Int)) (|F_14| (Array Int Int)) (|H_4| (Array Int Int)) (|D_0| Int) (|C_0| (Array Int Int)) (|.loc.51| Bool) (|.y.47| Int) (|.y.48| (Array Int Int)) (|.y.49| Int) (|.y.50| (Array Int Int)) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| (Array Int Int)) (|.xtv.4| (Array Int Int)) (|.xiv.1| (Array Int Int)) (|.xiv.2| Int) (|.xiv.3| (Array Int Int))) (=> (let ((.def_22 (not .loc.46))) (let ((.def_23 (= C_24 E_20))) (let ((.def_25 (= B_24 A_24))) (let ((.def_29 (not (= B_24 0)))) (let ((.def_32 (not (= A_24 0)))) (let ((.def_37 (= (select E_20 (- 9)) 0))) (let ((.def_38 (not .def_37))) (let ((.def_41 (= (select C_24 (- 9)) 0))) (let ((.def_42 (not .def_41))) (let ((.def_44 (<= 0 D_0))) (let ((.def_48 (and .def_32 (and .def_29 (and .def_25 (and .def_22 .def_44)))))) (let ((.def_53 (select C_0 (- 9)))) (let ((.def_54 (= .def_53 0))) (let ((.def_62 (select H_4 (- 9)))) (let ((.def_66 (not (= .def_62 (- 1))))) (let ((.def_68 (and .def_44 (and .def_54 .def_66)))) (let ((.def_70 (not (= H_4 C_0)))) (let ((.def_72 (= .def_62 0))) (let ((.def_74 (not .def_72))) (or (and (and (and (and (and (and .def_22 .def_23) .def_25) .def_29) .def_32) .def_38) .def_42) (or (and .def_42 (and .def_41 .def_48)) (or (and .def_38 (and .def_37 .def_48)) (or (and .def_32 (and .def_29 (and .def_25 (and .def_23 (and .def_22 (and .def_44 .def_54)))))) (and .loc.46 (or (and (not .def_44) (or .def_68 (or .def_68 (and (and (or .def_66 .def_70) .def_72) .def_74)))) (and (or .def_70 (not (= .def_53 .def_62))) (and .def_74 (and .def_44 .def_72)))))))))))))))))))))))))))) (state |B_24| |C_24| |A_24| |E_20| |.loc.46| |E_21| |D_24| |G_8| |F_14| |H_4| |D_0| |C_0|))))
(assert (forall ((|B_24| Int) (|C_24| (Array Int Int)) (|A_24| Int) (|E_20| (Array Int Int)) (|.loc.46| Bool) (|E_21| Int) (|D_24| Int) (|G_8| (Array Int Int)) (|F_14| (Array Int Int)) (|H_4| (Array Int Int)) (|D_0| Int) (|C_0| (Array Int Int)) (|.loc.51| Bool) (|.y.47| Int) (|.y.48| (Array Int Int)) (|.y.49| Int) (|.y.50| (Array Int Int)) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| (Array Int Int)) (|.xtv.4| (Array Int Int)) (|.xiv.1| (Array Int Int)) (|.xiv.2| Int) (|.xiv.3| (Array Int Int))) (=> (and (state |B_24| |C_24| |A_24| |E_20| |.loc.46| |E_21| |D_24| |G_8| |F_14| |H_4| |D_0| |C_0|) (let ((.def_36 (select E_20 (- 9)))) (let ((.def_40 (select C_24 (- 9)))) (let ((.def_93 (<= B_24 0))) (let ((.def_95 (<= 0 D_24))) (let ((.def_99 (= G_8 F_14))) (let ((.def_100 (not .def_99))) (let ((.def_102 (<= 0 B_24))) (let ((.def_110 (or .def_100 (not (= (ite .def_95 .def_40 (- 1)) (ite (<= 0 E_21) .def_36 (- 1))))))) (let ((.def_126 (or (not (= C_24 E_20)) (or (not (= (+ B_24 (+ (* (- 1) A_24) (+ (* (- 1) .def_36) .def_40))) 0)) (and .def_99 (= E_21 D_24)))))) (and (and (not .loc.46) .loc.51) (or (and (not .def_93) (or (and (or (not (= (ite .def_95 .def_36 (- 1)) (- 1))) .def_100) (not .def_102)) (and (and .def_102 .def_110) .def_126))) (and .def_126 (and .def_93 .def_110)))))))))))))) (state |.y.47| |.y.48| |.y.49| |.y.50| |.loc.51| |.xtv.1| |.xtv.2| |.xtv.3| |.xtv.4| |.xiv.1| |.xiv.2| |.xiv.3|))))
(assert (forall ((|B_24| Int) (|C_24| (Array Int Int)) (|A_24| Int) (|E_20| (Array Int Int)) (|.loc.46| Bool) (|E_21| Int) (|D_24| Int) (|G_8| (Array Int Int)) (|F_14| (Array Int Int)) (|H_4| (Array Int Int)) (|D_0| Int) (|C_0| (Array Int Int)) (|.loc.51| Bool) (|.y.47| Int) (|.y.48| (Array Int Int)) (|.y.49| Int) (|.y.50| (Array Int Int)) (|.xtv.1| Int) (|.xtv.2| Int) (|.xtv.3| (Array Int Int)) (|.xtv.4| (Array Int Int)) (|.xiv.1| (Array Int Int)) (|.xiv.2| Int) (|.xiv.3| (Array Int Int))) (=> (state |B_24| |C_24| |A_24| |E_20| |.loc.46| |E_21| |D_24| |G_8| |F_14| |H_4| |D_0| |C_0|) (not .loc.46))))
(check-sat)
