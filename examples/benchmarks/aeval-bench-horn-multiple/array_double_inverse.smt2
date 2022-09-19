(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var c (Array Int Int))
(declare-var c1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv1 ((Array Int Int) (Array Int Int) Int Int))
(declare-rel inv2 ((Array Int Int) (Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv1 a b 0 N))

(rule (=> (and (inv1 a b i N) (< i N) (= (store b i (select a (- N i1))) b1) (= i1 (+ i 1))) (inv1 a b1 i1 N)))

(rule (=> (and (inv1 a b i N) (>= i N)) (inv2 a b c 0 N)))

(rule (=> (and (inv2 a b c i N) (< i N) (= (store c i (select b (- N i1))) c1) (= i1 (+ i 1))) (inv2 a b c1 i1 N)))

(rule (=> (and (inv2 a b c i N) (>= i N) (<= 0 i1) (< i1 N) (not (= (select a i1) (select c i1)))) fail))

(query fail)
