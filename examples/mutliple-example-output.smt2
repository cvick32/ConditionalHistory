(declare-var a (Array Int (Array Int Int)))
(declare-var a1 (Array Int (Array Int Int)))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)
(declare-var M Int)
(declare-var N Int)
(declare-var Z Int)
(declare-var ZZ Int)

(declare-rel inv ((Array Int (Array Int Int)) Int Int Int Int))
(declare-rel fail ())

(rule (=> (and
           (= i 0)
           (= pc 1))
          (inv a i j M N Q)))

(rule (=> (and (inv a i j M N pc)
               (= pc 1)
               (< i M)
               (= j1 0)
               (= pc1 2))
          (inv a i j1 M N pc1)))

(rule (=> (and (inv a i j M N)
               (< j N)
               (= a1 (store a i (store (select a i) j 0)))
               (= j1 (+ j 1))
               (= pc 2))
          (inv a1 i j1 M N pc)))

(rule (=> (and
           (inv a i j M N pc)
           (= pc 2)
           (not (< j N))
           (= i1 (+ i 1))
           (= pc1 1))
          (inv a i1 j M N pc)))


(rule (=> (and
           (inv a i j M N pc)
           (not (< i M))
           (<= 0 Z)
           (< Z M)
           (<= 0 ZZ)
           (< ZZ N)
           (= pc 1)
           (not (= (select (select a Z) ZZ) 0)))
          fail))
