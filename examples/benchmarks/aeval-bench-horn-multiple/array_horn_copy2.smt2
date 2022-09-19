(declare-var A (Array Int Int))
(declare-var A1 (Array Int Int))
(declare-var B (Array Int Int))
(declare-var I Int)
(declare-var I1 Int)
(declare-var N Int)
(declare-var Z Int)

(declare-rel inv1 ((Array Int Int) (Array Int Int) Int Int))
(declare-rel inv2 ((Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (=> (= I 0) (inv1 A B I N)))

(rule (=>
       (and
        (inv1 A B I N)
        (= A1 (store A I (select B I)))
        (= I1 (+ I 1))
        (< I N))
       (inv1 A1 B I1 N)))

(rule (=>
       (and
        (>= I N)
        (= I1 0)
        (inv1 A B I N))
       (inv2 A B I1 N)))

(rule (=>
       (and
        (= I1 (+ I 1))
        (inv2 A B I N)
        (< I N))
       (inv2 A B I1 N)))

(rule (=>
       (and
        (inv2 A B I N)
        (>= Z 0)
        (< Z N)
        (not (= (select A Z)
                (select B Z))))
       fail))

(query fail)
