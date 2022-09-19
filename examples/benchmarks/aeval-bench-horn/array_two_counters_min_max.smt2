(declare-var a (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var m Int)
(declare-var m1 Int)
(declare-var n Int)
(declare-var n1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) Int Int Int Int Int))
(declare-rel fail ())

(rule (=> (> N 0) (inv a 0 (- N 1) m n N)))

(rule (=> (and (inv a i j m n N)
    (< i N) (>= j 0)
    (= m1 (ite (= i 0) (select a i) (ite (> (select a i) m) (select a i) m)))
    (= n1 (ite (= j (- N 1)) (select a j) (ite (< (select a j) n) (select a j) n)))
    (= i1 (+ i 1))
    (= j1 (- j 1))) (inv a i1 j1 m1 n1 N)))

(rule (=> (and (inv a i j m n N) (not (and (< i N) (>= j 0))) (not (>= m n))) fail))

(query fail)
