(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var n Int)
(declare-var c Int)

(declare-rel inv ((Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (inv a 0 c n))

(rule (=> (and (inv a i c n) (< i n)
  (= a1 (ite (= i 0) (store a i c) (store a i (+ 1 (select a (- i 1))))))
  (= i1 (+ i 1))) (inv a1 i1 c n)))

(rule (=> (and (inv a i c n) (>= i n) (< 0 i1) (< i1 n) (not (= (select a i1) (+ c i1)))) fail))

(query fail)
