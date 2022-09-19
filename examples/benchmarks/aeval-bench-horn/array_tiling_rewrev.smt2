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

(rule (=> (and (> S 1) (= val1 7) (=  val2 3) (= low 2) (= i (- S 2)))
          (inv a i S val1 val2 low)))

(rule (=> (and
           (inv a i S val1 val2 low)
           (<= -1 i)
           (= i1 (- i 1))
           (= a1 (ite (<= 0 i) (store a i val1) a))
           (= a2 (store a1 (+ i 1) val2)))
          (inv a2 i1 S val1 val2 low)))

(rule (=> (and
           (inv a i S val1 val2 low)
           (not (<= -1 i))
           (<= 0 i1)
           (< i1 S)
           (not (<= low (select a i1))))
          fail))

(query fail)
