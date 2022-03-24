;; @contract Governance proposal
;; @version 1.1

(impl-trait .lydian-dao-proposal-trait.lydian-dao-proposal-trait)

;; ------------------------------------------
;; Constants
;; ------------------------------------------

(define-constant  ERR-NOT-AUTHORIZED u1001)

;; ------------------------------------------
;; Variables
;; ------------------------------------------

(define-data-var wallet principal tx-sender)

;; ------------------------------------------
;; Execute
;; ------------------------------------------

(define-public (execute)
  (begin
    (asserts! (is-eq contract-caller .lydian-dao) (err  ERR-NOT-AUTHORIZED))

    ;; Contract is active minter
    (try! (contract-call? .lydian-token set-active-minter (as-contract tx-sender)))

    ;; Mint LDN
    (try! (contract-call? .lydian-token mint (as-contract tx-sender) u44885756))

    ;; Stake and wrap
    (try! (as-contract (contract-call? .staking-v1-1 stake .staking-distributor-v1-1 .treasury-v1-1 u44885756)))
    (try! (as-contract (contract-call? .wrapped-lydian-creator-v1-1 wrap u44885756)))

    ;; Send to wallet
    (try! (as-contract (contract-call? .wrapped-lydian-token transfer u44885756 (as-contract tx-sender) (var-get wallet) none)))

    ;; Treasury is active minter
    (try! (contract-call? .lydian-token set-active-minter .treasury-v1-1))

    (ok true)
  )
)

