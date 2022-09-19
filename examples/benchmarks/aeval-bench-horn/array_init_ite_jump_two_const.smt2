(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var a2 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)
(declare-var val1 Int)
(declare-var val2 Int)

(declare-rel inv ((Array Int Int) Int Int Int Int))
(declare-rel fail ())

(rule (inv a 0 7 13 100000))

(rule (=> (and (inv a i val1 val2 N) (<= i N)
    (= a1 (ite (= val1 i) (store a i 0) (ite (= val2 i) (store a i 10) (store a i i))))
    (= i1 (+ i 1)))
(inv a1 i1 val1 val2 N)))

(rule (=> (and (inv a i val1 val2 N) (> i N) (<= 0 i1) (<= i1 N)
    (not (and (not (= (select a i1) val1)) (not (= (select a i1) val2))))) fail))

(query fail)
