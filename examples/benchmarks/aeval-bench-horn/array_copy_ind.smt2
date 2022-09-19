(declare-var a (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)

(declare-rel inv ((Array Int Int) (Array Int Int) Int))
(declare-rel fail ())

(rule (inv a b 0))

(rule (=> (and (inv a b i) (= (store b i (select a i)) b1) (= i1 (+ i 1))) (inv a b1 i1)))

(rule (=> (and (inv a b i) (< 0 i1) (< i1 i) (not (= (select a i1) (select b i1)))) fail))

(query fail)
