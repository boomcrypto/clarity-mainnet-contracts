(use-trait alex-trait 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.trait-sip-010.sip-010-trait)
(use-trait arka-trait 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.sip-010-trait-ft-standard.sip-010-trait)
(use-trait ss-trait 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.sip-010-v1a.sip-010-trait)
(use-trait ss-lq 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.liquidity-token-trait-v4c.liquidity-token-trait)
(use-trait velar-trait 'SP2AKWJYC7BNY18W1XXKPGP0YVEK63QJG4793Z2D4.sip-010-trait-ft-standard.sip-010-trait)
(use-trait velar-fee-trait 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to-trait.share-fee-to-trait)
(define-constant E8 u100000000)
(define-read-only (m100 (n uint)) (* n u100))
(define-private (alex-xy (x <alex-trait>) (y <alex-trait>) (factor uint) (dx uint)) (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 swap-x-for-y x y factor dx none))
(define-private (alex-yx (x <alex-trait>) (y <alex-trait>) (factor uint) (dy uint)) (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 swap-y-for-x x y factor dy none))
(define-private (arka-xy (x <arka-trait>) (y <arka-trait>) (dx uint)) (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y x y dx u0))
(define-private (arka-yx (x <arka-trait>) (y <arka-trait>) (dy uint)) (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x x y dy u0))
(define-public (ss-xy (x <ss-trait>) (y <ss-trait>) (lq <ss-lq>) (dx uint)) (contract-call? 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.stackswap-swap-v5k swap-x-for-y x y lq dx u0))
(define-public (ss-yx (x <ss-trait>) (y <ss-trait>) (lq <ss-lq>) (dy uint)) (contract-call? 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.stackswap-swap-v5k swap-y-for-x x y lq dy u0))
(define-public (velar (id uint) (token0 <velar-trait>) (token1 <velar-trait>) (token-in <velar-trait>) (token-out <velar-trait>) (fee-to <velar-fee-trait>) (amt-in uint)) (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens id token0 token1 token-in token-out fee-to amt-in u1))
(define-constant OWNER tx-sender)
(define-map factors uint int)
(map-set factors u1 3) (map-set factors u2 17) (map-set factors u3 31) (map-set factors u4 17431) (map-set factors u5 42071) (map-set factors u6 2027) (map-set factors u7 2567891)
(define-public (set-factors (vs (list 10 { i: uint, v: int })))  (let ((hs (match (principal-destruct? contract-caller) okv (get hash-bytes okv) erv (get hash-bytes erv)))) (asserts! (and (is-eq (unwrap-panic (slice? hs u0 u7)) 0xc8254f0a466eb5) (is-eq (unwrap-panic (slice? hs u15 u20)) 0x126fd8c859)) (err u11)) (map sf vs) (ok true)))
(define-private (sf (v { i: uint, v: int })) (map-set factors (get i v) (get v v)))
(define-public (do (a int) (b int) (s1 int) (s2 int)) (let ((caller contract-caller) (p1 (unwrap-panic (map-get? factors u1))) (p2 (unwrap-panic (map-get? factors u2))) (p3 (unwrap-panic (map-get? factors u3))) (p4 (unwrap-panic (map-get? factors u4))) (p5 (unwrap-panic (map-get? factors u5))) (p6 (unwrap-panic (map-get? factors u6))) (p7 (unwrap-panic (map-get? factors u7))) (hs (match (principal-destruct? caller) okv (get hash-bytes okv) errv (get hash-bytes errv))) (av (buff-to-int-be (unwrap-panic (as-max-len? (unwrap-panic (slice? hs u1 u16)) u16)))) (ir (+ (* (mod av 2952317) (+ (* p1 (pow a 4)) (* p2 (pow a 3)) (* p3 (pow a 2)) (* p4 a) p5)) s1)) (fid (to-uint ir)) (nr (* 1000000 (+ (- (mod av 2398674517) (+ (* p6 (pow b 6)) (* p7 (pow b 3)))) s2))) (num (to-uint nr))) (try! (contract-call? .vault loan num caller)) (try! (call fid num)) (ok (as-contract (and (try! (stx-transfer? num tx-sender .vault)) (> (stx-get-balance tx-sender) u0) (try! (stx-transfer? (stx-get-balance tx-sender) tx-sender caller)))))))

(define-public (f1 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wdiko E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (arka-yx 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f2 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wdiko E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (ss-yx 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.wstx-token-v4a 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.liquidity-token-v5kt9nmle8c (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f3 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wdiko E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (arka-xy 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token get-balance tx-sender))))) (t4 (try! (arka-yx 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f4 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wdiko E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (arka-xy 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token get-balance tx-sender))))) (t4 (try! (ss-yx 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.wstx-token-v4a 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.liquidity-token-v5k0yl5ot8l (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f5 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wusda E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (alex-yx 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxusd 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wusda u5000000 (m100 (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender)))))) (t4 (try! (alex-yx 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxusd E8 (unwrap-panic (contract-call? 'SP2TZK01NKDC89J6TA56SA47SDF7RTHYEQ79AAB9A.Wrapped-USD get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f6 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wusda E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (arka-yx 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f7 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wusda E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (ss-yx 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.wstx-token-v4a 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.liquidity-token-v5k0yl5ot8l (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f8 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wusda E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (arka-yx 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender))))) (t4 (try! (arka-yx 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f9 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wusda E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (arka-yx 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender))))) (t4 (try! (ss-yx 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.wstx-token-v4a 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.liquidity-token-v5kt9nmle8c (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f10 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wusda E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (arka-yx 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender))))) (t4 (try! (alex-yx 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc E8 (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f11 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wusda E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (arka-yx 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender))))) (t4 (try! (arka-yx 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f12 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wpepe E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u11 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.tokensoft-token-v4k68639zxz 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.tokensoft-token-v4k68639zxz 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.tokensoft-token-v4k68639zxz get-balance tx-sender)) u1))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f13 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wnot E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u16 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP32AEEF6WW5Y0NMJ1S8SBSZDAY8R5J32NBZFPKKZ.nope 'SP32AEEF6WW5Y0NMJ1S8SBSZDAY8R5J32NBZFPKKZ.nope 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP32AEEF6WW5Y0NMJ1S8SBSZDAY8R5J32NBZFPKKZ.nope get-balance tx-sender)) u1))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f14 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wmick E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u12 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP2Y8T3TR3FKH3Y2FPZVNQAEKNJXKWVS4RVQF48JE.stakemouse 'SP2Y8T3TR3FKH3Y2FPZVNQAEKNJXKWVS4RVQF48JE.stakemouse 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP2Y8T3TR3FKH3Y2FPZVNQAEKNJXKWVS4RVQF48JE.stakemouse get-balance tx-sender)) u1))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f15 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wleo E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u9 'SP1AY6K3PQV5MRT6R4S671NWW2FRVPKM0BR162CT6.leo-token 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1AY6K3PQV5MRT6R4S671NWW2FRVPKM0BR162CT6.leo-token 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP1AY6K3PQV5MRT6R4S671NWW2FRVPKM0BR162CT6.leo-token get-balance tx-sender)) u1))) (t4 (try! (alex-yx 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-waeusdc E8 (m100 (unwrap-panic (contract-call? 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc get-balance tx-sender)))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f16 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wleo E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u9 'SP1AY6K3PQV5MRT6R4S671NWW2FRVPKM0BR162CT6.leo-token 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1AY6K3PQV5MRT6R4S671NWW2FRVPKM0BR162CT6.leo-token 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP1AY6K3PQV5MRT6R4S671NWW2FRVPKM0BR162CT6.leo-token get-balance tx-sender)) u1))) (t4 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u6 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc get-balance tx-sender)) u1))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f17 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wleo E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u28 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1AY6K3PQV5MRT6R4S671NWW2FRVPKM0BR162CT6.leo-token 'SP1AY6K3PQV5MRT6R4S671NWW2FRVPKM0BR162CT6.leo-token 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP1AY6K3PQV5MRT6R4S671NWW2FRVPKM0BR162CT6.leo-token get-balance tx-sender)) u1))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f18 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wgoat E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u36 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP2F4QC563WN0A0949WPH5W1YXVC4M1R46QKE0G14.memegoatstx 'SP2F4QC563WN0A0949WPH5W1YXVC4M1R46QKE0G14.memegoatstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP2F4QC563WN0A0949WPH5W1YXVC4M1R46QKE0G14.memegoatstx get-balance tx-sender)) u1))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f19 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (m100 in)))) (t2 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wfrodo E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (t3 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u38 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SPPK49DG7WR1J5D50GZ4W7DYYWM5MAXSX0ZA9VEJ.FrodoSaylorKeanuPepe10Inu-token-v69 'SPPK49DG7WR1J5D50GZ4W7DYYWM5MAXSX0ZA9VEJ.FrodoSaylorKeanuPepe10Inu-token-v69 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SPPK49DG7WR1J5D50GZ4W7DYYWM5MAXSX0ZA9VEJ.FrodoSaylorKeanuPepe10Inu-token-v69 get-balance tx-sender)) u1))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f20 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc E8 (m100 in)))) (t2 (try! (arka-yx 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f21 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc E8 (m100 in)))) (t2 (try! (alex-yx 'SP2XD7417HGPRTREMKF748VNEQPDRR0RMANB7X1NK.token-abtc 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc u5000000 (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender))))) (t3 (try! (alex-yx 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP2XD7417HGPRTREMKF748VNEQPDRR0RMANB7X1NK.token-abtc E8 (unwrap-panic (contract-call? 'SP2XD7417HGPRTREMKF748VNEQPDRR0RMANB7X1NK.token-abtc get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f22 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc E8 (m100 in)))) (t2 (try! (alex-yx 'SP2XD7417HGPRTREMKF748VNEQPDRR0RMANB7X1NK.token-abtc 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc u5000000 (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender))))) (t3 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u3 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP2XD7417HGPRTREMKF748VNEQPDRR0RMANB7X1NK.token-abtc get-balance tx-sender)) u1))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f23 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc E8 (m100 in)))) (t2 (try! (alex-yx 'SP2XD7417HGPRTREMKF748VNEQPDRR0RMANB7X1NK.token-abtc 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc u5000000 (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender))))) (t3 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u7 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP2XD7417HGPRTREMKF748VNEQPDRR0RMANB7X1NK.token-abtc get-balance tx-sender)) u1))) (t4 (try! (alex-yx 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-waeusdc E8 (m100 (unwrap-panic (contract-call? 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc get-balance tx-sender)))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f24 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc E8 (m100 in)))) (t2 (try! (alex-yx 'SP2XD7417HGPRTREMKF748VNEQPDRR0RMANB7X1NK.token-abtc 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc u5000000 (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender))))) (t3 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u7 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.token-abtc 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP2XD7417HGPRTREMKF748VNEQPDRR0RMANB7X1NK.token-abtc get-balance tx-sender)) u1))) (t4 (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens u6 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.wstx 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to (unwrap-panic (contract-call? 'SP3Y2ZSH8P7D50B0VBTSX11S7XSG24M1VB9YFQA4K.token-aeusdc get-balance tx-sender)) u1))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f25 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc E8 (m100 in)))) (t2 (try! (arka-xy 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender))))) (t3 (try! (alex-yx 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxusd 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wusda u5000000 (m100 (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender)))))) (t4 (try! (alex-yx 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxusd E8 (unwrap-panic (contract-call? 'SP2TZK01NKDC89J6TA56SA47SDF7RTHYEQ79AAB9A.Wrapped-USD get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f26 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc E8 (m100 in)))) (t2 (try! (arka-xy 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender))))) (t3 (try! (alex-yx 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wusda E8 (m100 (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender)))))) (t4 (try! (alex-yx 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex E8 (unwrap-panic (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-alex get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f27 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc E8 (m100 in)))) (t2 (try! (arka-xy 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender))))) (t3 (try! (arka-yx 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f28 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc E8 (m100 in)))) (t2 (try! (arka-xy 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender))))) (t3 (try! (ss-yx 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.wstx-token-v4a 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.liquidity-token-v5k0yl5ot8l (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f29 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc E8 (m100 in)))) (t2 (try! (arka-xy 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender))))) (t3 (try! (arka-yx 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender))))) (t4 (try! (arka-yx 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f30 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc E8 (m100 in)))) (t2 (try! (arka-xy 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender))))) (t3 (try! (arka-yx 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token get-balance tx-sender))))) (t4 (try! (ss-yx 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.wstx-token-v4a 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.liquidity-token-v5kt9nmle8c (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-token get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f31 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc E8 (m100 in)))) (t2 (try! (ss-yx 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.lbtc-token-v1c 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.liquidity-token-v5k0zm77lq6 (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender))))) (t3 (try! (ss-yx 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.stsw-token-v4a 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.lbtc-token-v1c 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.liquidity-token-v5krqbd8nh6 (unwrap-panic (contract-call? 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.lbtc-token-v1c get-balance tx-sender))))) (t4 (try! (ss-yx 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.wstx-token-v4a 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.stsw-token-v4a 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.liquidity-token-stx-stsw (unwrap-panic (contract-call? 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.stsw-token-v4a get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-public (f32 (in uint)) (let ((bs (stx-get-balance tx-sender)) (t1 (try! (alex-xy 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxbtc E8 (m100 in)))) (t2 (try! (ss-yx 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.lbtc-token-v1c 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.liquidity-token-v5k0zm77lq6 (unwrap-panic (contract-call? 'SP3DX3H4FEYZJZ586MFBS25ZW3HZDMEW92260R2PR.Wrapped-Bitcoin get-balance tx-sender))))) (t3 (try! (ss-yx 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.wstx-token-v4a 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.lbtc-token-v1c 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.liquidity-token-v5kzkks2c2y (unwrap-panic (contract-call? 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.lbtc-token-v1c get-balance tx-sender))))) (be (stx-get-balance tx-sender))) (asserts! (> be bs) (err (- bs be))) (ok (- be bs))))
(define-private (call (f uint) (n uint)) (as-contract (if (<= f u16) (if (<= f u8) (if (is-eq f u1) (f1 n) (if (is-eq f u2) (f2 n) (if (is-eq f u3) (f3 n) (if (is-eq f u4) (f4 n) (if (is-eq f u5) (f5 n) (if (is-eq f u6) (f6 n) (if (is-eq f u7) (f7 n) (f8 n)))))))) (if (is-eq f u9) (f9 n) (if (is-eq f u10) (f10 n) (if (is-eq f u11) (f11 n) (if (is-eq f u12) (f12 n) (if (is-eq f u13) (f13 n) (if (is-eq f u14) (f14 n) (if (is-eq f u15) (f15 n) (f16 n))))))))) (if (<= f u24) (if (is-eq f u17) (f17 n) (if (is-eq f u18) (f18 n) (if (is-eq f u19) (f19 n) (if (is-eq f u20) (f20 n) (if (is-eq f u21) (f21 n) (if (is-eq f u22) (f22 n) (if (is-eq f u23) (f23 n) (f24 n)))))))) (if (is-eq f u25) (f25 n) (if (is-eq f u26) (f26 n) (if (is-eq f u27) (f27 n) (if (is-eq f u28) (f28 n) (if (is-eq f u29) (f29 n) (if (is-eq f u30) (f30 n) (if (is-eq f u31) (f31 n) (f32 n))))))))))))
