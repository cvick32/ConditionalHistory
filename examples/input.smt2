(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var N Int)
(declare-var pc Int)

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
            (= pc 1)
            (= j1 (- j i))
            (= i1 (- i 1)))
       (inv a1 i1 j1 N pc1)))

(rule (=>
       (and (inv a i j N pc)
            (= pc 1)
            (<= i 0)
            (= i1 0)
            (= pc1 2))
       (inv a1 i1 j1 N pc1)))

(rule (=>
       (and
        (inv a i j N pc)
        (< i N)
        (= pc 2)
        (= (store a i j) a1)
        (= i1 (+ i 1)))
       (inv a1 i1 j1 N pc1)))

(rule (=> (and (inv a i j N pc)
               (= pc 2)
               (>= i N)
               (< 0 i1)
               (< i1 N)
               (not (<= (select a i1) N)))
          fail))

(query fail)
