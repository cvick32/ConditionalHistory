(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var c (Array Int Int))
(declare-var c1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var min Int)
(declare-var min1 Int)
(declare-var max Int)
(declare-var max1 Int)

(declare-var N Int)

(declare-rel inv1 ((Array Int Int) Int Int Int))
(declare-rel inv2 ((Array Int Int) (Array Int Int) Int Int Int))
(declare-rel inv3 ((Array Int Int) (Array Int Int)  (Array Int Int) Int Int Int))

(declare-rel fail ())

(rule (inv1 a 0 min N))

(rule (=> (and (inv1 a i max N) (< i N)
    (= max1 (ite (< max (select a i)) (select a i) max))
    (= i1 (+ i 1))) (inv1 a i1 max1 N)))

(rule (=> (and (inv1 a i max N) (>= i N)) (inv2 a b 0 max N)))

(rule (=> (and (inv2 a b i max N) (< i N)
    (= (store b i (- (select a i))) b1) (= i1 (+ i 1))) (inv2 a b1 i1 max N)))

(rule (=> (and (inv2 a b i max N) (>= i N)) (inv3 a b c 0 max N)))

(rule (=> (and (inv3 a b c i max N) (< i N)
    (= (store c i (- (select b i))) c1) (= i1 (+ i 1))) (inv3 a b c1 i1 max N)))

(rule (=> (and (inv3 a b c i max N) (>= i N) (< 0 i1) (< i1 N) (not (<= (select c i1) max))) fail))

(query fail)
