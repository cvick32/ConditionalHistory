(declare-var S Int)
(declare-var i Int)
(declare-var i1 Int)
(declare-var a (Array Int Int))
(declare-var acopy (Array Int Int))
(declare-var acopy1 (Array Int Int))
(declare-var acopy2 (Array Int Int))
(declare-var acopy3 (Array Int Int))
(declare-var acopy4 (Array Int Int))


(declare-rel inv ((Array Int Int) (Array Int Int) Int Int))
(declare-rel fail ())

(rule (=> (and (<= 1 S) (= i 0)) (inv a acopy i S)))

(rule (=> (and
           (inv a acopy i S)
           (< i (* 1 S))
           (= acopy1 (store acopy (- (* 4 S) (+ i 1)) (select a (- (* 4 S) (+ i 1)))))
           (= acopy2 (store acopy1 (- (* 3 S) (+ i 1)) (select a (- (* 3 S) (+ i 1)))))
	   (= acopy3 (store acopy2 (- (* 2 S) (+ i 1)) (select a (- (* 2 S) (+ i 1)))))
           (= acopy4 (store acopy3 i (select a i)))
	   (= i1 (+ 1 i)))
          (inv a acopy4 i1 S)))

(rule (=> (and (inv a acopy i S) (not (< i (* 1 S))) (<= 0 i1) (< i1 (* 4 S))
               (not (= (select a i1) (select acopy i1)))) fail))

(query fail)
