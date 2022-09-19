(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var N Int)

(declare-rel inv1 (Int Int Int))
(declare-rel inv2 ((Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (=> (> N 0) (inv1 N N N)))

(rule (=> (and
           (inv1 i j N)
           (> i 0)
           (= j1 (- j i))
           (= i1 (- i 1)))
          (inv1 i1 j1 N)))

(rule (=> (and
           (inv1 i j N)
           (<= i 0))
          (inv2 a j 0 N)))

(rule (=> (and
           (inv2 a j i N)
           (< i N)
           (= (store a i j) a1)
           (= i1 (+ i 1)))
          (inv2 a1 j i1 N)))

(rule (=> (and
           (inv2 a j i N)
           (>= i N)
           (< 0 i1)
           (< i1 N)
           (not (<= (select a i1) N)))
          fail))

(query fail)

;; After transformations have been made, we expect:

(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) Int Int Int Int))
(declare-rel fail ())

(rule (=> (and
           (> N 0)
           (= i N)
           (= j N)
           (= pc 1))
          (inv a i j N pc)))

(rule (=>
       (and (inv a i j N pc)
            (> i 0)
            (= j1 (- j i))
            (= i1 (- i 1)))
       (inv a i1 j1 N pc))) ; notice that i and j switch here 

(rule (=>
       (and (inv a i j N pc)
            (= pc 1)
            (<= i 0)
            (= i1 0)
            (= pc1 2))
       (inv a i1 j N pc1)))

(rule (=>
       (and
        (inv a i j N pc)
        (< i N)
        (= (store a i j) a1)
        (= i1 (+ i 1)))
       (inv a1 i1 j N pc)))

(rule (=> (and (inv a i j N pc)
               (= pc 2)
               (>= i N)
               (< 0 i1)
               (< i1 N)
               (not (<= (select a i1) N)))
          fail))

(query fail)

