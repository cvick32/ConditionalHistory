;here '2*S' represents 'SIZE' of original program

(declare-var S Int)
(declare-var i Int)
(declare-var i1 Int)
(declare-var a (Array Int Int))
(declare-var acopy (Array Int Int))
(declare-var acopy1 (Array Int Int))
(declare-var acopy2 (Array Int Int))

(declare-rel inv ((Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (=> (> S 1) (inv a acopy 0 S)))

(rule (=> (and
           (inv a acopy i S)
           (< i S)
           (= (store acopy (- (* 2 S) (+ i 1)) (select a (- (* 2 S) (+ i 1)))) acopy1)
           (= (store acopy1 i (select a i)) acopy2)
           (= i1 (+ i 1)))
          (inv a acopy2 i1 S)))

(rule (=> (and (inv a acopy i S) (not (< i S)) (<= 0 i1) (< i1 (* 2 S))
               (not (= (select acopy i1) (select a i1)))) fail))

(query fail)
