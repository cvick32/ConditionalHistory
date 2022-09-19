(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var k Int)
(declare-var k1 Int)
(declare-var N Int)

; tricky case, challenging for FreqHorn

(declare-rel inv1 ((Array Int Int) Int Int))
(declare-rel inv2 ((Array Int Int) Int Int Int Int))
(declare-rel fail ())

(rule (inv1 a 0 N))

(rule (=> (and (inv1 a i N) (< i N)) (inv2 a i 0 1 N)))

(rule (=> (and (inv2 a i j k N)
    (< j i)
    (= k1 (+ k (select a j)))
    (= j1 (+ j 1)))
  (inv2 a i j1 k1 N)))

(rule (=> (and (inv2 a i j k N) (not (< j i)) (= a1 (store a i k)) (= i1 (+ i 1))) (inv1 a1 i1 N)))

(rule (=> (and (inv1 a i N) (not (< i N)) (< 0 i1) (< i1 N) (not (>= (select a i1) 1))) fail))

(query fail)
