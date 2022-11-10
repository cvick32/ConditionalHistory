(set-logic HORN)
(declare-fun inv ((Array Int Int) Int Int Int) Bool)
(declare-fun fail () Bool)
(assert (forall ((a (Array Int Int)) (N Int)) (! (inv a 0 0 N) :weight 0)))
(assert (forall ((m Int) (i Int) (a (Array Int Int)) (i1 Int) (m1 Int) (N Int))
  (! (let ((a!1 (= m1 (ite (<= m (select a i)) m (select a i)))))
       (=> (and (inv a i m N) (< i N) a!1 (= i1 (+ i 1))) (inv a i1 m1 N)))
     :weight 0)))
(assert (forall ((i Int) (N Int) (m Int) (a (Array Int Int)) (i1 Int))
  (! (let ((a!1 (and (inv a i m N)
                     (>= i N)
                     (< 0 i1)
                     (< i1 N)
                     (not (<= m (select a i1))))))
       (=> a!1 fail))
     :weight 0)))
(assert (not fail))
(check-sat)
