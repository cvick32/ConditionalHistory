(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var N Int)

(declare-rel inv1 ((Array Int Int) Int Int))
(declare-rel inv2 ((Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (inv1 a 0 N))

(rule (=> (and (inv1 a i N) (< i N) (= i1 (+ i 1))) (inv2 a i i1 N)))

(rule (=> (and (inv2 a i j N)
  (< j N)
  (= a1 (ite
    (> (select a i) (select a j))
    (store (store a i (select a j)) j (select a i))
    a))
  (= j1 (+ j 1)))
  (inv2 a1 i j1 N)))

(rule (=> (and (inv2 a i j N) (not (< j N)) (= i1 (+ i 1))) (inv1 a i1 N)))

(rule (=> (and (inv1 a i N) (not (< i N)) (< 0 i1) (< i1 N) (< i1 j1) (< j1 N) (not (<= (select a i1) (select a j1)))) fail))

(query fail)
