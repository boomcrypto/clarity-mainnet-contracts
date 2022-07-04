;; Title: MultiSafe sip-009 non-fungible token transfer executor
;; Author: Talha Bugra Bulut & Trust Machiness

(impl-trait 'SP34V5RC8C7E1F0GQS20JKV9PRYR10XZ9C7DQNKAD.multisafe-traits.executor-trait)
(use-trait safe-trait 'SP34V5RC8C7E1F0GQS20JKV9PRYR10XZ9C7DQNKAD.multisafe-traits.safe-trait)
(use-trait nft-trait 'SP34V5RC8C7E1F0GQS20JKV9PRYR10XZ9C7DQNKAD.multisafe-traits.sip-009-trait)
(use-trait ft-trait 'SP34V5RC8C7E1F0GQS20JKV9PRYR10XZ9C7DQNKAD.multisafe-traits.sip-010-trait)

(define-public (execute (safe <safe-trait>) (param-ft <ft-trait>) (param-nft <nft-trait>) (param-p (optional principal)) (param-u (optional uint)) (param-b (optional (buff 20))))
        (contract-call? param-nft transfer (unwrap! param-u (err u9999)) (contract-of safe) (unwrap! param-p (err u9999)))
)