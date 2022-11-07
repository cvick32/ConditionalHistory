; https://github.com/chc-comp/quic3/blob/master/data/array_init_partial.smt2

(declare-rel verifier.error (Bool Bool Bool ))
(declare-rel main@entry ())

(declare-rel main@bb19.i (Int Int (Array Int Int) Int ))
(declare-rel main@bb30.i (Int (Array Int Int) Int Int ))

(declare-rel main@verifier.error.split ())
(declare-var main@%tmp25.i_0 Int )
(declare-var main@%tmp36.i_0 Int )
(declare-var main@%tmp37.i_0 Int )
(declare-var main@%tmp39.i_0 Bool )
(declare-var main@%tmp33.i_0 Bool )
(declare-var main@%tmp22.i_0 Bool )
(declare-var main@%tmp2.i_0 Int )
(declare-var main@%tmp5.i_0 Bool )
(declare-var main@%tmp8.i_0 Bool )
(declare-var main@%tmp12.i_0 Bool )
(declare-var main@%tmp12..i_0 Bool )
(declare-var main@entry_0 Bool )
(declare-var main@%_0_0 (Array Int Int) )
(declare-var main@%tmp3.i_0 Int )
(declare-var main@%tmp18.i_0 Int )
(declare-var main@bb19.i_0 Bool )
(declare-var main@%shadow.mem.0_0 (Array Int Int) )
(declare-var main@%i.0.i_0 Int )
(declare-var main@%shadow.mem.0_1 (Array Int Int) )
(declare-var main@%i.0.i_1 Int )
(declare-var main@bb23.i_0 Bool )
(declare-var main@%_1_0 (Array Int Int) )
(declare-var main@%tmp28.i_0 Int )
(declare-var main@bb19.i_1 Bool )
(declare-var main@%shadow.mem.0_2 (Array Int Int) )
(declare-var main@%i.0.i_2 Int )
(declare-var main@bb30.i_0 Bool )
(declare-var main@%i.1.i_0 Int )
(declare-var main@%i.1.i_1 Int )
(declare-var main@bb34.i_0 Bool )
(declare-var main@bb44.i_0 Bool )
(declare-var main@%tmp46.i_0 Int )
(declare-var main@bb30.i_1 Bool )
(declare-var main@%i.1.i_2 Int )
(declare-var main@bb40.i_0 Bool )
(declare-var main@verifier.error_0 Bool )
(declare-var main@verifier.error.split_0 Bool )



(rule (=> (and main@entry
         true
         (= main@%tmp5.i_0 (> main@%tmp2.i_0 0))
         main@%tmp5.i_0
         (= main@%tmp8.i_0 (> main@%tmp3.i_0 (- 1)))
         (= main@%tmp12.i_0 (<= main@%tmp3.i_0 main@%tmp2.i_0))
         (= main@%tmp12..i_0 (and main@%tmp8.i_0 main@%tmp12.i_0))
         main@%tmp12..i_0
         (> main@%tmp18.i_0 0)
         (=> main@bb19.i_0 (and main@bb19.i_0 main@entry_0))
         main@bb19.i_0
         (=> (and main@bb19.i_0 main@entry_0)
             (= main@%shadow.mem.0_0 main@%_0_0))
         (=> (and main@bb19.i_0 main@entry_0) (= main@%i.0.i_0 0))
         (=> (and main@bb19.i_0 main@entry_0)
             (= main@%shadow.mem.0_1 main@%shadow.mem.0_0))
         (=> (and main@bb19.i_0 main@entry_0) (= main@%i.0.i_1 main@%i.0.i_0)))
    (main@bb19.i main@%tmp18.i_0
                 main@%i.0.i_1
                 main@%shadow.mem.0_1
                 main@%tmp3.i_0)))

(rule
 (=> (and (main@bb19.i main@%tmp18.i_0
                       main@%i.0.i_0
                       main@%shadow.mem.0_0
                       main@%tmp3.i_0)
          (= main@%tmp22.i_0 (< main@%i.0.i_0 main@%tmp3.i_0))
          (=> main@bb23.i_0 (and main@bb23.i_0 main@bb19.i_0))
          (=> (and main@bb23.i_0 main@bb19.i_0) main@%tmp22.i_0)
          (=> main@bb23.i_0 (= main@%tmp25.i_0 (+ main@%tmp18.i_0 (* main@%i.0.i_0 1))))
          (=> main@bb23.i_0
              (or (<= main@%tmp18.i_0 0) (> main@%tmp25.i_0 0)))
          (=> main@bb23.i_0 (> main@%tmp18.i_0 0))
          (=> main@bb23.i_0
              (= main@%_1_0
                 (store main@%shadow.mem.0_0 main@%tmp25.i_0 0)))
          (=> main@bb23.i_0 (= main@%tmp28.i_0 (+ main@%i.0.i_0 1)))
          (=> main@bb19.i_1 (and main@bb19.i_1 main@bb23.i_0))
          main@bb19.i_1
          (=> (and main@bb19.i_1 main@bb23.i_0)
              (= main@%shadow.mem.0_1 main@%_1_0))
          (=> (and main@bb19.i_1 main@bb23.i_0)
              (= main@%i.0.i_1 main@%tmp28.i_0))
          (=> (and main@bb19.i_1 main@bb23.i_0)
              (= main@%shadow.mem.0_2 main@%shadow.mem.0_1))
          (=> (and main@bb19.i_1 main@bb23.i_0)
              (= main@%i.0.i_2 main@%i.0.i_1)))
     (main@bb19.i main@%tmp18.i_0
                  main@%i.0.i_2
                  main@%shadow.mem.0_2
                  main@%tmp3.i_0)))

(rule (=> (and (main@bb19.i main@%tmp18.i_0
                      main@%i.0.i_0
                      main@%shadow.mem.0_0
                      main@%tmp3.i_0)
         true
         (= main@%tmp22.i_0 (< main@%i.0.i_0 main@%tmp3.i_0))
         (=> main@bb30.i_0 (and main@bb30.i_0 main@bb19.i_0))
         main@bb30.i_0
         (=> (and main@bb30.i_0 main@bb19.i_0) (not main@%tmp22.i_0))
         (=> (and main@bb30.i_0 main@bb19.i_0) (= main@%i.1.i_0 0))
         (=> (and main@bb30.i_0 main@bb19.i_0) (= main@%i.1.i_1 main@%i.1.i_0)))
    (main@bb30.i main@%tmp18.i_0
                 main@%shadow.mem.0_0
                 main@%i.1.i_1
                 main@%tmp3.i_0)))

(rule (let ((a!1 (=> main@bb34.i_0
               (= main@%tmp36.i_0 (+ main@%tmp18.i_0 (* main@%i.1.i_0 1))))))
(let ((a!2 (and (main@bb30.i main@%tmp18.i_0
                             main@%shadow.mem.0_0
                             main@%i.1.i_0
                             main@%tmp3.i_0)
                true
                (= main@%tmp33.i_0 (< main@%i.1.i_0 main@%tmp3.i_0))
                main@%tmp33.i_0
                (=> main@bb34.i_0 (and main@bb34.i_0 main@bb30.i_0))
                a!1
                (=> main@bb34.i_0
                    (or (<= main@%tmp18.i_0 0) (> main@%tmp36.i_0 0)))
                (=> main@bb34.i_0 (> main@%tmp18.i_0 0))
                (=> main@bb34.i_0
                    (= main@%tmp37.i_0
                       (select main@%shadow.mem.0_0 main@%tmp36.i_0)))
                (=> main@bb34.i_0 (= main@%tmp39.i_0 (> main@%tmp37.i_0 (- 1))))
                (=> main@bb44.i_0 (and main@bb44.i_0 main@bb34.i_0))
                (=> (and main@bb44.i_0 main@bb34.i_0) main@%tmp39.i_0)
                (=> main@bb44.i_0 (= main@%tmp46.i_0 (+ main@%i.1.i_0 1)))
                (=> main@bb30.i_1 (and main@bb30.i_1 main@bb44.i_0))
                main@bb30.i_1
                (=> (and main@bb30.i_1 main@bb44.i_0)
                    (= main@%i.1.i_1 main@%tmp46.i_0))
                (=> (and main@bb30.i_1 main@bb44.i_0)
                    (= main@%i.1.i_2 main@%i.1.i_1)))))
  (=> a!2
      (main@bb30.i main@%tmp18.i_0
                   main@%shadow.mem.0_0
                   main@%i.1.i_2
                   main@%tmp3.i_0)))))

(rule (let ((a!1 (=> main@bb34.i_0
               (= main@%tmp36.i_0 (+ main@%tmp18.i_0 (* main@%i.1.i_0 1))))))
(let ((a!2 (and (main@bb30.i main@%tmp18.i_0
                             main@%shadow.mem.0_0
                             main@%i.1.i_0
                             main@%tmp3.i_0)
                true
                (= main@%tmp33.i_0 (< main@%i.1.i_0 main@%tmp3.i_0))
                main@%tmp33.i_0
                (=> main@bb34.i_0 (and main@bb34.i_0 main@bb30.i_0))
                a!1
                (=> main@bb34.i_0
                    (or (<= main@%tmp18.i_0 0) (> main@%tmp36.i_0 0)))
                (=> main@bb34.i_0 (> main@%tmp18.i_0 0))
                (=> main@bb34.i_0
                    (= main@%tmp37.i_0
                       (select main@%shadow.mem.0_0 main@%tmp36.i_0)))
                (=> main@bb34.i_0 (= main@%tmp39.i_0 (> main@%tmp37.i_0 (- 1))))
                (=> main@bb40.i_0 (and main@bb40.i_0 main@bb34.i_0))
                (=> (and main@bb40.i_0 main@bb34.i_0) (not main@%tmp39.i_0))
                (=> main@verifier.error_0
                    (and main@verifier.error_0 main@bb40.i_0))
                (=> main@verifier.error.split_0
                    (and main@verifier.error.split_0 main@verifier.error_0))
                main@verifier.error.split_0)))
  (=> a!2 main@verifier.error.split))))
(query main@verifier.error.split)
