(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var n Int)

(declare-rel inv ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv a 0 n))

(rule (=> (and (inv a i n) (< i n) (= i1 (+ i 1))
      (= (ite (= (select a i) i)
              (ite (= (select a i) 0) (store a i (+ i (select a i)))
                    (store a i i)) (store a i i)) a1)) (inv a1 i1 n)))

(rule (=> (and (inv a i n) (>= i n) (< 0 i1) (< i1 n) (not (= (select a i1) i1))) fail))

(query fail)
