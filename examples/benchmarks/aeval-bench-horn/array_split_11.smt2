(declare-var a (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var min Int)
(declare-var min1 Int)
(declare-var max Int)
(declare-var max1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) (Array Int Int) Int Int Int Int))
(declare-rel fail ())

(rule (=> (> N 0) (inv a b min max 0 N)))

(rule (=> (and (inv a b min max i N) (< i (* 2 N))
    (= min1 (ite (= i 0) (select a i) (ite (<= min (select a i)) min (select a i))))
    (= max1 (ite (= i 0) (select a i) (ite (>= max (select a i)) max (select a i))))
    (= b1 (ite (< i N) (store b i min1) (store b i max1)))
    (= i1 (+ i 1)))
  (inv a b1 min1 max1 i1 N)))

(rule (=> (and (inv a b min max i N) (>= i (* 2 N)) (not (<= (select b 0) (select b (- (* 2 N) 1))))) fail))

(query fail)

