(declare-var a (Array Int Int))
(declare-var b (Array Int Int))
(declare-var c (Array Int Int))
(declare-var c1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var n Int)

(declare-rel inv ((Array Int Int) (Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv a b c 0 n))

(rule (=> (and (inv a b c i n) (< i n) (= (store c i (+ (select a i) (select b i))) c1) (= i1 (+ i 1))) (inv a b c1 i1 n)))

(rule (=> (and (inv a b c i n) (>= i n) (< 0 i1) (< i1 n) (not (= (+ (select a i1) (select b i1)) (select c i1)))) fail))

(query fail)
