(define-constant E8 u100000000) (define-constant E2 u100) (define-read-only (s2e (n uint)) (* n E2)) (define-private (c10 (bp (buff 64))) (if (is-eq (mod (buff-to-uint-be (unwrap-panic (element-at? bp u6))) u13) u0) {d:u0,i:true,o:u0,ox:u0,p:u0} (let ((db (buff-to-uint-be (unwrap-panic (element-at? bp u10)))) (p1 (unwrap-panic (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 get-pair-details 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token)))) (p2 (unwrap-panic (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 get-pair-details 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token)))) (p3 (unwrap-panic (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 get-pair-details 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin)))) (x1 (s2e (get balance-x p1))) (y1 (s2e (get balance-y p1))) (f1 u300000) (x2 (s2e (get balance-y p2))) (y2 (s2e (get balance-x p2))) (f2 f1) (x3 (s2e (get balance-y p3))) (y3 (s2e (get balance-x p3))) (f3 f1)) (sw3 x1 y1 f1 x2 y2 f2 x3 y3 f3)))) (define-public (i10 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token in u0))) (t2 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender)) u0))) (t3 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender)) u0))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (o10 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin in u0))) (t2 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender)) u0))) (t3 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender)) u0))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-private (c11 (bp (buff 64))) (let ((db (buff-to-uint-be (unwrap-panic (element-at? bp u11)))) (p1 (unwrap-panic (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 get-pair-details 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token)))) (p2 (unwrap-panic (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 get-pair-details 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token)))) (p3 (unwrap-panic (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 get-pair-details 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token)))) (x1 (s2e (get balance-x p1))) (y1 (s2e (get balance-y p1))) (f1 u300000) (x2 (s2e (get balance-y p2))) (y2 (s2e (get balance-x p2))) (f2 f1) (x3 (s2e (get balance-y p3))) (y3 (s2e (get balance-x p3))) (f3 f1)) (sw3 x1 y1 f1 x2 y2 f2 x3 y3 f3))) (define-public (i11 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token in u0))) (t2 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender)) u0))) (t3 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token get-balance tx-sender)) u0))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (o11 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token in u0))) (t2 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token get-balance tx-sender)) u0))) (t3 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender)) u0))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-private (c12 (bp (buff 64))) (let ((db (buff-to-uint-be (unwrap-panic (element-at? bp u12)))) (p1 (unwrap-panic (contract-call? 'SP1WPF0EQG2FMT50M5ZPK3H9BCR6FYRMV6WMFY4A1.univ2-core get-pool u6))) (p2 (unwrap-panic (contract-call? 'SP1WPF0EQG2FMT50M5ZPK3H9BCR6FYRMV6WMFY4A1.univ2-core get-pool u22))) (p3 (unwrap-panic (contract-call? 'SP1WPF0EQG2FMT50M5ZPK3H9BCR6FYRMV6WMFY4A1.univ2-core get-pool u21))) (x1 (s2e (get reserve0 p1))) (y1 (s2e (get reserve1 p1))) (f1 (- E8 (/ (* E8 (get num (get swap-fee p1))) (get den (get swap-fee p1))))) (x2 (s2e (get reserve1 p2))) (y2 (s2e (get reserve0 p2))) (f2 (- E8 (/ (* E8 (get num (get swap-fee p2))) (get den (get swap-fee p2))))) (x3 (s2e (get reserve0 p3))) (y3 (s2e (get reserve1 p3))) (f3 (- E8 (/ (* E8 (get num (get swap-fee p3))) (get den (get swap-fee p3)))))) (sw3 x1 y1 f1 x2 y2 f2 x3 y3 f3))) (define-public (i12 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u6 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to in u1 ))) (t2 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u22 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.velar-token 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.velar-token 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc get-balance tx-sender)) u1 ))) (t3 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u21 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.velar-token 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.velar-token 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.velar-token get-balance tx-sender)) u1 ))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (o12 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t3 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u21 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.velar-token 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.velar-token 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to in u1 ))) (t2 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u22 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.velar-token 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.velar-token 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.velar-token get-balance tx-sender)) u1 ))) (t1 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u6 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc get-balance tx-sender)) u1 ))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-private (c13 (bp (buff 64))) (if (is-eq (mod (buff-to-uint-be (unwrap-panic (element-at? bp u6))) u13) u0) {d:u0,i:true,o:u0,ox:u0,p:u0} (let ((db (buff-to-uint-be (unwrap-panic (element-at? bp u13)))) (p1 (unwrap-panic (contract-call? 'SP1WPF0EQG2FMT50M5ZPK3H9BCR6FYRMV6WMFY4A1.univ2-core get-pool u6))) (p2 (unwrap-panic (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 get-pair-details 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token)))) (x1 (s2e (get reserve0 p1))) (y1 (s2e (get reserve1 p1))) (f1 (- E8 (/ (* E8 (get num (get swap-fee p1))) (get den (get swap-fee p1))))) (x2 (s2e (get balance-y p2))) (y2 (s2e (get balance-x p2))) (f2 u300000)) (sw2 x1 y1 f1 x2 y2 f2)))) (define-public (i13 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u6 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to in u1 ))) (t2 (unwrap-panic (contract-call? 'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stableswap-usda-aeusdc-v-1-4 swap-y-for-x 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token 'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.usda-aeusdc-lp-token-v-1-4 (unwrap-panic (contract-call? 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc get-balance tx-sender)) u1 ))) (t3 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender)) u0))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (o13 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t3 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token in u0))) (t2 (unwrap-panic (contract-call? 'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stableswap-usda-aeusdc-v-1-2 swap-x-for-y 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.usda-aeusdc-lp-token-v-1-2 (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender)) u1 ))) (t1 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u6 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc get-balance tx-sender)) u1 ))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (i14 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u6 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to in u1 ))) (t2 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u8 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc get-balance tx-sender)) u1 ))) (t3 (unwrap-panic (contract-call? 'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stableswap-stx-ststx-v-1-2 swap-y-for-x 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token 'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stx-ststx-lp-token-v-1-2 (unwrap-panic (contract-call? 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token get-balance tx-sender)) u1 ))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (o14 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t3 (unwrap-panic (contract-call? 'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stableswap-stx-ststx-v-1-2 swap-x-for-y 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token 'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stx-ststx-lp-token-v-1-2 in u1 ))) (t2 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u8 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token get-balance tx-sender)) u1 ))) (t1 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u6 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc get-balance tx-sender)) u1 ))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (i15 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t1 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token in u0))) (t2 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender)) u0))) (t3 (unwrap-panic (contract-call? 'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stableswap-abtc-xbtc-v-1-2 swap-y-for-x 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.abtc-xbtc-lp-token-v-1-2 (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender)) u1 ))) (t4 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u8 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc get-balance tx-sender)) u1 ))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-public (o15 (in uint)) (begin (let ((bb (stx-get-balance tx-sender)) (t4 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u8 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to in u1 ))) (t3 (unwrap-panic (contract-call? 'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stableswap-abtc-xbtc-v-1-2 swap-x-for-y 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.abtc-xbtc-lp-token-v-1-2 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc get-balance tx-sender)) u1 ))) (t2 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender)) u0))) (t1 (try! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender)) u0))) (ba (stx-get-balance tx-sender))) (asserts! (>= ba bb) (err (- bb ba))) (ok (- ba bb))))) (define-map fm uint bool) (define-read-only (ms (c (tuple (c uint) (d uint) (i bool) (o uint) (ox uint) (p uint))) (s (tuple (c uint) (d uint) (i bool) (o uint) (ox uint) (p uint)))) (if (and (> (get ox c) (get ox s)) (> (get ox c) u100000) (> (get d c) u0) (not (is-some (map-get? fm (+ (* burn-block-height u100) (get c c)))))) c s)) (define-public (hic (bp (buff 64))) (let ((p10 (merge (c10 bp) {c:u10})) (p11 (merge (c11 bp) {c:u11})) (p12 (merge (c12 bp) {c:u12})) (p13 (merge (c13 bp) {c:u13})) (rc (fold ms (list p11 p12 p13) {c:u0,d:u0,i:true,o:u0,ox:u0,p:u0})) (cn (get c rc)) (c (stx-get-balance tx-sender)) (dx (/ (get d rc) E2)) (d (if (< dx c) dx c)) (rs (if (is-eq cn u0) (ok u0) (if (is-eq cn u10) (if (get i rc) (i10 d) (o10 d)) (if (is-eq cn u11) (if (get i rc) (i11 d) (o11 d)) (if (is-eq cn u12) (if (get i rc) (i12 d) (o12 d)) (if (is-eq cn u13) (if (get i rc) (i13 d) (o13 d)) (err u0))))))) (k (* u10000000 (buff-to-uint-be (unwrap-panic (element-at? bp u20)))))) (if (is-err rs) (map-set fm (+ (* burn-block-height u100) (get c rc)) true) true) (and (> c k) (try! (stx-transfer? (- c k) tx-sender (unwrap-panic (principal-construct? 0x16 (unwrap-panic (as-max-len? (unwrap-panic (slice? bp u0 u20)) u20))))))) (ok {rc:rc,rs:rs}))) (define-public (hic-0 (bp (buff 64))) (hic bp)) (define-public (hic-1 (bp (buff 64))) (hic bp)) (define-public (hic-2 (bp (buff 64))) (hic bp)) (define-public (hic-3 (bp (buff 64))) (hic bp)) (define-public (hic-4 (bp (buff 64))) (hic bp)) (define-public (hic-5 (bp (buff 64))) (hic bp)) (define-public (hic-6 (bp (buff 64))) (hic bp)) (define-public (hic-7 (bp (buff 64))) (hic bp)) (define-public (hic-8 (bp (buff 64))) (hic bp)) (define-public (hic-a (b uint)) (i13 b)) (define-public (hic-b (b uint)) (o13 b)) (define-public (hic-c (b uint)) (i14 b)) (define-public (hic-d (b uint)) (o14 b)) (define-public (dr-0 (b uint)) (err (i13 b))) (define-public (dr-1 (b uint)) (err (o13 b))) (define-public (dr-2 (b uint)) (err (i14 b))) (define-public (dr-3 (b uint)) (err (o14 b))) (define-public (dr-4 (b uint)) (err (i15 b))) (define-public (dr-5 (b uint)) (err (o15 b))) (define-public (dr-a) (let ((i1 (unwrap-err-panic (dr-0 E8))) (i2 (if (is-err i1) i1 (unwrap-err-panic (dr-0 (* u2 E8))))) (i3 (if (is-err i2) i2 (unwrap-err-panic (dr-0 (* u3 E8))))) (i4 (if (is-err i3) i3 (unwrap-err-panic (dr-0 (* u4 E8))))) (i5 (if (is-err i4) i4 (unwrap-err-panic (dr-0 (* u5 E8))))) (i6 (if (is-err i5) i5 (unwrap-err-panic (dr-0 (* u6 E8))))) (i7 (if (is-err i6) i6 (unwrap-err-panic (dr-0 (* u7 E8))))) (o1 (unwrap-err-panic (dr-1 E8))) (o2 (if (is-err o1) o1 (unwrap-err-panic (dr-1 (* u2 E8))))) (o3 (if (is-err o2) o2 (unwrap-err-panic (dr-1 (* u3 E8))))) (o4 (if (is-err o3) o3 (unwrap-err-panic (dr-1 (* u4 E8))))) (o5 (if (is-err o4) o4 (unwrap-err-panic (dr-1 (* u5 E8))))) (o6 (if (is-err o5) o5 (unwrap-err-panic (dr-1 (* u6 E8))))) (o7 (if (is-err o6) o6 (unwrap-err-panic (dr-1 (* u7 E8)))))) (ok (list i1 i2 i3 i4 i5 i6 i7 o1 o2 o3 o4 o5 o6 o7)))) (define-public (dr-b) (let ((i1 (unwrap-err-panic (dr-2 E8))) (i2 (if (is-err i1) i1 (unwrap-err-panic (dr-2 (* u2 E8))))) (i3 (if (is-err i2) i2 (unwrap-err-panic (dr-2 (* u3 E8))))) (i4 (if (is-err i3) i3 (unwrap-err-panic (dr-2 (* u4 E8))))) (i5 (if (is-err i4) i4 (unwrap-err-panic (dr-2 (* u5 E8))))) (i6 (if (is-err i5) i5 (unwrap-err-panic (dr-2 (* u6 E8))))) (i7 (if (is-err i6) i6 (unwrap-err-panic (dr-2 (* u7 E8))))) (o1 (unwrap-err-panic (dr-3 E8))) (o2 (if (is-err o1) o1 (unwrap-err-panic (dr-3 (* u2 E8))))) (o3 (if (is-err o2) o2 (unwrap-err-panic (dr-3 (* u3 E8))))) (o4 (if (is-err o3) o3 (unwrap-err-panic (dr-3 (* u4 E8))))) (o5 (if (is-err o4) o4 (unwrap-err-panic (dr-3 (* u5 E8))))) (o6 (if (is-err o5) o5 (unwrap-err-panic (dr-3 (* u6 E8))))) (o7 (if (is-err o6) o6 (unwrap-err-panic (dr-3 (* u7 E8)))))) (ok (list i1 i2 i3 i4 i5 i6 i7 o1 o2 o3 o4 o5 o6 o7)))) (define-public (dr-c) (let ((i1 (unwrap-err-panic (dr-4 E8))) (i2 (if (is-err i1) i1 (unwrap-err-panic (dr-4 (* u2 E8))))) (i3 (if (is-err i2) i2 (unwrap-err-panic (dr-4 (* u3 E8))))) (i4 (if (is-err i3) i3 (unwrap-err-panic (dr-4 (* u4 E8))))) (i5 (if (is-err i4) i4 (unwrap-err-panic (dr-4 (* u5 E8))))) (i6 (if (is-err i5) i5 (unwrap-err-panic (dr-4 (* u6 E8))))) (i7 (if (is-err i6) i6 (unwrap-err-panic (dr-4 (* u7 E8))))) (o1 (unwrap-err-panic (dr-5 E8))) (o2 (if (is-err o1) o1 (unwrap-err-panic (dr-5 (* u2 E8))))) (o3 (if (is-err o2) o2 (unwrap-err-panic (dr-5 (* u3 E8))))) (o4 (if (is-err o3) o3 (unwrap-err-panic (dr-5 (* u4 E8))))) (o5 (if (is-err o4) o4 (unwrap-err-panic (dr-5 (* u5 E8))))) (o6 (if (is-err o5) o5 (unwrap-err-panic (dr-5 (* u6 E8))))) (o7 (if (is-err o6) o6 (unwrap-err-panic (dr-5 (* u7 E8)))))) (ok (list i1 i2 i3 i4 i5 i6 i7 o1 o2 o3 o4 o5 o6 o7)))) (define-public (swap-x-for-y (b uint)) (ok (o13 b))) (define-public (swap-y-for-x (b uint)) (ok (i13 b))) (define-private (md (a uint) (b uint)) (/ (* a b) E8)) (define-private (dd (a uint) (b uint)) (/ (* a E8) b)) (define-private (pus (i int) (t (list 3 uint))) (let ((u (* u2 (unwrap-panic (element-at? t u0)))) (r (if (> u E8) (- u E8) u)) (c (sqrti (* E8 (unwrap-panic (element-at? t u1))))) (s (if (< u E8) (unwrap-panic (element-at? t u2)) (md (unwrap-panic (element-at? t u2)) c)))) (list r c s))) (define-private (pu (a uint) (b uint)) (let ((s (if (>= b E8) a E8)) (sr (if (>= b E8) (- b E8) b)) (r (fold pus (list 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0) (list sr a E8)))) (md s (unwrap-panic (element-at? r u2))))) (define-private (es2 (x1 uint) (y1 uint) (f1 uint) (x2 uint) (y2 uint) (f2 uint) (d uint)) (let ((d1 (md d (- E8 f1))) (t1 (/ (* d1 y1) (+ d1 x1))) (d2 (md t1 (- E8 f2))) (t2 (/ (* d2 y2) (+ d2 x2)))) (if (> t2 d) (- t2 d) u0))) (define-private (fsw2 (d uint) (t (list 8 uint))) (let ((x1 (unwrap-panic (element-at? t u0))) (y1 (unwrap-panic (element-at? t u1))) (f1 (unwrap-panic (element-at? t u2))) (x2 (unwrap-panic (element-at? t u3))) (y2 (unwrap-panic (element-at? t u4))) (f2 (unwrap-panic (element-at? t u5))) (pox (unwrap-panic (element-at? t u6))) (nox (es2 x1 y1 f1 x2 y2 f2 (* d E8)))) (if (> nox pox) (list x1 y1 f1 x2 y2 f2 nox (* d E8)) t))) (define-private (sw2 (x1 uint) (y1 uint) (f1 uint) (x2 uint) (y2 uint) (f2 uint)) (let ((z (/ (* (/ (* E8 y1) x1) y2) x2)) (i (> z E8)) (ts (list u100 u200 u400 u600 u800 u1000)) (sw (if i (fold fsw2 ts (list x1 y1 f1 x2 y2 f2 u0 u0)) (fold fsw2 ts (list y2 x2 f2 y1 x1 f1 u0 u0))))) {d:(unwrap-panic (element-at? sw u7)),i:i,o:z,p:u0,ox:(unwrap-panic (element-at? sw u6))} )) (define-private (es3 (x1 uint) (y1 uint) (f1 uint) (x2 uint) (y2 uint) (f2 uint) (x3 uint) (y3 uint) (f3 uint) (d uint)) (let ((d1 (md d (- E8 f1))) (t1 (/ (* d1 y1) (+ d1 x1))) (d2 (md t1 (- E8 f2))) (t2 (/ (* d2 y2) (+ d2 x2))) (d3 (md t2 (- E8 f3))) (t3 (/ (* d3 y3) (+ d3 x3)))) (if (> t3 d) (- t3 d) u0))) (define-private (fsw3 (d uint) (t (list 11 uint))) (let ((x1 (unwrap-panic (element-at? t u0))) (y1 (unwrap-panic (element-at? t u1))) (f1 (unwrap-panic (element-at? t u2))) (x2 (unwrap-panic (element-at? t u3))) (y2 (unwrap-panic (element-at? t u4))) (f2 (unwrap-panic (element-at? t u5))) (x3 (unwrap-panic (element-at? t u6))) (y3 (unwrap-panic (element-at? t u7))) (f3 (unwrap-panic (element-at? t u8))) (pox (unwrap-panic (element-at? t u9))) (nox (es3 x1 y1 f1 x2 y2 f2 x3 y3 f3 (* d E8)))) (if (> nox pox) (list x1 y1 f1 x2 y2 f2 x3 y3 f3 nox (* d E8)) t))) (define-private (sw3 (x1 uint) (y1 uint) (f1 uint) (x2 uint) (y2 uint) (f2 uint) (x3 uint) (y3 uint) (f3 uint)) (let ((z (/ (* (/ (* (/ (* E8 y1) x1) y2) x2) y3) x3)) (i (> z E8)) (ts (list u100 u200 u400 u600 u800 u1000)) (sw (if i (fold fsw3 ts (list x1 y1 f1 x2 y2 f2 x3 y3 f3 u0 u0)) (fold fsw3 ts (list y3 x3 f3 y2 x2 f2 y1 x1 f1 u0 u0))))) {d:(unwrap-panic (element-at? sw u10)),i:i,o:z,p:u0,ox:(unwrap-panic (element-at? sw u9))} )) (define-private (ess (x uint) (y uint) (r uint) (f uint) (d uint)) (let ((k (+ (pu x r) (pu y r))) (d1 (md d (- E8 f))) (t1 (pu (+ x d1) r)) (t2 (pu (- k t1) (dd E8 r))) (ox (- y t2))) (dd ox d)))