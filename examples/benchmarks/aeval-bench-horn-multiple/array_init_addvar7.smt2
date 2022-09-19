(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var j Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv1 ((Array Int Int) Int Int))
(declare-rel inv2 ((Array Int Int) Int Int))
(declare-rel inv3 ((Array Int Int) Int Int))
(declare-rel inv4 ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv1 a 0 N))

(rule (=> (and (inv1 a i N)
               (< i N)
               (< j i)
               (= (store a i j) a1)
               (= i1 (+ i 1)))
          (inv1 a1 i1 N)))

(rule (=> (and (inv1 a i N)
               (>= i N))
          (inv2 a 0 N)))

(rule (=> (and (inv2 a i N)
               (< i N)
               (< j i)
               (= (store a i (+ (select a i) j)) a1)
               (= i1 (+ i 1)))
          (inv2 a1 i1 N)))

(rule (=> (and (inv2 a i N) (>= i N)) (inv3 a 0 N)))

(rule (=> (and (inv3 a i N) (< i N) (> j i) (= (store a i (- (select a i) j)) a1) (= i1 (+ i 1))) (inv3 a1 i1 N)))

(rule (=> (and (inv3 a i N) (>= i N)) (inv4 a 0 N)))

(rule (=> (and (inv4 a i N) (< i N) (> j i) (= (store a i (- (select a i) j)) a1) (= i1 (+ i 1))) (inv4 a1 i1 N)))

(rule (=> (and (inv4 a i N) (>= i N) (< 0 i1) (< i1 N) (not (< (select a i1) i1))) fail))

(query fail)
