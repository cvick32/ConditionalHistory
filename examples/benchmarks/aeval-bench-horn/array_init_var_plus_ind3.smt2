(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)

(declare-rel inv ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv a 0 0))

(rule (=> (and (inv a i j) (= (store a i j) a1) (= j1 (- j i)) (= i1 (+ i 1))) (inv a1 i1 j1)))

(rule (=> (and (inv a i j) (< 3 i1) (< i1 i) (not (>= 0 (select a i1)))) fail))

(query fail)
