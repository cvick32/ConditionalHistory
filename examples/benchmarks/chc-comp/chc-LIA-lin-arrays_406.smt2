(set-logic HORN)
(declare-fun state (Int Int Int Int Int Int Int Int Bool (Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int)) Bool)
(assert (forall ((|A| Int) (|B| Int) (|C| Int) (|D| Int) (|F| Int) (|I| Int) (|J| Int) (|.y.2| Int) (|.loc.3| Bool) (|E.1| (Array Int Int)) (|H| (Array Int Int)) (|E_0.1| (Array Int Int)) (|H_0| (Array Int Int)) (|E_1.1| (Array Int Int)) (|H_1| (Array Int Int)) (|.x.7| Int) (|.x.6| Int) (|.x.5| Int) (|.x.4| Int) (|.x.3| Int) (|.x.2| Int) (|.x.1| Int) (|G| Int) (|.loc.4| Bool) (|.xtv.1| (Array Int Int)) (|.xtv.2| (Array Int Int)) (|.xiv.1| (Array Int Int)) (|.xiv.2| (Array Int Int)) (|.xpv.1| (Array Int Int)) (|.xpv.2| (Array Int Int))) (=> (and (and (and (and (and (and (and (not (= (select E_0.1 F) 0)) (= D (select H_0 D))) (= C (select H_0 C))) (= A (select H_0 A))) (<= 0 I)) (not (<= 10 I))) (= (select E_0.1 B) 0)) (not .loc.3)) (state |A| |B| |C| |D| |F| |I| |J| |.y.2| |.loc.3| |E.1| |H| |E_0.1| |H_0| |E_1.1| |H_1|))))
(assert (forall ((|A| Int) (|B| Int) (|C| Int) (|D| Int) (|F| Int) (|I| Int) (|J| Int) (|.y.2| Int) (|.loc.3| Bool) (|E.1| (Array Int Int)) (|H| (Array Int Int)) (|E_0.1| (Array Int Int)) (|H_0| (Array Int Int)) (|E_1.1| (Array Int Int)) (|H_1| (Array Int Int)) (|.x.7| Int) (|.x.6| Int) (|.x.5| Int) (|.x.4| Int) (|.x.3| Int) (|.x.2| Int) (|.x.1| Int) (|G| Int) (|.loc.4| Bool) (|.xtv.1| (Array Int Int)) (|.xtv.2| (Array Int Int)) (|.xiv.1| (Array Int Int)) (|.xiv.2| (Array Int Int)) (|.xpv.1| (Array Int Int)) (|.xpv.2| (Array Int Int))) (=> (and (state |A| |B| |C| |D| |F| |I| |J| |.y.2| |.loc.3| |E.1| |H| |E_0.1| |H_0| |E_1.1| |H_1|) (and (and (not .loc.3) (and (= J .x.7) (and (= I .x.6) (and (= F .x.5) (and (= D .x.4) (and (= C .x.3) (and (= B .x.2) (and (= A .x.1) (and (not (= (select E.1 F) 0)) (and (= G 0) (and (= A (select H A)) (and (= C (select H C)) (and (= D (select H D)) (= (select E.1 B) 0)))))))))))))) .loc.4)) (state |.x.1| |.x.2| |.x.3| |.x.4| |.x.5| |G| |.x.6| |.x.7| |.loc.4| |.xtv.1| |.xtv.2| |.xiv.1| |.xiv.2| |.xpv.1| |.xpv.2|))))
(assert (forall ((|A| Int) (|B| Int) (|C| Int) (|D| Int) (|F| Int) (|I| Int) (|J| Int) (|.y.2| Int) (|.loc.3| Bool) (|E.1| (Array Int Int)) (|H| (Array Int Int)) (|E_0.1| (Array Int Int)) (|H_0| (Array Int Int)) (|E_1.1| (Array Int Int)) (|H_1| (Array Int Int)) (|.x.7| Int) (|.x.6| Int) (|.x.5| Int) (|.x.4| Int) (|.x.3| Int) (|.x.2| Int) (|.x.1| Int) (|G| Int) (|.loc.4| Bool) (|.xtv.1| (Array Int Int)) (|.xtv.2| (Array Int Int)) (|.xiv.1| (Array Int Int)) (|.xiv.2| (Array Int Int)) (|.xpv.1| (Array Int Int)) (|.xpv.2| (Array Int Int))) (=> (state |A| |B| |C| |D| |F| |I| |J| |.y.2| |.loc.3| |E.1| |H| |E_0.1| |H_0| |E_1.1| |H_1|) (not (and .loc.3 (and (and (and (and (and (and (and (= (select E_1.1 B) 0) (= C (select H_1 C))) (= D (select H_1 D))) (= A (select H_1 A))) (not (= I 0))) (<= 0 J)) (not (<= 10 J))) (not (= (select E_1.1 F) 0))))))))
(check-sat)
