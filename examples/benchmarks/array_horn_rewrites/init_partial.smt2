(declare-var A (Array Int Int))
(declare-var C Int)
(declare-var I Int)
(declare-var N Int)
(declare-var Q Int)
(declare-var A1 (Array Int Int))
(declare-var I1 Int)
(declare-var W Int)
(declare-var pc Int)
(declare-var Z Int)
(rule (=> (and
           (= I 0)
           (<= C N)
           (= pc 1)
           ) (inv A C I N Q pc)))
(rule (=> (and
           (= A1 (store A I 0))
           (= I1 (+ I 1))
           (inv A C I N Q pc)
           (< I C)
           (= pc 1)
           (= pc1 1))
          (inv A1 C I1 N Q pc1)))

(rule (=> (and
           (= I1 0)
           (inv A C I N Q pc)
           (>= I C)
           (= pc 1)
           (= pc1 2)
           ) (inv A C I1 N Q pc1)))
(rule (=> (and
           (= I1 (+ I 1))
           (inv A C I N Q pc)
           (< I C)
           (= pc 2)
           (= pc1 2)
           ) (inv A C I1 N Q pc1)))
(rule (=> (and
           (inv A C I N Q pc)
           (= pc 2)
           (< Z C)
           (>= Z 0)
           (not (= (select A Z) 0))
           ) fail))
