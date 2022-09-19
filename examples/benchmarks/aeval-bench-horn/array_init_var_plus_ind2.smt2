(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var k Int)
(declare-var k1 Int)

(declare-rel inv ((Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (inv a 0 0 0))

(rule (=> (and (inv a i j k) (= (store a i j) a1) (= j1 (+ j i)) (= k1 (- k i)) (= i1 (+ i 1))) (inv a1 i1 j1 k1)))

(rule (=> (and (inv a i j k) (< 0 i1) (< i1 i) (not (>= (select a i1) k))) fail))

(query fail)
