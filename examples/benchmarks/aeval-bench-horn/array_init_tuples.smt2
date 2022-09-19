(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)

(declare-rel inv1 ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv1 a 0 N))

(rule (=> (and (inv1 a i N) (< i N)
    (= (store
      (store
        (store
          (store
            (store
              (store a i (+ i 6))
              (+ i 1) (+ i 5))
            (+ i 2) (+ i 4))
          (+ i 3) (+ i 3))
        (+ i 4) (+ i 2))
      (+ i 5) (+ i 1)) a1)
    (= i1 (+ i 6)))
  (inv1 a1 i1 N)))

(rule (=> (and (inv1 a i N) (>= i N) (<= 0 i1) (< i1 N) (not (>= (select a i1) 0))) fail))

(query fail)
