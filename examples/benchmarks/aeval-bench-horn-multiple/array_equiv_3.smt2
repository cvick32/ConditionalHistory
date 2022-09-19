(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var n Int)
(declare-var c Int)
(declare-rel inv0 ((Array Int Int) Int Int Int))
(declare-rel inv1 ((Array Int Int) (Array Int Int) Int Int Int))
(declare-rel fail ())

(rule (inv0 a 0 75 n))

(rule (=> (and
           (inv0 a i c n)
           (< i n)
           (= a1 (ite (< i 3) (store a i c) (store a i (select a (- i 3)))))
           (= i1 (+ i 1)))
          (inv0 a1 i1 c n)))

(rule (=> (and (inv0 a i c n)
               (not (< i n)))
          (inv1 a b 0 c n)))

(rule (=> (and
           (inv1 a b i c n)
           (< i n)
           (= b1 (store a i c))
           (= i1 (+ i 1)))
          (inv1 a b1 i1 c n)))

(rule (=> (and (inv1 a b i c n)
               (not (< i n))
               (<= 0 i1) (< i1 n)
               (not (= (select a i1) (select b i1))))
          fail))

(query fail)
