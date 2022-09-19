(declare-var a (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var m Int)
(declare-var m1 Int)

(declare-rel inv ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv a 0 0))

(rule (=> (and (inv a i m) (= m1 (ite (<= m (select a i)) m (select a i))) (= i1 (+ i 1))) (inv a i1 m1)))

(rule (=> (and (inv a i m) (< 0 i1) (< i1 i) (not (<= m (select a i1)))) fail))

(query fail)
