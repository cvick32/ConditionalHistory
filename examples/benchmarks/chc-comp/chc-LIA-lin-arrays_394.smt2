(set-logic HORN)
(declare-fun state (Int (Array Int Int) (Array Int Int) Int (Array Int Int)) Bool)
(assert (forall ((|E| Int) (|G| (Array Int Int)) (|F| (Array Int Int)) (|C| Int) (|H| (Array Int Int)) (|.xiv.1| Int) (|.xiv.2| (Array Int Int)) (|.xiv.3| (Array Int Int)) (|.xiv.4| Int) (|.xiv.5| (Array Int Int))) (=> (let ((.def_15 (select G C))) (let ((.def_16 (select G E))) (let ((.def_19 (select H C))) (let ((.def_21 (select F C))) (let ((.def_22 (select F E))) (and (= .def_15 .def_16) (and (= (select H E) .def_19) (and (= .def_21 .def_22) (and (and (and (not (<= (+ E (* (- 1) C)) (- 4))) (and (<= E C) (and (and (or (<= .def_15 C) (not (<= .def_21 C))) (not (= .def_19 1))) (not (<= E 0))))) (= E .def_22)) (= (+ E (* (- 1) .def_16)) (- 4))))))))))) (state |E| |G| |F| |C| |H|))))
(assert (forall ((|E| Int) (|G| (Array Int Int)) (|F| (Array Int Int)) (|C| Int) (|H| (Array Int Int)) (|.xiv.1| Int) (|.xiv.2| (Array Int Int)) (|.xiv.3| (Array Int Int)) (|.xiv.4| Int) (|.xiv.5| (Array Int Int))) (=> (and (state |E| |G| |F| |C| |H|) false) (state |.xiv.1| |.xiv.2| |.xiv.3| |.xiv.4| |.xiv.5|))))
(assert (forall ((|E| Int) (|G| (Array Int Int)) (|F| (Array Int Int)) (|C| Int) (|H| (Array Int Int)) (|.xiv.1| Int) (|.xiv.2| (Array Int Int)) (|.xiv.3| (Array Int Int)) (|.xiv.4| Int) (|.xiv.5| (Array Int Int))) (=> (state |E| |G| |F| |C| |H|) false)))
(check-sat)