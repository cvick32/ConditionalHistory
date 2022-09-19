(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var i2 Int)

; very tricky query

(declare-rel inv ((Array Int Int) Int))
(declare-rel fail ())

(rule (=> (= a (store (store a 0 0) 1 1)) (inv a 2)))

(rule (=> (and (inv a i) (= (store a i i) a1) (= i1 (+ i 1))) (inv a1 i1)))

(rule (=> (and (inv a i) (< 0 i2) (< i2 i) (not (< (select a (- i2 1)) (select a i2)))) fail))

(query fail)
