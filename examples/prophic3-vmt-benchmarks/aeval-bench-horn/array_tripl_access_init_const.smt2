(declare-fun a () (Array Int Int))
(declare-fun a_next () (Array Int Int))
(define-fun .a () (Array Int Int) (! a :next a_next))
(declare-fun i () Int)
(declare-fun i_next () Int)
(define-fun .i () Int (! i :next i_next))
(declare-fun N () Int)
(declare-fun N_next () Int)
(define-fun .N () Int (! N :next N_next))
(declare-fun Z () Int)
(declare-fun Z_next () Int)
(define-fun .Z () Int (! Z :next Z_next))

(define-fun init-conditions () Bool (!
 (and
(= i 0)
(> N 1)
) :init true))

(define-fun trans-conditions () Bool (!
 (and
(let ((a!1 (store (store (store a (* 3 i) 0) (+ (* 3 i) 1) 0) (+ (* 3 i) 2) 0)))
  (= a!1 a_next))
(<= i N)
(= (+ i 1) i_next)
(= N N_next)
(= Z Z_next)
) :trans true))

(define-fun property () Bool (!
 (and
(let ((a!1 (not (not (>= (select a Z) 0)))))
  (=> (and (> i N) (>= Z 0) (<= Z (* N 3))) (and a!1)))
) :invar-property 0))

