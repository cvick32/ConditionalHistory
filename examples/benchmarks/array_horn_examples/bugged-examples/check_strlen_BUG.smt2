(set-info :origin "QARMC benchmarks by Andrey Rybalchenko")
(set-logic HORN)
(declare-fun inv1 ( Int Int) Bool)
(declare-fun inv2 ( Int Int) Bool)
(assert (forall ( (I Int) (N Int)) (=> (and (= I 0) (>= N 0)) (inv1 I N))))
(assert (forall ( (I Int) (I1 Int) (N Int)) (=> (and (= I1 (+ I 1)) (inv1 I N) (< I N)) (inv1 I1 N))))
(assert (forall ( (I Int) (I1 Int) (N Int)) (=> (and (= I1 (+ I 1)) (inv1 I N) (>= I N)) (inv2 I1 N))))
(assert (forall ( (I Int) (N Int)) (=> (inv2 I N) (= I N))))
(check-sat)
