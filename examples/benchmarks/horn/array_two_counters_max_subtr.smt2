(set-logic HORN)
(declare-fun inv ((Array Int Int) Int Int Int Int) Bool)
(declare-fun fail () Bool)
(assert (forall ((a (Array Int Int)) (m Int) (N Int))
  (! (=> (> N 0) (inv a 0 (- N 1) m N)) :weight 0)))
(assert (forall ((m Int)
         (a (Array Int Int))
         (i Int)
         (j Int)
         (a1 (Array Int Int))
         (i1 Int)
         (j1 Int)
         (m1 Int)
         (N Int))
  (! (let ((a!1 (ite (= j (- N 1))
                     (select a j)
                     (ite (> (select a j) m) (select a j) m)))
           (a!2 (ite (> (select a i) 0) (store a i (- (select a i))) a)))
       (=> (and (inv a i j m N)
                (< i N)
                (>= j 0)
                (= m1 a!1)
                (= a1 a!2)
                (= i1 (+ i 1))
                (= j1 (- j 1)))
           (inv a1 i1 j1 m1 N)))
     :weight 0)))
(assert (forall ((i Int) (j Int) (N Int) (m Int) (a (Array Int Int)) (i1 Int))
  (! (let ((a!1 (and (inv a i j m N)
                     (not (and (< i N) (>= j 0)))
                     (< 0 i1)
                     (< i1 N)
                     (not (>= m (select a i1))))))
       (=> a!1 fail))
     :weight 0)))
(assert (not fail))
(check-sat)