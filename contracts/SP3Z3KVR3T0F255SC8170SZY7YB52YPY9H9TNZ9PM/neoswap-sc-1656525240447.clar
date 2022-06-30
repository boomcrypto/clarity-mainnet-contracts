(use-trait nft 'SP2PABAF9FTAJYNFZH93XENAJ8FVY99RRM50D2JG9.nft-trait.nft-trait)

(define-constant agent-1 'SP27E3TDKYNH3C11RBDFPD5WGR6FV0VN08RKX4D2N)
(define-constant agent-2 'SP2HCSRZV6JPET1T3HW0NDNE09YJG4K3124QAEX91)
(define-constant agent-3 'SP3BTPH354JEM3E8AYAHQS9SWJ591TJQYD9QK0MCF)
(define-constant agent-4 'SP3C5JYPB8YE5H9WC2SM196RVJ0JXN2GHCWXJWSES)
(define-constant agent-5 'SP3AJC728JY0Y43E8RT6K4VDWPT265RDMXJ8M0VH0)
(define-constant agent-0 'SP1PJ0M4N981B47GT6KERPKHN1APJH2T5NWZSV7GS)

(define-data-var agent-1-status bool false)
(define-data-var agent-2-status bool false)
(define-data-var agent-3-status bool false)
(define-data-var agent-4-status bool false)
(define-data-var agent-5-status bool false)


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

(define-private (check-deal) (if (and  (var-get agent-1-status) (var-get agent-2-status) (var-get agent-3-status) (var-get agent-4-status) (var-get agent-5-status) true) (ok true) (ok false)))

(define-private (check-deal-status) (unwrap-panic (if (and  (var-get agent-1-status) (var-get agent-2-status) (var-get agent-3-status) (var-get agent-4-status) (var-get agent-5-status)) deal-closed (ok true))))

(define-private (release-escrow)
(begin
	(unwrap-panic (begin
		(unwrap-panic (as-contract (contract-call? 'SPJJYJVZ4H7B34GG8D3SSN70WVWDYSHCC9E9ZV4V.bitcoin-toadz transfer u2420 tx-sender agent-1)))
		(as-contract (stx-transfer? u19650000 tx-sender agent-1)))
	)
	(unwrap-panic (as-contract (contract-call? 'SP497E7RX3233ATBS2AB9G4WTHB63X5PBSP5VGAQ.boom-nfts transfer u10081 tx-sender agent-2)))
	(unwrap-panic (as-contract (contract-call? 'SP2KAF9RF86PVX3NEE27DFV1CQX0T4WGR41X3S45C.byzantion-matryoshka-dolls transfer u47 tx-sender agent-2)))
	(unwrap-panic (as-contract (contract-call? 'SPQZF23W7SEYBFG5JQ496NMY0G7379SRYEDREMSV.Candy transfer u1651 tx-sender agent-3)))
	(unwrap-panic (as-contract (contract-call? 'SPXM7A1WWQPS3R504SNGXERRHEKHZEGQE40DJGJY.stockings transfer u231 tx-sender agent-3)))
	(unwrap-panic (as-contract (contract-call? 'SPXM7A1WWQPS3R504SNGXERRHEKHZEGQE40DJGJY.stockings transfer u241 tx-sender agent-3)))
	(unwrap-panic (as-contract (contract-call? 'SP3AJC728JY0Y43E8RT6K4VDWPT265RDMXJ8M0VH0.bitbombs-v2 transfer u49 tx-sender agent-3)))
	(unwrap-panic (as-contract (contract-call? 'SPJW1XE278YMCEYMXB8ZFGJMH8ZVAAEDP2S2PJYG.citadels transfer u1734 tx-sender agent-4)))
	(unwrap-panic (as-contract (contract-call? 'SP3BS8RXKKAAM7HA76SFDKG4Q2YSG0X8K5K44XNDV.jelly-nft transfer u575 tx-sender agent-4)))
	(unwrap-panic (as-contract (contract-call? 'SPM1Q7YG18378H6W254YN8PABEVRPT38ZCY01SJD.collection-one-life-vol-2 transfer u7 tx-sender agent-4)))
	(unwrap-panic (as-contract (contract-call? 'SPPCHF5474M4X5ZS79TCKSNRKJ24Y71J77ZKTAP3.dinonyana transfer u9 tx-sender agent-4)))
	(unwrap-panic (as-contract (contract-call? 'SPJW1XE278YMCEYMXB8ZFGJMH8ZVAAEDP2S2PJYG.shapes transfer u346 tx-sender agent-5)))
	(unwrap-panic (as-contract (contract-call? 'SP2KAF9RF86PVX3NEE27DFV1CQX0T4WGR41X3S45C.byzantion-satoshi-knights transfer u78 tx-sender agent-5)))
	(unwrap-panic (begin
		(as-contract (stx-transfer? u960000 tx-sender agent-0)))
	)

	(var-set deal true)
	(var-set contract-status u503)
	(ok true)
))

(define-private (cancel-escrow)
(begin        
	(if (is-eq (var-get agent-1-status) true)
	(begin
		(unwrap-panic (as-contract (contract-call? 'SPJW1XE278YMCEYMXB8ZFGJMH8ZVAAEDP2S2PJYG.citadels transfer u1734 tx-sender agent-1)))
		(unwrap-panic (as-contract (contract-call? 'SP2KAF9RF86PVX3NEE27DFV1CQX0T4WGR41X3S45C.byzantion-matryoshka-dolls transfer u47 tx-sender agent-1)))
		(unwrap-panic (as-contract (contract-call? 'SP2KAF9RF86PVX3NEE27DFV1CQX0T4WGR41X3S45C.byzantion-satoshi-knights transfer u78 tx-sender agent-1)))
		(unwrap-panic (as-contract (contract-call? 'SPM1Q7YG18378H6W254YN8PABEVRPT38ZCY01SJD.collection-one-life-vol-2 transfer u7 tx-sender agent-1)))
		(unwrap-panic (as-contract (contract-call? 'SPPCHF5474M4X5ZS79TCKSNRKJ24Y71J77ZKTAP3.dinonyana transfer u9 tx-sender agent-1)))
	(var-set agent-1-status false))
	true)
	(if (is-eq (var-get agent-2-status) true)
	(begin
	(unwrap-panic (begin
		(unwrap-panic (as-contract (contract-call? 'SP3AJC728JY0Y43E8RT6K4VDWPT265RDMXJ8M0VH0.bitbombs-v2 transfer u49 tx-sender agent-2)))
		(unwrap-panic (as-contract (contract-call? 'SP3BS8RXKKAAM7HA76SFDKG4Q2YSG0X8K5K44XNDV.jelly-nft transfer u575 tx-sender agent-2)))
		(as-contract (stx-transfer? u3000000 tx-sender agent-2)))
	)
	(var-set agent-2-status false)
	)
	true
	)
	(if (is-eq (var-get agent-3-status) true)
	(begin
	(unwrap-panic (begin
		(unwrap-panic (as-contract (contract-call? 'SPJJYJVZ4H7B34GG8D3SSN70WVWDYSHCC9E9ZV4V.bitcoin-toadz transfer u2420 tx-sender agent-3)))
		(unwrap-panic (as-contract (contract-call? 'SPJW1XE278YMCEYMXB8ZFGJMH8ZVAAEDP2S2PJYG.shapes transfer u346 tx-sender agent-3)))
		(as-contract (stx-transfer? u2340000 tx-sender agent-3)))
	)
	(var-set agent-3-status false)
	)
	true
	)
	(if (is-eq (var-get agent-4-status) true)
	(begin
	(unwrap-panic (begin
		(unwrap-panic (as-contract (contract-call? 'SP497E7RX3233ATBS2AB9G4WTHB63X5PBSP5VGAQ.boom-nfts transfer u10081 tx-sender agent-4)))
		(unwrap-panic (as-contract (contract-call? 'SPQZF23W7SEYBFG5JQ496NMY0G7379SRYEDREMSV.Candy transfer u1651 tx-sender agent-4)))
		(unwrap-panic (as-contract (contract-call? 'SPXM7A1WWQPS3R504SNGXERRHEKHZEGQE40DJGJY.stockings transfer u231 tx-sender agent-4)))
		(unwrap-panic (as-contract (contract-call? 'SPXM7A1WWQPS3R504SNGXERRHEKHZEGQE40DJGJY.stockings transfer u241 tx-sender agent-4)))
		(as-contract (stx-transfer? u14020000 tx-sender agent-4)))
	)
	(var-set agent-4-status false)
	)
	true
	)
	(if (is-eq (var-get agent-5-status) true)
	(begin
	(unwrap-panic (begin
		(as-contract (stx-transfer? u1250000 tx-sender agent-5)))
	)
	(var-set agent-5-status false)
	)
	true
	)

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
		(asserts! (is-ok (contract-call? 'SPJW1XE278YMCEYMXB8ZFGJMH8ZVAAEDP2S2PJYG.citadels transfer u1734 tx-sender (as-contract tx-sender))) cannot-escrow-nft )
		(asserts! (is-ok (contract-call? 'SP2KAF9RF86PVX3NEE27DFV1CQX0T4WGR41X3S45C.byzantion-matryoshka-dolls transfer u47 tx-sender (as-contract tx-sender))) cannot-escrow-nft )
		(asserts! (is-ok (contract-call? 'SP2KAF9RF86PVX3NEE27DFV1CQX0T4WGR41X3S45C.byzantion-satoshi-knights transfer u78 tx-sender (as-contract tx-sender))) cannot-escrow-nft )
		(asserts! (is-ok (contract-call? 'SPM1Q7YG18378H6W254YN8PABEVRPT38ZCY01SJD.collection-one-life-vol-2 transfer u7 tx-sender (as-contract tx-sender))) cannot-escrow-nft )
		(asserts! (is-ok (contract-call? 'SPPCHF5474M4X5ZS79TCKSNRKJ24Y71J77ZKTAP3.dinonyana transfer u9 tx-sender (as-contract tx-sender))) cannot-escrow-nft )
		(var-set agent-1-status true)
		(var-set flag true))
		true)
		(if (is-eq tx-sender agent-2)
		(begin
		(asserts! (is-eq (var-get agent-2-status) false) sender-already-confirmed)
		(asserts! (is-ok (contract-call? 'SP3AJC728JY0Y43E8RT6K4VDWPT265RDMXJ8M0VH0.bitbombs-v2 transfer u49 tx-sender (as-contract tx-sender))) cannot-escrow-nft )
		(asserts! (is-ok (contract-call? 'SP3BS8RXKKAAM7HA76SFDKG4Q2YSG0X8K5K44XNDV.jelly-nft transfer u575 tx-sender (as-contract tx-sender))) cannot-escrow-nft )
		(asserts! (is-ok (stx-transfer? u3000000 tx-sender (as-contract tx-sender))) cannot-escrow-stx )
		(var-set agent-2-status true)
		(var-set flag true))
		true)
		(if (is-eq tx-sender agent-3)
		(begin
		(asserts! (is-eq (var-get agent-3-status) false) sender-already-confirmed)
		(asserts! (is-ok (contract-call? 'SPJJYJVZ4H7B34GG8D3SSN70WVWDYSHCC9E9ZV4V.bitcoin-toadz transfer u2420 tx-sender (as-contract tx-sender))) cannot-escrow-nft )
		(asserts! (is-ok (contract-call? 'SPJW1XE278YMCEYMXB8ZFGJMH8ZVAAEDP2S2PJYG.shapes transfer u346 tx-sender (as-contract tx-sender))) cannot-escrow-nft )
		(asserts! (is-ok (stx-transfer? u2340000 tx-sender (as-contract tx-sender))) cannot-escrow-stx )
		(var-set agent-3-status true)
		(var-set flag true))
		true)
		(if (is-eq tx-sender agent-4)
		(begin
		(asserts! (is-eq (var-get agent-4-status) false) sender-already-confirmed)
		(asserts! (is-ok (contract-call? 'SP497E7RX3233ATBS2AB9G4WTHB63X5PBSP5VGAQ.boom-nfts transfer u10081 tx-sender (as-contract tx-sender))) cannot-escrow-nft )
		(asserts! (is-ok (contract-call? 'SPQZF23W7SEYBFG5JQ496NMY0G7379SRYEDREMSV.Candy transfer u1651 tx-sender (as-contract tx-sender))) cannot-escrow-nft )
		(asserts! (is-ok (contract-call? 'SPXM7A1WWQPS3R504SNGXERRHEKHZEGQE40DJGJY.stockings transfer u231 tx-sender (as-contract tx-sender))) cannot-escrow-nft )
		(asserts! (is-ok (contract-call? 'SPXM7A1WWQPS3R504SNGXERRHEKHZEGQE40DJGJY.stockings transfer u241 tx-sender (as-contract tx-sender))) cannot-escrow-nft )
		(asserts! (is-ok (stx-transfer? u14020000 tx-sender (as-contract tx-sender))) cannot-escrow-stx )
		(var-set agent-4-status true)
		(var-set flag true))
		true)
		(if (is-eq tx-sender agent-5)
		(begin
		(asserts! (is-eq (var-get agent-5-status) false) sender-already-confirmed)
		(asserts! (is-ok (stx-transfer? u1250000 tx-sender (as-contract tx-sender))) cannot-escrow-stx )
		(var-set agent-5-status true)
		(var-set flag true))
		true)

	(ok true)))

	(if (and  (var-get agent-1-status) (var-get agent-2-status) (var-get agent-3-status) (var-get agent-4-status) (var-get agent-5-status) true)
		(var-set contract-status u504)
		true)
	(if (is-eq (var-get flag) true) (ok true) non-tradable-agent)
))

(define-public (cancel)
(begin (check-deal-status)
	(if (or  (is-eq tx-sender agent-1) (is-eq tx-sender agent-2) (is-eq tx-sender agent-3) (is-eq tx-sender agent-4) (is-eq tx-sender agent-5))
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
