(impl-trait .sip-010-trait.sip-010-trait)

(define-fungible-token btc)

;; get the token balance of owner
(define-read-only (get-balance (owner principal))
  (begin
    (ok (ft-get-balance btc owner))))

;; returns the total number of tokens
(define-read-only (get-total-supply)
  (ok (ft-get-supply btc)))

;; returns the token name
(define-read-only (get-name)
  (ok "BTC"))

;; the symbol or "ticker" for this token
(define-read-only (get-symbol)
  (ok "BTC"))

;; the number of decimals used
(define-read-only (get-decimals)
  (ok u8))

;; Transfers tokens to a recipient
(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
  (if (is-eq tx-sender sender)
    (begin
      (try! (ft-transfer? btc amount sender recipient))
      (ok true)
    )
    (err u4)))

(define-public (get-token-uri)
  (ok (some u"https://example.com")))

(define-public (mint (amount uint))
  (ft-mint? btc amount tx-sender))
