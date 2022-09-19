(declare-var A (Array Int Int))
(declare-var B (Array Int Int))
(declare-var I Int)
(declare-var N Int)
(declare-var Q Int)
(declare-var AI Int)
(declare-var B1 (Array Int Int))
(declare-var I1 Int)
(declare-var BI Int)
(declare-var pc Int)
(declare-var Z Int)

(rule (=> (and
           (= I 0)
           (= pc 1)
           ) (inv A B I N Q pc)))

(rule (=> (and
           (inv A B I N Q pc)
           (= B1 (store B I (select A I)))
           (= I1 (+ I 1))
           (< I N)
           (= pc 1)
           (= pc1 1))
          (inv A B1 I1 N Q pc1)))

(rule (=> (and
           (= I1 0)
           (inv A B I N Q pc)
           (>= I N)
           (= pc 1)
           (= pc1 2)
           ) (inv A B I1 N Q pc1)))

(rule (=> (and
           (= I1 (+ I 1))
           (inv A B I N Q pc)
           (< I N)
           (= pc 2)
           (= pc1 2)
           ) (inv A B I1 N Q pc1)))

(rule (=> (and
           (inv A B I N Q pc)
           (= pc 2)
           (< Z N)
           (>= Z 0)
           (not (= (select B Z) (select A Z)))
           ) fail))
