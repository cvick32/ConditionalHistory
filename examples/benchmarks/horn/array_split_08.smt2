(set-logic HORN)
(declare-fun inv ((Array Int Int) (Array Int Int) Int Int) Bool)
(declare-fun fail () Bool)
(assert (forall ((c (Array Int Int)) (N Int))
  (! (inv ((as const (Array Int Int)) 0) c 0 N) :weight 0)))
(assert (forall ((c (Array Int Int))
         (i Int)
         (a (Array Int Int))
         (c1 (Array Int Int))
         (i1 Int)
         (N Int))
  (! (let ((a!1 (ite (< i 100)
                     (store c i (+ i (select a i)))
                     (store c i (select c (- i 1))))))
       (=> (and (inv a c i N) (< i N) (= c1 a!1) (= i1 (+ i 1)))
           (inv a c1 i1 N)))
     :weight 0)))
(assert (forall ((a (Array Int Int)) (i Int) (N Int) (c (Array Int Int)) (i1 Int))
  (! (let ((a!1 (and (inv a c i N)
                     (>= i N)
                     (<= 100 i1)
                     (< i1 N)
                     (not (= 99 (select c i1))))))
       (=> a!1 fail))
     :weight 0)))
(assert (not fail))
(check-sat)
