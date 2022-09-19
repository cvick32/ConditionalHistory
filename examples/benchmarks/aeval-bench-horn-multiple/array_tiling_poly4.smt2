(declare-var S Int)
(declare-var i Int)
(declare-var i1 Int)
(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))

(declare-rel inv1 ((Array Int Int) Int Int))
(declare-rel inv2 ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (=> (> S 1) (inv1 a 0 S)))

(rule (=> (and (inv1 a i S) (< i S) (= (store a i (+ (* (+ i 1) (- i 1)) 2)) a1) (= i1 (+ i 1))) (inv1 a1 i1 S)))

(rule (=> (and (inv1 a i S) (not (< i S))) (inv2 a 0 S)))

(rule (=> (and (inv2 a i S) (< i S) (= (store a i (- (select a i) 1)) a1) (= i1 (+ i 1))) (inv2 a1 i1 S)))

(rule (=> (and (inv2 a i S) (not (< i S)) (<= 0 i1) (< i1 S) (not (= (select a i1) (* i1 i1)))) fail))

(query fail)
