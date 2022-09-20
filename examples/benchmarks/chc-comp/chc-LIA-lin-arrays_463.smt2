(set-logic HORN)
(declare-fun state (Int Int Int Int (Array Int Int) Int Int Int Int (Array Int Int) Bool Bool Int Int Int) Bool)
(assert (forall ((|E_14| Int) (|C_14| Int) (|G_14| Int) (|A_14| Int) (|F_14| (Array Int Int)) (|H_14| Int) (|J_0| Int) (|B_14| Int) (|D_14| Int) (|I_1| (Array Int Int)) (|.loc.37| Bool) (|.loc.38| Bool) (|G| Int) (|F| Int) (|H| Int) (|.loc.49| Bool) (|.loc.50| Bool) (|.y.47| Int) (|.y.40| Int) (|.y.43| (Array Int Int)) (|.y.42| Int) (|.y.41| Int) (|.y.39| Int) (|.y.44| Int) (|.y.46| Int) (|.y.48| (Array Int Int)) (|.y.45| Int) (|.xiv.1| Int) (|.xiv.2| Int) (|.xiv.3| Int)) (=> (let ((.def_25 (not .loc.38))) (let ((.def_31 (= (+ A_14 (* (- 1) B_14)) 1))) (let ((.def_33 (= F_14 I_1))) (let ((.def_37 (not (= A_14 0)))) (let ((.def_131 (= H 0))) (let ((.def_132 (= G F))) (or (and (and (and (and (and (and (and (and (and (and (and (and (and .loc.37 .def_25) .def_31) .def_33) .def_37) (= (+ G_14 (+ (* (- 1) A_14) (* (- 1) F))) 0)) (not (= (+ C_14 (+ (* (- 1) G_14) A_14)) 0))) (= (+ A_14 (+ (* (- 1) H_14) D_14)) 1)) (= (+ A_14 (+ (* (- 1) J_0) F)) 1)) (<= (ite (<= A_14 G_14) (+ G_14 (* (- 1) A_14)) (* (- 1) (+ G_14 (* (- 1) A_14)))) (ite (<= 0 C_14) C_14 (* (- 1) C_14)))) (<= (ite (<= 0 F) F (* (- 1) F)) (ite (<= 0 D_14) D_14 (* (- 1) D_14)))) (= C_14 D_14)) (not (= D_14 F))) (= (+ E_14 (+ (* (- 1) C_14) (* (- 1) A_14))) 0)) (and (or (and (and .def_37 (and (and (and (and (and (and .def_33 (and (and (and .def_31 (and .def_25 (not (= B_14 (- 1))))) (= H_14 D_14)) (= E_14 C_14))) (not (<= (ite (<= 0 G_14) G_14 (* (- 1) G_14)) (ite (<= 0 E_14) E_14 (* (- 1) E_14))))) (not (<= (ite (<= 0 J_0) J_0 (* (- 1) J_0)) (ite (<= 0 H_14) H_14 (* (- 1) H_14))))) (not (= E_14 G_14))) (= E_14 H_14)) (= G_14 J_0))) (not (= H_14 J_0))) (and .loc.38 (and (or .def_131 .def_132) (and (not .def_131) (not .def_132))))) (not .loc.37))))))))) (state |E_14| |C_14| |G_14| |A_14| |F_14| |H_14| |J_0| |B_14| |D_14| |I_1| |.loc.37| |.loc.38| |G| |F| |H|))))
(assert (forall ((|E_14| Int) (|C_14| Int) (|G_14| Int) (|A_14| Int) (|F_14| (Array Int Int)) (|H_14| Int) (|J_0| Int) (|B_14| Int) (|D_14| Int) (|I_1| (Array Int Int)) (|.loc.37| Bool) (|.loc.38| Bool) (|G| Int) (|F| Int) (|H| Int) (|.loc.49| Bool) (|.loc.50| Bool) (|.y.47| Int) (|.y.40| Int) (|.y.43| (Array Int Int)) (|.y.42| Int) (|.y.41| Int) (|.y.39| Int) (|.y.44| Int) (|.y.46| Int) (|.y.48| (Array Int Int)) (|.y.45| Int) (|.xiv.1| Int) (|.xiv.2| Int) (|.xiv.3| Int)) (=> (and (state |E_14| |C_14| |G_14| |A_14| |F_14| |H_14| |J_0| |B_14| |D_14| |I_1| |.loc.37| |.loc.38| |G| |F| |H|) (let ((.def_146 (store F_14 E_14 (select F_14 G_14)))) (let ((.def_148 (store I_1 H_14 (select I_1 J_0)))) (let ((.def_151 (not (= C_14 D_14)))) (let ((.def_153 (= B_14 0))) (let ((.def_155 (= A_14 1))) (let ((.def_159 (not .def_155))) (let ((.def_160 (not .def_153))) (let ((.def_161 (and .def_159 .def_160))) (let ((.def_162 (not .loc.50))) (let ((.def_165 (= D_14 .y.47))) (let ((.def_168 (= C_14 .y.40))) (let ((.def_171 (= .def_146 .y.43))) (let ((.def_176 (= (+ A_14 (* (- 1) .y.42)) 1))) (let ((.def_181 (= (+ G_14 (* (- 1) .y.41)) (- 1)))) (let ((.def_186 (= (+ E_14 (* (- 1) .y.39)) (- 1)))) (let ((.def_191 (= (+ H_14 (* (- 1) .y.44)) (- 1)))) (let ((.def_196 (= (+ B_14 (* (- 1) .y.46)) 1))) (let ((.def_199 (= .def_148 .y.48))) (let ((.def_204 (= (+ J_0 (* (- 1) .y.45)) (- 1)))) (let ((.def_207 (and .def_153 .def_159))) (let ((.def_215 (= I_1 .y.48))) (let ((.def_217 (= B_14 .y.46))) (let ((.def_219 (= J_0 .y.45))) (let ((.def_221 (= H_14 .y.44))) (let ((.def_224 (and .def_155 .def_160))) (let ((.def_232 (= F_14 .y.43))) (let ((.def_234 (= A_14 .y.42))) (let ((.def_236 (= G_14 .y.41))) (let ((.def_238 (= E_14 .y.39))) (let ((.def_245 (store F_14 (+ E_14 (- 1)) (select F_14 (+ G_14 (- 1)))))) (let ((.def_263 (= .y.43 .def_245))) (let ((.def_265 (= (+ G_14 (* (- 1) .y.41)) 1))) (let ((.def_267 (= (+ E_14 (* (- 1) .y.39)) 1))) (let ((.def_269 (= (+ H_14 (* (- 1) .y.44)) 1))) (let ((.def_271 (= (+ J_0 (* (- 1) .y.45)) 1))) (and (not .loc.38) (or (or (or (and (not .loc.49) (or (and (not .loc.37) (or (or (or (and (and (and (or (not (= .def_146 .def_148)) .def_151) .def_153) .def_155) .loc.50) (and (and (and (and (and (and (and (and (and (and (and .def_161 .def_162) .def_165) .def_168) .def_171) .def_176) .def_181) .def_186) .def_191) .def_196) .def_199) .def_204)) (and (and (and (and (and .def_186 (and .def_181 (and .def_176 (and .def_171 (and .def_168 (and .def_165 (and .def_162 .def_207))))))) .def_215) .def_217) .def_219) .def_221)) (and (and (and (and (and .def_204 (and .def_199 (and .def_196 (and .def_191 (and .def_168 (and .def_165 (and .def_162 .def_224))))))) .def_232) .def_234) .def_236) .def_238))) (and (or .def_151 (not (= .def_148 .def_245))) (and .loc.50 (and .loc.37 (and .def_153 .def_155)))))) (and (and (and (and (and (and .def_199 (and .def_196 (and .def_176 (and .def_168 (and .def_165 (and .def_162 (and .loc.49 (and .loc.37 .def_161)))))))) .def_263) .def_265) .def_267) .def_269) .def_271)) (and .def_267 (and .def_265 (and .def_263 (and .def_221 (and .def_219 (and .def_217 (and .def_215 (and .def_176 (and .def_168 (and .def_165 (and .def_162 (and .loc.49 (and .loc.37 .def_207)))))))))))))) (and .def_271 (and .def_269 (and .def_238 (and .def_236 (and .def_234 (and .def_232 (and .def_199 (and .def_196 (and .def_168 (and .def_165 (and .def_162 (and .loc.49 (and .loc.37 .def_224))))))))))))))))))))))))))))))))))))))))))))))))))) (state |.y.39| |.y.40| |.y.41| |.y.42| |.y.43| |.y.44| |.y.45| |.y.46| |.y.47| |.y.48| |.loc.49| |.loc.50| |.xiv.1| |.xiv.2| |.xiv.3|))))
(assert (forall ((|E_14| Int) (|C_14| Int) (|G_14| Int) (|A_14| Int) (|F_14| (Array Int Int)) (|H_14| Int) (|J_0| Int) (|B_14| Int) (|D_14| Int) (|I_1| (Array Int Int)) (|.loc.37| Bool) (|.loc.38| Bool) (|G| Int) (|F| Int) (|H| Int) (|.loc.49| Bool) (|.loc.50| Bool) (|.y.47| Int) (|.y.40| Int) (|.y.43| (Array Int Int)) (|.y.42| Int) (|.y.41| Int) (|.y.39| Int) (|.y.44| Int) (|.y.46| Int) (|.y.48| (Array Int Int)) (|.y.45| Int) (|.xiv.1| Int) (|.xiv.2| Int) (|.xiv.3| Int)) (=> (state |E_14| |C_14| |G_14| |A_14| |F_14| |H_14| |J_0| |B_14| |D_14| |I_1| |.loc.37| |.loc.38| |G| |F| |H|) (not (and .loc.38 (not .loc.37))))))
(check-sat)