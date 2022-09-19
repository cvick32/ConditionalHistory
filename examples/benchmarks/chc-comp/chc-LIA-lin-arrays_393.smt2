(set-logic HORN)
(declare-fun state (Int (Array Int Int) Int (Array Int Int) Int (Array Int Int)) Bool)
(assert (forall ((|E_0| Int) (|J| (Array Int Int)) (|G_0| Int) (|I| (Array Int Int)) (|H_0| Int) (|K| (Array Int Int)) (|.xiv.1| Int) (|.xiv.2| (Array Int Int)) (|.xiv.3| Int) (|.xiv.4| (Array Int Int)) (|.xiv.5| Int) (|.xiv.6| (Array Int Int))) (=> (let ((.def_16 (select J H_0))) (let ((.def_17 (select J G_0))) (let ((.def_20 (select K H_0))) (let ((.def_22 (select I H_0))) (let ((.def_23 (select I G_0))) (and (= .def_16 .def_17) (and (= (select K G_0) .def_20) (and (= .def_22 .def_23) (and (and (and (and (and (not (<= (+ G_0 (* (- 1) H_0)) (- 4))) (and (<= G_0 H_0) (and (and (and (or (<= .def_16 H_0) (not (<= .def_22 H_0))) (not (= .def_20 1))) (not (<= G_0 0))) (not (<= E_0 0))))) (= G_0 .def_23)) (= E_0 (select I E_0))) (= (+ G_0 (* (- 1) .def_17)) (- 4))) (= (+ E_0 (* (- 1) (select J E_0))) (- 4))))))))))) (state |E_0| |J| |G_0| |I| |H_0| |K|))))
(assert (forall ((|E_0| Int) (|J| (Array Int Int)) (|G_0| Int) (|I| (Array Int Int)) (|H_0| Int) (|K| (Array Int Int)) (|.xiv.1| Int) (|.xiv.2| (Array Int Int)) (|.xiv.3| Int) (|.xiv.4| (Array Int Int)) (|.xiv.5| Int) (|.xiv.6| (Array Int Int))) (=> (and (state |E_0| |J| |G_0| |I| |H_0| |K|) false) (state |.xiv.1| |.xiv.2| |.xiv.3| |.xiv.4| |.xiv.5| |.xiv.6|))))
(assert (forall ((|E_0| Int) (|J| (Array Int Int)) (|G_0| Int) (|I| (Array Int Int)) (|H_0| Int) (|K| (Array Int Int)) (|.xiv.1| Int) (|.xiv.2| (Array Int Int)) (|.xiv.3| Int) (|.xiv.4| (Array Int Int)) (|.xiv.5| Int) (|.xiv.6| (Array Int Int))) (=> (state |E_0| |J| |G_0| |I| |H_0| |K|) false)))
(check-sat)
