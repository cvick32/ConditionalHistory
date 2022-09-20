(set-logic HORN)
(declare-rel inv1 ( (Array Int Int) (Array Int Int) Int Int Int))(declare-rel inv2 ( (Array Int Int) (Array Int Int) Int Int))(declare-rel fail ( ))(forall ((a (Array Int Int)) (b (Array Int Int)) (N Int))
  (! (inv1 a b 0 (- N 1) N) ))(forall ((a (Array Int Int))
         (b (Array Int Int))
         (j Int)
         (i Int)
         (a1 (Array Int Int))
         (b1 (Array Int Int))
         (i1 Int)
         (j1 Int)
         (N Int))
  (! (=> (and (inv1 a b i j N)
              (< i N)
              (>= j 0)
              (= a1 (store a i 0))
              (= b1 (store b j 1))
              (= j1 (- j 1))
              (= i1 (+ i 1)))
         (inv1 a1 b1 i1 j1 N))
     ))(forall ((i Int) (j Int) (a (Array Int Int)) (b (Array Int Int)) (N Int))
  (! (=> (and (inv1 a b i j N) (or (>= i N) (< j 0))) (inv2 a b 0 N)) ))(forall ((a (Array Int Int))
         (i Int)
         (a1 (Array Int Int))
         (b (Array Int Int))
         (i1 Int)
         (N Int))
  (! (let ((a!1 (= a1 (store a i (+ (select a i) (select b i))))))
       (=> (and (inv2 a b i N) (< i N) a!1 (= i1 (+ i 1))) (inv2 a1 b i1 N)))
     ))(forall ((b (Array Int Int)) (i Int) (N Int) (a (Array Int Int)) (i1 Int))
  (! (let ((a!1 (and (inv2 a b i N)
                     (>= i N)
                     (<= 0 i1)
                     (< i1 N)
                     (not (= (select a i1) 1)))))
       (=> a!1 fail))
     ))(assert (not fail))
(check-sat)