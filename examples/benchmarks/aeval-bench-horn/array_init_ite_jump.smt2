(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var a2 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)
(declare-var val Int)

(declare-rel inv ((Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (inv a 0 7 N))

(rule (=> (and (inv a i val N) (<= i N)
    (= a1 (ite (= val i) (store a i 0) (store a i i)))
    (= i1 (+ i 1)))
(inv a1 i1 val N)))

(rule (=> (and (inv a i val N) (> i N) (<= 0 i1) (<= i1 N) (= (select a i1) val)) fail))

(query fail)
