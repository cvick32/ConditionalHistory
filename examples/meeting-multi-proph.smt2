(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var b (Array Int Int))
(declare-var b1 (Array Int Int))

(declare-var x Bool)
(declare-var y Int)
(declare-var i Int)

(declare-rel inv ((Array Int Int) (Array Int Int) Int))
(declare-rel fail ())

(rule (inv ((as const (Array Int Int)) 0)
           ((as const (Array Int Int)) 1)))

(rule (=>
       (and (inv a b)
            (= a1 (store a i 1))
            (= b1 (ite x
                       (store b y (select a i))
                       (store b y (select a (+ i 1))))))
       (inv a1 b1)))

;; Use i here as a stand-in will be replaced by an immutable-var
(rule (=> (and (inv a b)
               (not (<= (select b i) 1)))
          fail))

(query fail)
