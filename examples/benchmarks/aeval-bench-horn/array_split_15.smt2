(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv (store a 0 0) 1 N))

(rule (=> (and (inv a i N) (< i N)
    (= a1 (ite (<= (select a (- i 1)) 10)
        (store a i (+ 1 (select a (- i 1))))
        (store a i 100)))
    (= i1 (+ i 1)))
  (inv a1 i1 N)))

(rule (=> (and (inv a i N) (>= i N) (< 11 i1) (< i1 N)
  (not (= (select a i1) 100))) fail))

(query fail)
