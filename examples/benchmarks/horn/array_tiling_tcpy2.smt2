(set-logic HORN)
(declare-fun inv ((Array Int Int) (Array Int Int) Int Int) Bool)
(declare-fun fail () Bool)
(assert (forall ((a (Array Int Int)) (acopy (Array Int Int)) (i Int) (S Int))
  (! (=> (and (<= 1 S) (= i 0)) (inv a acopy i S)) :weight 0)))
(assert (forall ((acopy (Array Int Int))
         (acopy0 (Array Int Int))
         (acopy1 (Array Int Int))
         (acopy2 (Array Int Int))
         (acopy3 (Array Int Int))
         (i Int)
         (a (Array Int Int))
         (acopy4 (Array Int Int))
         (i1 Int)
         (S Int))
  (! (let ((a!1 (store acopy (- (* 5 S) (+ i 1)) (select a (- (* 5 S) (+ i 1)))))
           (a!2 (store acopy0
                       (- (* 4 S) (+ i 1))
                       (select a (- (* 4 S) (+ i 1)))))
           (a!3 (store acopy1
                       (- (* 3 S) (+ i 1))
                       (select a (- (* 3 S) (+ i 1)))))
           (a!4 (store acopy2
                       (- (* 2 S) (+ i 1))
                       (select a (- (* 2 S) (+ i 1))))))
     (let ((a!5 (and (inv a acopy i S)
                     (< i (* 1 S))
                     (= acopy0 a!1)
                     (= acopy1 a!2)
                     (= acopy2 a!3)
                     (= acopy3 a!4)
                     (= acopy4 (store acopy3 i (select a i)))
                     (= i1 (+ 1 i)))))
       (=> a!5 (inv a acopy4 i1 S))))
     :weight 0)))
(assert (forall ((i Int) (S Int) (a (Array Int Int)) (acopy (Array Int Int)) (i1 Int))
  (! (let ((a!1 (and (inv a acopy i S)
                     (not (< i (* 1 S)))
                     (<= 0 i1)
                     (< i1 (* 5 S))
                     (not (= (select a i1) (select acopy i1))))))
       (=> a!1 fail))
     :weight 0)))
(assert (not fail))
(check-sat)
