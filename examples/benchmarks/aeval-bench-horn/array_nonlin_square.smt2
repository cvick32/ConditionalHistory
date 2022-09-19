(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var n Int)

(declare-rel inv ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv a 0 n))

(rule (=> (and (inv a i n) (< i n) (= i1 (+ i 1))
      (= a1 (store a i (* (select a i) (select a i))))) (inv a1 i1 n)))

(rule (=> (and (inv a i n) (>= i n) (< 0 i1) (< i1 n) (not (>= (select a i1) 0))) fail))

(query fail)
