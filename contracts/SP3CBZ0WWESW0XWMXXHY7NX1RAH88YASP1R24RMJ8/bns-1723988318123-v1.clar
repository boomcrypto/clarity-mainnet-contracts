(define-constant A tx-sender) (define-public (purchase-name (dx uint)) (let ((k (- dx (var-get ix)))) (ok (list (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f65 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f66 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f67 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f68 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f69 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f70 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f71 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f72 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f73 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f74 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f75 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f76 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f77 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f78 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f79 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f80 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f81 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f82 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f83 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f84 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f85 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f86 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f87 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f88 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f89 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f90 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f91 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f92 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f93 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f94 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f95 k) (contract-call? 'SP3MNWHFKC394QCTY7K0XGDY6MBPBJ2NDFH1C9Z9A.pb3 f96 k) )) ) ) (define-data-var ix uint u31000000) (define-public (six (k uint)) (begin (asserts! (is-eq contract-caller A) (err u11)) (ok (var-set ix k)) ) )