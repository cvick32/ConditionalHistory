(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var m Int)
(declare-var m1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) Int Int Int Int))
(declare-rel fail ())

(rule (=> (> N 0) (inv a 0 (- N 1) m N)))

(rule (=> (and (inv a i j m N)
    (< i N) (>= j 0)
    (= m1 (ite (= j (- N 1)) (select a j) (ite (> (select a j) m) (select a j) m)))
    (= a1 (ite (> (select a i) 0) (store a i (- (select a i))) a))
    (= i1 (+ i 1))
    (= j1 (- j 1)))
          (inv a1 i1 j1 m1 N)))

(rule (=> (and (inv a i j m N) (not (and (< i N) (>= j 0)))
    (< 0 i1) (< i1 N) (not (>= m (select a i1)))) fail))

(query fail)
