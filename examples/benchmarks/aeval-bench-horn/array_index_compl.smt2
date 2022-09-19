(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv (store a 0 1) 0 N))

(rule (=> (and (inv a i N) (< i N) (= a1 (store a (+ i 1) (+ 1 (select a i)))) (= i1 (select a i))) (inv a1 i1 N)))

(rule (=> (and (inv a i N) (= 1 1) (< i 0)) fail))

(query fail)
