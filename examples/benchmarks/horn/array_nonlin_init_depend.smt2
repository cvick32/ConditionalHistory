(set-logic HORN)
(declare-fun inv ((Array Int Int) Int Int Int Int) Bool)
(declare-fun fail () Bool)
(assert (forall ((a (Array Int Int)) (C1 Int) (C2 Int) (n Int))
  (! (inv a 0 C1 C2 n) :weight 0)))
(assert (forall ((a (Array Int Int))
         (i Int)
         (a1 (Array Int Int))
         (i1 Int)
         (C1 Int)
         (C2 Int)
         (n Int))
  (! (let ((a!1 (store a i (+ (select a (- i 1)) C2))))
     (let ((a!2 (and (inv a i C1 C2 n)
                     (< i n)
                     (= a1 (ite (= i 0) (store a i C1) a!1))
                     (= i1 (+ i 1)))))
       (=> a!2 (inv a1 i1 C1 C2 n))))
     :weight 0)))
(assert (forall ((i Int) (n Int) (a (Array Int Int)) (C1 Int) (i1 Int) (C2 Int))
  (! (let ((a!1 (not (= (select a i1) (+ C1 (* i1 C2))))))
       (=> (and (inv a i C1 C2 n) (>= i n) (< 0 i1) (< i1 n) a!1) fail))
     :weight 0)))
(assert (not fail))
(check-sat)
