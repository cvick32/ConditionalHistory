(declare-var A (Array Int Int))
(declare-var A1 (Array Int Int))
(declare-var C Int)
(declare-var N Int)
(declare-var I Int)
(declare-var K Int)
(declare-var pc Int)

(rule (=> (and (= pc 1)
               (= I 0))
          (inv A C I N pc)))

(rule (=> (and
           (= A1 (store A I C))
           (inv A C I N pc)
           (< I N)
           (= I1 (+ I 1))
           (= pc 1)
           (= pc1 1))
          (inv A1 C I1 N pc1)))

(rule (=> (and
           (inv A C I N pc)
           (= pc 1)
           (< K N)
           (>= K 0)
           (>= C 0)
           (not (< I N))
           (not (and (<= 0 (select A K))
                     (<= (select A K) C))))
          fail))
