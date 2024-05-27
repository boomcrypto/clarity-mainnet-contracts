(use-trait sip010-trait .trait-sip-010.sip-010-trait)
(define-constant err-unauthorised (err u1000))
(define-constant err-paused (err u1001))
(define-constant err-peg-in-address-not-found (err u1002))
(define-constant err-invalid-amount (err u1003))
(define-constant err-token-mismatch (err u1004))
(define-constant err-invalid-tx (err u1005))
(define-constant err-already-sent (err u1006))
(define-constant err-address-mismatch (err u1007))
(define-constant err-request-already-revoked (err u1008))
(define-constant err-request-already-finalized (err u1009))
(define-constant err-revoke-grace-period (err u1010))
(define-constant err-request-already-claimed (err u1011))
(define-constant err-invalid-input (err u1012))
(define-constant err-tx-mined-before-request (err u1013))
(define-constant err-commit-tx-mismatch (err u1014))
(define-constant MAX_UINT u340282366920938463463374607431768211455)
(define-constant ONE_8 u100000000)
(define-data-var contract-owner principal tx-sender)
(define-data-var fee-address principal tx-sender)
(define-public (set-contract-owner (new-contract-owner principal))
	(begin
		(try! (is-contract-owner))
		(ok (var-set contract-owner new-contract-owner))))
(define-public (set-fee-address (new-fee-address principal))
	(begin
		(try! (is-contract-owner))
		(ok (var-set fee-address new-fee-address))))
(define-public (transfer-all-to (new-owner principal) (token-trait <sip010-trait>))
	(begin 
		(try! (is-contract-owner))
		(as-contract (contract-call? token-trait transfer-fixed (unwrap-panic (contract-call? token-trait get-balance-fixed tx-sender)) tx-sender new-owner none))))
(define-public (transfer-all-to-many (new-owner principal) (token-traits (list 10 <sip010-trait>)))
	(ok (map transfer-all-to (list new-owner new-owner new-owner new-owner new-owner new-owner new-owner new-owner new-owner new-owner) token-traits)))
(define-read-only (get-request-revoke-grace-period)
	(contract-call? .meta-bridge-registry-v2 get-request-revoke-grace-period))
(define-read-only (get-request-claim-grace-period)
	(contract-call? .meta-bridge-registry-v2 get-request-claim-grace-period))
(define-read-only (is-peg-in-address-approved (address (buff 128)))
	(contract-call? .meta-bridge-registry-v2 is-peg-in-address-approved address))
(define-read-only (get-pair-details-or-fail (pair { tick: (string-utf8 256), token: principal }))
	(contract-call? .meta-bridge-registry-v2 get-pair-details-or-fail pair))
(define-read-only (is-approved-pair (pair { tick: (string-utf8 256), token: principal }))
	(contract-call? .meta-bridge-registry-v2 is-approved-pair pair))
(define-read-only (get-request-or-fail (request-id uint))
	(contract-call? .meta-bridge-registry-v2 get-request-or-fail request-id))
(define-read-only (create-order-or-fail (order { user: principal, dest: uint }))
	(ok (unwrap! (to-consensus-buff? order) err-invalid-input)))
(define-read-only (decode-order-or-fail (order-script (buff 128)) (offset uint))
	(ok (unwrap! (from-consensus-buff? { user: principal, dest: uint } (unwrap-panic (slice? order-script offset (len order-script)))) err-invalid-input)))
(define-read-only (decode-order-from-reveal-tx-or-fail (tx (buff 8192)) (order-idx uint))
	(let (
			(parsed-tx (unwrap! (contract-call? .clarity-bitcoin-v1-07 parse-wtx tx) err-invalid-tx))
			(commit-txid (get hash (get outpoint (unwrap-panic (element-at? (get ins parsed-tx) u0)))))
			(order-script (unwrap-panic (element-at? (unwrap-panic (element-at? (get witnesses parsed-tx) u0)) order-idx)))
			(order-details (try! (decode-order-or-fail (unwrap-panic (as-max-len? (unwrap-panic (slice? order-script u0 (+ (buff-to-uint-be (unwrap-panic (element-at? order-script u0))) u1))) u128)) u1))))
			(ok { commit-txid: commit-txid, order-details: order-details })))
(define-read-only (get-peg-in-sent-or-default (bitcoin-tx (buff 8192)) (output uint) (offset uint))
	(contract-call? .meta-bridge-registry-v2 get-peg-in-sent-or-default bitcoin-tx output offset))
(define-read-only (get-fee-address)
	(var-get fee-address))
(define-read-only (extract-tx-ins-outs (tx (buff 8192)))
	(if (try! (contract-call? .clarity-bitcoin-v1-07 is-segwit-tx tx))
		(let (
				(parsed-tx (unwrap! (contract-call? .clarity-bitcoin-v1-07 parse-wtx tx) err-invalid-tx)))
			(ok { ins: (get ins parsed-tx), outs: (get outs parsed-tx) }))
		(let (
				(parsed-tx (unwrap! (contract-call? .clarity-bitcoin-v1-07 parse-tx tx) err-invalid-tx)))
			(ok { ins: (get ins parsed-tx), outs: (get outs parsed-tx) }))))
(define-read-only (validate-tx (tx (buff 8192)) (output-idx uint) (offset-idx uint) (order-idx uint) (token principal))
	(let (
			(tx-idxed (try! (contract-call? .oracle-v2-02 get-bitcoin-tx-indexed-or-fail tx output-idx offset-idx)))
			(parsed-tx (try! (extract-tx-ins-outs tx)))
			(order-script (get scriptPubKey (unwrap-panic (element-at? (get outs parsed-tx) order-idx))))
			(order-details (try! (decode-order-or-fail order-script u2)))
			(token-details (try! (get-pair-details-or-fail { tick: (get tick tx-idxed), token: token })))
			(amt-in-fixed (decimals-to-fixed (get amt tx-idxed) (contract-call? .oracle-v2-02 get-tick-decimals-or-default (get tick tx-idxed))))
			(fee (mul-down amt-in-fixed (get peg-in-fee token-details)))
			(amt-net (- amt-in-fixed fee)))
		(asserts! (not (get-peg-in-sent-or-default tx output-idx offset-idx)) err-already-sent)
		(asserts! (is-peg-in-address-approved (get to tx-idxed)) err-peg-in-address-not-found)
		(ok { tx: tx, output-idx: output-idx, offset-idx: offset-idx, order-details: order-details, fee: fee, amt-net: amt-net, tx-idxed: tx-idxed, token-details: token-details })
	)
)
(define-read-only (validate-drop-tx
	(commit-tx { tx: (buff 8192), output-idx: uint, offset-idx: uint })
	(reveal-tx { tx: (buff 8192), order-idx: uint })
	(token principal))
	(let (
			(commit-tx-idxed (try! (contract-call? .oracle-v2-02 get-bitcoin-tx-indexed-or-fail (get tx commit-tx) (get output-idx commit-tx) (get offset-idx commit-tx))))
			(reveal-tx-data (try! (decode-order-from-reveal-tx-or-fail (get tx reveal-tx) (get order-idx reveal-tx))))			
			(token-details (try! (get-pair-details-or-fail { tick: (get tick commit-tx-idxed), token: token })))
			(amt-in-fixed (decimals-to-fixed (get amt commit-tx-idxed) (contract-call? .oracle-v2-02 get-tick-decimals-or-default (get tick commit-tx-idxed))))
			(fee (mul-down amt-in-fixed (get peg-in-fee token-details)))
			(amt-net (- amt-in-fixed fee)))
		(asserts! (not (get-peg-in-sent-or-default (get tx commit-tx) (get output-idx commit-tx) (get offset-idx commit-tx))) err-already-sent)
		(asserts! (is-peg-in-address-approved (get to commit-tx-idxed)) err-peg-in-address-not-found)
		(asserts! (is-eq (contract-call? .clarity-bitcoin-v1-07 get-segwit-txid (get tx commit-tx)) (get commit-txid reveal-tx-data)) err-commit-tx-mismatch)
		(ok { tx: (get tx commit-tx), output-idx: (get output-idx commit-tx), offset-idx: (get offset-idx commit-tx), order-details: (get order-details reveal-tx-data), fee: fee, amt-net: amt-net, tx-idxed: commit-tx-idxed, token-details: token-details })
	)
)
(define-public (finalize-drop-peg-in-on-index
	(tx { bitcoin-tx: (buff 8192), output: uint, offset: uint, tick: (string-utf8 256), amt: uint, from: (buff 128), to: (buff 128), from-bal: uint, to-bal: uint, decimals: uint })
	(block { header: (buff 80), height: uint })
	(proof { tx-index: uint, hashes: (list 14 (buff 32)), tree-depth: uint })
	(signature-packs (list 10 { signer: principal, tx-hash: (buff 32), signature: (buff 65) }))
	(reveal-tx { tx: (buff 8192), order-idx: uint }) 
	(token-trait <sip010-trait>))
	(begin
		(try! (index-tx tx block proof signature-packs))
		(finalize-drop-peg-in { tx: (get bitcoin-tx tx), output-idx: (get output tx), offset-idx: (get offset tx) } reveal-tx token-trait)))
(define-public (finalize-peg-in-on-index
	(tx { bitcoin-tx: (buff 8192), output: uint, offset: uint, tick: (string-utf8 256), amt: uint, from: (buff 128), to: (buff 128), from-bal: uint, to-bal: uint, decimals: uint })
	(block { header: (buff 80), height: uint })
	(proof { tx-index: uint, hashes: (list 14 (buff 32)), tree-depth: uint })
	(signature-packs (list 10 { signer: principal, tx-hash: (buff 32), signature: (buff 65) }))
	(order-idx uint) (token-trait <sip010-trait>))
	(begin
		(try! (index-tx tx block proof signature-packs))
		(finalize-peg-in (get bitcoin-tx tx) (get output tx) (get offset tx) order-idx token-trait)))
(define-public (finalize-peg-in (tx (buff 8192)) (output-idx uint) (offset-idx uint) (order-idx uint) (token-trait <sip010-trait>))
	(finalize-peg-in-internal (try! (validate-tx tx output-idx offset-idx order-idx (contract-of token-trait))) token-trait))
(define-public (finalize-drop-peg-in 
	(commit-tx { tx: (buff 8192), output-idx: uint, offset-idx: uint })
	(reveal-tx { tx: (buff 8192), order-idx: uint })
	(token-trait <sip010-trait>))
	(finalize-peg-in-internal (try! (validate-drop-tx commit-tx reveal-tx (contract-of token-trait))) token-trait))
(define-public (request-peg-out (tick (string-utf8 256)) (amount uint) (peg-out-address (buff 128)) (token-trait <sip010-trait>))
	(let (
			(token (contract-of token-trait))
			(token-details (try! (get-pair-details-or-fail { tick: tick, token: token })))
			(fee (mul-down amount (get peg-out-fee token-details)))
			(amount-net (- amount fee))
			(gas-fee (get peg-out-gas-fee token-details))
			(request-details { requested-by: tx-sender, peg-out-address: peg-out-address, tick: tick, token: token, amount-net: amount-net, fee: fee, gas-fee: gas-fee, claimed: u0, claimed-by: tx-sender, fulfilled-by: 0x, revoked: false, finalized: false, requested-at: block-height, requested-at-burn-height: burn-block-height })
			(request-id (as-contract (try! (contract-call? .meta-bridge-registry-v2 set-request u0 request-details)))))
		(asserts! (not (get peg-out-paused token-details)) err-paused)
		(asserts! (> amount u0) err-invalid-amount)
		(try! (contract-call? token-trait transfer-fixed amount tx-sender (as-contract tx-sender) none))
		(and (> gas-fee u0) (try! (contract-call? .token-susdt transfer-fixed gas-fee tx-sender (as-contract tx-sender) none)))
		(print (merge request-details { type: "request-peg-out", request-id: request-id }))
		(ok true)))
(define-public (claim-peg-out (request-id uint) (fulfilled-by (buff 128)))
	(let (
			(claimer tx-sender)
			(request-details (try! (get-request-or-fail request-id)))
			(token-details (try! (get-pair-details-or-fail { tick: (get tick request-details), token: (get token request-details) }))))
		(asserts! (not (get peg-out-paused token-details)) err-paused)
		(asserts! (< (get claimed request-details) block-height) err-request-already-claimed)
		(asserts! (not (get revoked request-details)) err-request-already-revoked)
		(asserts! (not (get finalized request-details)) err-request-already-finalized)
		(as-contract (try! (contract-call? .meta-bridge-registry-v2 set-request request-id (merge request-details { claimed: (+ block-height (get-request-claim-grace-period)), claimed-by: claimer, fulfilled-by: fulfilled-by }))))
		(print (merge request-details { type: "claim-peg-out", request-id: request-id, claimed: (+ block-height (get-request-claim-grace-period)), claimed-by: claimer, fulfilled-by: fulfilled-by }))
		(ok true)
	)
)
(define-public (finalize-peg-out-on-index (request-id uint)
	(tx { bitcoin-tx: (buff 8192), output: uint, offset: uint, tick: (string-utf8 256), amt: uint, from: (buff 128), to: (buff 128), from-bal: uint, to-bal: uint, decimals: uint })
	(block { header: (buff 80), height: uint })
	(proof { tx-index: uint, hashes: (list 14 (buff 32)), tree-depth: uint })
	(signature-packs (list 10 { signer: principal, tx-hash: (buff 32), signature: (buff 65) }))
	(token-trait <sip010-trait>))
	(begin 
		(try! (index-tx tx block proof signature-packs))
		(finalize-peg-out request-id (get bitcoin-tx tx) (get output tx) (get offset tx) token-trait)))
(define-public (finalize-peg-out (request-id uint) (tx (buff 8192)) (output-idx uint) (offset-idx uint) (token-trait <sip010-trait>))
	(let (
			(token (contract-of token-trait))
			(request-details (try! (get-request-or-fail request-id)))
			(token-details (try! (get-pair-details-or-fail { tick: (get tick request-details), token: (get token request-details) })))
			(tx-idxed (try! (contract-call? .oracle-v2-02 get-bitcoin-tx-indexed-or-fail tx output-idx offset-idx)))
			(tx-mined-height (try! (contract-call? .oracle-v2-02 get-bitcoin-tx-mined-or-fail tx)))
			(amount-in-fixed (decimals-to-fixed (get amt tx-idxed) (contract-call? .oracle-v2-02 get-tick-decimals-or-default (get tick tx-idxed))))
			(fulfilled-by (get from tx-idxed))
			(is-fulfilled-by-peg-in (is-peg-in-address-approved fulfilled-by))
			)
		(asserts! (not (get peg-out-paused token-details)) err-paused)
		(asserts! (is-eq (get tick request-details) (get tick tx-idxed)) err-token-mismatch)
		(asserts! (is-eq (get amount-net request-details) amount-in-fixed) err-invalid-amount)
		(asserts! (is-eq (get peg-out-address request-details) (get to tx-idxed)) err-address-mismatch)
		(asserts! (is-eq (get fulfilled-by request-details) fulfilled-by) err-address-mismatch)
		(asserts! (< (get requested-at-burn-height request-details) tx-mined-height) err-tx-mined-before-request)
		(asserts! (not (get-peg-in-sent-or-default tx output-idx offset-idx)) err-already-sent)
		(asserts! (not (get revoked request-details)) err-request-already-revoked)
		(asserts! (not (get finalized request-details)) err-request-already-finalized)
		(as-contract (try! (contract-call? .meta-bridge-registry-v2 set-peg-in-sent { tx: tx, output: output-idx, offset: offset-idx } true)))
		(as-contract (try! (contract-call? .meta-bridge-registry-v2 set-request request-id (merge request-details { finalized: true }))))
		(and (> (get fee request-details) u0) (as-contract (try! (contract-call? token-trait transfer-fixed (get fee request-details) tx-sender (var-get fee-address) none))))
		(and (> (get gas-fee request-details) u0) (as-contract (try! (contract-call? .token-susdt transfer-fixed (get gas-fee request-details) tx-sender (if is-fulfilled-by-peg-in (var-get fee-address) (get claimed-by request-details)) none))))
		(if is-fulfilled-by-peg-in
			(and (not (get no-burn token-details)) (as-contract (try! (contract-call? token-trait burn-fixed (get amount-net request-details) tx-sender))))
			(as-contract (try! (contract-call? token-trait transfer-fixed (get amount-net request-details) tx-sender (get claimed-by request-details) none)))
		)
		(print { type: "finalize-peg-out", request-id: request-id, tx: tx })
		(ok true)))
(define-public (revoke-peg-out (request-id uint) (token-trait <sip010-trait>))
	(let (
			(token (contract-of token-trait))
			(request-details (try! (get-request-or-fail request-id)))
			(token-details (try! (get-pair-details-or-fail { tick: (get tick request-details), token: (get token request-details) }))))
		(asserts! (> block-height (+ (get requested-at request-details) (get-request-revoke-grace-period))) err-revoke-grace-period)
		(asserts! (< (get claimed request-details) block-height) err-request-already-claimed)
		(asserts! (not (get revoked request-details)) err-request-already-revoked)
		(asserts! (not (get finalized request-details)) err-request-already-finalized)
		(as-contract (try! (contract-call? .meta-bridge-registry-v2 set-request request-id (merge request-details { revoked: true }))))
		(and (> (get fee request-details) u0) (as-contract (try! (contract-call? token-trait transfer-fixed (get fee request-details) tx-sender (get requested-by request-details) none))))
		(and (> (get gas-fee request-details) u0) (as-contract (try! (contract-call? .token-susdt transfer-fixed (get gas-fee request-details) tx-sender (get requested-by request-details) none))))
		(as-contract (try! (contract-call? token-trait transfer-fixed (get amount-net request-details) tx-sender (get requested-by request-details) none)))
		(print { type: "revoke-peg-out", request-id: request-id })
		(ok true)))
(define-private (finalize-peg-in-internal 
	(validation-data { 
		tx: (buff 8192), output-idx: uint, offset-idx: uint, 
		order-details: { user: principal, dest: uint }, 
		fee: uint, amt-net: uint, 
		tx-idxed: { tick: (string-utf8 256), amt: uint, from: (buff 128), to: (buff 128) }, 
		token-details: { approved: bool, peg-in-paused: bool, peg-out-paused: bool, peg-in-fee: uint, peg-out-fee: uint, peg-out-gas-fee: uint, no-burn: bool } })
	(token-trait <sip010-trait>))
	(let (
			(tx (get tx validation-data))
			(output-idx (get output-idx validation-data))
			(offset-idx (get offset-idx validation-data))
			(tx-idxed (get tx-idxed validation-data))
			(order-details (get order-details validation-data))
			(order-address (get user order-details))
			(dest (get dest order-details))
			(token-details (get token-details validation-data))
			(fee (get fee validation-data))
			(amt-net (get amt-net validation-data))
			(print-msg (merge tx-idxed { type: "peg-in", order-address: order-address, fee: fee, amt-net: amt-net, bitcoin-tx: tx, output-idx: output-idx, offset-idx: offset-idx })))
		(asserts! (not (get peg-in-paused token-details)) err-paused)
		(as-contract (try! (contract-call? .meta-bridge-registry-v2 set-peg-in-sent { tx: tx, output: output-idx, offset: offset-idx } true)))
		(if (get no-burn token-details)
			(and (> fee u0) (as-contract (try! (contract-call? token-trait transfer-fixed fee tx-sender (var-get fee-address) none))))
			(and (> fee u0) (as-contract (try! (contract-call? token-trait mint-fixed fee (var-get fee-address))))))
		;; map cannot hold traits, so the below have to be hard-coded.
		;; mint to order-address if either dest == 0 or order-address is not registered with b20, or token is not registered with b20
		(if (or (is-eq dest u0) (is-err (contract-call? .stxdx-registry get-user-id-or-fail order-address)) (is-none (contract-call? .stxdx-registry get-asset-id (contract-of token-trait))))
			(begin
				(if (get no-burn token-details)
					(and (> amt-net u0) (as-contract (try! (contract-call? token-trait transfer-fixed amt-net tx-sender order-address none))))
					(and (> amt-net u0) (as-contract (try! (contract-call? token-trait mint-fixed amt-net order-address)))))
				(print (merge print-msg { dest: u0 })))
			(begin
				(and (not (get no-burn token-details)) (> amt-net u0) (as-contract (try! (contract-call? token-trait mint-fixed amt-net tx-sender))))
				(and (> amt-net u0) (as-contract (try! (contract-call? .stxdx-wallet-zero transfer-in
					amt-net
					(try! (contract-call? .stxdx-registry get-user-id-or-fail order-address))  ;; user-id
					(unwrap-panic (contract-call? .stxdx-registry get-asset-id (contract-of token-trait))) ;; asset-id
					token-trait))))
				(print (merge print-msg { dest: u1 }))))
		(ok true)))
(define-private (index-tx
	(tx { bitcoin-tx: (buff 8192), output: uint, offset: uint, tick: (string-utf8 256), amt: uint, from: (buff 128), to: (buff 128), from-bal: uint, to-bal: uint, decimals: uint })
	(block { header: (buff 80), height: uint })
	(proof { tx-index: uint, hashes: (list 14 (buff 32)), tree-depth: uint })
	(signature-packs (list 10 { signer: principal, tx-hash: (buff 32), signature: (buff 65) })))
	(begin 
		(and 
			(not (is-ok (contract-call? .oracle-v2-02 get-bitcoin-tx-indexed-or-fail (get bitcoin-tx tx) (get output tx) (get offset tx))))
			(as-contract (try! (contract-call? .oracle-v2-02 index-tx-many (list { tx: tx, block: block, proof: proof, signature-packs: signature-packs })))))
		(print { type: "indexed-tx", tx: tx, block: block, proof: proof, signature-packs: signature-packs })
		(ok true)))
(define-private (is-contract-owner)
	(ok (asserts! (is-eq (var-get contract-owner) tx-sender) err-unauthorised)))
(define-private (min (a uint) (b uint))
	(if (< a b) a b))
(define-private (mul-down (a uint) (b uint))
	(/ (* a b) ONE_8))
(define-private (div-down (a uint) (b uint))
	(if (is-eq a u0) u0 (/ (* a ONE_8) b)))
(define-private (decimals-to-fixed (amount uint) (decimals uint))
	(/ (* amount ONE_8) (pow u10 decimals)))