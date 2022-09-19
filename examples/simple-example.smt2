(declare-var a (Array Int Int))

(declare-rel inv ((Array Int Int)))
(declare-rel fail ())

(rule (inv ((as const (Array Int Int)) 0)))

(rule (=>
       (and (inv a))
       (inv a)))

(rule (=> (and (inv a)
               (>= Z 0)
               (not (= (select a Z) 0)))
          fail))

(query fail)
