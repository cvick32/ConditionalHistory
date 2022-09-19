(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var n Int)
(declare-var k Int)

(declare-rel inv ((Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (=> (and (<= 0 k) (< k n)) (inv a 0 n k)))

(rule (=> (and (inv a i n k) (< i n) (= (ite (< i k) (store a i i) a) a1) (= i1 (+ i 1))) (inv a1 i1 n k)))

(rule (=> (and (inv a i n k) (>= i n) (<= 0 i1) (< i1 n) (< i1 k) (not (= (select a i1) i1))) fail))

(query fail)
