(define-constant E8 u100000000) (define-read-only (s2e (n uint)) (* n u100)) (define-read-only (g1) (let ((p1 (unwrap-panic (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 get-pair-details 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token)))) (p2 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.simple-weight-pool-alex get-pool-details 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wusda))) (p3 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 get-pool-details 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token E8))) (x (/ (* E8 (get balance-y p1)) (get balance-x p1))) (y (/ (* x (get balance-x p2)) (get balance-y p2))) (z (/ (* y (get balance-x p3)) (get balance-y p3)))) (ok z))) (define-public (i1 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token in u0))) (t2 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.simple-weight-pool-alex swap-y-for-alex 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wusda (s2e (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender))) none))) (t3 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-y-for-x 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token E8 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token get-balance tx-sender)) none))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (o1 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-x-for-y 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token E8 (s2e in) none))) (t2 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.simple-weight-pool-alex swap-alex-for-y 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wusda (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token get-balance tx-sender)) none))) (t3 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender)) u0))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (b1 (l uint) (d uint)) (let ((r0 (unwrap-panic (g1))) (r1 (if (> r0 (+ E8 l)) (i1 d) (err u0))) (r2 (if (< r0 (- E8 l)) (o1 d) (err u0))) (r3 (if (and (is-err r1) (is-err r2)) E8 (unwrap-panic (g1)))) (r4 (if (> r3 (+ E8 l)) (i1 d) (err u0))) (r5 (if (< r3 (- E8 l)) (o1 d) (err u0))) (r6 (if (and (is-err r4) (is-err r5)) E8 (unwrap-panic (g1)))) (r7 (if (> r6 (+ E8 l)) (i1 d) (err u0))) (r8 (if (< r6 (- E8 l)) (o1 d) (err u0))) (r9 (if (and (is-err r7) (is-err r8)) E8 (unwrap-panic (g1)))) (ra (if (> r9 (+ E8 l)) (i1 d) (err u0))) (rb (if (< r9 (- E8 l)) (o1 d) (err u0))) (rc (if (and (is-err ra) (is-err rb)) E8 (unwrap-panic (g1)))) (rd (if (> rc (+ E8 l)) (i1 d) (err u0))) (re (if (< rc (- E8 l)) (o1 d) (err u0)))) (ok (list (ok r0) r1 r2)))) (define-read-only (g2) (let ((p1 (unwrap-panic (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 get-pair-details 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token)))) (p2 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 get-pool-details 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wdiko E8))) (p3 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 get-pool-details 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token E8))) (x (/ (* E8 (get balance-y p1)) (get balance-x p1))) (y (/ (* x (get balance-x p2)) (get balance-y p2))) (z (/ (* y (get balance-x p3)) (get balance-y p3)))) (ok z))) (define-public (i2 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token in u0))) (t2 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-y-for-x 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wdiko E8 (s2e (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token get-balance tx-sender))) none))) (t3 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-y-for-x 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token E8 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token get-balance tx-sender)) none))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (o2 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-x-for-y 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token u100000000 (s2e in) none))) (t2 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-x-for-y 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wdiko u100000000 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token get-balance tx-sender)) none))) (t3 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token get-balance tx-sender)) u0))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (b2 (l uint) (d uint)) (let ((r0 (unwrap-panic (g2))) (r1 (if (> r0 (+ E8 l)) (i2 d) (err u0))) (r2 (if (< r0 (- E8 l)) (o2 d) (err u0))) (r3 (if (and (is-err r1) (is-err r2)) E8 (unwrap-panic (g2)))) (r4 (if (> r3 (+ E8 l)) (i2 d) (err u0))) (r5 (if (< r3 (- E8 l)) (o2 d) (err u0))) (r6 (if (and (is-err r4) (is-err r5)) E8 (unwrap-panic (g2)))) (r7 (if (> r6 (+ E8 l)) (i2 d) (err u0))) (r8 (if (< r6 (- E8 l)) (o2 d) (err u0))) (r9 (if (and (is-err r7) (is-err r8)) E8 (unwrap-panic (g2)))) (ra (if (> r9 (+ E8 l)) (i2 d) (err u0))) (rb (if (< r9 (- E8 l)) (o2 d) (err u0))) (rc (if (and (is-err ra) (is-err rb)) E8 (unwrap-panic (g2)))) (rd (if (> rc (+ E8 l)) (i2 d) (err u0))) (re (if (< rc (- E8 l)) (o2 d) (err u0)))) (ok (list (ok r0) r1 r2)))) (define-read-only (g3) (let ((p1 (unwrap-panic (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 get-pair-details 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP3NE50GEXFG9SZGTT51P40X2CKYSZ5CC4ZTZ7A2G.welshcorgicoin-token)))) (p2 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool get-pool-details 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wcorgi E8))) (x (/ (* E8 (get balance-y p1)) (get balance-x p1))) (y (/ (* x (get balance-x p2)) (get balance-y p2)))) (ok y))) (define-public (i3 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP3NE50GEXFG9SZGTT51P40X2CKYSZ5CC4ZTZ7A2G.welshcorgicoin-token in u0))) (t2 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool swap-y-for-x 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wcorgi E8 (s2e (unwrap-panic (contract-call? 'SP3NE50GEXFG9SZGTT51P40X2CKYSZ5CC4ZTZ7A2G.welshcorgicoin-token get-balance tx-sender))) none))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (o3 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool swap-x-for-y 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wcorgi E8 (s2e in) none))) (t2 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP3NE50GEXFG9SZGTT51P40X2CKYSZ5CC4ZTZ7A2G.welshcorgicoin-token (unwrap-panic (contract-call? 'SP3NE50GEXFG9SZGTT51P40X2CKYSZ5CC4ZTZ7A2G.welshcorgicoin-token get-balance tx-sender)) u0))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (b3 (l uint) (d uint)) (let ((r0 (unwrap-panic (g3))) (r1 (if (> r0 (+ E8 l)) (i3 d) (err u0))) (r2 (if (< r0 (- E8 l)) (o3 d) (err u0))) (r3 (if (and (is-err r1) (is-err r2)) E8 (unwrap-panic (g3)))) (r4 (if (> r3 (+ E8 l)) (i3 d) (err u0))) (r5 (if (< r3 (- E8 l)) (o3 d) (err u0))) (r6 (if (and (is-err r4) (is-err r5)) E8 (unwrap-panic (g3)))) (r7 (if (> r6 (+ E8 l)) (i3 d) (err u0))) (r8 (if (< r6 (- E8 l)) (o3 d) (err u0))) (r9 (if (and (is-err r7) (is-err r8)) E8 (unwrap-panic (g3)))) (ra (if (> r9 (+ E8 l)) (i3 d) (err u0))) (rb (if (< r9 (- E8 l)) (o3 d) (err u0))) (rc (if (and (is-err ra) (is-err rb)) E8 (unwrap-panic (g3)))) (rd (if (> rc (+ E8 l)) (i3 d) (err u0))) (re (if (< rc (- E8 l)) (o3 d) (err u0)))) (ok (list (ok r0) r1 r2)))) (define-read-only (g4) (let ((p1 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.fixed-weight-pool-v1-01 get-pool-details 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token u50000000 u50000000))) (p2 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 get-pool-details 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token E8))) (x (/ (* E8 (get balance-y p1)) (get balance-x p1))) (y (/ (* x (get balance-x p2)) (get balance-y p2)))) (ok y))) (define-public (i4 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.fixed-weight-pool-v1-01 swap-x-for-y 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token u50000000 u50000000 (s2e in) none))) (t2 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-y-for-x 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token E8 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token get-balance tx-sender)) none))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (o4 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-x-for-y 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token E8 (s2e in) none))) (t2 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.fixed-weight-pool-v1-01 swap-y-for-x 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token u50000000 u50000000 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token get-balance tx-sender)) none))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (b4 (l uint) (d uint)) (let ((r0 (unwrap-panic (g4))) (r1 (if (> r0 (+ E8 l)) (i4 d) (err u0))) (r2 (if (< r0 (- E8 l)) (o4 d) (err u0))) (r3 (if (and (is-err r1) (is-err r2)) E8 (unwrap-panic (g4)))) (r4 (if (> r3 (+ E8 l)) (i4 d) (err u0))) (r5 (if (< r3 (- E8 l)) (o4 d) (err u0))) (r6 (if (and (is-err r4) (is-err r5)) E8 (unwrap-panic (g4)))) (r7 (if (> r6 (+ E8 l)) (i4 d) (err u0))) (r8 (if (< r6 (- E8 l)) (o4 d) (err u0))) (r9 (if (and (is-err r7) (is-err r8)) E8 (unwrap-panic (g4)))) (ra (if (> r9 (+ E8 l)) (i4 d) (err u0))) (rb (if (< r9 (- E8 l)) (o4 d) (err u0))) (rc (if (and (is-err ra) (is-err rb)) E8 (unwrap-panic (g4)))) (rd (if (> rc (+ E8 l)) (i4 d) (err u0))) (re (if (< rc (- E8 l)) (o4 d) (err u0)))) (ok (list (ok r0) r1 r2)))) (define-read-only (g5) (let ((p1 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.fixed-weight-pool-v1-01 get-pool-details 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wbtc u50000000 u50000000))) (p2 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 get-pool-details 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wbtc E8))) (x (/ (* E8 (get balance-y p1)) (get balance-x p1))) (y (/ (* x (get balance-x p2)) (get balance-y p2)))) (ok y))) (define-public (i5 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.fixed-weight-pool-v1-01 swap-x-for-y 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wbtc u50000000 u50000000 (s2e in) none))) (t2 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-y-for-x 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wbtc E8 (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender)) none))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (o5 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-x-for-y 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wbtc E8 (s2e in) none))) (t2 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.fixed-weight-pool-v1-01 swap-y-for-x 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wbtc u50000000 u50000000 (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender)) none))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (b5 (l uint) (d uint)) (let ((r0 (unwrap-panic (g5))) (r1 (if (> r0 (+ E8 l)) (i5 d) (err u0))) (r2 (if (< r0 (- E8 l)) (o5 d) (err u0))) (r3 (if (and (is-err r1) (is-err r2)) E8 (unwrap-panic (g5)))) (r4 (if (> r3 (+ E8 l)) (i5 d) (err u0))) (r5 (if (< r3 (- E8 l)) (o5 d) (err u0))) (r6 (if (and (is-err r4) (is-err r5)) E8 (unwrap-panic (g5)))) (r7 (if (> r6 (+ E8 l)) (i5 d) (err u0))) (r8 (if (< r6 (- E8 l)) (o5 d) (err u0))) (r9 (if (and (is-err r7) (is-err r8)) E8 (unwrap-panic (g5)))) (ra (if (> r9 (+ E8 l)) (i5 d) (err u0))) (rb (if (< r9 (- E8 l)) (o5 d) (err u0))) (rc (if (and (is-err ra) (is-err rb)) E8 (unwrap-panic (g5)))) (rd (if (> rc (+ E8 l)) (i5 d) (err u0))) (re (if (< rc (- E8 l)) (o5 d) (err u0)))) (ok (list (ok r0) r1 r2)))) (define-read-only (g6) (let ((p1 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 get-pool-details 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wbtc E8))) (p2 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 get-pool-details 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc E8))) (x (/ (* E8 (get balance-y p1)) (get balance-x p1))) (y (/ (* x (get balance-x p2)) (get balance-y p2)))) (ok y))) (define-public (i6 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-x-for-y 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wbtc E8 (s2e in) none ))) (t2 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-y-for-x 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wbtc u5000000 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wbtc get-balance tx-sender)) none ))) (t3 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-y-for-x 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc E8 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc get-balance tx-sender)) none ))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (o6 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-x-for-y 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc E8 (s2e in) none ))) (t2 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-x-for-y 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wbtc u5000000 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc get-balance tx-sender)) none ))) (t3 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-y-for-x 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wbtc E8 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wbtc get-balance tx-sender)) none ))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (b6 (l uint) (d uint)) (let ((r0 (unwrap-panic (g6))) (r1 (if (> r0 (+ E8 l)) (i6 d) (err u0))) (r2 (if (< r0 (- E8 l)) (o6 d) (err u0))) (r3 (if (and (is-err r1) (is-err r2)) E8 (unwrap-panic (g6)))) (r4 (if (> r3 (+ E8 l)) (i6 d) (err u0))) (r5 (if (< r3 (- E8 l)) (o6 d) (err u0))) (r6 (if (and (is-err r4) (is-err r5)) E8 (unwrap-panic (g6)))) (r7 (if (> r6 (+ E8 l)) (i6 d) (err u0))) (r8 (if (< r6 (- E8 l)) (o6 d) (err u0))) (r9 (if (and (is-err r7) (is-err r8)) E8 (unwrap-panic (g6)))) (ra (if (> r9 (+ E8 l)) (i6 d) (err u0))) (rb (if (< r9 (- E8 l)) (o6 d) (err u0))) (rc (if (and (is-err ra) (is-err rb)) E8 (unwrap-panic (g6)))) (rd (if (> rc (+ E8 l)) (i6 d) (err u0))) (re (if (< rc (- E8 l)) (o6 d) (err u0)))) (ok (list (ok r0) r1 r2)))) (define-read-only (g7) (let ((p1 (unwrap-panic (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-core get-pool u3))) (p2 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 get-pool-details 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc E8))) (x (/ (* E8 (get reserve1 p1)) (get reserve0 p1))) (y (/ (* x (get balance-x p2)) (get balance-y p2)))) (ok (/ y u100)))) (define-public (i7 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u3 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to in u1 ))) (t2 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-y-for-x 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc E8 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc get-balance tx-sender)) none ))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (o7 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-x-for-y 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc E8 (s2e in) none ))) (t2 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u3 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc get-balance tx-sender)) u1 ))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (b7 (l uint) (d uint)) (let ((r0 (unwrap-panic (g7))) (r1 (if (> r0 (+ E8 l)) (i7 d) (err u0))) (r2 (if (< r0 (- E8 l)) (o7 d) (err u0))) (r3 (if (and (is-err r1) (is-err r2)) E8 (unwrap-panic (g7)))) (r4 (if (> r3 (+ E8 l)) (i7 d) (err u0))) (r5 (if (< r3 (- E8 l)) (o7 d) (err u0))) (r6 (if (and (is-err r4) (is-err r5)) E8 (unwrap-panic (g7)))) (r7 (if (> r6 (+ E8 l)) (i7 d) (err u0))) (r8 (if (< r6 (- E8 l)) (o7 d) (err u0))) (r9 (if (and (is-err r7) (is-err r8)) E8 (unwrap-panic (g7)))) (ra (if (> r9 (+ E8 l)) (i7 d) (err u0))) (rb (if (< r9 (- E8 l)) (o7 d) (err u0))) (rc (if (and (is-err ra) (is-err rb)) E8 (unwrap-panic (g7)))) (rd (if (> rc (+ E8 l)) (i7 d) (err u0))) (re (if (< rc (- E8 l)) (o7 d) (err u0)))) (ok (list (ok r0) r1 r2)))) (define-read-only (g8) (let ((p1 (unwrap-panic (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-core get-pool u6))) (p2 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 get-pool-details 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-waeusdc E8))) (x (/ (* E8 (get reserve1 p1)) (get reserve0 p1))) (y (/ (* x (get balance-x p2)) (get balance-y p2)))) (ok y))) (define-public (i8 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u6 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to in u1 ))) (t2 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-y-for-x 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-waeusdc E8 (s2e (unwrap-panic (contract-call? 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc get-balance tx-sender))) none ))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (o8 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.amm-swap-pool-v1-1 swap-x-for-y 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-waeusdc E8 (s2e in) none ))) (t2 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u6 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc get-balance tx-sender)) u1 ))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (b8 (l uint) (d uint)) (let ((r0 (unwrap-panic (g8))) (r1 (if (> r0 (+ E8 l)) (i8 d) (err u0))) (r2 (if (< r0 (- E8 l)) (o8 d) (err u0))) (r3 (if (and (is-err r1) (is-err r2)) E8 (unwrap-panic (g8)))) (r4 (if (> r3 (+ E8 l)) (i8 d) (err u0))) (r5 (if (< r3 (- E8 l)) (o8 d) (err u0))) (r6 (if (and (is-err r4) (is-err r5)) E8 (unwrap-panic (g8)))) (r7 (if (> r6 (+ E8 l)) (i8 d) (err u0))) (r8 (if (< r6 (- E8 l)) (o8 d) (err u0))) (r9 (if (and (is-err r7) (is-err r8)) E8 (unwrap-panic (g8)))) (ra (if (> r9 (+ E8 l)) (i8 d) (err u0))) (rb (if (< r9 (- E8 l)) (o8 d) (err u0))) (rc (if (and (is-err ra) (is-err rb)) E8 (unwrap-panic (g8)))) (rd (if (> rc (+ E8 l)) (i8 d) (err u0))) (re (if (< rc (- E8 l)) (o8 d) (err u0)))) (ok (list (ok r0) r1 r2)))) (define-public (swap-multiple (l1 uint) (d1 uint) (l2 uint) (d2 uint) (l3 uint) (d3 uint) (l4 uint) (d4 uint) (l5 uint) (d5 uint) (l6 uint) (d6 uint) (l7 uint) (d7 uint) (l8 uint) (d8 uint) (k uint)) (let ((d (list (ok u0) (err u0) (err u0))) (s (list (if (> l1 u0) (unwrap-panic (b1 l1 d1)) d) (if (> l2 u0) (unwrap-panic (b2 l2 d2)) d) (if (> l3 u0) (unwrap-panic (b3 l3 d3)) d) (if (> l4 u0) (unwrap-panic (b4 l4 d4)) d) (if (> l5 u0) (unwrap-panic (b5 l5 d5)) d) (if (> l6 u0) (unwrap-panic (b6 l6 d6)) d) (if (> l7 u0) (unwrap-panic (b7 l7 d7)) d) (if (> l8 u0) (unwrap-panic (b8 l8 d8)) d))) (c (stx-get-balance tx-sender))) (and (> c k) (try! (stx-transfer? (- c k) tx-sender 'SP1VSDGJ3RCR2K8V1SY5DGNR733YACKPXPHEMXTFD))) (ok s)))