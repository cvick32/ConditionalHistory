(set-logic HORN)
(declare-rel inv1 ( (Array Int (Array Int Int)) (Array Int (Array Int Int)) Int Int Int))(declare-rel inv2 ( (Array Int (Array Int Int)) (Array Int (Array Int Int)) Int Int Int Int))(declare-rel fail ( ))(forall ((a (Array Int (Array Int Int)))
         (b (Array Int (Array Int Int)))
         (M Int)
         (N Int))
  (! (inv1 a b 0 M N) ))(forall ((a (Array Int (Array Int Int)))
         (b (Array Int (Array Int Int)))
         (i Int)
         (M Int)
         (N Int))
  (! (=> (and (inv1 a b i M N) (< i M)) (inv2 a b i 0 M N)) ))(forall ((a (Array Int (Array Int Int)))
         (j Int)
         (a1 (Array Int (Array Int Int)))
         (b (Array Int (Array Int Int)))
         (i Int)
         (j1 Int)
         (M Int)
         (N Int))
  (! (let ((a!1 (store a i (store (select a i) j (select (select b i) j)))))
       (=> (and (inv2 a b i j M N) (< j N) (= a1 a!1) (= j1 (+ j 1)))
           (inv2 a1 b i j1 M N)))
     ))(forall ((j Int)
         (i Int)
         (a (Array Int (Array Int Int)))
         (b (Array Int (Array Int Int)))
         (i1 Int)
         (M Int)
         (N Int))
  (! (=> (and (inv2 a b i j M N) (not (< j N)) (= i1 (+ i 1)))
         (inv1 a b i1 M N))
     ))(forall ((i Int)
         (M Int)
         (N Int)
         (a (Array Int (Array Int Int)))
         (b (Array Int (Array Int Int)))
         (i1 Int)
         (j1 Int))
  (! (let ((a!1 (not (= (select (select a i1) j1) (select (select b i1) j1)))))
       (=> (and (inv1 a b i M N)
                (not (< i M))
                (<= 0 i1)
                (< i1 M)
                (<= 0 j1)
                (< j1 N)
                a!1)
           fail))
     ))(assert (not fail))
(check-sat)