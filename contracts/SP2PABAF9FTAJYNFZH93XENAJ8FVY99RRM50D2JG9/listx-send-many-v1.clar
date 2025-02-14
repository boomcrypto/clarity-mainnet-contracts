(define-private (check-err (result (response bool uint)) (prior (response bool uint)))
  (match prior ok-value result err-value (err err-value)))
(define-private (transfer-from-tuple (details { to: principal, amount: uint, memo: (optional (buff 34)) }))
  (contract-call? 'SM26NBC8SFHNW4P1Y4DFH27974P56WN86C92HPEHH.token-lqstx transfer (get amount details) tx-sender (get to details) (get memo details)))
(define-public (send-many (recipients (list 200 { to: principal, amount: uint, memo: (optional (buff 34))})))
  (fold check-err (map transfer-from-tuple recipients) (ok true)))