(declare-var A (Array Int Int))
(declare-var A1 (Array Int Int))
(declare-var a Int)
(declare-var a1 Int)
(declare-var b Int)
(declare-var b1 Int)
(declare-var c Int)
(declare-var c1 Int)
(declare-var d Int)
(declare-var d1 Int)
(declare-var e Int)
(declare-var e1 Int)
(declare-var f Int)
(declare-var f1 Int)
(declare-var g Int)
(declare-var g1 Int)
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv1 ((Array Int Int) Int Int Int Int Int Int))
(declare-rel fail ())

(rule (inv1 A 0 0 0 0 0 N))

(rule (=> (and (inv1 A i a b c d N) (< i N)
    (= (store
      (store
        (store
          (store A i (+ i a))
          (+ i 1) (+ i b))
        (+ i 2) (+ i c))
      (+ i 3) (+ i d)) A1)
    (= i1 (+ i 4))
    (= a1 (+ i 1))
    (= b1 (+ a 1))
    (= c1 (+ b 1))
    (= d1 (+ c 1)))
  (inv1 A1 i1 a1 b1 c1 d1 N)))

(rule (=> (and (inv1 A i a b c d N) (>= i N) (<= 0 i1) (< i1 N) (not (>= (select A i1) 0))) fail))

(query fail)
