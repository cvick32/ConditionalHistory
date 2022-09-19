(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv a 0 N))

(rule (=> (and (inv a i N) (< i (* 2 N))
    (= (ite (< i N) (store a i -1) (store a i 1)) a1)
    (= i1 (+ i 1)))
  (inv a1 i1 N)))

(rule (=> (and (inv a i N) (>= i (* 2 N)) (<= 0 i1) (< i1 N)
  (not (= (+ (select a i1) (select a (+ N i1))) 0))) fail))

(query fail)
