(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) (Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (inv a b 0 (- N 1) N))

(rule (=> (and (inv a b i j N)
    (< i N) (>= j 0)
    (= a1 (store a i 1))
    (= b1 (store b j 1))
    (= i1 (+ i 1))
    (= j1 (- j 1))) (inv a1 b1 i1 j1 N)))

(rule (=> (and (inv a b i j N) (not (and (< i N) (>= j 0))) (< 0 i1) (< i1 N)
  (not (= (select a i1) (select b i1)))) fail))

(query fail)


;qvits[invNum]
