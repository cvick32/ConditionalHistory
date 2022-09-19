(declare-var A (Array Int Int))
(declare-var B (Array Int Int))
(declare-var I Int)
(declare-var N Int)
(declare-var A1 (Array Int Int))
(declare-var I1 Int)
(declare-var pc Int)
(declare-var Z Int)

(rule (=> (and
           (= I 0)
           (= pc 1)
           ) (inv A B I N pc)))
(rule (=> (and
           (= A1 (store A I (select B I)))
           (= I1 (+ I 1))
           (inv A B I N pc)
           (>= (select B I) 0)
           (< I N)
           (= pc 1)
           (= pc1 1)) (inv A1 B I1 N pc1)))

(rule (=> (and
           (inv A B I N pc)
           (= pc 1)
           (< Z N)
           (>= Z 0)
           (not (< I N))
           (not (and (<= 0 (select A Z))
                     (<= (select A Z) (select B Z)))))
          fail))

