(set-logic HORN)
(declare-fun inv ((Array Int Int) Int Int) Bool)
(declare-fun fail () Bool)
(assert (forall ((a (Array Int Int))) (! (inv a 0 0) :weight 0)))
(assert (forall ((a (Array Int Int))
         (j Int)
         (i Int)
         (a1 (Array Int Int))
         (i1 Int)
         (j1 Int))
  (! (=> (and (inv a i j) (= (store a i j) a1) (= j1 (+ j i)) (= i1 (+ i 1)))
         (inv a1 i1 j1))
     :weight 0)))
(assert (forall ((j Int) (i Int) (a (Array Int Int)) (i1 Int))
  (! (let ((a!1 (and (inv a i j) (< 0 i1) (< i1 i) (not (>= (select a i1) 0)))))
       (=> a!1 fail))
     :weight 0)))
(assert (not fail))
(check-sat)
