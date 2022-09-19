(declare-var p (Array Int Int))
(declare-var g (Array Int Int))
(declare-var i Int)
(declare-var j Int)
(declare-var i1 Int)
(declare-var j1 Int)

(declare-rel inv1 ((Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv1 p g 0 0))

(rule (=> (and (inv1 p g i j) (= j 0) (= j1 (ite (= (select p i) (select g i)) 0 1)) (= i1 (+ i 1))) (inv1 p g i1 j1)))

(rule (=> (and (inv1 p g i j) (not (= j 0)) (<= 0 i1) (< i1 (- i 1)) (not (= (select p i1) (select g i1)))) fail))

(query fail)
