(set-logic HORN)
(declare-rel inv1 ( (Array Int Int) Int Int Int))(declare-rel inv2 ( (Array Int Int) Int Int Int))(declare-rel inv3 ( (Array Int Int) Int Int Int))(declare-rel inv4 ( (Array Int Int) Int Int Int))(declare-rel fail ( ))(forall ((a (Array Int Int)) (n Int)) (! (inv1 a 0 n 0) ))(forall ((sum Int) (i Int) (a (Array Int Int)) (i1 Int) (n Int) (sum1 Int))
  (! (let ((a!1 (and (inv1 a i n sum)
                     (< i n)
                     (= sum1 (+ sum (select a i)))
                     (= i1 (+ i 1)))))
       (=> a!1 (inv1 a i1 n sum1)))
     ))(forall ((i Int) (a (Array Int Int)) (n Int) (sum Int))
  (! (=> (and (inv1 a i n sum) (>= i n)) (inv2 a 0 n sum)) ))(forall ((sum Int) (i Int) (a (Array Int Int)) (i1 Int) (n Int) (sum1 Int))
  (! (let ((a!1 (and (inv2 a i n sum)
                     (< i n)
                     (= sum1 (+ sum (select a i)))
                     (= i1 (+ i 1)))))
       (=> a!1 (inv2 a i1 n sum1)))
     ))(forall ((i Int) (a (Array Int Int)) (n Int) (sum Int))
  (! (=> (and (inv2 a i n sum) (>= i n)) (inv3 a 0 n sum)) ))(forall ((sum Int) (i Int) (a (Array Int Int)) (i1 Int) (n Int) (sum1 Int))
  (! (let ((a!1 (and (inv3 a i n sum)
                     (< i n)
                     (= sum1 (- sum (select a i)))
                     (= i1 (+ i 1)))))
       (=> a!1 (inv3 a i1 n sum1)))
     ))(forall ((i Int) (a (Array Int Int)) (n Int) (sum Int))
  (! (=> (and (inv3 a i n sum) (>= i n)) (inv4 a 0 n sum)) ))(forall ((sum Int) (i Int) (a (Array Int Int)) (i1 Int) (n Int) (sum1 Int))
  (! (let ((a!1 (and (inv4 a i n sum)
                     (< i n)
                     (= sum1 (- sum (select a i)))
                     (= i1 (+ i 1)))))
       (=> a!1 (inv4 a i1 n sum1)))
     ))(forall ((a (Array Int Int)) (i Int) (n Int) (sum Int))
  (! (=> (and (inv4 a i n sum) (>= i n) (not (= sum 0))) fail) ))(assert (not fail))
(check-sat)