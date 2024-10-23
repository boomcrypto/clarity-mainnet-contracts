;; the-rot-childs-collect-shun
;; contractType: continuous

(impl-trait 'SP2PABAF9FTAJYNFZH93XENAJ8FVY99RRM50D2JG9.nft-trait.nft-trait)
;;(impl-trait .nft-trait.nft-trait)

(define-non-fungible-token the-rot-childs-collect-shun uint)

(define-constant DEPLOYER tx-sender)

(define-constant ERR-NOT-AUTHORIZED u101)
(define-constant ERR-INVALID-USER u102)
(define-constant ERR-LISTING u103)
(define-constant ERR-WRONG-COMMISSION u104)
(define-constant ERR-NOT-FOUND u105)
(define-constant ERR-NFT-MINT u106)
(define-constant ERR-CONTRACT-LOCKED u107)
(define-constant ERR-METADATA-FROZEN u111)
(define-constant ERR-INVALID-PERCENTAGE u114)

(define-data-var last-id uint u0)
(define-data-var artist-address principal 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG)
(define-data-var locked bool false)
(define-data-var metadata-frozen bool false)

(define-map cids uint (string-ascii 64))

(define-public (lock-contract)
  (begin
    (asserts! (or (is-eq tx-sender (var-get artist-address)) (is-eq tx-sender DEPLOYER)) (err ERR-NOT-AUTHORIZED))
    (var-set locked true)
    (ok true)))

(define-public (set-artist-address (address principal))
  (begin
    (asserts! (or (is-eq tx-sender (var-get artist-address)) (is-eq tx-sender DEPLOYER)) (err ERR-INVALID-USER))
    (ok (var-set artist-address address))))

(define-public (burn (token-id uint))
  (begin 
    (asserts! (is-owner token-id tx-sender) (err ERR-NOT-AUTHORIZED))
    (asserts! (is-none (map-get? market token-id)) (err ERR-LISTING))
    (nft-burn? the-rot-childs-collect-shun token-id tx-sender)))

(define-public (set-token-uri (hash (string-ascii 64)) (token-id uint))
  (begin
    (asserts! (or (is-eq tx-sender (var-get artist-address)) (is-eq tx-sender DEPLOYER)) (err ERR-NOT-AUTHORIZED))
    (asserts! (not (var-get metadata-frozen)) (err ERR-METADATA-FROZEN))
    (print { notification: "token-metadata-update", payload: { token-class: "nft", token-ids: (list token-id), contract-id: (as-contract tx-sender) }})
    (map-set cids token-id hash)
    (ok true)))

(define-public (freeze-metadata)
  (begin
    (asserts! (or (is-eq tx-sender (var-get artist-address)) (is-eq tx-sender DEPLOYER)) (err ERR-NOT-AUTHORIZED))
    (var-set metadata-frozen true)
    (ok true)))

(define-private (is-owner (token-id uint) (user principal))
    (is-eq user (unwrap! (nft-get-owner? the-rot-childs-collect-shun token-id) false)))

(define-public (transfer (id uint) (sender principal) (recipient principal))
  (begin
    (asserts! (is-eq tx-sender sender) (err ERR-NOT-AUTHORIZED))
    (asserts! (is-none (map-get? market id)) (err ERR-LISTING))
    (trnsfr id sender recipient)))

(define-read-only (get-owner (token-id uint))
  (ok (nft-get-owner? the-rot-childs-collect-shun token-id)))

(define-read-only (get-last-token-id)
  (ok (var-get last-id)))

(define-read-only (get-token-uri (token-id uint))
  (ok (some (concat "ipfs://" (unwrap-panic (map-get? cids token-id))))))

(define-read-only (get-artist-address)
  (ok (var-get artist-address)))

(define-public (claim (uris (list 25 (string-ascii 64))))
  (mint-many uris))

(define-private (mint-many (uris (list 25 (string-ascii 64))))
  (let 
    (
      (token-id (+ (var-get last-id) u1))
      (art-addr (var-get artist-address))
      (id-reached (fold mint-many-iter uris token-id))
      (current-balance (get-balance tx-sender))
    )
    (asserts! (or (is-eq tx-sender DEPLOYER) (is-eq tx-sender art-addr)) (err ERR-NOT-AUTHORIZED))
    (asserts! (is-eq (var-get locked) false) (err ERR-CONTRACT-LOCKED))
    (var-set last-id (- id-reached u1))
    (map-set token-count tx-sender (+ current-balance (- id-reached token-id)))    
    (ok id-reached)))

(define-private (mint-many-iter (hash (string-ascii 64)) (next-id uint))
  (begin
    (unwrap! (nft-mint? the-rot-childs-collect-shun next-id tx-sender) next-id)
    (map-set cids next-id hash)      
    (+ next-id u1)))

;; NON-CUSTODIAL FUNCTIONS START
(use-trait commission-trait 'SP3D6PV2ACBPEKYJTCMH7HEN02KP87QSP8KTEH335.commission-trait.commission)

(define-map token-count principal uint)
(define-map market uint {price: uint, commission: principal, royalty: uint})

(define-read-only (get-balance (account principal))
  (default-to u0
    (map-get? token-count account)))

(define-private (trnsfr (id uint) (sender principal) (recipient principal))
  (match (nft-transfer? the-rot-childs-collect-shun id sender recipient)
    success
      (let
        ((sender-balance (get-balance sender))
        (recipient-balance (get-balance recipient)))
          (map-set token-count
            sender
            (- sender-balance u1))
          (map-set token-count
            recipient
            (+ recipient-balance u1))
          (ok success))
    error (err error)))

(define-private (is-sender-owner (id uint))
  (let ((owner (unwrap! (nft-get-owner? the-rot-childs-collect-shun id) false)))
    (or (is-eq tx-sender owner) (is-eq contract-caller owner))))

(define-read-only (get-listing-in-ustx (id uint))
  (map-get? market id))

(define-public (list-in-ustx (id uint) (price uint) (comm-trait <commission-trait>))
  (let ((listing  {price: price, commission: (contract-of comm-trait), royalty: (var-get royalty-percent)}))
    (asserts! (is-sender-owner id) (err ERR-NOT-AUTHORIZED))
    (map-set market id listing)
    (print (merge listing {a: "list-in-ustx", id: id}))
    (ok true)))

(define-public (unlist-in-ustx (id uint))
  (begin
    (asserts! (is-sender-owner id) (err ERR-NOT-AUTHORIZED))
    (map-delete market id)
    (print {a: "unlist-in-ustx", id: id})
    (ok true)))

(define-public (buy-in-ustx (id uint) (comm-trait <commission-trait>))
  (let ((owner (unwrap! (nft-get-owner? the-rot-childs-collect-shun id) (err ERR-NOT-FOUND)))
      (listing (unwrap! (map-get? market id) (err ERR-LISTING)))
      (price (get price listing))
      (royalty (get royalty listing)))
    (asserts! (is-eq (contract-of comm-trait) (get commission listing)) (err ERR-WRONG-COMMISSION))
    (try! (stx-transfer? price tx-sender owner))
    (try! (pay-royalty price royalty))
    (try! (contract-call? comm-trait pay id price))
    (try! (trnsfr id owner tx-sender))
    (map-delete market id)
    (print {a: "buy-in-ustx", id: id})
    (ok true)))
    
(define-data-var royalty-percent uint u500)

(define-read-only (get-royalty-percent)
  (ok (var-get royalty-percent)))

(define-public (set-royalty-percent (royalty uint))
  (begin
    (asserts! (or (is-eq tx-sender (var-get artist-address)) (is-eq tx-sender DEPLOYER)) (err ERR-INVALID-USER))
    (asserts! (and (>= royalty u0) (<= royalty u1000)) (err ERR-INVALID-PERCENTAGE))
    (ok (var-set royalty-percent royalty))))

(define-private (pay-royalty (price uint) (royalty uint))
  (let (
    (royalty-amount (/ (* price royalty) u10000))
  )
  (if (and (> royalty-amount u0) (not (is-eq tx-sender (var-get artist-address))))
    (try! (stx-transfer? royalty-amount tx-sender (var-get artist-address)))
    (print false)
  )
  (ok true)))

;; NON-CUSTODIAL FUNCTIONS END

(try! (nft-mint? the-rot-childs-collect-shun u1 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u1 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/1.json")
(try! (nft-mint? the-rot-childs-collect-shun u2 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u2 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/2.json")
(try! (nft-mint? the-rot-childs-collect-shun u3 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u3 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/3.json")
(try! (nft-mint? the-rot-childs-collect-shun u4 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u4 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/4.json")
(try! (nft-mint? the-rot-childs-collect-shun u5 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u5 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/5.json")
(try! (nft-mint? the-rot-childs-collect-shun u6 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u6 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/6.json")
(try! (nft-mint? the-rot-childs-collect-shun u7 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u7 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/7.json")
(try! (nft-mint? the-rot-childs-collect-shun u8 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u8 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/8.json")
(try! (nft-mint? the-rot-childs-collect-shun u9 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u9 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/9.json")
(try! (nft-mint? the-rot-childs-collect-shun u10 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u10 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/10.json")
(try! (nft-mint? the-rot-childs-collect-shun u11 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u11 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/11.json")
(try! (nft-mint? the-rot-childs-collect-shun u12 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u12 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/12.json")
(try! (nft-mint? the-rot-childs-collect-shun u13 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u13 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/13.json")
(try! (nft-mint? the-rot-childs-collect-shun u14 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u14 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/14.json")
(try! (nft-mint? the-rot-childs-collect-shun u15 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u15 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/15.json")
(try! (nft-mint? the-rot-childs-collect-shun u16 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u16 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/16.json")
(try! (nft-mint? the-rot-childs-collect-shun u17 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u17 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/17.json")
(try! (nft-mint? the-rot-childs-collect-shun u18 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u18 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/18.json")
(try! (nft-mint? the-rot-childs-collect-shun u19 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u19 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/19.json")
(try! (nft-mint? the-rot-childs-collect-shun u20 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u20 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/20.json")
(try! (nft-mint? the-rot-childs-collect-shun u21 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u21 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/21.json")
(try! (nft-mint? the-rot-childs-collect-shun u22 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u22 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/22.json")
(try! (nft-mint? the-rot-childs-collect-shun u23 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u23 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/23.json")
(try! (nft-mint? the-rot-childs-collect-shun u24 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u24 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/24.json")
(try! (nft-mint? the-rot-childs-collect-shun u25 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u25 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/25.json")
(try! (nft-mint? the-rot-childs-collect-shun u26 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u26 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/26.json")
(try! (nft-mint? the-rot-childs-collect-shun u27 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u27 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/27.json")
(try! (nft-mint? the-rot-childs-collect-shun u28 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u28 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/28.json")
(try! (nft-mint? the-rot-childs-collect-shun u29 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u29 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/29.json")
(try! (nft-mint? the-rot-childs-collect-shun u30 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u30 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/30.json")
(try! (nft-mint? the-rot-childs-collect-shun u31 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u31 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/31.json")
(try! (nft-mint? the-rot-childs-collect-shun u32 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u32 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/32.json")
(try! (nft-mint? the-rot-childs-collect-shun u33 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u33 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/33.json")
(try! (nft-mint? the-rot-childs-collect-shun u34 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u34 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/34.json")
(try! (nft-mint? the-rot-childs-collect-shun u35 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u35 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/35.json")
(try! (nft-mint? the-rot-childs-collect-shun u36 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u36 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/36.json")
(try! (nft-mint? the-rot-childs-collect-shun u37 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u37 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/37.json")
(try! (nft-mint? the-rot-childs-collect-shun u38 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u38 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/38.json")
(try! (nft-mint? the-rot-childs-collect-shun u39 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u39 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/39.json")
(try! (nft-mint? the-rot-childs-collect-shun u40 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u40 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/40.json")
(try! (nft-mint? the-rot-childs-collect-shun u41 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u41 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/41.json")
(try! (nft-mint? the-rot-childs-collect-shun u42 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u42 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/42.json")
(try! (nft-mint? the-rot-childs-collect-shun u43 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u43 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/43.json")
(try! (nft-mint? the-rot-childs-collect-shun u44 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u44 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/44.json")
(try! (nft-mint? the-rot-childs-collect-shun u45 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u45 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/45.json")
(try! (nft-mint? the-rot-childs-collect-shun u46 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u46 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/46.json")
(try! (nft-mint? the-rot-childs-collect-shun u47 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u47 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/47.json")
(try! (nft-mint? the-rot-childs-collect-shun u48 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u48 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/48.json")
(try! (nft-mint? the-rot-childs-collect-shun u49 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u49 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/49.json")
(try! (nft-mint? the-rot-childs-collect-shun u50 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u50 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/50.json")
(try! (nft-mint? the-rot-childs-collect-shun u51 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u51 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/51.json")
(try! (nft-mint? the-rot-childs-collect-shun u52 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u52 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/52.json")
(try! (nft-mint? the-rot-childs-collect-shun u53 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u53 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/53.json")
(try! (nft-mint? the-rot-childs-collect-shun u54 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u54 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/54.json")
(try! (nft-mint? the-rot-childs-collect-shun u55 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u55 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/55.json")
(try! (nft-mint? the-rot-childs-collect-shun u56 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u56 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/56.json")
(try! (nft-mint? the-rot-childs-collect-shun u57 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG))
(map-set token-count 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG (+ (get-balance 'SP13MQ92X6HP6H50ZN6C68R4A05XAY5PRWJQ57XGG) u1))
(map-set cids u57 "QmaSZS8dfNNWhSo98T2XJZkn3tmhFMUmgJtQxxdnpX7b7d/json/57.json")
(var-set last-id u57)

(define-data-var license-uri (string-ascii 80) "https://arweave.net/zmc1WTspIhFyVY82bwfAIcIExLFH5lUcHHUN0wXg4W8/4")
(define-data-var license-name (string-ascii 40) "PERSONAL")

(define-read-only (get-license-uri)
  (ok (var-get license-uri)))
  
(define-read-only (get-license-name)
  (ok (var-get license-name)))
  
(define-public (set-license-uri (uri (string-ascii 80)))
  (begin
    (asserts! (or (is-eq tx-sender (var-get artist-address)) (is-eq tx-sender DEPLOYER)) (err ERR-NOT-AUTHORIZED))
    (ok (var-set license-uri uri))))
    
(define-public (set-license-name (name (string-ascii 40)))
  (begin
    (asserts! (or (is-eq tx-sender (var-get artist-address)) (is-eq tx-sender DEPLOYER)) (err ERR-NOT-AUTHORIZED))
    (ok (var-set license-name name))))