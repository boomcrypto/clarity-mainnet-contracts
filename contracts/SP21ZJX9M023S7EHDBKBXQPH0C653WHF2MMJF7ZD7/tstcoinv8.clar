;; fngble tkn smrt cntrct tmplt v1.8

;; community standard fungible token trait
(impl-trait 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.sip-010-trait-ft-standard.sip-010-trait)

;; error code
(define-constant ERR-UNAUTHORIZED (err u401))

;; token definites
(define-fungible-token tstcoinv8)
(define-data-var token-uri (optional (string-utf8 256)) (some u"ipfs://QmVM1z6o4KEPgPpj87BEHrFHmbHvpv1czDKxEYstEqQhTU"))
(define-constant contract-creator tx-sender)

;; public functions
(define-public (transfer (amount uint) (from principal) (to principal) (memo (optional (buff 34))))
    (begin
        (asserts! (is-eq from tx-sender) ERR-UNAUTHORIZED)
        (ft-transfer? tstcoinv8 amount from to)
    )
)

(define-public (set-token-uri (value (string-utf8 256)))
    (begin
        (asserts! (is-eq tx-sender contract-creator) ERR-UNAUTHORIZED)
        (var-set token-uri (some value))
        (ok (print {
              notification: "token-metadata-update",
              payload: {
                contract-id: (as-contract tx-sender),
                token-class: "ft"
              }
            })
        )
    )
)

(define-public (send-many (recipients (list 500 { to: principal, amount: uint, memo: (optional (buff 34)) })))
  (fold check-err (map send-token recipients) (ok true))
)

;; private functions
(define-private (check-err (result (response bool uint)) (prior (response bool uint)))
  (match prior ok-value result err-value (err err-value))
)

(define-private (send-token (recipient { to: principal, amount: uint, memo: (optional (buff 34)) }))
  (send-token-with-memo (get amount recipient) (get to recipient) (get memo recipient))
)

(define-private (send-token-with-memo (amount uint) (to principal) (memo (optional (buff 34))))
  (let ((transferOk (try! (transfer amount tx-sender to memo))))
    (ok transferOk)
  )
)

;; read-only functions
(define-read-only (get-name)
    (ok "tstcoinv8")
)

(define-read-only (get-symbol)
    (ok "TSTV8")
)

(define-read-only (get-decimals)
    (ok u12)
)

(define-read-only (get-balance (user principal))
    (ok (ft-get-balance tstcoinv8 user)
    )
)

(define-read-only (get-total-supply)
    (ok (ft-get-supply tstcoinv8)
    )
)

(define-read-only (get-token-uri)
    (ok (var-get token-uri)
    )
)

;; offclly coind!

(begin
  (try! (ft-mint? tstcoinv8 u1000000000000 contract-creator))
)