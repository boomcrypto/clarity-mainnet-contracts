(use-trait nft 'SP2PABAF9FTAJYNFZH93XENAJ8FVY99RRM50D2JG9.nft-trait.nft-trait)

(define-constant agent-1 'SP12VXAS7H2MT7R8116F4RA1FCS21DZ86B4DTN80J)
(define-constant agent-2 'SP15B9DHAWWBDNNAF7B63T1TXJYQMB3FQTGWMQRGG)
(define-constant agent-3 'SP21C94648068TV7RSTNWQ1FSECGAZ7PYTT2GAD63)
(define-constant agent-4 'SP27E3TDKYNH3C11RBDFPD5WGR6FV0VN08RKX4D2N)
(define-constant agent-5 'SP364J7EDJXRE1FPDZDABP9M58HPY4G88BFCP2HD0)
(define-constant agent-6 'SP3BH9700MJEX25GWJYTCDNZB50QC786T9QM8NM3B)
(define-constant agent-7 'SP3BTPH354JEM3E8AYAHQS9SWJ591TJQYD9QK0MCF)
(define-constant agent-8 'SP3C5JYPB8YE5H9WC2SM196RVJ0JXN2GHCWXJWSES)
(define-constant agent-0 'SP1PJ0M4N981B47GT6KERPKHN1APJH2T5NWZSV7GS)

(define-data-var agent-1-status bool false)
(define-data-var agent-2-status bool true)
(define-data-var agent-3-status bool true)
(define-data-var agent-4-status bool true)
(define-data-var agent-5-status bool false)
(define-data-var agent-6-status bool true)
(define-data-var agent-7-status bool true)
(define-data-var agent-8-status bool true)


(define-data-var flag bool false)

(define-data-var deal bool false)

(define-constant deal-closed (err u300))
(define-constant cannot-escrow-nft (err u301))
(define-constant cannot-escrow-stx (err u302))
(define-constant sender-already-confirmed (err u303))
(define-constant non-tradable-agent (err u304))
(define-constant release-escrow-failed (err u305))
(define-constant deal-cancelled (err u306))
(define-constant escrow-not-ready (err u307))


;; u501 - Progress ; u502 - Cancelled ; u503 - Finished ; u504 - Escrow Ready
(define-data-var contract-status uint u501)


(define-read-only (check-contract-status) (ok (var-get contract-status)))

(define-private (check-deal) (if (and  (var-get agent-1-status) (var-get agent-2-status) (var-get agent-3-status) (var-get agent-4-status) (var-get agent-5-status) (var-get agent-6-status) (var-get agent-7-status) (var-get agent-8-status) true) (ok true) (ok false)))

(define-private (check-deal-status) (unwrap-panic (if (and  (var-get agent-1-status) (var-get agent-2-status) (var-get agent-3-status) (var-get agent-4-status) (var-get agent-5-status) (var-get agent-6-status) (var-get agent-7-status) (var-get agent-8-status)) deal-closed (ok true))))

(define-private (release-escrow)
(begin
	(unwrap-panic (as-contract (contract-call? 'SPJW1XE278YMCEYMXB8ZFGJMH8ZVAAEDP2S2PJYG.venice-visuals transfer u73 tx-sender agent-1)))
	(unwrap-panic (begin
		(as-contract (stx-transfer? u80000000 tx-sender agent-5)))
	)
	(unwrap-panic (begin
		(as-contract (stx-transfer? u4000000 tx-sender agent-0)))
	)

	(var-set deal true)
	(var-set contract-status u503)
	(ok true)
))

(define-private (cancel-escrow)
(begin        
	(if (is-eq (var-get agent-1-status) true)
	(begin
	(unwrap-panic (begin
		(as-contract (stx-transfer? u84000000 tx-sender agent-1)))
	)
	(var-set agent-1-status false)
	)
	true
	)
	(if (is-eq (var-get agent-5-status) true)
	(begin
		(unwrap-panic (as-contract (contract-call? 'SPJW1XE278YMCEYMXB8ZFGJMH8ZVAAEDP2S2PJYG.venice-visuals transfer u73 tx-sender agent-5)))
	(var-set agent-5-status false))
	true)

	(var-set contract-status u502)
	(ok true)
))

(define-public (confirm-and-escrow)
(begin
	(asserts! (not (is-eq (var-get contract-status) u503)) deal-closed)
	(asserts! (not (is-eq (var-get contract-status) u502)) deal-cancelled)
	(var-set flag false)
	(unwrap-panic (begin
		(if (is-eq tx-sender agent-1)
		(begin
		(asserts! (is-eq (var-get agent-1-status) false) sender-already-confirmed)
		(asserts! (is-ok (stx-transfer? u84000000 tx-sender (as-contract tx-sender))) cannot-escrow-stx )
		(var-set agent-1-status true)
		(var-set flag true))
		true)
		(if (is-eq tx-sender agent-5)
		(begin
		(asserts! (is-eq (var-get agent-5-status) false) sender-already-confirmed)
		(asserts! (is-ok (contract-call? 'SPJW1XE278YMCEYMXB8ZFGJMH8ZVAAEDP2S2PJYG.venice-visuals transfer u73 tx-sender (as-contract tx-sender))) cannot-escrow-nft )
		(var-set agent-5-status true)
		(var-set flag true))
		true)

	(ok true)))

	(if (and  (var-get agent-1-status) (var-get agent-2-status) (var-get agent-3-status) (var-get agent-4-status) (var-get agent-5-status) (var-get agent-6-status) (var-get agent-7-status) (var-get agent-8-status) true)
		(var-set contract-status u504)
		true)
	(if (is-eq (var-get flag) true) (ok true) non-tradable-agent)
))

(define-public (cancel)
(begin (check-deal-status)
	(if (or  (is-eq tx-sender agent-1) (is-eq tx-sender agent-2) (is-eq tx-sender agent-3) (is-eq tx-sender agent-4) (is-eq tx-sender agent-5) (is-eq tx-sender agent-6) (is-eq tx-sender agent-7) (is-eq tx-sender agent-8))
	(begin
	(unwrap-panic (cancel-escrow))
	(ok true))
	non-tradable-agent)
))

(define-public (complete-neoswap)
(begin
	(asserts! (not (is-eq (var-get contract-status) u501)) escrow-not-ready)
	(asserts! (not (is-eq (var-get contract-status) u503)) deal-closed)
	(asserts! (not (is-eq (var-get contract-status) u502)) deal-cancelled)
	(unwrap-panic (release-escrow))
	(ok true)
))
