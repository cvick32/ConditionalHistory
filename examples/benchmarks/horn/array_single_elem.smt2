(set-logic HORN)
(declare-fun inv ((Array Int Int) Int Int) Bool)
(declare-fun fail () Bool)
(assert (forall ((a (Array Int Int)) (N Int)) (=> (> N 150) (inv a 0 N))))
(assert (forall ((a (Array Int Int)) (i Int) (a1 (Array Int Int)) (i1 Int) (N Int))
  (let ((a!1 (and (inv a i N)
                  (< i N)
                  (= a1 (ite (= i 143) (store a i 0) a))
                  (= i1 (+ i 1)))))
    (=> a!1 (inv a1 i1 N)))))
(assert (forall ((i Int) (N Int) (a (Array Int Int)))
  (let ((a!1 (and (inv a i N) (>= i N) (not (= (select a 143) 0)))))
    (=> a!1 fail))))
(assert (not fail))
(check-sat)