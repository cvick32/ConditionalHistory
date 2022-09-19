(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var N Int)

(declare-rel inv1 ((Array Int Int) (Array Int Int) Int Int Int))
(declare-rel inv2 ((Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv1 a b 0 (- N 1) N))

(rule (=> (and (inv1 a b i j N)
    (< i N) (>= j 0)
    (= a1 (store a i 0))
    (= b1 (store b j 1))
    (= j1 (- j 1)) (= i1 (+ i 1)))
  (inv1 a1 b1 i1 j1 N)))

(rule (=> (and (inv1 a b i j N)
               (or (>= i N) (< j 0)))
          (inv2 a b 0 N)))

(rule (=> (and (inv2 a b i N) (< i N)
    (= a1 (store a i (+ (select a i) (select b i))))
    (= i1 (+ i 1)))
          (inv2 a1 b i1 N)))

(rule (=> (and (inv2 a b i N) (>= i N) (<= 0 i1) (< i1 N)
  (not (= (select a i1) 1))) fail))

(query fail)
