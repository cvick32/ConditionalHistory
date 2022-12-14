(set-logic HORN)
(declare-fun inv ((Array Int Int) Int Int Int Int) Bool)
(declare-fun fail () Bool)
(assert (forall ((a (Array Int Int)) (i Int) (S Int) (defval Int) (fixval Int))
  (! (=> (and (> S 0) (= defval 0) (= fixval 10) (= i 1))
         (inv a i S defval fixval))
     :weight 0)))
(assert (forall ((a (Array Int Int))
         (val2 Int)
         (a1 (Array Int Int))
         (i Int)
         (val1 Int)
         (a2 (Array Int Int))
         (i1 Int)
         (S Int)
         (defval Int)
         (fixval Int))
  (! (let ((a!1 (ite (= 0 val2)
                     (store a (- (* 2 i) 2) 10)
                     (store a (- (* 2 i) 2) val2)))
           (a!2 (ite (= 0 val1)
                     (store a1 (- (* 2 i) 1) 10)
                     (store a1 (- (* 2 i) 1) val1))))
       (=> (and (inv a i S defval fixval)
                (<= i (* 1 S))
                (= i1 (+ i 1))
                (= a1 a!1)
                (= a2 a!2))
           (inv a2 i1 S defval fixval)))
     :weight 0)))
(assert (forall ((defval Int) (fixval Int) (i Int) (S Int) (a (Array Int Int)) (i1 Int))
  (! (let ((a!1 (not (not (= (select a i1) 0)))))
     (let ((a!2 (and (inv a i S defval fixval)
                     (not (<= i (* 1 S)))
                     (<= 0 i1)
                     (< i1 (* 2 S))
                     a!1)))
       (=> a!2 fail)))
     :weight 0)))
(assert (not fail))
(check-sat)
