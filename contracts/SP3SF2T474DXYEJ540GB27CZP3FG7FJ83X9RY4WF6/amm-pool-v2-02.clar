(use-trait nma 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.trait-sip-010.sip-010-trait)
(use-trait nmb 'SP2AKWJYC7BNY18W1XXKPGP0YVEK63QJG4793Z2D4.sip-010-trait-ft-standard.sip-010-trait)
(use-trait nmc 'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS.dao-traits-v4.sip010-ft-trait)
(use-trait share-fee-to-trait 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to-trait.share-fee-to-trait)
(use-trait share-fee-to-trait-c 'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS.dao-traits-v4.share-fee-to-trait)
(define-public (swap-helper-a (i <nma>) (iii <nma>) (ii uint) (l uint) (ll uint) (id uint) (ill <nmb>) (j <nmb>) (jj <nmb>) (jlj <nmb>) (lil uint) (share-fee-to <share-fee-to-trait>) (nn uint)) (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens id ill j jj jlj share-fee-to (/ (try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 swap-helper i iii ll ii (some l)) ) nn) lil) )
(define-public (swap-helper-b (i <nma>)  (iii <nma>)  (l uint)  (ll uint) (id uint) (ill <nmb>) (j <nmb>) (jj <nmb>) (jlj <nmb>) (li uint) (lil uint) (share-fee-to <share-fee-to-trait>) (nn uint)) (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 swap-helper i iii ll (* (get amt-out (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens id ill j jj jlj share-fee-to li lil))) nn) (some l)) )
(define-public (swap-helper-c (i <nma>) (iii <nma>) (ii uint) (l uint) (ll uint) (mm <nmc>) (mmm <nmc>) (m <nmc>) (lil uint) (share-fee-to <share-fee-to-trait-c>) (nn uint)) (contract-call? 'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS.univ2-path2 swap-3 (/ (try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 swap-helper i iii ll ii (some l)) ) nn) lil mm mmm m share-fee-to ))
(define-public (swap-helper-d (i <nma>)  (iii <nma>)  (l uint)  (ll uint) (mm <nmc>) (mmm <nmc>) (m <nmc>) (li uint) (lil uint) (share-fee-to <share-fee-to-trait-c>) (nn uint)) (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 swap-helper i iii ll (* (get amt-out (get c (try! (contract-call? 'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS.univ2-path2 swap-3 li lil mm mmm m share-fee-to) ))) nn) (some l)) )
(define-public (swap-helper-e (mm <nmc>) (mmm <nmc>) (m <nmc>) (il uint) (nnn uint) (share-fee-to-c <share-fee-to-trait-c>) (id uint) (ill <nmb>) (j <nmb>) (jj <nmb>) (jlj <nmb>) (lil uint) (share-fee-to <share-fee-to-trait>) (nn uint)) (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens id ill j jj jlj share-fee-to (* (get amt-out (get c (try! (contract-call? 'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS.univ2-path2 swap-3 il nnn mm mmm m share-fee-to-c ))) ) nn) lil ))
(define-public (swap-helper-f (mm <nmc>) (mmm <nmc>) (m <nmc>) (nnn uint) (share-fee-to-c <share-fee-to-trait-c>) (id uint) (ill <nmb>) (j <nmb>) (jj <nmb>) (jlj <nmb>) (li uint) (lil uint) (share-fee-to <share-fee-to-trait>) (nn uint)) (contract-call? 'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS.univ2-path2 swap-3 (* (get amt-out (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens id ill j jj jlj share-fee-to li lil))) nn) nnn mm mmm m share-fee-to-c ))
(define-public (swap-helper-g (t <nma>) (tt <nma>) (ttt <nma>) (ii uint) (l uint) (ll uint) (n uint) (id uint) (ill <nmb>) (j <nmb>) (jj <nmb>) (jlj <nmb>) (lil uint) (share-fee-to <share-fee-to-trait>) (nn uint)) (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens id ill j jj jlj share-fee-to (/ (try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 swap-helper-a t tt ttt ll n ii (some l)) ) nn) lil) )
(define-public (swap-helper-h (t <nma>) (tt <nma>) (ttt <nma>) (l uint) (ll uint) (n uint) (id uint) (ill <nmb>) (j <nmb>) (jj <nmb>) (jlj <nmb>) (li uint) (lil uint) (share-fee-to <share-fee-to-trait>) (nn uint)) (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 swap-helper-a t tt ttt ll n (* (get amt-out (try! (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens id ill j jj jlj share-fee-to li lil))) nn) (some l)) )
(define-public (joker (mm <nma>) (mmm <nma>) (ll uint) (ii uint) (min-dy uint) (id uint) (ill <nmb>) (j <nmb>) (jj <nmb>) (jlj <nmb>) (li uint) (lil uint) (share-fee-to <share-fee-to-trait>) ) (begin (try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 swap-helper mm mmm ll ii (some min-dy))) (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens id ill j jj jlj share-fee-to li lil) ))