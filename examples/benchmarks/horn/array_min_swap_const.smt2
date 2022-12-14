(set-logic HORN)
(declare-fun inv ((Array Int Int) Int Int Int) Bool)
(declare-fun fail () Bool)
(assert (forall ((a (Array Int Int)) (i Int))
  (! (=> (>= i 0) (inv a i (+ i 1) 100000)) :weight 0)))
(assert (forall ((a (Array Int Int))
         (j Int)
         (a1 (Array Int Int))
         (i Int)
         (j1 Int)
         (N Int))
  (! (let ((a!1 (ite (> (select a i) (select a j))
                     (store (store a i (select a j)) j (select a i))
                     a)))
       (=> (and (inv a i j N) (< j N) (= a1 a!1) (= j1 (+ j 1)))
           (inv a1 i j1 N)))
     :weight 0)))
(assert (forall ((j Int) (N Int) (i Int) (a (Array Int Int)) (i1 Int))
  (! (let ((a!1 (and (inv a i j N)
                     (>= j N)
                     (< i i1)
                     (< i1 N)
                     (not (<= (select a i) (select a i1))))))
       (=> a!1 fail))
     :weight 0)))
(assert (not fail))
(check-sat)
