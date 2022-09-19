(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var n Int)
(declare-var C1 Int)
(declare-var C2 Int)

(declare-rel inv ((Array Int Int) Int Int Int Int))
(declare-rel fail ())

(rule (inv a 0 C1 C2 n))

(rule (=> (and (inv a i C1 C2 n) (< i n)
  (= a1 (ite (= i 0) (store a i C1) (store a i (+ (select a (- i 1)) C2))))
  (= i1 (+ i 1))) (inv a1 i1 C1 C2 n)))

(rule (=> (and (inv a i C1 C2 n) (>= i n) (< 0 i1) (< i1 n) (not (= (select a i1) (+ C1 (* i1 C2))))) fail))

(query fail)
