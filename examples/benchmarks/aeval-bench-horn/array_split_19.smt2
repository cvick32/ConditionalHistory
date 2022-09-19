(declare-var a (Array Int Int))
(declare-var b (Array Int Int))
(declare-var c (Array Int Int))
(declare-var c1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var x Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) (Array Int Int) (Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (inv a b c 0 1 N))

(rule (=> (and (inv a b c x i N) (< i N)
    (= c1 (ite  (< i 500)
                c
                (store c i (+ x (select a i) (select b i)))))
    (= i1 (+ i 1)))
  (inv a b c1 x i1 N)))

(rule (=> (and (inv a b c x i N) (>= i N) (<= 500 i1) (< i1 N)
  (not (= (select c i1) (+ (select a i1) (select b i1))))) fail))

(query fail)
