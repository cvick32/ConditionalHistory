(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var sum Int)
(declare-var sum1 Int)
(declare-var N Int)

(declare-rel inv1 ((Array Int Int) Int Int))
(declare-rel inv2 ((Array Int Int) (Array Int Int) Int Int))
(declare-rel inv3 ((Array Int Int) (Array Int Int) Int Int Int))

(declare-rel fail ())

(rule (inv1 a 0 N))

(rule (=> (and (inv1 a i N) (< i N)
    (= i1 (+ i 1))
    (= (store a i i) a1)) (inv1 a1 i1 N)))

(rule (=> (and (inv1 a i N) (not (< i N))) (inv2 a b 0 N)))

(rule (=> (and (inv2 a b i N) (< i N)
    (= i1 (+ i 1))
    (= (store b (- N i1) i) b1)) (inv2 a b1 i1 N)))

(rule (=> (and (inv2 a b i N) (not (< i N))) (inv3 a b 0 0 N)))

(rule (=> (and (inv3 a b i sum N) (< i N)
    (= i1 (+ i 1))
    (= sum1 (+ sum (- (select a i) (select b (- N i1)))))) (inv3 a b i1 sum1 N)))

(rule (=> (and (inv3 a b i sum N) (>= i N) (not (= sum 0))) fail))

(query fail)
