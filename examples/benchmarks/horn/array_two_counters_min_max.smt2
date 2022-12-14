(set-logic HORN)
(declare-fun inv ((Array Int Int) Int Int Int Int Int) Bool)
(declare-fun fail () Bool)
(assert (forall ((a (Array Int Int)) (m Int) (n Int) (N Int))
  (! (=> (> N 0) (inv a 0 (- N 1) m n N)) :weight 0)))
(assert (forall ((m Int)
         (n Int)
         (i Int)
         (j Int)
         (a (Array Int Int))
         (i1 Int)
         (j1 Int)
         (m1 Int)
         (n1 Int)
         (N Int))
  (! (let ((a!1 (ite (= i 0)
                     (select a i)
                     (ite (> (select a i) m) (select a i) m)))
           (a!2 (ite (= j (- N 1))
                     (select a j)
                     (ite (< (select a j) n) (select a j) n))))
       (=> (and (inv a i j m n N)
                (< i N)
                (>= j 0)
                (= m1 a!1)
                (= n1 a!2)
                (= i1 (+ i 1))
                (= j1 (- j 1)))
           (inv a i1 j1 m1 n1 N)))
     :weight 0)))
(assert (forall ((a (Array Int Int)) (i Int) (N Int) (j Int) (m Int) (n Int))
  (! (let ((a!1 (and (inv a i j m n N)
                     (not (and (< i N) (>= j 0)))
                     (not (>= m n)))))
       (=> a!1 fail))
     :weight 0)))
(assert (not fail))
(check-sat)
