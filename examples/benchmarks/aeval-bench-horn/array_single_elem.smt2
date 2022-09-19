(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (=> (> N 150) (inv a 0 N)))

(rule (=> (and (inv a i N) (< i N) (= a1 (ite (= i 143) (store a i 0) a)) (= i1 (+ i 1))) (inv a1 i1 N)))

(rule (=> (and (inv a i N) (>= i N) (not (= (select a 143) 0))) fail))

(query fail)
