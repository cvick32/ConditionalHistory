(set-logic HORN)
(declare-fun state (Int Int Int (Array Int Int) Int Int Int (Array Int Int) Bool) Bool)
(assert (forall ((|A_0| Int) (|E_0| Int) (|C_0| Int) (|G| (Array Int Int)) (|B_0| Int) (|F_0| Int) (|D_0| Int) (|H| (Array Int Int)) (|.loc.10| Bool) (|.loc.19| Bool) (|.y.17| Int) (|.y.15| Int) (|.y.13| Int) (|.y.11| Int) (|.y.18| (Array Int Int)) (|.y.12| Int) (|.y.14| (Array Int Int)) (|.y.16| Int)) (=> (and (and (and (and (and (= F_0 0) (= E_0 0)) (= G H)) (= C_0 D_0)) (= A_0 B_0)) (not .loc.10)) (state |A_0| |E_0| |C_0| |G| |B_0| |F_0| |D_0| |H| |.loc.10|))))
(assert (forall ((|A_0| Int) (|E_0| Int) (|C_0| Int) (|G| (Array Int Int)) (|B_0| Int) (|F_0| Int) (|D_0| Int) (|H| (Array Int Int)) (|.loc.10| Bool) (|.loc.19| Bool) (|.y.17| Int) (|.y.15| Int) (|.y.13| Int) (|.y.11| Int) (|.y.18| (Array Int Int)) (|.y.12| Int) (|.y.14| (Array Int Int)) (|.y.16| Int)) (=> (and (state |A_0| |E_0| |C_0| |G| |B_0| |F_0| |D_0| |H| |.loc.10|) (let ((.def_35 (<= C_0 E_0))) (let ((.def_37 (<= D_0 F_0))) (let ((.def_41 (not .def_35))) (let ((.def_42 (not .def_37))) (let ((.def_44 (not .loc.19))) (let ((.def_47 (= D_0 .y.17))) (let ((.def_50 (= B_0 .y.15))) (let ((.def_53 (= C_0 .y.13))) (let ((.def_56 (= A_0 .y.11))) (let ((.def_66 (= (store H (+ (+ B_0 (* 4 F_0)) 4) (select H B_0)) .y.18))) (let ((.def_73 (= (+ E_0 (* (- 1) .y.12)) (- 1)))) (let ((.def_82 (= (store G (+ (+ A_0 (* 4 E_0)) 4) (select G (+ A_0 (* 4 E_0)))) .y.14))) (let ((.def_87 (= (+ F_0 (* (- 1) .y.16)) (- 1)))) (and (not .loc.10) (or (or (or (and (and (and (or (not (= G H)) (not (= E_0 F_0))) .def_35) .def_37) .loc.19) (and (and (and (and (and (and (and (and (and (and .def_41 .def_42) .def_44) .def_47) .def_50) .def_53) .def_56) .def_66) .def_73) .def_82) .def_87)) (and (= F_0 .y.16) (and (= H .y.18) (and .def_82 (and .def_73 (and .def_56 (and .def_53 (and .def_50 (and .def_47 (and .def_44 (and .def_37 .def_41))))))))))) (and (= E_0 .y.12) (and (= G .y.14) (and .def_87 (and .def_66 (and .def_56 (and .def_53 (and .def_50 (and .def_47 (and .def_44 (and .def_35 .def_42)))))))))))))))))))))))))) (state |.y.11| |.y.12| |.y.13| |.y.14| |.y.15| |.y.16| |.y.17| |.y.18| |.loc.19|))))
(assert (forall ((|A_0| Int) (|E_0| Int) (|C_0| Int) (|G| (Array Int Int)) (|B_0| Int) (|F_0| Int) (|D_0| Int) (|H| (Array Int Int)) (|.loc.10| Bool) (|.loc.19| Bool) (|.y.17| Int) (|.y.15| Int) (|.y.13| Int) (|.y.11| Int) (|.y.18| (Array Int Int)) (|.y.12| Int) (|.y.14| (Array Int Int)) (|.y.16| Int)) (=> (state |A_0| |E_0| |C_0| |G| |B_0| |F_0| |D_0| |H| |.loc.10|) (not .loc.10))))
(check-sat)