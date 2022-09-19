(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (=> (>= i 0) (inv a i (+ i 1) N)))

(rule (=> (and (inv a i j N)
      (< j N)
      (= a1 (ite
          (> (select a i) (select a j))
          (store (store a i (select a j)) j (select a i))
          a))
      (= j1 (+ j 1)))
  (inv a1 i j1 N)))

(rule (=> (and (inv a i j N) (>= j N) (< i i1) (< i1 N) (not (<= (select a i) (select a i1)))) fail))

(query fail)
