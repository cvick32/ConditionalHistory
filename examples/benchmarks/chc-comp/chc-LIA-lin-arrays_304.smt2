(set-logic HORN)
(declare-fun state ((Array Int Int) (Array Int Int) Int Int (Array Int Int) Int Int Bool Int) Bool)
(assert (forall ((|A_1| (Array Int Int)) (|B_1| (Array Int Int)) (|C_0| Int) (|D_0| Int) (|.y.4| (Array Int Int)) (|.y.5| Int) (|.y.6| Int) (|.loc.7| Bool) (|F_1| Int) (|.x.2| (Array Int Int)) (|.x.3| (Array Int Int)) (|.loc.10| Bool) (|v_5| Int) (|.x.4| Int) (|E_0| (Array Int Int)) (|.y.8| Int) (|.y.9| Int) (|.xpv.1| Int)) (=> (and (and (= C_0 0) (= D_0 100000)) (not .loc.7)) (state |A_1| |B_1| |C_0| |D_0| |.y.4| |.y.5| |.y.6| |.loc.7| |F_1|))))
(assert (forall ((|A_1| (Array Int Int)) (|B_1| (Array Int Int)) (|C_0| Int) (|D_0| Int) (|.y.4| (Array Int Int)) (|.y.5| Int) (|.y.6| Int) (|.loc.7| Bool) (|F_1| Int) (|.x.2| (Array Int Int)) (|.x.3| (Array Int Int)) (|.loc.10| Bool) (|v_5| Int) (|.x.4| Int) (|E_0| (Array Int Int)) (|.y.8| Int) (|.y.9| Int) (|.xpv.1| Int)) (=> (and (state |A_1| |B_1| |C_0| |D_0| |.y.4| |.y.5| |.y.6| |.loc.7| |F_1|) (let ((.def_24 (not .loc.7))) (let ((.def_35 (<= D_0 C_0))) (or (and (and (and (= A_1 .x.2) (= B_1 .x.3)) .loc.10) (or (and .def_24 (and (and (= v_5 0) .def_35) (= D_0 .x.4))) (and (not (<= .y.6 .y.5)) (and (= (store .y.4 .y.5 (+ (select A_1 .y.5) (select B_1 .y.5))) E_0) (and (= (+ .y.5 (* (- 1) v_5)) (- 1)) (and .loc.7 (= .y.6 .x.4))))))) (and (= .x.2 (store A_1 C_0 1)) (and (= .x.3 (store B_1 C_0 2)) (and (= (+ C_0 (* (- 1) .y.8)) (- 1)) (and (= D_0 .y.9) (and (not .loc.10) (and .def_24 (not .def_35))))))))))) (state |.x.2| |.x.3| |.y.8| |.y.9| |E_0| |v_5| |.x.4| |.loc.10| |.xpv.1|))))
(assert (forall ((|A_1| (Array Int Int)) (|B_1| (Array Int Int)) (|C_0| Int) (|D_0| Int) (|.y.4| (Array Int Int)) (|.y.5| Int) (|.y.6| Int) (|.loc.7| Bool) (|F_1| Int) (|.x.2| (Array Int Int)) (|.x.3| (Array Int Int)) (|.loc.10| Bool) (|v_5| Int) (|.x.4| Int) (|E_0| (Array Int Int)) (|.y.8| Int) (|.y.9| Int) (|.xpv.1| Int)) (=> (state |A_1| |B_1| |C_0| |D_0| |.y.4| |.y.5| |.y.6| |.loc.7| |F_1|) (not (and .loc.7 (and (and (<= .y.6 .y.5) (and (not (<= F_1 0)) (not (<= 3 (select .y.4 F_1))))) (not (<= .y.6 F_1))))))))
(check-sat)
