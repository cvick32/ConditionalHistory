(set-logic HORN)
(declare-fun inv ((Array Int Int) Int Int Int) Bool)
(declare-fun fail () Bool)
(assert (forall ((a (Array Int Int)) (c Int) (n Int)) (! (inv a 0 c n) :weight 0)))
(assert (forall ((a (Array Int Int))
         (i Int)
         (a1 (Array Int Int))
         (i1 Int)
         (c Int)
         (n Int))
  (! (let ((a!1 (ite (= i 0) (store a i c) (store a i (select a (- i 1))))))
       (=> (and (inv a i c n) (< i n) (= a1 a!1) (= i1 (+ i 1)))
           (inv a1 i1 c n)))
     :weight 0)))
(assert (forall ((i Int) (n Int) (a (Array Int Int)) (i1 Int) (c Int))
  (! (let ((a!1 (and (inv a i c n)
                     (>= i n)
                     (<= 0 i1)
                     (< i1 n)
                     (not (= (select a i1) c)))))
       (=> a!1 fail))
     :weight 0)))
(assert (not fail))
(check-sat)
