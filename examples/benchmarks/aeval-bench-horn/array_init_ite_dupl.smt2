(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var n Int)
(declare-var c Int)
(declare-var c1 Int)

(declare-rel inv ((Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (=> (>= c 0) (inv a 0 c n)))

(rule (=> (and (inv a i c n) (< i n)
      (= i1 (+ i 1))
      (= a1
         (ite
          (<= i c)
          (store (store a i c) c c)
          (store (store a i (select a (- i 1))) c c))))
    (inv a1 i1 c n)))

(rule (=> (and (inv a i c n) (>= i n) (<= 0 i1) (< i1 n) (not (= (select a i1) c))) fail))

(query fail)
