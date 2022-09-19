(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv a b 0 777777))

(rule (=> (and (inv a b i N) (< i N) (= i1 (+ i 1))
    (= (store a i i) a1)
    (= (store b i (- N i)) b1))    (inv a1 b1 i1 N)))

(rule (=> (and (inv a b i N) (>= i N) (< 0 i1) (< i1 N) (not (= N (+ (select a i1) (select b i1))))) fail))

(query fail)
