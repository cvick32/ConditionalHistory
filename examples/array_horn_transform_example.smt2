;; check_strcpy.smt2 to aeval multiple format
;; this will work with Ken's transform which works with my transform

(declare-var A (Array Int Int))
(declare-var B (Array Int Int))
(declare-var B1 (Array Int Int))

(declare-var AI Int)
(declare-var BI Int)
(declare-var I Int)
(declare-var I1 Int)
(declare-var N Int)
(declare-var Q Int)

(declare-rel inv1 ((Array Int Int) Int Int))
(declare-rel inv2 ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (=> (= I 0)
          (inv1 I N Q (select A Q) (select B Q))))

(rule (=>
       (and
        (inv1 I N Q (select A Q) (select B Q))
        (= B1 (store B I AI))
        (= (select A I) AI)
        (= I1 (+ I 1))
        (< I N))
       (inv1 I1 N Q (select A Q) (select B1 Q))))

(rule
  (=>
   (and
    (inv1 I N Q (select A Q) (select B Q))
    (>= I N)
    (= I1 0))
   (inv2 I1 N Q (select A Q) (select B Q))))


(rule
  (=>
   (and
    (inv2 I N Q (select A Q) (select B Q))
    (= I1 (+ I 1))
    (< I N))
   (inv2 I1 N Q (select A Q) (select B Q))))

(rule
  (=>
   (and
    (= (select B I) BI)
    (= (select A I) AI)
    (inv2 I N Q (select A Q) (select B Q))
    (< I N)
    (not (= AI BI)))
   fail))

(query fail)
