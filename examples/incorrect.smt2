(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var y Int)
(declare-var x Int)

(declare-rel inv ((Array Int Int) (Array Int Int) Int))
(declare-rel fail ())

(rule (inv ((as const (Array Int Int)) 0)
           ((as const (Array Int Int)) 1)))

(rule (=>
       (and (inv a b)
            (= a1 (store a x 1))
            (= b1 (store b y (select a x))))
       (inv a1 b1)))

(rule (=> (and (inv a b)
               (not (> (select b y) 2)))
          fail))

(query fail)
