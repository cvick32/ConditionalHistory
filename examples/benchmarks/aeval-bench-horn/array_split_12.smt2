(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var y Int)
(declare-var y1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (inv a 1000 0 N))

(rule (=> (and (inv a y i N) (< i N)
    (= y1 (ite (< i 500) (- y 1) (+ y 1)))
    (= a1 (store a i (+ i y)))
    (= i1 (+ i 1)))
  (inv a1 y1 i1 N)))

(rule (=> (and (inv a y i N) (>= i N) (<= 500 i1) (< i1 N)
    (not (= (* 2 i1) (select a i1)))) fail))

(query fail)

