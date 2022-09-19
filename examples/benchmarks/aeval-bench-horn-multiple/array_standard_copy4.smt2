(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var c (Array Int Int))
(declare-var c1 (Array Int Int))
(declare-var d (Array Int Int))
(declare-var d1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)
(declare-var x Int)

(declare-rel inv1 ((Array Int Int) Int Int))
(declare-rel inv2 ((Array Int Int) (Array Int Int) Int Int))
(declare-rel inv3 ((Array Int Int) (Array Int Int) (Array Int Int) Int Int))
(declare-rel inv4 ((Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) Int Int))

(declare-rel fail ())

(rule (inv1 a 0 N))

(rule (=> (and (inv1 a i N) (< i N) (= (store a i x) a1) (= i1 (+ i 1))) (inv1 a1 i1 N)))

(rule (=> (and (inv1 a i N) (>= i N)) (inv2 a b 0 N)))

(rule (=> (and (inv2 a b i N) (< i N) (= (store b i (select a i)) b1) (= i1 (+ i 1))) (inv2 a b1 i1 N)))

(rule (=> (and (inv2 a b i N) (>= i N)) (inv3 a b c 0 N)))

(rule (=> (and (inv3 a b c i N) (< i N) (= (store c i (select b i)) c1) (= i1 (+ i 1))) (inv3 a b c1 i1 N)))

(rule (=> (and (inv3 a b c i N) (>= i N)) (inv4 a b c d 0 N)))

(rule (=> (and (inv4 a b c d i N) (< i N) (= (store d i (select c i)) d1) (= i1 (+ i 1))) (inv4 a b c d1 i1 N)))

(rule (=> (and (inv4 a b c d i N) (>= i N) (<= 0 i1) (< i1 N) (not (= (select d i1) (select a i1)))) fail))

(query fail)
