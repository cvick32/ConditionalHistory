(set-logic HORN)
(declare-fun inv ((Array Int Int) Int) Bool)
(declare-fun fail () Bool)
(assert (forall ((a (Array Int Int))) (! (inv a 0) :weight 0)))
(assert (forall ((a (Array Int Int)) (i Int) (a1 (Array Int Int)) (i1 Int))
  (! (=> (and (inv a i) (= (store a i i) a1) (= i1 (+ i 1))) (inv a1 i1))
     :weight 0)))
(assert (forall ((i Int) (a (Array Int Int)) (i1 Int))
  (! (let ((a!1 (and (inv a i) (< 0 i1) (< i1 i) (not (= (select a i1) i1)))))
       (=> a!1 fail))
     :weight 0)))
(assert (not fail))
(check-sat)
