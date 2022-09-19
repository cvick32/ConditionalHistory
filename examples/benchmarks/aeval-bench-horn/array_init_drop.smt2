(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv (store a 0 0) 0 N))

(rule (=> (and (inv a i N) (< i N)
    (= a1 (ite (= (select a i) i) (store a i i) (store a i (- (select a (- i 1)) 1))))
    (= i1 (+ i 1)))
  (inv a1 i1 N)))

(rule (=> (and (inv a i N) (>= i N) (<= 0 i1) (< i1 N)
  (not (<= (select a i1) i1))) fail))

(query fail)

