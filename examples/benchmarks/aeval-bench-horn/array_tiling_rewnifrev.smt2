(declare-var S Int)
(declare-var i Int)
(declare-var i1 Int)
(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var a2 (Array Int Int))

(declare-rel inv ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (=> (and (> S 1) (= i (- S 1)))
          (inv a i S)))

(rule (=> (and
           (inv a i S)
           (<= 0 i)
           (= i1 (- i 1))
           (= a1 (ite (<= 0 (- i 1)) (store a (- i 1) (- i 2)) a))
           (= a2 (store a1 i i)))
          (inv a2 i1 S)))

(rule (=> (and
           (inv a i S)
           (not (<= 0 i))
           (<= 0 i1)
           (< i1 S)
           (not (<= i1 (select a i1))))
          fail))

(query fail)
