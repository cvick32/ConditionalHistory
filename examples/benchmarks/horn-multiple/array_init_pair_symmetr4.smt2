(set-logic HORN)
(declare-rel inv1 ( (Array Int Int) (Array Int Int) Int Int))(declare-rel inv2 ( (Array Int Int) (Array Int Int) (Array Int Int) Int Int))(declare-rel fail ( ))(forall ((a (Array Int Int)) (b (Array Int Int)) (N Int))
  (! (inv1 a b 0 N) ))(forall ((a (Array Int Int))
         (b (Array Int Int))
         (x Int)
         (i Int)
         (a1 (Array Int Int))
         (b1 (Array Int Int))
         (i1 Int)
         (N Int))
  (! (let ((a!1 (and (inv1 a b i N)
                     (< i N)
                     (= (store a i x) a1)
                     (> x 0)
                     (= (store b i (* x i)) b1)
                     (= i1 (+ i 1)))))
       (=> a!1 (inv1 a1 b1 i1 N)))
     ))(forall ((i Int)
         (a (Array Int Int))
         (b (Array Int Int))
         (c (Array Int Int))
         (N Int))
  (! (=> (and (inv1 a b i N) (>= i N)) (inv2 a b c 0 N)) ))(forall ((c (Array Int Int))
         (i Int)
         (a (Array Int Int))
         (b (Array Int Int))
         (c1 (Array Int Int))
         (i1 Int)
         (N Int))
  (! (let ((a!1 (= (store c i (- (select b i) (select a i))) c1)))
       (=> (and (inv2 a b c i N) (< i N) a!1 (= i1 (+ i 1))) (inv2 a b c1 i1 N)))
     ))(forall ((a (Array Int Int))
         (b (Array Int Int))
         (i Int)
         (N Int)
         (c (Array Int Int))
         (i1 Int))
  (! (let ((a!1 (and (inv2 a b c i N)
                     (>= i N)
                     (< 0 i1)
                     (< i1 N)
                     (not (>= (select c i1) 0)))))
       (=> a!1 fail))
     ))(assert (not fail))
(check-sat)