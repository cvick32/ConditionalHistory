(declare-var a (Array Int Int))
(declare-var b (Array Int Int))
(declare-var c (Array Int Int))
(declare-var c1 (Array Int Int))
(declare-var i Int)
(declare-var j Int)
(declare-var i1 Int)
(declare-var j1 Int)
(declare-var N Int)

(declare-rel inv1 ((Array Int Int) (Array Int Int) (Array Int Int) Int Int Int))

(declare-rel fail ())

(rule (inv1 a b c 0 N 0))

(rule (=> (and (inv1 a b c i N j)
        (< i N)
        (= j1 (ite (= (select a i) (select b i)) (+ j 1) j))
        (= c1 (ite (= (select a i) (select b i)) (store c j i) c))
        (= i1 (+ i 1))) (inv1 a b c1 i1 N j1)))

(rule (=> (and (inv1 a b c i N j) (>= i N) (<= 0 i1) (< i1 j) (not (>= (select c i1) i1))) fail))

(query fail)
