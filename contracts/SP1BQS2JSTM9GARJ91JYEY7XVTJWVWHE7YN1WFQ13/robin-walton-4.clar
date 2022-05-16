(use-trait sip-010-token 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.sip-010-trait-ft-standard.sip-010-trait)
(use-trait liquidity-token 'SP32NTG209B861QBHF4TH0C86QB0A12TY2F16WHMY.liquidity-token-trait.liquidity-token-trait)

;; constants
;;

;; data maps and vars
;;

;; private functions
;;

;; public functions
;;
(define-public (swap-cryptomate-arkadiko (cryptomate-token-x-trait <sip-010-token>) (cryptomate-token-y-trait <sip-010-token>) (cryptomate-token-liquidity-trait <liquidity-token>) (cryptomate-dx uint) (cryptomate-min-dy uint) (arkadiko-token-x-trait <sip-010-token>) (arkadiko-token-y-trait <sip-010-token>) (arkadiko-dy uint) (arkadiko-min-dx uint))
    (begin
        (unwrap-panic (contract-call? 'SP32NTG209B861QBHF4TH0C86QB0A12TY2F16WHMY.cryptomate-swap swap-x-for-y cryptomate-token-x-trait cryptomate-token-y-trait cryptomate-token-liquidity-trait cryptomate-dx cryptomate-min-dy))
        (print { message: "cryptomate-swap", cryptomate-dx: cryptomate-dx, cryptomate-min-dy: cryptomate-min-dy })
        (unwrap-panic (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x arkadiko-token-x-trait arkadiko-token-y-trait arkadiko-dy arkadiko-min-dx))
        (ok true)
    )
)
