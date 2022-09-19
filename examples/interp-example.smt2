(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var i Int)
(declare-var N Int)

(declare-rel inv1 ((Array Int Int) (Array Int Int) Int Int))
(declare-rel inv2 ((Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (=> (> N 0) (inv1 a b 0 N)))

(rule (=>
       (and (inv1 a b i N)
            (< i N)
            (= a1 (store a i i))
            (= i1 (+ i 1)))
       (inv1 a1 b i1 N)))

(rule (=>
       (and (inv1 a b i N)
            (>= i N)
            (= i1 0))
       (inv2 a b i1 N)))

(rule (=>
       (and (inv2 a b i N)
            (< i N)
            (= i1 (+ i 1))
            (= b1 (store b i (- N (select a i)))))
       (inv2 a b1 i1 N)))

(rule (=>
       (and (inv2 a b i N)
            (>= i N)
            (>= i1 0)
            (< i1 N)
            (not (>= (select b (- N i1 1)) 0)))
      fail))

(query fail)
