(set-logic HORN)
(declare-fun inv ((Array Int Int) Int Int) Bool)
(declare-fun fail () Bool)
(assert (forall ((a (Array Int Int))) (! (inv a 0 100000) :weight 0)))
(assert (forall ((a (Array Int Int)) (i Int) (a1 (Array Int Int)) (i1 Int) (N Int))
  (! (let ((a!1 (store (store (store a (* 3 i) 0) (+ (* 3 i) 1) 0)
                       (+ (* 3 i) 2)
                       0)))
       (=> (and (inv a i N) (<= i N) (= a1 a!1) (= i1 (+ i 1))) (inv a1 i1 N)))
     :weight 0)))
(assert (forall ((i Int) (N Int) (a (Array Int Int)) (i1 Int))
  (! (let ((a!1 (and (inv a i N)
                     (> i N)
                     (<= 0 i1)
                     (<= i1 (* N 3))
                     (not (>= (select a i1) 0)))))
       (=> a!1 fail))
     :weight 0)))
(assert (not fail))
(check-sat)
