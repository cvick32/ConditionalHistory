(declare-var a (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var k Int)
(declare-var k1 Int)
(declare-var N Int)

(declare-rel inv1 ((Array Int Int) (Array Int Int) Int Int Int))

(declare-rel fail ())

(rule (inv1 a b 0 N 0))

(rule (=> (and (inv1 a b i N k)
	       (< i N)
	       (= k1 (ite (>= 0 (select a i)) (+ k 1) k))
	       (= b1 (ite (>= 0 (select a i)) (store b k (select a i)) b))
	       (= i1 (+ i 1)))
	  (inv1 a b1 i1 N k1)))

(rule (=> (and (inv1 a b i N k) (>= i N) (<= 0 i1) (< i1 k) (not (>= 0 (select b i1)))) fail))

(query fail)
