(use-trait ft-trait .trait-sip-010.sip-010-trait)
(define-constant ERR-NOT-AUTHORIZED (err u1000))
(define-constant ERR-TOKEN-NOT-AUTHORIZED (err u1001))
(define-constant ERR-DUPLICATE-SIGNATURE (err u1009))
(define-constant ERR-ORDER-HASH-MISMATCH (err u1010))
(define-constant ERR-INVALID-SIGNATURE (err u1011))
(define-constant ERR-UKNOWN-RELAYER (err u1012))
(define-constant ERR-REQUIRED-VALIDATORS (err u1013))
(define-constant ERR-ORDER-ALREADY-SENT (err u1014))
(define-constant ERR-PAUSED (err u1015))
(define-constant ERR-INVALID-INPUT (err u1020))
(define-constant ERR-NOT-IN-WHITELIST (err u1021))
(define-constant ERR-INVALID-TOKEN (err u1022))
(define-constant ERR-SLIPPAGE (err u1023))
(define-constant MAX_UINT u340282366920938463463374607431768211455)
(define-constant ONE_8 u100000000)
(define-constant structured-data-prefix 0x534950303138)
(define-constant message-domain-main 0x57790ebb55cb7aa3d0ffb493faf4fa3a8513cc07323280dac9f19a442bc81809) ;;mainnet
(define-constant message-domain-test 0xbba6c42cb177438f5dc4c3c1c51b9e2eb0d43e6bdec927433edd123888f4ce6b) ;; testnet
(define-data-var contract-owner principal tx-sender)
(define-data-var is-paused bool true)
(define-data-var use-whitelist bool false)
(define-map whitelisted-users principal bool)
(define-map use-launch-whitelist uint bool)
(define-map launch-whitelisted {launch-id: uint, owner: (buff 20)} bool)
(define-data-var order-hash-to-iter (buff 32) 0x)
(define-read-only (create-wrap-order (order { to: principal, token: principal, amount-in-fixed: uint, chain-id: uint, salt: (buff 256) } ))
  (ok (unwrap! (to-consensus-buff? order) ERR-INVALID-INPUT)))
(define-read-only (decode-wrap-order (order-buff (buff 128)))
  (ok (unwrap! (from-consensus-buff? { to: principal, token: principal, amount-in-fixed: uint, chain-id: uint, salt: (buff 256) } order-buff) ERR-INVALID-INPUT)))
(define-read-only (hash-wrap-order (order { to: principal, token: principal, amount-in-fixed: uint, chain-id: uint, salt: (buff 256) } ))
	(ok (sha256 (try! (create-wrap-order order)))))
(define-read-only (create-launchpad-order (order { from: (buff 20), to: principal, launch-id: uint, token: principal, amount-in-fixed: uint, chain-id: uint, salt: (buff 256) } ))
  (ok (unwrap! (to-consensus-buff? order) ERR-INVALID-INPUT)))
(define-read-only (decode-launchpad-order (order-buff (buff 128)))
  (ok (unwrap! (from-consensus-buff? { from: (buff 20), to: principal, launch-id: uint, token: principal, amount-in-fixed: uint, chain-id: uint, salt: (buff 256) } order-buff) ERR-INVALID-INPUT)))
(define-read-only (hash-launchpad-order (order { from: (buff 20), to: principal, launch-id: uint, token: principal, amount-in-fixed: uint, chain-id: uint, salt: (buff 256) } ))
	(ok (sha256 (try! (create-launchpad-order order)))))
(define-read-only (create-swap-order (order { from: (buff 20), to: principal, token: principal, amount-in-fixed: uint, pool-id: uint, min-amount-out-fixed: uint, chain-id: uint, salt: (buff 256) } ))
  (ok (unwrap! (to-consensus-buff? order) ERR-INVALID-INPUT)))
(define-read-only (decode-swap-order (order-buff (buff 128)))
  (ok (unwrap! (from-consensus-buff? { from: (buff 20), to: principal, token: principal, amount-in-fixed: uint, pool-id: uint, min-amount-out-fixed: uint, chain-id: uint, salt: (buff 256) } order-buff) ERR-INVALID-INPUT)))
(define-read-only (hash-swap-order (order { from: (buff 20), to: principal, token: principal, amount-in-fixed: uint, pool-id: uint, min-amount-out-fixed: uint, chain-id: uint, salt: (buff 256) } ))
	(ok (sha256 (try! (create-swap-order order)))))
(define-read-only (create-cross-order (order { from: (buff 20), to: (buff 128), token: principal, amount-in-fixed: uint, src-chain-id: uint, dest-chain-id: uint, salt: (buff 256) } ))
  (ok (unwrap! (to-consensus-buff? order) ERR-INVALID-INPUT)))
(define-read-only (decode-cross-order (order-buff (buff 128)))
  (ok (unwrap! (from-consensus-buff? { from: (buff 20), to: (buff 128), token: principal, amount-in-fixed: uint, src-chain-id: uint, dest-chain-id: uint, salt: (buff 256) } order-buff) ERR-INVALID-INPUT)))
(define-read-only (hash-cross-order (order { from: (buff 20), to: (buff 128), token: principal, amount-in-fixed: uint, src-chain-id: uint, dest-chain-id: uint, salt: (buff 256) } ))
	(ok (sha256 (try! (create-cross-order order)))))
(define-read-only (create-cross-swap-order (order { from: (buff 20), to: (buff 128), token: principal, amount-in-fixed: uint, pool-id: uint, min-amount-out-fixed: uint, src-chain-id: uint, dest-chain-id: uint, salt: (buff 256) } ))
  (ok (unwrap! (to-consensus-buff? order) ERR-INVALID-INPUT)))
(define-read-only (decode-cross-swap-order (order-buff (buff 128)))
  (ok (unwrap! (from-consensus-buff? { from: (buff 20), to: (buff 128), token: principal, amount-in-fixed: uint, pool-id: uint, min-amount-out-fixed: uint, src-chain-id: uint, dest-chain-id: uint, salt: (buff 256) } order-buff) ERR-INVALID-INPUT)))
(define-read-only (hash-cross-swap-order (order { from: (buff 20), to: (buff 128), token: principal, amount-in-fixed: uint, pool-id: uint, min-amount-out-fixed: uint, src-chain-id: uint, dest-chain-id: uint, salt: (buff 256) } ))
	(ok (sha256 (try! (create-cross-swap-order order)))))
(define-read-only (message-domain)
  (if (is-eq chain-id u1) message-domain-main message-domain-test))
(define-read-only (get-use-whitelist)
  (var-get use-whitelist))
(define-read-only (is-whitelisted (user principal))
  (default-to false (map-get? whitelisted-users user)))
(define-read-only (get-paused)
  (var-get is-paused))
(define-read-only (get-contract-owner)
  (var-get contract-owner))
(define-read-only (is-approved-operator-or-default (operator principal))
  (contract-call? .cross-bridge-registry-v2-01 is-approved-operator-or-default operator))
(define-read-only (is-approved-relayer-or-default (relayer principal))
  (contract-call? .cross-bridge-registry-v2-01 is-approved-relayer-or-default relayer))
(define-read-only (get-validator-id (validator principal))
	(contract-call? .cross-bridge-registry-v2-01 get-validator-id validator))
(define-read-only (get-validator-id-or-fail (validator principal))
	(contract-call? .cross-bridge-registry-v2-01 get-validator-id-or-fail validator))
(define-read-only (validator-from-id (id uint))
	(contract-call? .cross-bridge-registry-v2-01 validator-from-id id))
(define-read-only (validator-from-id-or-fail (id uint))
	(contract-call? .cross-bridge-registry-v2-01 validator-from-id-or-fail id))
(define-read-only (get-required-validators)
  (contract-call? .cross-bridge-registry-v2-01 get-required-validators))
(define-read-only (get-approved-chain-or-fail (src-chain-id uint))
  (contract-call? .cross-bridge-registry-v2-01 get-approved-chain-or-fail src-chain-id))
(define-read-only (get-token-reserve-or-default (pair { token:principal, chain-id: uint }))
  (contract-call? .cross-bridge-registry-v2-01 get-token-reserve-or-default pair))
(define-read-only (get-min-fee-or-default (pair { token:principal, chain-id: uint }))
  (contract-call? .cross-bridge-registry-v2-01 get-min-fee-or-default pair))
(define-read-only (get-approved-pair-or-fail (pair { token:principal, chain-id: uint }))
  (contract-call? .cross-bridge-registry-v2-01 get-approved-pair-or-fail pair))
(define-read-only (is-order-sent-or-default (order-hash (buff 32)))
  (contract-call? .cross-bridge-registry-v2-01 is-order-sent-or-default order-hash))
(define-read-only (is-order-validated-by-or-default (order-hash (buff 32)) (validator principal))
  (contract-call? .cross-bridge-registry-v2-01 is-order-validated-by-or-default order-hash validator))
(define-read-only (get-use-launch-whitelist-or-default (launch-id uint))
	(default-to false (map-get? use-launch-whitelist launch-id)))
(define-read-only (get-launch-whitelisted-or-default (launch-id uint) (owner (buff 20)))
	(if (get-use-launch-whitelist-or-default launch-id)
		(default-to false (map-get? launch-whitelisted {launch-id: launch-id, owner: owner}))
		true))
(define-read-only (validate-launchpad (launch-id uint) (from (buff 20)) (to principal) (amount uint) (token principal))
  (begin
    (asserts! (get-launch-whitelisted-or-default launch-id from) ERR-NOT-IN-WHITELIST)
    (contract-call? .alex-launchpad-v1-7 validate-register to launch-id amount token)))
(define-read-only (validate-swap (pool-id uint) (token principal) (dx uint) (min-dy uint))
	(let (
			(pool-details (try! (contract-call? .amm-swap-pool-v1-1 get-pool-details-by-id pool-id)))
			(token-y (if (is-eq (get token-x pool-details) token) (get token-y pool-details) (get token-x pool-details)))
			(factor (get factor pool-details))
			(dy (try! (contract-call? .amm-swap-pool-v1-1 get-helper token token-y factor dx))))
		(asserts! (>= dy min-dy) ERR-SLIPPAGE)
		(ok { dy: dy, token-y: token-y, factor: factor })))
(define-read-only (validate-cross (token principal) (dx uint) (dest-chain-id uint))
  (if (is-eq dest-chain-id u0)
    (begin
      (asserts! (is-eq token .token-abtc) ERR-INVALID-TOKEN)
      (try! (contract-call? .btc-peg-out-endpoint-v1-12 validate-peg-out-0 dx))
      (ok true))
    (begin 
      (try! (contract-call? .cross-peg-out-endpoint-v2-02 validate-transfer-to-unwrap (as-contract tx-sender) token dx dest-chain-id))
      (ok true))))
(define-read-only (validate-cross-swap (pool-id uint) (token principal) (dx uint) (min-dy uint) (dest-chain-id uint))
  (let (
      (validation-data (try! (validate-swap pool-id token dx min-dy))))
      (try! (validate-cross (get token-y validation-data) (get dy validation-data) dest-chain-id))
      (ok validation-data)))
(define-public (set-use-launch-whitelist (launch-id uint) (new-whitelisted bool))
	(begin
		(try! (check-is-owner))
		(ok (map-set use-launch-whitelist launch-id new-whitelisted))))
(define-public (set-launch-whitelisted (launch-id uint) (whitelisted (list 200 {owner: (buff 20), whitelisted: bool})))
	(begin
		(try! (check-is-owner))
		(fold set-launch-whitelisted-iter whitelisted launch-id)
		(ok true)))
(define-public (set-paused (paused bool))
  (begin
    (try! (check-is-owner))
    (ok (var-set is-paused paused))))
(define-public (apply-whitelist (new-use-whitelist bool))
  (begin
    (try! (check-is-owner))
    (ok (var-set use-whitelist new-use-whitelist))))
(define-public (whitelist (user principal) (whitelisted bool))
  (begin
    (try! (check-is-owner))
    (ok (map-set whitelisted-users user whitelisted))))
(define-public (whitelist-many (users (list 2000 principal)) (whitelisted (list 2000 bool)))
  (ok (map whitelist users whitelisted)))
(define-public (set-contract-owner (owner principal))
  (begin
    (try! (check-is-owner))
    (ok (var-set contract-owner owner))))
(define-public (transfer-to-wrap
    (order { to: principal, token: principal, amount-in-fixed: uint, chain-id: uint, salt: (buff 256) })
    (token-trait <ft-trait>)
    (signature-packs (list 100 { signer: principal, order-hash: (buff 32), signature: (buff 65) })))
    (let (
        (token (contract-of token-trait))
        (order-hash (try! (hash-wrap-order order)))
        (common-data (try! (transfer-common order-hash (get to order) token (get chain-id order) signature-packs)))
        (token-details (get token-details common-data)))
      (asserts! (is-eq token (get token order)) ERR-TOKEN-NOT-AUTHORIZED)
      (if (get burnable token-details)
        (as-contract (try! (contract-call? token-trait mint-fixed (get amount-in-fixed order) (get to order))))
        (as-contract (try! (contract-call? .cross-bridge-registry-v2-01 transfer-fixed token-trait (get amount-in-fixed order) (get to order)))))
      (as-contract (try! (contract-call? .cross-bridge-registry-v2-01 add-token-reserve { token: token, chain-id: (get chain-id order) } (get amount-in-fixed order))))
      (print { object: "cross-bridge-endpoint", action: "transfer-to-wrap", salt: (get salt order), amount-in-fixed: (get amount-in-fixed order), token: (get token order), to: (get to order), chain-id: (get chain-id order) })
      (as-contract (contract-call? .cross-bridge-registry-v2-01 set-order-sent order-hash true))))
(define-public (transfer-to-launchpad
    (order { from: (buff 20), to: principal, launch-id: uint, token: principal, amount-in-fixed: uint, chain-id: uint, salt: (buff 256) })
    (token-trait <ft-trait>)
    (signature-packs (list 100 { signer: principal, order-hash: (buff 32), signature: (buff 65)})))
    (let (
        (token (contract-of token-trait))
        (order-hash (try! (hash-launchpad-order order)))
        (common-data (try! (transfer-common order-hash (get to order) token (get chain-id order) signature-packs)))
        (token-details (get token-details common-data))
        (print-msg { object: "cross-bridge-endpoint", action: "transfer-to-launchpad", salt: (get salt order), from: (get from order), to: (get to order), launch-id: (get launch-id order), amount-in-fixed: (get amount-in-fixed order), token: (get token order), chain-id: (get chain-id order) }))
      (asserts! (is-eq token (get token order)) ERR-TOKEN-NOT-AUTHORIZED)
      (if (get burnable token-details) 
        (as-contract (try! (contract-call? token-trait mint-fixed (get amount-in-fixed order) tx-sender)))
        (as-contract (try! (contract-call? .cross-bridge-registry-v2-01 transfer-fixed token-trait (get amount-in-fixed order) tx-sender))))
      (as-contract (try! (contract-call? .cross-bridge-registry-v2-01 add-token-reserve { token: token, chain-id: (get chain-id order) } (get amount-in-fixed order))))
      (as-contract (try! (contract-call? .cross-bridge-registry-v2-01 set-order-sent order-hash true)))
      (match (validate-launchpad (get launch-id order) (get from order) (get to order) (get amount-in-fixed order) token)
        ok-value
        (begin
          (map-set launch-whitelisted { launch-id: (get launch-id order), owner: (get from order) } false)
          (print (merge print-msg { success : true }))
          (as-contract (contract-call? .alex-launchpad-v1-7 register-on-behalf (get to order) (get launch-id order) (get amount-in-fixed order) token-trait)))
        err-value
        (begin
          (as-contract (try! (contract-call? token-trait transfer-fixed (get amount-in-fixed order) tx-sender (get to order) none)))
          (print (merge print-msg { success : false }))
          (ok {start: u0, end: u0})))))
(define-public (transfer-to-swap
    (order { from: (buff 20), to: principal, token: principal, pool-id: uint, amount-in-fixed: uint, min-amount-out-fixed: uint, chain-id: uint, salt: (buff 256) })
    (token-trait <ft-trait>)
    (token-out-trait <ft-trait>)
    (signature-packs (list 100 { signer: principal, order-hash: (buff 32), signature: (buff 65)})))
    (let (
        (token (contract-of token-trait))
        (token-out (contract-of token-out-trait))
        (order-hash (try! (hash-swap-order order)))
        (common-data (try! (transfer-common order-hash (get to order) token (get chain-id order) signature-packs)))
        (token-details (get token-details common-data))
        (print-msg { object: "cross-bridge-endpoint", action: "transfer-to-swap", salt: (get salt order), from: (get from order), to: (get to order), token-x: (get token order), pool-id: (get pool-id order), dx: (get amount-in-fixed order), min-dy: (get min-amount-out-fixed order), chain-id: (get chain-id order) }))
      (asserts! (is-eq token (get token order)) ERR-TOKEN-NOT-AUTHORIZED)
      (if (get burnable token-details) 
        (as-contract (try! (contract-call? token-trait mint-fixed (get amount-in-fixed order) tx-sender)))
        (as-contract (try! (contract-call? .cross-bridge-registry-v2-01 transfer-fixed token-trait (get amount-in-fixed order) tx-sender))))
      (as-contract (try! (contract-call? .cross-bridge-registry-v2-01 add-token-reserve { token: token, chain-id: (get chain-id order) } (get amount-in-fixed order))))
      (as-contract (try! (contract-call? .cross-bridge-registry-v2-01 set-order-sent order-hash true)))
      (match (validate-swap (get pool-id order) token (get amount-in-fixed order) (get min-amount-out-fixed order))
        ok-value
        (let (
            (check-token (asserts! (is-eq token-out (get token-y ok-value)) ERR-INVALID-TOKEN))
            (dy (as-contract (try! (contract-call? .amm-swap-pool-v1-1 swap-helper token-trait token-out-trait (get factor ok-value) (get amount-in-fixed order) (some (get min-amount-out-fixed order)))))))
          (print (merge print-msg { token-y: token-out, dy: dy }))
          (as-contract (try! (contract-call? token-out-trait transfer-fixed dy tx-sender (get to order) none)))
          (ok dy))
        err-value
        (begin
          (print (merge print-msg { token-y: token-out, err: err-value }))
          (as-contract (try! (contract-call? token-trait transfer-fixed (get amount-in-fixed order) tx-sender (get to order) none)))
          (ok err-value)))))
(define-public (transfer-to-cross
    (order { from: (buff 20), to: (buff 128), token: principal, amount-in-fixed: uint, src-chain-id: uint, dest-chain-id: uint, salt: (buff 256) })
    (token-trait <ft-trait>)
    (signature-packs (list 100 { signer: principal, order-hash: (buff 32), signature: (buff 65)})))
    (let (
        (token (contract-of token-trait))
        (order-hash (try! (hash-cross-order order)))
        (common-data (try! (transfer-common order-hash (as-contract tx-sender) token (get src-chain-id order) signature-packs)))
        (token-details (get token-details common-data))
        (print-msg { object: "cross-bridge-endpoint", action: "transfer-to-cross", salt: (get salt order), from: (get from order), to: (get to order), token: (get token order), amount-in-fixed: (get amount-in-fixed order), src-chain-id: (get src-chain-id order), dest-chain-id: (get dest-chain-id order) }))
      (asserts! (is-eq token (get token order)) ERR-TOKEN-NOT-AUTHORIZED)
      (if (get burnable token-details) 
        (as-contract (try! (contract-call? token-trait mint-fixed (get amount-in-fixed order) tx-sender)))
        (as-contract (try! (contract-call? .cross-bridge-registry-v2-01 transfer-fixed token-trait (get amount-in-fixed order) tx-sender))))
      (as-contract (try! (contract-call? .cross-bridge-registry-v2-01 add-token-reserve { token: token, chain-id: (get src-chain-id order) } (get amount-in-fixed order))))
      (as-contract (try! (contract-call? .cross-bridge-registry-v2-01 set-order-sent order-hash true)))
      (match (validate-cross token (get amount-in-fixed order) (get dest-chain-id order))
        ok-value
        (if (is-eq (get dest-chain-id order) u0)
          (let (
              (request-id (as-contract (try! (contract-call? .btc-peg-out-endpoint-v1-12 request-peg-out-0 (get to order) (get amount-in-fixed order))))))
            (print (merge print-msg { request-id: request-id }))
            (ok true))
          (begin
            (print print-msg)
            (as-contract (contract-call? .cross-peg-out-endpoint-v2-02 transfer-to-unwrap token-trait (get amount-in-fixed order) (get dest-chain-id order) (get to order)))))
        err-value
        (begin
          (print (merge print-msg { err: err-value }))
          (as-contract (contract-call? .cross-peg-out-endpoint-v2-02 transfer-to-unwrap token-trait (get amount-in-fixed order) (get src-chain-id order) (get from order)))))))
(define-public (transfer-to-cross-swap
    (order { from: (buff 20), to: (buff 128), token: principal, pool-id: uint, amount-in-fixed: uint, min-amount-out-fixed: uint, src-chain-id: uint, dest-chain-id: uint, salt: (buff 256) })
    (token-trait <ft-trait>)
    (token-out-trait <ft-trait>)
    (signature-packs (list 100 { signer: principal, order-hash: (buff 32), signature: (buff 65)})))
    (let (
        (token (contract-of token-trait))
        (token-out (contract-of token-out-trait))
        (order-hash (try! (hash-cross-swap-order order)))
        (common-data (try! (transfer-common order-hash (as-contract tx-sender) token (get src-chain-id order) signature-packs)))
        (token-details (get token-details common-data))
        (print-msg { object: "cross-bridge-endpoint", action: "transfer-to-cross-swap", salt: (get salt order), from: (get from order), to: (get to order), token-x: (get token order), pool-id: (get pool-id order), dx: (get amount-in-fixed order), min-dy: (get min-amount-out-fixed order), src-chain-id: (get src-chain-id order), dest-chain-id: (get dest-chain-id order) }))
      (asserts! (is-eq token (get token order)) ERR-TOKEN-NOT-AUTHORIZED)
      (if (get burnable token-details) 
        (as-contract (try! (contract-call? token-trait mint-fixed (get amount-in-fixed order) tx-sender)))
        (as-contract (try! (contract-call? .cross-bridge-registry-v2-01 transfer-fixed token-trait (get amount-in-fixed order) tx-sender))))
      (as-contract (try! (contract-call? .cross-bridge-registry-v2-01 add-token-reserve { token: token, chain-id: (get src-chain-id order) } (get amount-in-fixed order))))
      (as-contract (try! (contract-call? .cross-bridge-registry-v2-01 set-order-sent order-hash true)))
      (match (validate-cross-swap (get pool-id order) token (get amount-in-fixed order) (get min-amount-out-fixed order) (get dest-chain-id order))
        ok-value
        (let (
            (check-token (asserts! (is-eq token-out (get token-y ok-value)) ERR-INVALID-TOKEN))
            (dy (as-contract (try! (contract-call? .amm-swap-pool-v1-1 swap-helper token-trait token-out-trait (get factor ok-value) (get amount-in-fixed order) (some (get min-amount-out-fixed order))))))
            (updated-print-msg (merge print-msg { token-y: token-out, dy: dy })))
          (if (is-eq (get dest-chain-id order) u0)
            (let (
              (request-id (as-contract (try! (contract-call? .btc-peg-out-endpoint-v1-12 request-peg-out-0 (get to order) (get amount-in-fixed order))))))
              (print (merge updated-print-msg { request-id: request-id }))
              (ok true))
            (begin
              (print updated-print-msg)
              (as-contract (contract-call? .cross-peg-out-endpoint-v2-02 transfer-to-unwrap token-out-trait dy (get dest-chain-id order) (get to order))))))
        err-value
        (begin
          (print (merge print-msg { token-y: token-out, err: err-value }))
          (as-contract (contract-call? .cross-peg-out-endpoint-v2-02 transfer-to-unwrap token-trait (get amount-in-fixed order) (get src-chain-id order) (get from order)))))))
(define-private (set-launch-whitelisted-iter (e {owner: (buff 20), whitelisted: bool}) (launch-id uint))
	(begin
		(map-set launch-whitelisted {launch-id: launch-id, owner: (get owner e)} (get whitelisted e))
		launch-id))
(define-private (transfer-common (order-hash (buff 32)) (recipient principal) (token principal) (src-chain-id uint) (signature-packs (list 100 { signer: principal, order-hash: (buff 32), signature: (buff 65)})))
  (let (
      (token-details (try! (get-approved-pair-or-fail { token: token, chain-id: src-chain-id })))
      (chain-details (try! (get-approved-chain-or-fail src-chain-id))))
    (asserts! (not (get-paused)) ERR-PAUSED)
    (asserts! (is-approved-relayer-or-default tx-sender) ERR-UKNOWN-RELAYER)
    (asserts! (>= (len signature-packs) (get-required-validators)) ERR-REQUIRED-VALIDATORS)
    (asserts! (not (is-order-sent-or-default order-hash)) ERR-ORDER-ALREADY-SENT)
    (var-set order-hash-to-iter order-hash)
    (try! (fold validate-signature-iter signature-packs (ok true)))
    (ok { token-details: token-details, chain-details: chain-details, recipient: recipient })))
(define-private (validate-order (order-hash (buff 32)) (signature-pack { signer: principal, order-hash: (buff 32), signature: (buff 65)}))
  (let (
      (validator (try! (validator-from-id-or-fail (try! (get-validator-id-or-fail (get signer signature-pack)))))))
    (asserts! (not (is-order-validated-by-or-default order-hash (get signer signature-pack))) ERR-DUPLICATE-SIGNATURE)
    (asserts! (is-eq order-hash (get order-hash signature-pack)) ERR-ORDER-HASH-MISMATCH)
    (asserts! (is-eq (secp256k1-recover? (sha256 (concat structured-data-prefix (concat (message-domain) order-hash))) (get signature signature-pack)) (ok (get validator-pubkey validator))) ERR-INVALID-SIGNATURE)
    (as-contract (contract-call? .cross-bridge-registry-v2-01 set-order-validated-by { order-hash: order-hash, validator: (get signer signature-pack) } true))))
(define-private (validate-signature-iter (signature-pack { signer: principal, order-hash: (buff 32), signature: (buff 65)}) (previous-response (response bool uint)))
  (match previous-response prev-ok (validate-order (var-get order-hash-to-iter) signature-pack) prev-err previous-response))
(define-private (check-is-owner)
  (ok (asserts! (is-eq tx-sender (var-get contract-owner)) ERR-NOT-AUTHORIZED)))
(define-private (mul-down (a uint) (b uint))
  (/ (* a b) ONE_8))
(define-private (div-down (a uint) (b uint))
  (if (is-eq a u0) u0 (/ (* a ONE_8) b)))
(define-private (max (a uint) (b uint))
  (if (<= a b) b a))