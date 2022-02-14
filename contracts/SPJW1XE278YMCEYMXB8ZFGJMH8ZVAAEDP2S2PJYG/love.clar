;; https://explorer.stacks.co/txid/0x80eb693e5e2a9928094792080b7f6d69d66ea9cc881bc465e8d9c5c621bd4d07?chain=mainnet
(impl-trait 'SP2PABAF9FTAJYNFZH93XENAJ8FVY99RRM50D2JG9.nft-trait.nft-trait)
(use-trait commission-trait .commission-trait.commission)

(define-non-fungible-token love uint)

;; constants
(define-constant ERR-NOT-AUTHORIZED u401)
(define-constant ERR-ALL-MINTED u101)
(define-constant ERR-NOT-FOUND u102)
(define-constant ERR-LISTING u103)
(define-constant ERR-WRONG-COMMISSION u104)
(define-constant ERR-WHITELIST-MINT u105)
(define-constant ERR-UNWRAP u106)
(define-constant ERR-PUBLIC-MINT u107)

(define-constant CONTRACT-OWNER tx-sender)
(define-constant ITEM-COUNT u16)

;; variables
(define-data-var metadata-frozen bool false)
(define-data-var love-counter uint u0)
(define-data-var love-index uint u0)
(define-data-var token-uri (string-ascii 256) "ipfs://Qmb9rAH2gTdh8QxEn477rEtNCHqgVHwqqmiix5muuEShkx/{id}.json")
(define-data-var whitelist-cost-per-mint uint u150000000)
(define-data-var cost-per-mint uint u450000000)
(define-data-var marketplace-commission uint u30000000)
(define-data-var creator-address principal 'SP35K3WCA9GCJV2XC7X021MR2D9D2PKF855CVCKB0)
(define-data-var rotation uint u1)
(define-data-var public-mint-enabled bool false)

(define-map token-count principal uint)
(define-map market uint {price: uint, commission: principal})

;; public functions
(define-public (whitelist-mint (index uint))
  (let (
    (current-balance (get-balance tx-sender))
    (count (var-get love-counter))
    (owner (unwrap! (contract-call? .entangled-flowers get-owner index) (err ERR-UNWRAP)))
    (item (contract-call? .stacks-art-market-v2 get-item-for-sale u17 index))
  )
    (asserts! (<= count ITEM-COUNT) (err ERR-ALL-MINTED))
    (asserts! (< current-balance u1) (err ERR-WHITELIST-MINT))
    (asserts!
      (or
        (and
          (is-some owner)
          (is-eq (unwrap-panic owner) tx-sender)
        )
        (and
          (is-some (get seller item))
          (is-eq (unwrap-panic (get seller item)) tx-sender)
        )
      )
      (err ERR-NOT-AUTHORIZED)
    )

    (try! (mint-next (var-get whitelist-cost-per-mint) (var-get marketplace-commission)))
    (ok true)
  )
)

(define-public (mint)
  (let (
    (count (var-get love-counter))
  )
    (asserts! (<= count ITEM-COUNT) (err ERR-ALL-MINTED))
    (asserts! (var-get public-mint-enabled) (err ERR-PUBLIC-MINT))

    (try! (mint-next (var-get cost-per-mint) (var-get marketplace-commission)))
    (ok true)
  )
)

(define-private (mint-next (cost uint) (comm uint))
  (let (
    (count (var-get love-counter))
    (idx (var-get love-index))
    (random-love-id
      (if (is-eq (var-get rotation) u0)
        (+ u1 idx)
        (- ITEM-COUNT (- count idx))
      )
    )
    (current-balance (get-balance tx-sender))
  )
    (match (stx-transfer? cost tx-sender (as-contract tx-sender))
      success (begin
        (try! (nft-mint? love random-love-id tx-sender))
        (var-set love-counter (+ count u1))
        (if (is-eq u0 (var-get rotation))
          (begin
            (var-set rotation u1)
            (var-set love-index (+ u1 (var-get love-index)))
          )
          (var-set rotation u0)
        )
        (try!
          (as-contract (stx-transfer? (- cost comm) (as-contract tx-sender) (var-get creator-address)))
        )

        (map-set token-count tx-sender (+ current-balance u1))
        (ok random-love-id)
      )
      error (err error)
    )
  )
)

(define-public (burn (index uint))
  (let (
    (current-balance (get-balance tx-sender))
  )
    (asserts! (is-sender-owner index) (err ERR-NOT-AUTHORIZED))
    (match (nft-burn? love index tx-sender)
      success (begin
        (map-set token-count tx-sender (- current-balance u1))
        (ok true)
      )
      error (err error)
    )
  )
)

(define-private (trnsfr (id uint) (sender principal) (recipient principal))
  (match (nft-transfer? love id sender recipient)
    success
      (let (
        (sender-balance (get-balance sender))
        (recipient-balance (get-balance recipient))
      )
        (map-set token-count sender (- sender-balance u1))
        (map-set token-count recipient (+ recipient-balance u1))
        (ok success)
      )
    error (err error)
  )
)

;; SIP009: Transfer token to a specified principal
(define-public (transfer (id uint) (sender principal) (recipient principal))
  (begin
    (asserts! (is-eq tx-sender sender) (err ERR-NOT-AUTHORIZED))
    (asserts! (is-none (map-get? market id)) (err ERR-LISTING))
    (trnsfr id sender recipient)
  )
)

(define-read-only (get-last-token-id)
  (ok (var-get love-counter))
)

(define-public (set-cost-per-mint (value uint))
  (if (is-eq tx-sender CONTRACT-OWNER)
    (ok (var-set cost-per-mint value))
    (err ERR-NOT-AUTHORIZED)
  )
)

(define-public (enable-public-mint)
  (if (is-eq tx-sender CONTRACT-OWNER)
    (ok (var-set public-mint-enabled true))
    (err ERR-NOT-AUTHORIZED)
  )
)

(define-public (freeze-metadata)
  (if (or
    (is-eq tx-sender CONTRACT-OWNER)
    (is-eq tx-sender (var-get creator-address))
  )
    (ok (var-set metadata-frozen true))
    (err ERR-NOT-AUTHORIZED)
  )
)

(define-public (set-token-uri (value (string-ascii 256)))
  (begin
    (asserts! (is-eq false (var-get metadata-frozen)) (err ERR-NOT-AUTHORIZED))

    (if (or
      (is-eq tx-sender CONTRACT-OWNER)
      (is-eq tx-sender (var-get creator-address))
    )
      (ok (var-set token-uri value))
      (err ERR-NOT-AUTHORIZED)
    )
  )
)

(define-public (set-creator-address (address principal))
  (if (or
    (is-eq tx-sender CONTRACT-OWNER)
    (is-eq tx-sender (var-get creator-address))
  )
    (ok (var-set creator-address address))
    (err ERR-NOT-AUTHORIZED)
  )
)

(define-read-only (get-token-uri (id uint))
  (ok (some (var-get token-uri)))
)

(define-read-only (get-owner (index uint))
  (ok (nft-get-owner? love index))
)

(define-read-only (get-balance (account principal))
  (default-to u0
    (map-get? token-count account)
  )
)

(define-public (transfer-stx (address principal) (amount uint))
  (if (is-eq tx-sender CONTRACT-OWNER)
    (as-contract (stx-transfer? amount (as-contract tx-sender) address))
    (err ERR-NOT-AUTHORIZED)
  )
)

(define-public (list-in-ustx (id uint) (price uint) (comm <commission-trait>))
  (let (
    (listing  {price: price, commission: (contract-of comm)})
  )
    (asserts! (is-sender-owner id) (err ERR-NOT-AUTHORIZED))
    (map-set market id listing)
    (print (merge listing {a: "list-in-ustx", id: id}))
    (ok true)
  )
)

(define-public (unlist-in-ustx (id uint))
  (begin
    (asserts! (is-sender-owner id) (err ERR-NOT-AUTHORIZED))
    (map-delete market id)
    (print {a: "unlist-in-ustx", id: id})
    (ok true)
  )
)

(define-public (buy-in-ustx (id uint) (comm <commission-trait>))
  (let (
    (owner (unwrap! (nft-get-owner? love id) (err ERR-NOT-FOUND)))
    (listing (unwrap! (map-get? market id) (err ERR-LISTING)))
    (price (get price listing))
  )
    (asserts! (is-eq (contract-of comm) (get commission listing)) (err ERR-WRONG-COMMISSION))
    (try! (stx-transfer? price tx-sender owner))
    (try! (contract-call? comm pay id price))
    (try! (trnsfr id owner tx-sender))
    (map-delete market id)
    (print {a: "buy-in-ustx", id: id})
    (ok true)
  )
)

;; private functions

(define-private (is-sender-owner (id uint))
  (let (
    (owner (unwrap! (nft-get-owner? love id) false))
  )
    (or (is-eq tx-sender owner) (is-eq contract-caller owner))
  )
)
