(declare-var A (Array Int Int))
(declare-var A1 (Array Int Int))
(declare-var B (Array Int Int))
(declare-var I Int)
(declare-var I1 Int)
(declare-var K Int)
(declare-var M Int)
(declare-var N Int)
(declare-var P Int)
(declare-var Q Int)
(declare-var W Int)

(declare-rel inv1 (Int Int Int Int Int Int (Array Int Int) (Array Int Int)))

(rule (=>
       (= I N)
       (inv1 I K N M P Q A B)))

(rule (=>
       (and
        (= A1 (store A I W))
        (= (select B (- I N)) W)
        (= I1 (+ I 1))
        (< I (+ N M))
        (inv1 I K N M P Q A B))
       (inv1 I1 K N M P Q A1 B)))

(rule
 (=> (and
      (< K (+ N M))
      (>= K N)
      (inv1 I K N M P Q A B)
      (not (< I (+ N M)))
      (not (= (select A K) (select B (- K N)))))
     fail))
