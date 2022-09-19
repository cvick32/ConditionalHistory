(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))
(declare-var c (Array Int Int))
(declare-var c1 (Array Int Int))
(declare-var x Int)
(declare-var y Int)
(declare-var w Int)

(declare-rel inv ((Array Int Int) (Array Int Int) Int))
(declare-rel fail ())

(rule (inv ((as const (Array Int Int)) 0)
           ((as const (Array Int Int)) 1)
           ((as const (Array Int Int)) 1)))

(rule (=>
       (and (inv a b c)
            (> x 0)
            (> y 0)
            (> w 0)
            (= a1 (store a x 1))
            (= b1 (store b y (select a x)))
            (= c1 (store c w (select a x))))
       (inv a1 b1 c1)))

;; Use y here as a stand-in will be replaced by an immutable-var
(rule (=> (and (inv a b c)
               (and
                (not (<= (select b y) 1))
                (not (<= (select c y) 1))))
          fail))

(query fail)
