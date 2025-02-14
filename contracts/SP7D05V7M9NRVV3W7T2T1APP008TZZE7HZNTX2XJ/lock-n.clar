(define-data-var owner (optional principal) none)
(define-constant UNLOCK_BLOCK_HEIGHT u180000)

(define-public (withdraw)
  (let
    (
      (amount (contract-call? 'SP1BMZTS416A3VTMN0SYTRMEJSCHW75RRAKXWF4DZ.inscription get_stx10_balance "nakamoto" (as-contract tx-sender)))
      (payload (contract-call? 'SP1BMZTS416A3VTMN0SYTRMEJSCHW75RRAKXWF4DZ.inscription get_stx10_transfer_payload "nakamoto" amount))
      (real_owner (unwrap! (var-get owner) (err u10001)))
    )
    (asserts! (is-eq tx-sender real_owner) (err u10002))
    (asserts! (>= block-height UNLOCK_BLOCK_HEIGHT) (err u10003))
    (as-contract (contract-call? 'SP1BMZTS416A3VTMN0SYTRMEJSCHW75RRAKXWF4DZ.inscription inscribe_transfer_stx10 payload real_owner "nakamoto" amount))
  )
)

(define-public (deposit)
  (let
    (
      (amount (contract-call? 'SP1BMZTS416A3VTMN0SYTRMEJSCHW75RRAKXWF4DZ.inscription get_stx10_balance "nakamoto" tx-sender))
      (payload (contract-call? 'SP1BMZTS416A3VTMN0SYTRMEJSCHW75RRAKXWF4DZ.inscription get_stx10_transfer_payload "nakamoto" amount))
    )
    (asserts! (is-none (var-get owner)) (err u10004))
    (var-set owner (some tx-sender))
    (contract-call? 'SP1BMZTS416A3VTMN0SYTRMEJSCHW75RRAKXWF4DZ.inscription inscribe_transfer_stx10 payload (as-contract tx-sender) "nakamoto" amount)
  )
)