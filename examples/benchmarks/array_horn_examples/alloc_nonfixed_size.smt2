(set-info :origin "QARMC benchmarks by Andrey Rybalchenko")
(set-logic HORN)
(declare-fun inv1 ( Int Int Int Int Int Int) Bool)
(assert (forall ( (A (Array Int Int)) (B (Array Int Int)) (I Int) (K Int) (N Int) (Q Int)) 
       (=> (= I 0) (inv1 I K N Q (select A Q) (select B Q)))))

(assert (forall ((A (Array Int Int)) (A1 (Array Int Int)) 
                 (B (Array Int Int)) (B-I Int) (I Int) (I1 Int) 
                 (K Int) (N Int) (Q Int)) 
       (=> 
        (and 
         (= A1 (store A I B-I)) 
         (= (select B I) B-I) 
         (= I1 (+ I 1)) 
         (forall ((Q Int)) (inv1 I K N Q (select A Q) (select B Q))) 
         (< I N)) 
        (inv1 I1 K N Q (select A1 Q) (select B Q)))))

(assert (forall ( (A (Array Int Int)) (A-K Int) (B (Array Int Int)) 
                  (B-K Int) (I Int) (K Int) (N Int) (Q Int)) 
       (=> 
        (and 
         (>= B-K 0) 
         (= (select B K) B-K) 
         (= (select A K) A-K) 
         (< K N) 
         (>= K 0) 
         (>= N 0) 
         (forall ((Q Int)) (inv1 I K N Q (select A Q) (select B Q))) 
         (not (< I N))) 
      (and (<= 0 A-K) (<= A-K B-K)))))
(check-sat)
