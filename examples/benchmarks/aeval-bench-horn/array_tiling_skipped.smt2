;here '2*S' is 'SIZE' of original program
(declare-var S Int)
(declare-var i Int)
(declare-var i1 Int)
(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var a2 (Array Int Int))

(declare-rel inv ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (=> (>= S 0) (inv a 0 S)))

(rule (=> (and
           (inv a i S)
           (< i S)
           (= a1 (ite (> (select a (* 2 i))  (* 2 i))
                      (store a (* 2 i) (* 2 i))
                      a))
           (= a2 (ite (> (select a1 (+ (* 2 i) 1)) (+ (* 2 i) 1))
                      (store a1 (+ (* 2 i) 1) (+ (* 2 i) 1))
                      a1))
           (= i1 (+ i 1)))
          (inv a2 i1 S)))

(rule (=> (and
           (inv a i S)
           (not (< i S))
           (< 0 i1)
           (< i1 (* 2 S))
           (not (<= (select a i1) i1)))
          fail))

(query fail)
