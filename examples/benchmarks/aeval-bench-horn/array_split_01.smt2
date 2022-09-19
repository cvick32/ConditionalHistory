(declare-var a (Array Int Int))
(declare-var c (Array Int Int))
(declare-var c1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv ((Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv a c 0 N))

(rule (=> (and (inv a c i N)
               (< i N)
               (= c1 (ite (< i 500)
                          (store c i (select a i))
                          (store c i i)))
               (= i1 (+ i 1)))
          (inv a c1 i1 N)))

(rule (=> (and (inv a c i N)
               (>= i N)
               (<= 500 i1)
               (< i1 N)
               (not (= i1 (select c i1))))
          fail))

(query fail)
