(declare-var a (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var m Int)
(declare-var m1 Int)
(declare-var x Int)
(declare-var x1 Int)
(declare-var N Int)

; trivial case, does not even need quantifiers in the invariants
; should be solved within the bootstrapping

(declare-rel inv ((Array Int Int) Int Int Int Int))
(declare-rel fail ())

(rule (inv a 0 0 0 N))

(rule (=> (and (inv a i m x N) (< i N) (= x1 (ite (<= x (select a i)) x (select a i))) (= m1 (ite (<= m (select a i)) (select a i) m)) (= i1 (+ i 1))) (inv a i1 m1 x1 N)))

(rule (=> (and (inv a i m x N) (>= i N) (< 0 i1) (< i1 N) (not (<= x m))) fail))

(query fail)
