(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var a2 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (inv a 0 (- N 1) N))

(rule (=> (and (inv a i j N)
    (< i N) (>= j 0)
    (= a1 (ite (= (select a i) 0) (store a i 5) a))
    (= a2 (ite (= (select a1 j) 1) (store a1 j 3) a1))
    (= i1 (+ i 1))
    (= j1 (- j 1))) (inv a2 i1 j1 N)))

(rule (=> (and (inv a i j N) (not (and (< i N) (>= j 0)))
    (<= 0 i1) (< i1 N) (or (= (select a i1) 0) (= (select a i1) 1))) fail))

(query fail)
