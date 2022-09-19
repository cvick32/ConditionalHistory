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

(rule (=> (and (inv1 a i N) (< i N) (= a1 (store a i 0))) (inv2 a1 i 0 N)))

(rule (=> (and (inv2 a i j N)
    (< j i)
    (= a1 (store a i (* 2 (select a i))))
    (= j1 (+ j 1)))
  (inv2 a1 i j1 N)))

(rule (=> (and (inv2 a i j N) (not (< j i)) (= i1 (+ i 1))) (inv1 a i1 N)))

(rule (=> (and (inv1 a i N) (not (< i N)) (< 0 i1) (< i1 N) (not (>= (select a i1) 0))) fail))

(query fail)
