(set-logic HORN)
(declare-fun inv1
             (Int Int Int Int Int Int (Array Int Int) (Array Int Int))
             Bool)
(declare-fun fail () Bool)
(assert (forall ((I Int)
         (K Int)
         (N Int)
         (M Int)
         (P Int)
         (Q Int)
         (A (Array Int Int))
         (B (Array Int Int)))
  (! (=> (= I N) (inv1 I K N M P Q A B)) :weight 0)))
(assert (forall ((W Int)
         (I Int)
         (A (Array Int Int))
         (I1 Int)
         (K Int)
         (N Int)
         (M Int)
         (P Int)
         (Q Int)
         (A1 (Array Int Int))
         (B (Array Int Int)))
  (! (let ((a!1 (and (= A1 (store A I W))
                     (= (select B (- I N)) W)
                     (= I1 (+ I 1))
                     (< I (+ N M))
                     (inv1 I K N M P Q A B))))
       (=> a!1 (inv1 I1 K N M P Q A1 B)))
     :weight 0)))
(assert (forall ((P Int)
         (Q Int)
         (I Int)
         (M Int)
         (A (Array Int Int))
         (B (Array Int Int))
         (K Int)
         (N Int))
  (! (let ((a!1 (not (= (select A K) (select B (- K N))))))
     (let ((a!2 (and (< K (+ N M))
                     (>= K N)
                     (inv1 I K N M P Q A B)
                     (not (< I (+ N M)))
                     a!1)))
       (=> a!2 fail)))
     :weight 0)))
