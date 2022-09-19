(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var N Int)

(declare-rel inv ((Array Int Int)))
(declare-rel fail ())

(rule (inv (store a 0 0)))

(rule (=> (and (inv a)
               (= a1 (store a 0 (+ 1 (select a 0)))))
          (inv a1)))

(rule (=> (and
           (inv a)
           (= N N)
           (not (>= (select a 0) 0)))
          fail))

(query fail)
