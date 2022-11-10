(declare-var a (Array Int Int))
(declare-var c Bool)
(declare-var c1 Bool)
(declare-var x Int)

(declare-rel inv ((Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv ((as const (Array Int Int)) 0) true))

(rule (=> (and (inv a c) (= c1 (ite (> (select a x) 0)
                                    false
                                    true)))
          (inv a c1)))

(rule (=> (and (inv a c) (= c false)) fail))

(query fail)
