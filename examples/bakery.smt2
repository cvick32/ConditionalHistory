(declare-var num (Array Int Int))
(declare-var num1 (Array Int Int))
(declare-var crit (Array Int Int))
(declare-var crit1 (Array Int Int))

(declare-var min Int)
(declare-var max Int)
(declare-var j Int)

(declare-rel inv ((Array Int Int) Int))
(declare-rel fail ())

(rule (=> (and (= num ((as const (Array Int Int)) 0))
               (= max 0)
               (= min 0))
          (inv num max N)))

(rule (=>
       (and (inv num max N)
            (>= j 0)
            (< j N)
            (= num1 (ite (= (select num j) 0)
                         (store num j (+ max 1))
                         num))
            (= max1 (ite (= (select num j) 0)
                         (+ max 1)
                         max))
            ( 
       (inv a1 b1)))

(rule (=> (and (inv a b)
               (not (<= (select b i) 1)))
          fail))

(query fail)
