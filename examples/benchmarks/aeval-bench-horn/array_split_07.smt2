(declare-var a (Array Int Int))
(declare-var b (Array Int Int))
(declare-var c (Array Int Int))
(declare-var c1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) (Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv a b c 0 N))

(rule (=> (and (inv a b c i N) (< i N)
    (= c1 (ite (< i 100) (store c i (select a i)) (store c i (select b i))))
    (= i1 (+ i 1)))
  (inv a b c1 i1 N)))

(rule (=> (and (inv a b c i N) (>= i N) (<= 100 i1) (< i1 N)
  (not (= (select b i1) (select c i1)))) fail))

(query fail)
