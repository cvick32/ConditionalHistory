(declare-var a (Array Int (Array Int Int)))
(declare-var a1 (Array Int (Array Int Int)))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var M Int)
(declare-var N Int)

(declare-rel inv1 ((Array Int (Array Int Int)) Int Int Int))
(declare-rel inv2 ((Array Int (Array Int Int)) Int Int Int Int))
(declare-rel fail ())

(rule (inv1 a 0 M N))

(rule (=> (and (inv1 a i M N) (< i M) (= i1 (+ i 1))) (inv2 a i 0 M N)))

(rule (=> (and (inv2 a i j M N)
  (< j N)
  (= a1 (store a i (store (select a i) j j)))
  (= j1 (+ j 1)))
  (inv2 a1 i j1 M N)))

(rule (=> (and (inv2 a i j M N) (not (< j N)) (= i1 (+ i 1))) (inv1 a i1 M N)))

(rule (=> (and (inv1 a i M N) (not (< i M)) (<= 0 i1) (< i1 M) (<= 0 j1) (< j1 N) (not (= (select (select a i1) j1) j1))) fail))

(query fail)
