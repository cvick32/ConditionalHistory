(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var n Int)

(declare-rel inv ((Array Int Int) (Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (inv a b 0 (- n 1) n))

(rule (=> (and (inv a b i j n) (< i n) (>= j 0) (= (store a i i) a1) (= (store b j j) b1) (= i1 (+ i 1)) (= j1 (- j 1))) (inv a1 b1 i1 j1 n)))

(rule (=> (and (inv a b i j n) (or (>= i n) (< j 0)) (<= 0 i1) (< i1 n) (not (= (select a i1) (select b i1)))) fail))

(query fail)
