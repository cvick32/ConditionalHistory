(declare-var S Int)
(declare-var i Int)
(declare-var i1 Int)
(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var a2 (Array Int Int))
(declare-var val1 Int)
(declare-var val2 Int)
(declare-var low Int)

(declare-rel inv ((Array Int Int) Int Int Int Int Int))
(declare-rel fail ())

(rule (=> (and (> S 1) (= val1 0) (=  val2 3) (= low 2) (= i 0))
          (inv a i S val1 val2 low)))

(rule (=> (and
           (inv a i S val1 val2 low)
           (< i S)
           (= i1 (+ i 1))
           (= a1 (ite (< (+ i 1) S) (store a (+ i 1) val1) a))
           (= a2 (store a1 i val2)))
          (inv a2 i1 S val1 val2 low)))

(rule (=> (and
           (inv a i S val1 val2 low)
           (not (< i S))
           (<= 0 i1)
           (< i1 S)
           (not (<= low (select a i1))))
          fail))

(query fail)
