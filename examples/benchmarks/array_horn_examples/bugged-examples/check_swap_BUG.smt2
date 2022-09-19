(set-info :origin "QARMC benchmarks by Andrey Rybalchenko")
(set-logic HORN)
(declare-fun inv1 (Int Int Int Int Int) Bool)
(declare-fun inv2 (Int Int Int Int Int) Bool)
(declare-fun inv3 (Int Int Int Int Int) Bool)
(declare-fun inv4 (Int Int Int Int Int) Bool)
(declare-fun inv5 (Int Int Int Int Int) Bool)
(declare-fun inv6 (Int Int Int Int Int) Bool)
(declare-fun inv7 (Int Int Int Int Int Int Int) Bool)

(assert
 (forall
  ((A (Array Int Int)) (AC (Array Int Int)) (AC-K Int) (A-K Int) (B (Array Int Int))
   (BC (Array Int Int)) (BC-K Int) (B-K Int) (K Int) (N Int) (Q Int))
  (=>
   (and
    (= (select BC K) BC-K)
    (= (select AC K) AC-K)
    (= (select B K) B-K)
    (= (select A K) A-K)
    (< K N) (forall ((Q Int)) (inv7 K N Q (select A Q) (select B Q) (select AC Q) (select BC Q)))
    (<= 0 K))
   (and (= A-K BC-K) (= B-K AC-K)))))
(assert
 (forall
  ((A (Array Int Int)) (AC (Array Int Int)) (I Int) (N Int) (Q Int))
  (=>
   (= I 0)
   (inv1 I N Q (select A Q) (select AC Q)))))

(assert
 (forall
  ((A (Array Int Int)) (AC (Array Int Int)) (AC1 (Array Int Int))
   (I Int) (I1 Int) (N Int) (Q Int) (W Int))
  (=>
   (and
    (= AC1 (store AC I W))
    (= (select A I) W)
    (= I1 (+ I 1))
    (forall ((Q Int)) (inv1 I N Q (select A Q) (select AC Q)))
    (< I N))
   (inv1 I1 N Q (select A Q) (select AC1 Q)))))

(assert
 (forall
  ((B (Array Int Int)) (BC (Array Int Int)) (I Int) (I1 Int) (N Int) (Q Int))
  (=>
   (and
    (>= I N)
    (= I1 0))
   (inv2 I1 N Q (select B Q) (select BC Q)))))

(assert
 (forall
  ((B (Array Int Int)) (BC (Array Int Int)) (BC1 (Array Int Int))
   (I Int) (I1 Int) (N Int) (Q Int) (W Int))
  (=>
   (and
    (= BC1 (store BC I W))
    (= (select B I) W)
    (= I1 (+ I 1))
    (forall ((Q Int)) (inv2 I N Q (select B Q) (select BC Q)))
    (< I N))
   (inv2 I1 N Q (select B Q) (select BC1 Q)))))

(assert
 (forall
  ((A (Array Int Int)) (AC (Array Int Int)) (I Int) (I1 Int) (N Int) (Q Int))
  (=>
   (and
    (= I1 0)
    (forall ((Q Int)) (inv1 I N Q (select A Q) (select AC Q)))
    (>= I N))
   (inv3 I1 N Q (select A Q) (select AC Q)))))

(assert
 (forall
  ((A (Array Int Int)) (A1 (Array Int Int)) (AC (Array Int Int))
   (AI Int) (B (Array Int Int)) (B1 (Array Int Int)) (BI Int)
   (I Int) (I1 Int) (N Int) (Q Int))
  (=>
   (and
    (= B1 (store B I AI))
    (= A1 (store A I AI))
    (= (select B I) BI)
    (= (select A I) AI)
    (= I1 (+ I 1))
    (forall ((Q Int)) (inv3 I N Q (select A Q) (select AC Q)))
    (< I N))
   (inv3 I1 N Q (select A1 Q) (select AC Q)))))

(assert
 (forall
  ((B (Array Int Int)) (BC (Array Int Int)) (I Int) (I1 Int) (N Int) (Q Int))
  (=>
   (and
    (= I1 0)
    (forall ((Q Int)) (inv2 I N Q (select B Q) (select BC Q)))
    (>= I N))
   (inv4 I1 N Q (select B Q) (select BC Q)))))

(assert
 (forall
  ((A (Array Int Int)) (A1 (Array Int Int)) (AI Int) (B (Array Int Int))
   (B1 (Array Int Int)) (BC (Array Int Int)) (BI Int) (I Int) (I1 Int) (N Int) (Q Int))
  (=>
   (and
    (= B1 (store B I AI))
    (= A1 (store A I AI))
    (= (select B I) BI)
    (= (select A I) AI)
    (= I1 (+ I 1))
    (forall ((Q Int)) (inv4 I N Q (select B Q) (select BC Q)))
    (< I N))
   (inv4 I1 N Q (select B1 Q) (select BC Q)))))

(assert
 (forall
  ((A (Array Int Int)) (B (Array Int Int)) (BC (Array Int Int)) (I Int) (I1 Int) (N Int) (Q Int))
  (=>
   (and
    (= I1 0)
    (forall ((Q Int)) (inv4 I N Q (select B Q) (select BC Q)))
    (>= I N))
   (inv7 I1 N Q (select A Q) (select BC Q)))))

(assert
 (forall
  ((A (Array Int Int)) (A1 (Array Int Int)) (AI Int) (B (Array Int Int)) (B1 (Array Int Int)) (BC (Array Int Int)) (BI Int) (I Int) (I1 Int) (N Int) (Q Int))
  (=>
   (and
    (= B1 (store B I AI))
    (= A1 (store A I AI))
    (= (select B I) BI)
    (= (select A I) AI)
    (= I1 (+ I 1))
    (< I N)
    (forall ((Q Int)) (inv4 I N Q (select B Q) (select BC Q)))
    (forall ((Q Int)) (inv7 I N Q (select A Q) (select BC Q))))
   (inv7 I1 N Q (select A1 Q) (select BC Q)))))

(assert
 (forall
  ((A (Array Int Int)) (AC (Array Int Int)) (B (Array Int Int)) (I Int) (I1 Int) (N Int) (Q Int))
  (=>
   (and
    (= I1 0)
    (forall ((Q Int)) (inv3 I N Q (select A Q) (select AC Q)))
    (>= I N))
   (inv6 I1 N Q (select B Q) (select AC Q)))))

(assert
 (forall
  ((A (Array Int Int)) (A1 (Array Int Int)) (AC (Array Int Int)) (AI Int)
   (B (Array Int Int)) (B1 (Array Int Int)) (BI Int) (I Int) (I1 Int) (N Int) (Q Int))
  (=>
   (and
    (= B1 (store B I AI))
    (= A1 (store A I BI))
    (= (select B I) BI)
    (= (select A I) AI)
    (= I1 (+ I 1))
    (< I N)
    (forall ((Q Int)) (inv3 I N Q (select A Q) (select AC Q)))
    (forall ((Q Int)) (inv6 I N Q (select B Q) (select AC Q))))
   (inv6 I1 N Q (select B1 Q) (select AC Q)))))

(assert
 (forall
  ((A (Array Int Int)) (AC (Array Int Int)) (B (Array Int Int))
   (BC (Array Int Int)) (I Int) (I1 Int) (N Int) (Q Int))
  (=>
   (and
    (= I1 0)
    (>= I N)
    (forall ((Q Int)) (inv7 I N Q (select A Q) (select BC Q)))
    (forall ((Q Int)) (inv6 I N Q (select B Q) (select AC Q))))
   (inv7 I1 N Q (select A Q) (select B Q) (select AC Q) (select BC Q)))))

(assert
 (forall
  ((A (Array Int Int)) (AC (Array Int Int)) (B (Array Int Int))
   (BC (Array Int Int)) (I Int) (I1 Int) (I4 Int) (N Int) (Q Int))
  (=>
   (and
    (= I1 (+ I 1))
    (< I N)
    (forall ((Q Int)) (inv7 I N Q (select A Q) (select B Q) (select AC Q) (select BC Q)))
    (>= I4 N)
    (forall ((Q Int)) (inv7 I4 N Q (select A Q) (select BC Q)))
    (forall ((Q Int)) (inv6 I4 N Q (select B Q) (select AC Q))))
   (inv7 I1 N Q (select A Q) (select B Q) (select AC Q) (select BC Q)))))

(check-sat)
