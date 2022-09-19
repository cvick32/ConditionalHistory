(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var j Int)
(declare-var k Int)
(declare-var i1 Int)
(declare-var n Int)

(declare-rel inv ((Array Int Int) Int Int Int Int))
(declare-rel fail ())

(rule (=> (and (> j 0) (> 0 k)) (inv a 1 j k n)))

(rule (=> (and (inv a i j k n) (< i n) (= (store a i (+ i (* j k))) a1) (= i1 (+ i 1))) (inv a1 i1 j k n)))

(rule (=> (and (inv a i j k n) (>= i n) (< 0 i1) (< i1 n) (not (< (select a i1) i1))) fail))

(query fail)
