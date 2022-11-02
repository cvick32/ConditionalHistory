(set-logic HORN)
(declare-fun inv ((Array Int Int) Int Int Int Int Int Int Int Int) Bool)
(declare-fun fail () Bool)
(assert (forall ((a (Array Int Int))
         (i Int)
         (CC Int)
         (val1 Int)
         (val2 Int)
         (val3 Int)
         (val4 Int)
         (val5 Int)
         (minval Int))
  (! (=> (and (> CC 0)
              (= val1 1)
              (= val2 3)
              (= val3 7)
              (= val4 5)
              (= val5 2)
              (= i 1))
         (inv a i CC val1 val2 val3 val4 val5 minval))
     :weight 0)))
(assert (forall ((a (Array Int Int))
         (a1 (Array Int Int))
         (a2 (Array Int Int))
         (a3 (Array Int Int))
         (a4 (Array Int Int))
         (i Int)
         (a5 (Array Int Int))
         (i1 Int)
         (CC Int)
         (val1 Int)
         (val2 Int)
         (val3 Int)
         (val4 Int)
         (val5 Int)
         (minval Int))
  (! (let ((a!1 (ite (<= minval val5)
                     (store a (- (* 5 i) 5) val5)
                     (store a (- (* 5 i) 5) 0)))
           (a!2 (ite (<= minval val4)
                     (store a1 (- (* 5 i) 4) val4)
                     (store a1 (- (* 5 i) 4) 0)))
           (a!3 (ite (<= minval val3)
                     (store a2 (- (* 5 i) 3) val3)
                     (store a2 (- (* 5 i) 3) 0)))
           (a!4 (ite (<= minval val2)
                     (store a3 (- (* 5 i) 2) val2)
                     (store a3 (- (* 5 i) 2) 0)))
           (a!5 (ite (<= minval val1)
                     (store a4 (- (* 5 i) 1) val1)
                     (store a4 (- (* 5 i) 1) 0))))
       (=> (and (inv a i CC val1 val2 val3 val4 val5 minval)
                (<= i (* 1 CC))
                (= i1 (+ i 1))
                (= a1 a!1)
                (= a2 a!2)
                (= a3 a!3)
                (= a4 a!4)
                (= a5 a!5))
           (inv a5 i1 CC val1 val2 val3 val4 val5 minval)))
     :weight 0)))
(assert (forall ((val1 Int)
         (val2 Int)
         (val3 Int)
         (val4 Int)
         (val5 Int)
         (i Int)
         (CC Int)
         (minval Int)
         (a (Array Int Int))
         (i1 Int))
  (! (let ((a!1 (not (or (<= minval (select a i1)) (= (select a i1) 0)))))
     (let ((a!2 (and (inv a i CC val1 val2 val3 val4 val5 minval)
                     (not (<= i (* 1 CC)))
                     (<= 0 i1)
                     (< i1 (* 5 CC))
                     a!1)))
       (=> a!2 fail)))
     :weight 0)))
(assert (not fail))
(check-sat)
