(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv a (- N 1) 100000))

(rule (=> (and (inv a i N) (>= i 0) (= (store a i 1) a1) (= i1 (- i 1))) (inv a1 i1 N)))

(rule (=> (and (inv a i N) (< i 0) (< 0 i1) (< i1 N) (not (= (select a i1) 1))) fail))

(query fail)
