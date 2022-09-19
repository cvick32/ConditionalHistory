(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var c (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var N Int)

(declare-rel inv1 ((Array Int Int) (Array Int Int) (Array Int Int) Int Int))
(declare-rel inv2 ((Array Int Int) (Array Int Int) (Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (inv1 a ((as const (Array Int Int)) 1) ((as const (Array Int Int)) 2) 0 N))

(rule (=> (and (inv1 a b c i N) (< i N)) (inv2 a b c i 0 N)))

(rule (=> (and (inv2 a b c i j N)
    (< j N)
    (= a1 (ite (= i 0) (store a j (select b j)) (store a j (+ (select a j) (select c j)))))
    (= j1 (+ j 1)))
  (inv2 a1 b c i j1 N)))

(rule (=> (and (inv2 a b c i j N) (not (< j N)) (= i1 (+ i 1))) (inv1 a b c i1 N)))

(rule (=> (and (inv1 a b c i N) (not (< i N)) (<= 0 i1) (< i1 N) (not (> (select a i1) 0))) fail))

(query fail)
