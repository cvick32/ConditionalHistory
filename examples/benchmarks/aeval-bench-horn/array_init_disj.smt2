(declare-var a (Array Int Int))
(declare-var a1 (Array Int Int))
(declare-var i Int)
(declare-var i1 Int)
(declare-var N Int)
(declare-var B Bool)

(declare-rel inv ((Array Int Int) Int Int))
(declare-rel fail ())

(rule (inv a 0 N))

(rule (=> (and
           (inv a i N)
           (< i N)
           (= a1 (ite B (store a i 0) (store a i 2)))
           (= i1 (+ i 1)))
          (inv a1 i1 N)))

(rule (=> (and (inv a i N) (>= i N) (< 0 i1) (< i1 N) (= (select a i1) 1)) fail))

(query fail)
