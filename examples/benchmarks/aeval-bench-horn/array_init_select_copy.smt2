(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv a b 0 N))

(rule (=> (and (inv a b i N) (< i N)
  (= a1 (ite (= i 0) (store a i 0)
    (ite (>= (select b i) 0)
      (store a i (select b i))
      (store a i (select a (- i 1))))))
  (= i1 (+ i 1)))
  (inv a1 b i1 N)))

(rule (=> (and (inv a b i N) (>= i N) (<= 0 i1) (< i1 N)
  (not (>= (select a i1) 0))) fail))

(query fail)
