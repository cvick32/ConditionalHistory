(declare-var a (Array Int Int))
(declare-var b (Array Int Int))
(declare-var c (Array Int Int))
(declare-var c1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var x Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv a (store c 0 0) 1 N))

(rule (=> (and (inv a c i N) (< i (* 2 N))
    (= c1 (ite (< i N)
               (store c i (select c (- i 1)))
               (store c i (+ (select c (- i N)) (select a i)))))
    (= i1 (+ i 1)))
  (inv a c1 i1 N)))

(rule (=> (and (inv a c i N) (>= i (* 2 N)) (<= N i1) (< i1 (* 2 N))
  (not (= (select c i1) (select a i1)))) fail))

(query fail)
