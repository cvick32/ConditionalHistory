(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))

(declare-var y Int)

(declare-rel inv ((Array Int Int) (Array Int Int) Int))
(declare-rel fail ())

(rule (inv ((as const (Array Int Int)) 0))

(rule (=>
       (and (inv a)
            (= a1 (store a y 0)))
       (inv a1)))

(rule (=> (and (inv a)
               (not (>= (select a y) 0)))
          fail))

(query fail)
