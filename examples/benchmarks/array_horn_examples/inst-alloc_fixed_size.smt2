(set-info :origin "Dillig examples prepared by Andrey Rybalchenko")
(set-logic HORN)
(declare-fun inv1 ( Int Int Int Int) Bool)

(assert (forall ( (A (Array Int Int)) (I Int) (K Int) (N Int) (Q Int))
      (=> (= Q Q) (inv1 0 N Q (select A Q)))))

(assert (forall ( (A (Array Int Int)) (A1 (Array Int Int))
                 (C Int) (I Int) (N Int) (Q Int))
      (=> (and
           (= A1 (store A I 0))
	       (inv1 I N Q (select A Q))
           (< I N))
         (inv1 (+ I 1) N Q (select A1 Q)))))

(assert (forall ( (A (Array Int Int)) (A-K Int)
                  (C Int) (I Int) (K Int) (N Int))
      (=> (and
           (= (select A K) A-K)
           (< K N)
           (>= K 0)
	       (inv1 I N K A-K)
           (not (< I N)))
         (and (= 0 A-K)))))

(check-sat)
