(declare-var a (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var c (Array Int Int))
(declare-var c1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) (Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv a b c 0 N))

(rule (=> (and (inv a b c i N) (< i N)
    (= (ite (= (mod i 2) 0) (store b i (select a i)) b) b1)
    (= (ite (= (mod i 2) 0) c (store c i (select a i))) c1)
    (= i1 (+ i 1)))
  (inv a b1 c1 i1 N)))

(rule (=> (and (inv a b c i N) (>= i N) (<= 0 i1) (< i1 N)
  (not (or (= (select a i1) (select b i1)) (= (select a i1) (select c i1))))) fail))

(query fail)
