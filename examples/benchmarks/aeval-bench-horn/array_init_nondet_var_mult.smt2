(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var j Int)
(declare-var i1 Int)
(declare-var n Int)

(declare-rel inv ((Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (=> (> j 0) (inv a 1 j n)))

(rule (=> (and (inv a i j n) (< i n) (= (store a i (* i j)) a1) (= i1 (+ i 1))) (inv a1 i1 j n)))

(rule (=> (and (inv a i j n) (>= i n) (< 0 i1) (< i1 n) (not (>= (select a i1) i1))) fail))

(query fail)
