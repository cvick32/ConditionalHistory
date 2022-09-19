(set-logic HORN)
(declare-rel inv1 ( (Array Int Int) Int Int Int))(declare-rel inv2 ( (Array Int Int) (Array Int Int) Int Int Int))(declare-rel inv3 ( (Array Int Int) (Array Int Int) Int Int Int Int))(declare-rel fail ( ))(forall ((a (Array Int Int)) (j Int) (N Int))
  (! (inv1 a (- N 1) j N) ))(forall ((j Int) (i Int) (a (Array Int Int)) (i1 Int) (j1 Int) (N Int))
  (! (let ((a!1 (= j1 (ite (> j (select a i)) (select a i) j))))
       (=> (and (inv1 a i j N) (>= i 0) a!1 (= i1 (- i 1))) (inv1 a i1 j1 N)))
     ))(forall ((i Int) (a (Array Int Int)) (b (Array Int Int)) (j Int) (N Int))
  (! (=> (and (inv1 a i j N) (< i 0)) (inv2 a b 0 j N)) ))(forall ((b (Array Int Int))
         (i Int)
         (a (Array Int Int))
         (b1 (Array Int Int))
         (i1 Int)
         (j Int)
         (N Int))
  (! (let ((a!1 (store b i (- (select a (- N i1)) j))))
       (=> (and (inv2 a b i j N) (< i N) (= a!1 b1) (= i1 (+ i 1)))
           (inv2 a b1 i1 j N)))
     ))(forall ((i Int) (a (Array Int Int)) (b (Array Int Int)) (j Int) (N Int))
  (! (=> (and (inv2 a b i j N) (>= i N)) (inv3 a b 0 j 0 N)) ))(forall ((k Int)
         (i Int)
         (a (Array Int Int))
         (b (Array Int Int))
         (i1 Int)
         (j Int)
         (k1 Int)
         (N Int))
  (! (let ((a!1 (and (inv3 a b i j k N)
                     (< i N)
                     (= k1 (+ k (select b i)))
                     (= i1 (+ i 1)))))
       (=> a!1 (inv3 a b i1 j k1 N)))
     ))(forall ((a (Array Int Int))
         (b (Array Int Int))
         (j Int)
         (i Int)
         (N Int)
         (k Int))
  (! (=> (and (inv3 a b i j k N) (>= i N) (not (>= k 0))) fail) ))(assert (not fail))
(check-sat)