(define-constant ERR-UNAUTHORIZED (err u401))
(define-constant approved-sender 'SP1CRQ91XRQ8DQJXTFA0NVKVST98FA97REB460ADK)

(define-public (send-many (recipients (list 2000 { to: principal, amount: uint, memo: (optional (buff 34)) })))
  (fold check-err (map send-token recipients) (ok true))
)

(define-private (check-err (result (response bool uint)) (prior (response bool uint)))
  (match prior ok-value result err-value (err err-value))
)

(define-private (send-token (recipient { to: principal, amount: uint, memo: (optional (buff 34)) }))
  (send-token-with-memo (get amount recipient) (get to recipient) (get memo recipient))
)

(define-private (send-token-with-memo (amount uint) (to principal) (memo (optional (buff 34))))
  (let ((transferOk (try! (contract-call? 'SP1Z92MPDQEWZXW36VX71Q25HKF5K2EPCJ304F275.tokensoft-token-v4kr9vt747c transfer amount tx-sender to memo))))
    (ok transferOk)
  )
)