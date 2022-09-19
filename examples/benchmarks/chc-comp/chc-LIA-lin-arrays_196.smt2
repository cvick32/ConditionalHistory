(set-logic HORN)
(declare-fun state (Int Int Int (Array Int Int) (Array Int Int) (Array Int Int) Int Int Int Int Int Int (Array Int Int) (Array Int Int) Int Int Int Int Int Int Int Int Int Int Int Int Bool Bool Bool) Bool)
(assert (forall ((|A| Int) (|B1| Int) (|C| Int) (|C1| (Array Int Int)) (|E| (Array Int Int)) (|F| (Array Int Int)) (|D1| Int) (|H| Int) (|E1| Int) (|J| Int) (|F1| Int) (|L| Int) (|G1| (Array Int Int)) (|N| (Array Int Int)) (|H1| Int) (|P| Int) (|Q| Int) (|R| Int) (|S| Int) (|T| Int) (|U| Int) (|V| Int) (|W| Int) (|X| Int) (|Y| Int) (|Z| Int) (|A1| Bool) (|.loc.3| Bool) (|.loc.4| Bool) (|.x.93| Int) (|.x.95| Int) (|.x.97| (Array Int Int)) (|.x.98| (Array Int Int)) (|.x.100| Int) (|.x.102| Int) (|.x.104| Int) (|.x.108| Int) (|.x.106| (Array Int Int)) (|.loc.5| Bool) (|.loc.6| Bool) (|.x.110| Int) (|.x.116| Int) (|.x.113| Int) (|.x.115| Int) (|.x.117| Int) (|.x.103| Int) (|.x.109| Int) (|.x.118| Int) (|.x.99| Int) (|.x.112| Int) (|.x.111| Int) (|A1_3| Bool) (|.x.96| (Array Int Int)) (|.x.105| (Array Int Int)) (|.x.94| Int) (|.x.101| Int) (|.x.107| Int) (|.x.114| Int)) (=> (and (and (not .loc.4) (not .loc.3)) (and (and (and (and (and (and (and (= G1 N) (not A1)) (= B1 C)) (= E1 J)) (= H1 P)) (= F1 L)) (= C1 E)) (= D1 H))) (state |A| |B1| |C| |C1| |E| |F| |D1| |H| |E1| |J| |F1| |L| |G1| |N| |H1| |P| |Q| |R| |S| |T| |U| |V| |W| |X| |Y| |Z| |A1| |.loc.3| |.loc.4|))))
(assert (forall ((|A| Int) (|B1| Int) (|C| Int) (|C1| (Array Int Int)) (|E| (Array Int Int)) (|F| (Array Int Int)) (|D1| Int) (|H| Int) (|E1| Int) (|J| Int) (|F1| Int) (|L| Int) (|G1| (Array Int Int)) (|N| (Array Int Int)) (|H1| Int) (|P| Int) (|Q| Int) (|R| Int) (|S| Int) (|T| Int) (|U| Int) (|V| Int) (|W| Int) (|X| Int) (|Y| Int) (|Z| Int) (|A1| Bool) (|.loc.3| Bool) (|.loc.4| Bool) (|.x.93| Int) (|.x.95| Int) (|.x.97| (Array Int Int)) (|.x.98| (Array Int Int)) (|.x.100| Int) (|.x.102| Int) (|.x.104| Int) (|.x.108| Int) (|.x.106| (Array Int Int)) (|.loc.5| Bool) (|.loc.6| Bool) (|.x.110| Int) (|.x.116| Int) (|.x.113| Int) (|.x.115| Int) (|.x.117| Int) (|.x.103| Int) (|.x.109| Int) (|.x.118| Int) (|.x.99| Int) (|.x.112| Int) (|.x.111| Int) (|A1_3| Bool) (|.x.96| (Array Int Int)) (|.x.105| (Array Int Int)) (|.x.94| Int) (|.x.101| Int) (|.x.107| Int) (|.x.114| Int)) (=> (and (state |A| |B1| |C| |C1| |E| |F| |D1| |H| |E1| |J| |F1| |L| |G1| |N| |H1| |P| |Q| |R| |S| |T| |U| |V| |W| |X| |Y| |Z| |A1| |.loc.3| |.loc.4|) (let ((.def_40 (not .loc.3))) (let ((.def_91 (= .x.110 .x.116))) (let ((.def_95 (= .x.113 .x.115))) (let ((.def_119 (and (= .x.115 .x.117) (and (= .x.103 .x.109) (and (= .x.113 .x.118) (and (= .x.118 .x.99) (and (= .x.117 .x.99) (and (= .x.116 .x.109) (and (= .x.110 .x.112) (= .x.103 .x.112)))))))))) (let ((.def_122 (= S .x.111))) (let ((.def_148 (= .x.99 0))) (let ((.def_161 (or A1 (and (= (store (store C1 0 0) .x.99 1) .x.96) (and (= (store G1 .x.99 4) .x.105) (and (and (and (and (and (and (and (= .x.94 0) (not (<= A .x.99))) (= .x.101 0)) (= .x.107 0)) (= .x.103 0)) (not .def_148)) (= (select (select F .x.99) .x.103) 0)) (= (ite .def_148 0 (select C1 .x.99)) 0))))))) (let ((.def_187 (= A1 A1_3))) (let ((.def_214 (not .loc.6))) (and (and (not .loc.4) (and (= A .x.93) (and (= C .x.95) (and (= E .x.97) (and (= F .x.98) (and (= H .x.100) (and (= J .x.102) (and (= L .x.104) (and (= P .x.108) (= N .x.106)))))))))) (or (or (and (and (not .loc.5) .loc.6) (or (and .def_40 (and (or (not .def_91) (or A1 (not .def_95))) (and (or A1 .def_119) (and (and .def_122 A1_3) .def_161)))) (and (or A1 (= .x.114 0)) (and (= B1 .x.94) (and (= C1 .x.96) (and (= D1 .x.99) (and (= E1 .x.101) (and (= F1 .x.103) (and (= G1 .x.105) (and (= H1 .x.107) (and (= Q .x.109) (and (= R .x.110) (and (= T .x.112) (and (= U .x.113) (and (= W .x.115) (and (= X .x.116) (and (= Y .x.117) (and (= Z .x.118) (and (and .loc.3 (or A1_3 (= .x.111 .x.114))) .def_187))))))))))))))))))) (and (or .def_119 A1_3) (and (or A1_3 (and .def_91 .def_95)) (and (and .def_187 (and .loc.5 (and .def_40 (and .def_122 .def_161)))) .def_214)))) (and .def_214 (and .loc.5 (and .def_40 (and .def_161 (and .def_122 (and A1 A1_3)))))))))))))))))) (state |.x.93| |.x.94| |.x.95| |.x.96| |.x.97| |.x.98| |.x.99| |.x.100| |.x.101| |.x.102| |.x.103| |.x.104| |.x.105| |.x.106| |.x.107| |.x.108| |.x.109| |.x.110| |.x.111| |.x.112| |.x.113| |.x.114| |.x.115| |.x.116| |.x.117| |.x.118| |A1_3| |.loc.5| |.loc.6|))))
(assert (forall ((|A| Int) (|B1| Int) (|C| Int) (|C1| (Array Int Int)) (|E| (Array Int Int)) (|F| (Array Int Int)) (|D1| Int) (|H| Int) (|E1| Int) (|J| Int) (|F1| Int) (|L| Int) (|G1| (Array Int Int)) (|N| (Array Int Int)) (|H1| Int) (|P| Int) (|Q| Int) (|R| Int) (|S| Int) (|T| Int) (|U| Int) (|V| Int) (|W| Int) (|X| Int) (|Y| Int) (|Z| Int) (|A1| Bool) (|.loc.3| Bool) (|.loc.4| Bool) (|.x.93| Int) (|.x.95| Int) (|.x.97| (Array Int Int)) (|.x.98| (Array Int Int)) (|.x.100| Int) (|.x.102| Int) (|.x.104| Int) (|.x.108| Int) (|.x.106| (Array Int Int)) (|.loc.5| Bool) (|.loc.6| Bool) (|.x.110| Int) (|.x.116| Int) (|.x.113| Int) (|.x.115| Int) (|.x.117| Int) (|.x.103| Int) (|.x.109| Int) (|.x.118| Int) (|.x.99| Int) (|.x.112| Int) (|.x.111| Int) (|A1_3| Bool) (|.x.96| (Array Int Int)) (|.x.105| (Array Int Int)) (|.x.94| Int) (|.x.101| Int) (|.x.107| Int) (|.x.114| Int)) (=> (state |A| |B1| |C| |C1| |E| |F| |D1| |H| |E1| |J| |F1| |L| |G1| |N| |H1| |P| |Q| |R| |S| |T| |U| |V| |W| |X| |Y| |Z| |A1| |.loc.3| |.loc.4|) (not (and A1 (and .loc.4 (not .loc.3)))))))
(check-sat)
