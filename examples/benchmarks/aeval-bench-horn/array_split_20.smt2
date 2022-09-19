(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var c (Array Int Int))
(declare-var c1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) (Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv (store a 0 0) b c 1 N))

(rule (=> (and (inv a b c i N) (< i (* 2 N))
    (= a1 (ite (< i N) (store a i (select a (- i 1)))
              (store a i (+ (select a (- i N)) (select b i) (select c i)))))
    (= i1 (+ i 1)))
  (inv a1 b c i1 N)))

(rule (=> (and (inv a b c i N) (not (< i (* 2 N))) (<= N i1) (< i1 (* 2 N))
  (not (= (select a i1) (+ (select b i1) (select c i1))))) fail))

(query fail)
