(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var min Int)
(declare-var min1 Int)
(declare-var max Int)
(declare-var max1 Int)

(declare-var N Int)

(declare-rel inv1 ((Array Int Int) Int Int Int Int))
(declare-rel inv2 ((Array Int Int) (Array Int Int) Int Int Int Int))
(declare-rel fail ())

(rule (inv1 a 0 min max N))

(rule (=> (and (inv1 a i min max N) (< i N)
    (= min1 (ite (> min (select a i)) (select a i) min))
    (= max1 (ite (< max (select a i)) (select a i) max))
    (= i1 (+ i 1))) (inv1 a i1 min1 max1 N)))

(rule (=> (and (inv1 a i min max N) (>= i N)) (inv2 a b 0 min max N)))

(rule (=> (and (inv2 a b i min max N) (< i N) (= (store b i (+ (select a i) (- max min))) b1) (= i1 (+ i 1))) (inv2 a b1 i1 min max N)))

(rule (=> (and (inv2 a b i min max N) (>= i N) (< 0 i1) (< i1 N) (not (>= (select b i1) (select a i1)))) fail))

(query fail)
