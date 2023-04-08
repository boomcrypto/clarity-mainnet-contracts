;; multiway-swap
;; Contract to facilitate a multiway NFT swap.
;; Each of the parties involved has to call confirm-and-escrow to escrow their dues.
;; Once all parties confirmed, finalize has to be called to redistribute escrowed items.
;; At any point before the swap is finalized it can be canceled by a party involved, 
;; regardles of whether they already called confirm-and-escrow or not.

;; traders
(define-constant TRADER-1 'SP14W78Q821B3HQ3ED30624Z1F13X4JMFZY3N5SK4)
(define-constant TRADER-2 'SP19WKA4H1ZVCWRCY82SPGJHJ3GXD02D60YQT7Y7H)
(define-constant TRADER-3 'SP1B4EZB1Y4BHWKW797ZYX947JSV6XFSK135N1S5G)
(define-constant TRADER-4 'SP2TW1D8YF5CE0NDP5VCR5NMTPHQ4PQR1KBB4NQ5Q)
(define-constant TRADER-5 'SP2ZY7ETKYAN1M7R4HWQ77Q4CVDVH8PVQ41XS0N0S)
(define-constant TRADER-6 'SP3C5JYPB8YE5H9WC2SM196RVJ0JXN2GHCWXJWSES)
(define-constant TRADER-7 'SP3P4E5DQBJXMQ6MY5CR67G8RT9C5E8D3JK80MMKH)
(define-constant TRADER-8 'SPN3Y24JD5B17DN9Y8AEQGQV4VVWA644ACXBE3XE)

;; receivers
(define-constant RECEIVER-1 'SP1PJ0M4N981B47GT6KERPKHN1APJH2T5NWZSV7GS)


;; constants
(define-constant ERR_ESCROW_NOT_FILLED u401)
(define-constant ERR_SWAP_FINALIZED u402)
(define-constant ERR_RELEASING_ESCROW_FAILED u491)
(define-constant ERR_SWAP_CANCELED u499)

(define-constant ERR_IS_NOT_TRADER u410)
(define-constant ERR_CALLER_ALREADY_ESCROWED u411)
(define-constant ERR_FAILED_TO_ESCROW_STX u412)
(define-constant ERR_FAILED_TO_ESCROW_NFT u413)

(define-constant SWAP_STATE_ACTIVE u100)
(define-constant SWAP_STATE_READY_TO_FINALIZE u101)
(define-constant SWAP_STATE_FINALIZED u102)
(define-constant SWAP_STATE_CANCELED u109)

(define-constant TRADER_STATE_ACTIVE u110)
(define-constant TRADER_STATE_CONFIRMED u111)
(define-constant TRADER_STATE_CANCELED u119)

(define-constant NUM_TRADERS u8)

;; data maps and vars
(define-data-var swapState uint SWAP_STATE_ACTIVE)
(define-data-var confirmCount uint u0)

(define-map TraderState principal uint)

;; Set TraderState of each trader to TRADER_STATE_ACTIVE.
(map-set TraderState TRADER-1 TRADER_STATE_ACTIVE)
(map-set TraderState TRADER-2 TRADER_STATE_ACTIVE)
(map-set TraderState TRADER-3 TRADER_STATE_ACTIVE)
(map-set TraderState TRADER-4 TRADER_STATE_ACTIVE)
(map-set TraderState TRADER-5 TRADER_STATE_ACTIVE)
(map-set TraderState TRADER-6 TRADER_STATE_ACTIVE)
(map-set TraderState TRADER-7 TRADER_STATE_ACTIVE)
(map-set TraderState TRADER-8 TRADER_STATE_ACTIVE)

;; private functions
(define-private (deposit-escrow) 
    (begin
	(if (is-eq tx-sender TRADER-1)
            (begin
		(unwrap! (contract-call? 'SP2GG6GF6ESKMPNJYWZ35PF3Q8966MEDHH0AAYX6C.bitcoin-punkz transfer u4321 tx-sender (as-contract tx-sender)) (err ERR_FAILED_TO_ESCROW_NFT))
		(unwrap! (contract-call? 'SP2GG6GF6ESKMPNJYWZ35PF3Q8966MEDHH0AAYX6C.bitcoin-punkz transfer u4322 tx-sender (as-contract tx-sender)) (err ERR_FAILED_TO_ESCROW_NFT))
		(unwrap! (contract-call? 'SP2GG6GF6ESKMPNJYWZ35PF3Q8966MEDHH0AAYX6C.bitcoin-punkz transfer u4323 tx-sender (as-contract tx-sender)) (err ERR_FAILED_TO_ESCROW_NFT))
		(unwrap! (contract-call? 'SP2GG6GF6ESKMPNJYWZ35PF3Q8966MEDHH0AAYX6C.bitcoin-punkz transfer u4324 tx-sender (as-contract tx-sender)) (err ERR_FAILED_TO_ESCROW_NFT))
	    )
            true
        )
	(if (is-eq tx-sender TRADER-2)
            (begin
		(unwrap! (contract-call? 'SP19WKA4H1ZVCWRCY82SPGJHJ3GXD02D60YQT7Y7H.shinigami-pfp transfer u4 tx-sender (as-contract tx-sender)) (err ERR_FAILED_TO_ESCROW_NFT))
	    )
            true
        )
	(if (is-eq tx-sender TRADER-3)
            (begin
		(unwrap! (stx-transfer? u19292000 tx-sender (as-contract tx-sender)) (err ERR_FAILED_TO_ESCROW_STX))
	    )
            true
        )
	(if (is-eq tx-sender TRADER-4)
            (begin
		(unwrap! (stx-transfer? u5118000 tx-sender (as-contract tx-sender)) (err ERR_FAILED_TO_ESCROW_STX))
		(unwrap! (contract-call? 'SP2J4TG4H9KYMTTG267KMR82JDM20WHET6XNR0PWQ.bitcoin-owlz transfer u1514 tx-sender (as-contract tx-sender)) (err ERR_FAILED_TO_ESCROW_NFT))
		(unwrap! (contract-call? 'SP3D6PV2ACBPEKYJTCMH7HEN02KP87QSP8KTEH335.steady-lads-msa transfer u1102 tx-sender (as-contract tx-sender)) (err ERR_FAILED_TO_ESCROW_NFT))
		(unwrap! (contract-call? 'SP2YS6QDVENG4GK46W6BRB8TCJ22VFZH7A54T2293.spirits-of-elden transfer u191 tx-sender (as-contract tx-sender)) (err ERR_FAILED_TO_ESCROW_NFT))
	    )
            true
        )
	(if (is-eq tx-sender TRADER-5)
            (begin
		(unwrap! (contract-call? 'SP2ZY7ETKYAN1M7R4HWQ77Q4CVDVH8PVQ41XS0N0S.parrot-pix transfer u15 tx-sender (as-contract tx-sender)) (err ERR_FAILED_TO_ESCROW_NFT))
	    )
            true
        )
	(if (is-eq tx-sender TRADER-6)
            (begin
		(unwrap! (contract-call? 'SP3D6PV2ACBPEKYJTCMH7HEN02KP87QSP8KTEH335.steady-lads-msa transfer u729 tx-sender (as-contract tx-sender)) (err ERR_FAILED_TO_ESCROW_NFT))
	    )
            true
        )
	(if (is-eq tx-sender TRADER-7)
            (begin
		(unwrap! (contract-call? 'SP3PDE2SV6DB455Q2AG7RWZ1X1MADJNSTZEDV2K2Z.fashion-dog transfer u114 tx-sender (as-contract tx-sender)) (err ERR_FAILED_TO_ESCROW_NFT))
	    )
            true
        )
	(if (is-eq tx-sender TRADER-8)
            (begin
		(unwrap! (contract-call? 'SP352YW5754Y9NR4VPFVMWP4V9GPK9NEXR9SK5NQY.stacks-whales transfer u7187 tx-sender (as-contract tx-sender)) (err ERR_FAILED_TO_ESCROW_NFT))
	    )
            true
        )

        (map-set TraderState tx-sender TRADER_STATE_CONFIRMED)
        (unwrap-panic (update-swap-state))
        (ok true)
    )
)

(define-private (release-escrow) 
    (begin
	(unwrap-panic (as-contract (contract-call? 'SP2J4TG4H9KYMTTG267KMR82JDM20WHET6XNR0PWQ.bitcoin-owlz transfer u1514 tx-sender TRADER-2)))
	(unwrap-panic (as-contract (contract-call? 'SP19WKA4H1ZVCWRCY82SPGJHJ3GXD02D60YQT7Y7H.shinigami-pfp transfer u4 tx-sender TRADER-3)))
	(unwrap-panic (as-contract (contract-call? 'SP3D6PV2ACBPEKYJTCMH7HEN02KP87QSP8KTEH335.steady-lads-msa transfer u729 tx-sender TRADER-3)))
	(unwrap-panic (as-contract (contract-call? 'SP2YS6QDVENG4GK46W6BRB8TCJ22VFZH7A54T2293.spirits-of-elden transfer u191 tx-sender TRADER-3)))
	(unwrap-panic (as-contract (contract-call? 'SP3PDE2SV6DB455Q2AG7RWZ1X1MADJNSTZEDV2K2Z.fashion-dog transfer u114 tx-sender TRADER-3)))
	(unwrap-panic (as-contract (contract-call? 'SP352YW5754Y9NR4VPFVMWP4V9GPK9NEXR9SK5NQY.stacks-whales transfer u7187 tx-sender TRADER-4)))
	(unwrap-panic (as-contract (contract-call? 'SP2ZY7ETKYAN1M7R4HWQ77Q4CVDVH8PVQ41XS0N0S.parrot-pix transfer u15 tx-sender TRADER-4)))
	(unwrap-panic (as-contract (contract-call? 'SP2GG6GF6ESKMPNJYWZ35PF3Q8966MEDHH0AAYX6C.bitcoin-punkz transfer u4321 tx-sender TRADER-6)))
	(unwrap-panic (as-contract (contract-call? 'SP2GG6GF6ESKMPNJYWZ35PF3Q8966MEDHH0AAYX6C.bitcoin-punkz transfer u4323 tx-sender TRADER-6)))
	(unwrap-panic (as-contract (contract-call? 'SP2GG6GF6ESKMPNJYWZ35PF3Q8966MEDHH0AAYX6C.bitcoin-punkz transfer u4324 tx-sender TRADER-6)))
	(unwrap-panic (as-contract (contract-call? 'SP2GG6GF6ESKMPNJYWZ35PF3Q8966MEDHH0AAYX6C.bitcoin-punkz transfer u4322 tx-sender TRADER-6)))
	(unwrap-panic (as-contract (contract-call? 'SP3D6PV2ACBPEKYJTCMH7HEN02KP87QSP8KTEH335.steady-lads-msa transfer u1102 tx-sender TRADER-7)))

	(unwrap-panic (as-contract (stx-transfer? u1812000 tx-sender TRADER-1)))
	(unwrap-panic (as-contract (stx-transfer? u6695000 tx-sender TRADER-2)))
	(unwrap-panic (as-contract (stx-transfer? u1936000 tx-sender RECEIVER-1)))
	(unwrap-panic (as-contract (stx-transfer? u9750000 tx-sender TRADER-5)))
	(unwrap-panic (as-contract (stx-transfer? u735000 tx-sender TRADER-6)))
	(unwrap-panic (as-contract (stx-transfer? u2482000 tx-sender TRADER-7)))
	(unwrap-panic (as-contract (stx-transfer? u1000000 tx-sender TRADER-8)))

        (var-set swapState SWAP_STATE_FINALIZED)
        (ok true)
    )
)

(define-private (return-escrow) 
    (begin 
	(if (is-eq (default-to ERR_IS_NOT_TRADER (map-get? TraderState TRADER-1)) TRADER_STATE_CONFIRMED)
            (begin
		(unwrap-panic (as-contract (contract-call? 'SP2GG6GF6ESKMPNJYWZ35PF3Q8966MEDHH0AAYX6C.bitcoin-punkz transfer u4321 tx-sender TRADER-1)))
		(unwrap-panic (as-contract (contract-call? 'SP2GG6GF6ESKMPNJYWZ35PF3Q8966MEDHH0AAYX6C.bitcoin-punkz transfer u4322 tx-sender TRADER-1)))
		(unwrap-panic (as-contract (contract-call? 'SP2GG6GF6ESKMPNJYWZ35PF3Q8966MEDHH0AAYX6C.bitcoin-punkz transfer u4323 tx-sender TRADER-1)))
		(unwrap-panic (as-contract (contract-call? 'SP2GG6GF6ESKMPNJYWZ35PF3Q8966MEDHH0AAYX6C.bitcoin-punkz transfer u4324 tx-sender TRADER-1)))
	    )
            true
        )
	(if (is-eq (default-to ERR_IS_NOT_TRADER (map-get? TraderState TRADER-2)) TRADER_STATE_CONFIRMED)
            (begin
		(unwrap-panic (as-contract (contract-call? 'SP19WKA4H1ZVCWRCY82SPGJHJ3GXD02D60YQT7Y7H.shinigami-pfp transfer u4 tx-sender TRADER-2)))
	    )
            true
        )
	(if (is-eq (default-to ERR_IS_NOT_TRADER (map-get? TraderState TRADER-3)) TRADER_STATE_CONFIRMED)
            (begin
		(unwrap-panic (as-contract (stx-transfer? u19292000 tx-sender TRADER-3)))
	    )
            true
        )
	(if (is-eq (default-to ERR_IS_NOT_TRADER (map-get? TraderState TRADER-4)) TRADER_STATE_CONFIRMED)
            (begin
		(unwrap-panic (as-contract (stx-transfer? u5118000 tx-sender TRADER-4)))
		(unwrap-panic (as-contract (contract-call? 'SP2J4TG4H9KYMTTG267KMR82JDM20WHET6XNR0PWQ.bitcoin-owlz transfer u1514 tx-sender TRADER-4)))
		(unwrap-panic (as-contract (contract-call? 'SP3D6PV2ACBPEKYJTCMH7HEN02KP87QSP8KTEH335.steady-lads-msa transfer u1102 tx-sender TRADER-4)))
		(unwrap-panic (as-contract (contract-call? 'SP2YS6QDVENG4GK46W6BRB8TCJ22VFZH7A54T2293.spirits-of-elden transfer u191 tx-sender TRADER-4)))
	    )
            true
        )
	(if (is-eq (default-to ERR_IS_NOT_TRADER (map-get? TraderState TRADER-5)) TRADER_STATE_CONFIRMED)
            (begin
		(unwrap-panic (as-contract (contract-call? 'SP2ZY7ETKYAN1M7R4HWQ77Q4CVDVH8PVQ41XS0N0S.parrot-pix transfer u15 tx-sender TRADER-5)))
	    )
            true
        )
	(if (is-eq (default-to ERR_IS_NOT_TRADER (map-get? TraderState TRADER-6)) TRADER_STATE_CONFIRMED)
            (begin
		(unwrap-panic (as-contract (contract-call? 'SP3D6PV2ACBPEKYJTCMH7HEN02KP87QSP8KTEH335.steady-lads-msa transfer u729 tx-sender TRADER-6)))
	    )
            true
        )
	(if (is-eq (default-to ERR_IS_NOT_TRADER (map-get? TraderState TRADER-7)) TRADER_STATE_CONFIRMED)
            (begin
		(unwrap-panic (as-contract (contract-call? 'SP3PDE2SV6DB455Q2AG7RWZ1X1MADJNSTZEDV2K2Z.fashion-dog transfer u114 tx-sender TRADER-7)))
	    )
            true
        )
	(if (is-eq (default-to ERR_IS_NOT_TRADER (map-get? TraderState TRADER-8)) TRADER_STATE_CONFIRMED)
            (begin
		(unwrap-panic (as-contract (contract-call? 'SP352YW5754Y9NR4VPFVMWP4V9GPK9NEXR9SK5NQY.stacks-whales transfer u7187 tx-sender TRADER-8)))
	    )
            true
        )

        (map-set TraderState tx-sender TRADER_STATE_CANCELED)
        (var-set swapState SWAP_STATE_CANCELED)
        (ok true)
    )
)

(define-private (update-swap-state) 
    (let 
        ((cfCount (+ (var-get confirmCount) u1)))

        (var-set confirmCount cfCount)
        (if 
            (is-eq cfCount NUM_TRADERS)
            (var-set swapState SWAP_STATE_READY_TO_FINALIZE)
            true
        )
        (ok true)
    )
)

;; public functions
(define-read-only (get-swap-state) 
  (ok (var-get swapState))
)

(define-read-only (get-trader-state (trader principal)) 
  (unwrap! (map-get? TraderState trader) ERR_IS_NOT_TRADER)
)

(define-public (confirm-and-escrow) 
    (let 
        ((trState (unwrap! (map-get? TraderState tx-sender) (err ERR_IS_NOT_TRADER))))

        (asserts! (not (is-eq (var-get swapState) SWAP_STATE_FINALIZED)) (err ERR_SWAP_FINALIZED))
        (asserts! (not (is-eq (var-get swapState) SWAP_STATE_CANCELED)) (err ERR_SWAP_CANCELED))
        (asserts! (not (is-eq trState TRADER_STATE_CONFIRMED)) (err ERR_CALLER_ALREADY_ESCROWED))
        (try! (deposit-escrow))
        (ok true)
    )
)

(define-public (cancel) 
    (begin
        (unwrap! (map-get? TraderState tx-sender) (err ERR_IS_NOT_TRADER))
        (asserts! (not (is-eq (var-get swapState) SWAP_STATE_FINALIZED)) (err ERR_SWAP_FINALIZED))
        (asserts! (not (is-eq (var-get swapState) SWAP_STATE_CANCELED)) (err ERR_SWAP_CANCELED))
        (unwrap! (return-escrow) (err ERR_RELEASING_ESCROW_FAILED))
        (ok true)
    )
)

(define-public (finalize) 
    (begin
        (asserts! (not (is-eq (var-get swapState) SWAP_STATE_ACTIVE)) (err ERR_ESCROW_NOT_FILLED))
        (asserts! (not (is-eq (var-get swapState) SWAP_STATE_FINALIZED)) (err ERR_SWAP_FINALIZED))
        (asserts! (not (is-eq (var-get swapState) SWAP_STATE_CANCELED)) (err ERR_SWAP_CANCELED))
        (unwrap! (release-escrow) (err ERR_RELEASING_ESCROW_FAILED))
        (ok true)
    )
)
