(declare-var a (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var n Int)

(declare-rel inv ((Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv a b 0 n))

(rule (=> (and (inv a b i n) (< i n) (= (store b i (select a (- n i1))) b1) (= i1 (+ i 1))) (inv a b1 i1 n)))

(rule (=> (and (inv a b i n) (>= i n) (<= 0 i1) (< i1 n) (not (= (select a i1) (select b (- n i1 1))))) fail))

(query fail)
