;; odinson
;; contractType: public

(impl-trait 'SP2PABAF9FTAJYNFZH93XENAJ8FVY99RRM50D2JG9.nft-trait.nft-trait)

(define-non-fungible-token odinson uint)

;; Constants
(define-constant DEPLOYER tx-sender)
(define-constant COMM u1000)
(define-constant COMM-ADDR 'SPNWZ5V2TPWGQGVDR6T7B6RQ4XMGZ4PXTEE0VQ0S)

(define-constant ERR-NO-MORE-NFTS u100)
(define-constant ERR-NOT-ENOUGH-PASSES u101)
(define-constant ERR-PUBLIC-SALE-DISABLED u102)
(define-constant ERR-CONTRACT-INITIALIZED u103)
(define-constant ERR-NOT-AUTHORIZED u104)
(define-constant ERR-INVALID-USER u105)
(define-constant ERR-LISTING u106)
(define-constant ERR-WRONG-COMMISSION u107)
(define-constant ERR-NOT-FOUND u108)
(define-constant ERR-PAUSED u109)
(define-constant ERR-MINT-LIMIT u110)
(define-constant ERR-METADATA-FROZEN u111)
(define-constant ERR-AIRDROP-CALLED u112)
(define-constant ERR-NO-MORE-MINTS u113)
(define-constant ERR-INVALID-PERCENTAGE u114)

;; Internal variables
(define-data-var mint-limit uint u101)
(define-data-var last-id uint u1)
(define-data-var total-price uint u15000000)
(define-data-var artist-address principal 'SP11Z0M9SXMXM2BGQHDPT0B9Z03TDE56WFSF6EEX8)
(define-data-var ipfs-root (string-ascii 80) "ipfs://ipfs/QmUZjEVaDbsd6Ujt6FQ7ZPZzbKjMjufHdWwadTXBsMdsXA/json/")
(define-data-var mint-paused bool true)
(define-data-var premint-enabled bool false)
(define-data-var sale-enabled bool false)
(define-data-var metadata-frozen bool false)
(define-data-var airdrop-called bool false)
(define-data-var mint-cap uint u0)

(define-map mints-per-user principal uint)
(define-map mint-passes principal uint)

(define-public (claim) 
  (mint (list true)))

;; Default Minting
(define-private (mint (orders (list 25 bool)))
  (mint-many orders))

(define-private (mint-many (orders (list 25 bool )))  
  (let 
    (
      (last-nft-id (var-get last-id))
      (enabled (asserts! (<= last-nft-id (var-get mint-limit)) (err ERR-NO-MORE-NFTS)))
      (art-addr (var-get artist-address))
      (id-reached (fold mint-many-iter orders last-nft-id))
      (price (* (var-get total-price) (- id-reached last-nft-id)))
      (total-commission (/ (* price COMM) u10000))
      (current-balance (get-balance tx-sender))
      (total-artist (- price total-commission))
      (capped (> (var-get mint-cap) u0))
      (user-mints (get-mints tx-sender))
    )
    (asserts! (or (is-eq false (var-get mint-paused)) (is-eq tx-sender DEPLOYER)) (err ERR-PAUSED))
    (asserts! (or (not capped) (is-eq tx-sender DEPLOYER) (is-eq tx-sender art-addr) (>= (var-get mint-cap) (+ (len orders) user-mints))) (err ERR-NO-MORE-MINTS))
    (map-set mints-per-user tx-sender (+ (len orders) user-mints))
    (if (or (is-eq tx-sender art-addr) (is-eq tx-sender DEPLOYER) (is-eq (var-get total-price) u0000000))
      (begin
        (var-set last-id id-reached)
        (map-set token-count tx-sender (+ current-balance (- id-reached last-nft-id)))
      )
      (begin
        (var-set last-id id-reached)
        (map-set token-count tx-sender (+ current-balance (- id-reached last-nft-id)))
        (try! (stx-transfer? total-artist tx-sender (var-get artist-address)))
        (try! (stx-transfer? total-commission tx-sender COMM-ADDR))
      )    
    )
    (ok id-reached)))

(define-private (mint-many-iter (ignore bool) (next-id uint))
  (if (<= next-id (var-get mint-limit))
    (begin
      (unwrap! (nft-mint? odinson next-id tx-sender) next-id)
      (+ next-id u1)    
    )
    next-id))

(define-public (set-artist-address (address principal))
  (begin
    (asserts! (or (is-eq tx-sender (var-get artist-address)) (is-eq tx-sender DEPLOYER)) (err ERR-INVALID-USER))
    (ok (var-set artist-address address))))

(define-public (set-price (price uint))
  (begin
    (asserts! (or (is-eq tx-sender (var-get artist-address)) (is-eq tx-sender DEPLOYER)) (err ERR-INVALID-USER))
    (ok (var-set total-price price))))

(define-public (toggle-pause)
  (begin
    (asserts! (or (is-eq tx-sender (var-get artist-address)) (is-eq tx-sender DEPLOYER)) (err ERR-INVALID-USER))
    (ok (var-set mint-paused (not (var-get mint-paused))))))

(define-public (set-mint-limit (limit uint))
  (begin
    (asserts! (or (is-eq tx-sender (var-get artist-address)) (is-eq tx-sender DEPLOYER)) (err ERR-INVALID-USER))
    (asserts! (< limit (var-get mint-limit)) (err ERR-MINT-LIMIT))
    (ok (var-set mint-limit limit))))

(define-public (burn (token-id uint))
  (begin 
    (asserts! (is-owner token-id tx-sender) (err ERR-NOT-AUTHORIZED))
    (asserts! (is-none (map-get? market token-id)) (err ERR-LISTING))
    (nft-burn? odinson token-id tx-sender)))

(define-private (is-owner (token-id uint) (user principal))
    (is-eq user (unwrap! (nft-get-owner? odinson token-id) false)))

(define-public (set-base-uri (new-base-uri (string-ascii 80)))
  (begin
    (asserts! (or (is-eq tx-sender (var-get artist-address)) (is-eq tx-sender DEPLOYER)) (err ERR-NOT-AUTHORIZED))
    (asserts! (not (var-get metadata-frozen)) (err ERR-METADATA-FROZEN))
    (print { notification: "token-metadata-update", payload: { token-class: "nft", contract-id: (as-contract tx-sender) }})
    (var-set ipfs-root new-base-uri)
    (ok true)))

(define-public (freeze-metadata)
  (begin
    (asserts! (or (is-eq tx-sender (var-get artist-address)) (is-eq tx-sender DEPLOYER)) (err ERR-NOT-AUTHORIZED))
    (var-set metadata-frozen true)
    (ok true)))

;; Non-custodial SIP-009 transfer function
(define-public (transfer (id uint) (sender principal) (recipient principal))
  (begin
    (asserts! (is-eq tx-sender sender) (err ERR-NOT-AUTHORIZED))
    (asserts! (is-none (map-get? market id)) (err ERR-LISTING))
    (trnsfr id sender recipient)))

;; read-only functions
(define-read-only (get-owner (token-id uint))
  (ok (nft-get-owner? odinson token-id)))

(define-read-only (get-last-token-id)
  (ok (- (var-get last-id) u1)))

(define-read-only (get-token-uri (token-id uint))
  (ok (some (concat (concat (var-get ipfs-root) "{id}") ".json"))))

(define-read-only (get-paused)
  (ok (var-get mint-paused)))

(define-read-only (get-price)
  (ok (var-get total-price)))

(define-read-only (get-artist-address)
  (ok (var-get artist-address)))

(define-read-only (get-mints (caller principal))
  (default-to u0 (map-get? mints-per-user caller)))

(define-read-only (get-mint-limit)
  (ok (var-get mint-limit)))

(define-data-var license-uri (string-ascii 80) "https://arweave.net/zmc1WTspIhFyVY82bwfAIcIExLFH5lUcHHUN0wXg4W8/1")
(define-data-var license-name (string-ascii 40) "EXCLUSIVE")

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

;; Non-custodial marketplace extras
(use-trait commission-trait 'SP3D6PV2ACBPEKYJTCMH7HEN02KP87QSP8KTEH335.commission-trait.commission)

(define-map token-count principal uint)
(define-map market uint {price: uint, commission: principal, royalty: uint})

(define-read-only (get-balance (account principal))
  (default-to u0
    (map-get? token-count account)))

(define-private (trnsfr (id uint) (sender principal) (recipient principal))
  (match (nft-transfer? odinson id sender recipient)
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
  (let ((owner (unwrap! (nft-get-owner? odinson id) false)))
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
  (let ((owner (unwrap! (nft-get-owner? odinson id) (err ERR-NOT-FOUND)))
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
  

;; Airdrop
(define-public (admin-airdrop)
  (let
    (
      (last-nft-id (var-get last-id))
    )
    (begin
      (asserts! (or (is-eq tx-sender (var-get artist-address)) (is-eq tx-sender DEPLOYER)) (err ERR-NOT-AUTHORIZED))
      (asserts! (is-eq false (var-get airdrop-called)) (err ERR-AIRDROP-CALLED))
      (try! (nft-mint? odinson (+ last-nft-id u0) 'SP33QC4338KYE0GXH29Y5BY06CFBSAAT5Z88ENV5Q))
      (map-set token-count 'SP33QC4338KYE0GXH29Y5BY06CFBSAAT5Z88ENV5Q (+ (get-balance 'SP33QC4338KYE0GXH29Y5BY06CFBSAAT5Z88ENV5Q) u1))
      (try! (nft-mint? odinson (+ last-nft-id u1) 'SP1KHTT62WP9CKZ2T4MXXS3CE8FGTATY1VFZA35T3))
      (map-set token-count 'SP1KHTT62WP9CKZ2T4MXXS3CE8FGTATY1VFZA35T3 (+ (get-balance 'SP1KHTT62WP9CKZ2T4MXXS3CE8FGTATY1VFZA35T3) u1))
      (try! (nft-mint? odinson (+ last-nft-id u2) 'SPWEYBG1VGWW6PT5Z2Z6E4RT9KJ126QFJEC2YPVH))
      (map-set token-count 'SPWEYBG1VGWW6PT5Z2Z6E4RT9KJ126QFJEC2YPVH (+ (get-balance 'SPWEYBG1VGWW6PT5Z2Z6E4RT9KJ126QFJEC2YPVH) u1))
      (try! (nft-mint? odinson (+ last-nft-id u3) 'SP3DQN404WPWC7V4HTKHX3ZK0M88KHFZVGECG5XZ7))
      (map-set token-count 'SP3DQN404WPWC7V4HTKHX3ZK0M88KHFZVGECG5XZ7 (+ (get-balance 'SP3DQN404WPWC7V4HTKHX3ZK0M88KHFZVGECG5XZ7) u1))
      (try! (nft-mint? odinson (+ last-nft-id u4) 'SP1ENXBW6Q13DWHYRKM983R8VJCT4XPTFGEQAQ2W2))
      (map-set token-count 'SP1ENXBW6Q13DWHYRKM983R8VJCT4XPTFGEQAQ2W2 (+ (get-balance 'SP1ENXBW6Q13DWHYRKM983R8VJCT4XPTFGEQAQ2W2) u1))
      (try! (nft-mint? odinson (+ last-nft-id u5) 'SP36E6YX1K93M5HVW3W9Q302MCCHSBBF6HSF5604X))
      (map-set token-count 'SP36E6YX1K93M5HVW3W9Q302MCCHSBBF6HSF5604X (+ (get-balance 'SP36E6YX1K93M5HVW3W9Q302MCCHSBBF6HSF5604X) u1))
      (try! (nft-mint? odinson (+ last-nft-id u6) 'SP36KFYJHQQWYSXA72XWGBTN3Z8XKFNEVKETZP2GP))
      (map-set token-count 'SP36KFYJHQQWYSXA72XWGBTN3Z8XKFNEVKETZP2GP (+ (get-balance 'SP36KFYJHQQWYSXA72XWGBTN3Z8XKFNEVKETZP2GP) u1))
      (try! (nft-mint? odinson (+ last-nft-id u7) 'SP2QY7SJBR0413ZH066WNA0MW4KGESRXGPCV9S4BS))
      (map-set token-count 'SP2QY7SJBR0413ZH066WNA0MW4KGESRXGPCV9S4BS (+ (get-balance 'SP2QY7SJBR0413ZH066WNA0MW4KGESRXGPCV9S4BS) u1))
      (try! (nft-mint? odinson (+ last-nft-id u8) 'SP1J9CFRV5C69EQ0E8PP95Y5W4FBP53M7G133SZAH))
      (map-set token-count 'SP1J9CFRV5C69EQ0E8PP95Y5W4FBP53M7G133SZAH (+ (get-balance 'SP1J9CFRV5C69EQ0E8PP95Y5W4FBP53M7G133SZAH) u1))
      (try! (nft-mint? odinson (+ last-nft-id u9) 'SP37W6CK0YZ1KJXGFM57Z7VY48T6VFKCQYKQ929NP))
      (map-set token-count 'SP37W6CK0YZ1KJXGFM57Z7VY48T6VFKCQYKQ929NP (+ (get-balance 'SP37W6CK0YZ1KJXGFM57Z7VY48T6VFKCQYKQ929NP) u1))
      (try! (nft-mint? odinson (+ last-nft-id u10) 'SP2K3EY052VXM2MS4RNAT4HPWYNPA26YBD8307YEZ))
      (map-set token-count 'SP2K3EY052VXM2MS4RNAT4HPWYNPA26YBD8307YEZ (+ (get-balance 'SP2K3EY052VXM2MS4RNAT4HPWYNPA26YBD8307YEZ) u1))
      (try! (nft-mint? odinson (+ last-nft-id u11) 'SP3T8XVBX10T72WB2E41ZTS5NCY85WC6YMWR2QA6K))
      (map-set token-count 'SP3T8XVBX10T72WB2E41ZTS5NCY85WC6YMWR2QA6K (+ (get-balance 'SP3T8XVBX10T72WB2E41ZTS5NCY85WC6YMWR2QA6K) u1))
      (try! (nft-mint? odinson (+ last-nft-id u12) 'SP2116N7B3R9BP8HZQG7WHAQMRQJJB4G8PZ920Q58))
      (map-set token-count 'SP2116N7B3R9BP8HZQG7WHAQMRQJJB4G8PZ920Q58 (+ (get-balance 'SP2116N7B3R9BP8HZQG7WHAQMRQJJB4G8PZ920Q58) u1))
      (try! (nft-mint? odinson (+ last-nft-id u13) 'SP312QYMJFRNW3G1TFRX5SVBNZ1PNGY9J2HW2Q4Q1))
      (map-set token-count 'SP312QYMJFRNW3G1TFRX5SVBNZ1PNGY9J2HW2Q4Q1 (+ (get-balance 'SP312QYMJFRNW3G1TFRX5SVBNZ1PNGY9J2HW2Q4Q1) u1))
      (try! (nft-mint? odinson (+ last-nft-id u14) 'SP16A0DA7AQS374CJAXJHGMASDGMA9021A8N9X8HY))
      (map-set token-count 'SP16A0DA7AQS374CJAXJHGMASDGMA9021A8N9X8HY (+ (get-balance 'SP16A0DA7AQS374CJAXJHGMASDGMA9021A8N9X8HY) u1))
      (try! (nft-mint? odinson (+ last-nft-id u15) 'SP2Z4NG9BJN2XT83QNJHVMDGYSE01FT7KFC5CGVGS))
      (map-set token-count 'SP2Z4NG9BJN2XT83QNJHVMDGYSE01FT7KFC5CGVGS (+ (get-balance 'SP2Z4NG9BJN2XT83QNJHVMDGYSE01FT7KFC5CGVGS) u1))
      (try! (nft-mint? odinson (+ last-nft-id u16) 'SP3MRPKVC203YFY616A6YZ6Q45CMY3MNFRTQMQWHV))
      (map-set token-count 'SP3MRPKVC203YFY616A6YZ6Q45CMY3MNFRTQMQWHV (+ (get-balance 'SP3MRPKVC203YFY616A6YZ6Q45CMY3MNFRTQMQWHV) u1))
      (try! (nft-mint? odinson (+ last-nft-id u17) 'SPG6CHDSFHSXQ3ESBBF2MEDS42GH131SRH6JGFQA))
      (map-set token-count 'SPG6CHDSFHSXQ3ESBBF2MEDS42GH131SRH6JGFQA (+ (get-balance 'SPG6CHDSFHSXQ3ESBBF2MEDS42GH131SRH6JGFQA) u1))
      (try! (nft-mint? odinson (+ last-nft-id u18) 'SPJBK3BE1PSPB83BV54B6SNREDF4P0B50G1NAC3N))
      (map-set token-count 'SPJBK3BE1PSPB83BV54B6SNREDF4P0B50G1NAC3N (+ (get-balance 'SPJBK3BE1PSPB83BV54B6SNREDF4P0B50G1NAC3N) u1))
      (try! (nft-mint? odinson (+ last-nft-id u19) 'SP3VQ25N2RKZ6591DD36Q7FHJZYDH7N1F5GP981KH))
      (map-set token-count 'SP3VQ25N2RKZ6591DD36Q7FHJZYDH7N1F5GP981KH (+ (get-balance 'SP3VQ25N2RKZ6591DD36Q7FHJZYDH7N1F5GP981KH) u1))
      (try! (nft-mint? odinson (+ last-nft-id u20) 'SPB554NZYV3PM1F9GGWGZ71FAK4YKHVDAJHP08SM))
      (map-set token-count 'SPB554NZYV3PM1F9GGWGZ71FAK4YKHVDAJHP08SM (+ (get-balance 'SPB554NZYV3PM1F9GGWGZ71FAK4YKHVDAJHP08SM) u1))
      (try! (nft-mint? odinson (+ last-nft-id u21) 'SP235DV9CZGRGMFN1PZ3NC7Z2TGT1YV4XNMM9P7BY))
      (map-set token-count 'SP235DV9CZGRGMFN1PZ3NC7Z2TGT1YV4XNMM9P7BY (+ (get-balance 'SP235DV9CZGRGMFN1PZ3NC7Z2TGT1YV4XNMM9P7BY) u1))
      (try! (nft-mint? odinson (+ last-nft-id u22) 'SPZX0089TM9V77Y8DFGFJPR5ZNKR7AJREFH99ZNF))
      (map-set token-count 'SPZX0089TM9V77Y8DFGFJPR5ZNKR7AJREFH99ZNF (+ (get-balance 'SPZX0089TM9V77Y8DFGFJPR5ZNKR7AJREFH99ZNF) u1))
      (try! (nft-mint? odinson (+ last-nft-id u23) 'SP3JZDCM2GWCVJYYAVS0V56T7WT0Q9152SE8HCJG5))
      (map-set token-count 'SP3JZDCM2GWCVJYYAVS0V56T7WT0Q9152SE8HCJG5 (+ (get-balance 'SP3JZDCM2GWCVJYYAVS0V56T7WT0Q9152SE8HCJG5) u1))
      (try! (nft-mint? odinson (+ last-nft-id u24) 'SP1Q9FNT1EJEGDBS98JYNCW4WCDEK8YNBCVFZQN7X))
      (map-set token-count 'SP1Q9FNT1EJEGDBS98JYNCW4WCDEK8YNBCVFZQN7X (+ (get-balance 'SP1Q9FNT1EJEGDBS98JYNCW4WCDEK8YNBCVFZQN7X) u1))
      (try! (nft-mint? odinson (+ last-nft-id u25) 'SP11MZNWA0W5J15P9NFPHP45KN4RM975RJDR85B76))
      (map-set token-count 'SP11MZNWA0W5J15P9NFPHP45KN4RM975RJDR85B76 (+ (get-balance 'SP11MZNWA0W5J15P9NFPHP45KN4RM975RJDR85B76) u1))
      (try! (nft-mint? odinson (+ last-nft-id u26) 'SP1TX5P63EXKJJRX1DHNQTJ1FE86NRPCJD4324Q4V))
      (map-set token-count 'SP1TX5P63EXKJJRX1DHNQTJ1FE86NRPCJD4324Q4V (+ (get-balance 'SP1TX5P63EXKJJRX1DHNQTJ1FE86NRPCJD4324Q4V) u1))
      (try! (nft-mint? odinson (+ last-nft-id u27) 'SP32PZTRGDJQ4TQV6FXJE6Y6KXSAX6D8CXXD542C8))
      (map-set token-count 'SP32PZTRGDJQ4TQV6FXJE6Y6KXSAX6D8CXXD542C8 (+ (get-balance 'SP32PZTRGDJQ4TQV6FXJE6Y6KXSAX6D8CXXD542C8) u1))
      (try! (nft-mint? odinson (+ last-nft-id u28) 'SP3KVRE3RDYYSJ3JDGXKA0K15CC4JEA2ZGX4TJ5EC))
      (map-set token-count 'SP3KVRE3RDYYSJ3JDGXKA0K15CC4JEA2ZGX4TJ5EC (+ (get-balance 'SP3KVRE3RDYYSJ3JDGXKA0K15CC4JEA2ZGX4TJ5EC) u1))
      (try! (nft-mint? odinson (+ last-nft-id u29) 'SP2R5TX6ZWT1VPYSVQHYRBSHTEKA6KA4V9QZGVKRY))
      (map-set token-count 'SP2R5TX6ZWT1VPYSVQHYRBSHTEKA6KA4V9QZGVKRY (+ (get-balance 'SP2R5TX6ZWT1VPYSVQHYRBSHTEKA6KA4V9QZGVKRY) u1))
      (try! (nft-mint? odinson (+ last-nft-id u30) 'SP2DR0EH4ADH624859YZ8D1K46TZPM8TE22BE8YH5))
      (map-set token-count 'SP2DR0EH4ADH624859YZ8D1K46TZPM8TE22BE8YH5 (+ (get-balance 'SP2DR0EH4ADH624859YZ8D1K46TZPM8TE22BE8YH5) u1))
      (try! (nft-mint? odinson (+ last-nft-id u31) 'SPBC525A5WEZJP1MPNWT0WJMDTP0RAW3JRCMQ3BH))
      (map-set token-count 'SPBC525A5WEZJP1MPNWT0WJMDTP0RAW3JRCMQ3BH (+ (get-balance 'SPBC525A5WEZJP1MPNWT0WJMDTP0RAW3JRCMQ3BH) u1))
      (try! (nft-mint? odinson (+ last-nft-id u32) 'SP3B0YE190B2Y31FHWMMQJC2W94QBSJXPG9KGQWM1))
      (map-set token-count 'SP3B0YE190B2Y31FHWMMQJC2W94QBSJXPG9KGQWM1 (+ (get-balance 'SP3B0YE190B2Y31FHWMMQJC2W94QBSJXPG9KGQWM1) u1))
      (try! (nft-mint? odinson (+ last-nft-id u33) 'SP2Q02YA5SPKEW763B1KEG9QGEEHC0CJT90ACBW0A))
      (map-set token-count 'SP2Q02YA5SPKEW763B1KEG9QGEEHC0CJT90ACBW0A (+ (get-balance 'SP2Q02YA5SPKEW763B1KEG9QGEEHC0CJT90ACBW0A) u1))
      (try! (nft-mint? odinson (+ last-nft-id u34) 'SP1EQPJS15JMH6YHA079SH15E77ZZB321NQBR5RZ1))
      (map-set token-count 'SP1EQPJS15JMH6YHA079SH15E77ZZB321NQBR5RZ1 (+ (get-balance 'SP1EQPJS15JMH6YHA079SH15E77ZZB321NQBR5RZ1) u1))
      (try! (nft-mint? odinson (+ last-nft-id u35) 'SP2BWMDQ6FFHCRGRP1VCAXHSMYTDY8J0T0J5AZV4Q))
      (map-set token-count 'SP2BWMDQ6FFHCRGRP1VCAXHSMYTDY8J0T0J5AZV4Q (+ (get-balance 'SP2BWMDQ6FFHCRGRP1VCAXHSMYTDY8J0T0J5AZV4Q) u1))
      (try! (nft-mint? odinson (+ last-nft-id u36) 'SP7S3EJYAM7NVJ7KD0KEFCY78MRP9M4G2N92QZ24))
      (map-set token-count 'SP7S3EJYAM7NVJ7KD0KEFCY78MRP9M4G2N92QZ24 (+ (get-balance 'SP7S3EJYAM7NVJ7KD0KEFCY78MRP9M4G2N92QZ24) u1))
      (try! (nft-mint? odinson (+ last-nft-id u37) 'SP3V47ZVPRWP8EB3276VBJX2EMEXN1BH9QW4VS148))
      (map-set token-count 'SP3V47ZVPRWP8EB3276VBJX2EMEXN1BH9QW4VS148 (+ (get-balance 'SP3V47ZVPRWP8EB3276VBJX2EMEXN1BH9QW4VS148) u1))
      (try! (nft-mint? odinson (+ last-nft-id u38) 'SP6DE5C6WE71DEZK5W6V9GQTWR0V72D2Y0FB1PBG))
      (map-set token-count 'SP6DE5C6WE71DEZK5W6V9GQTWR0V72D2Y0FB1PBG (+ (get-balance 'SP6DE5C6WE71DEZK5W6V9GQTWR0V72D2Y0FB1PBG) u1))
      (try! (nft-mint? odinson (+ last-nft-id u39) 'SP1TMWTJKX8ZANA0QV7ZFA35NS34HB7SZE9A1K9AM))
      (map-set token-count 'SP1TMWTJKX8ZANA0QV7ZFA35NS34HB7SZE9A1K9AM (+ (get-balance 'SP1TMWTJKX8ZANA0QV7ZFA35NS34HB7SZE9A1K9AM) u1))
      (try! (nft-mint? odinson (+ last-nft-id u40) 'SP2PP9Z6CB5Y6T6ZTNWB248VDQ867TWZ3T63064Z1))
      (map-set token-count 'SP2PP9Z6CB5Y6T6ZTNWB248VDQ867TWZ3T63064Z1 (+ (get-balance 'SP2PP9Z6CB5Y6T6ZTNWB248VDQ867TWZ3T63064Z1) u1))
      (try! (nft-mint? odinson (+ last-nft-id u41) 'SPQJ9R7MYEJC7T1YDMKQRZJ1F18F8XTGPPEA7PW1))
      (map-set token-count 'SPQJ9R7MYEJC7T1YDMKQRZJ1F18F8XTGPPEA7PW1 (+ (get-balance 'SPQJ9R7MYEJC7T1YDMKQRZJ1F18F8XTGPPEA7PW1) u1))
      (try! (nft-mint? odinson (+ last-nft-id u42) 'SP7CRHEK1XHQ50K3RB5VPXZ1PMX5QSCNB2WRC3ZA))
      (map-set token-count 'SP7CRHEK1XHQ50K3RB5VPXZ1PMX5QSCNB2WRC3ZA (+ (get-balance 'SP7CRHEK1XHQ50K3RB5VPXZ1PMX5QSCNB2WRC3ZA) u1))
      (try! (nft-mint? odinson (+ last-nft-id u43) 'SP30MFT966FHFJ6KFJXEAY352ZP091YSCS7WFGPKM))
      (map-set token-count 'SP30MFT966FHFJ6KFJXEAY352ZP091YSCS7WFGPKM (+ (get-balance 'SP30MFT966FHFJ6KFJXEAY352ZP091YSCS7WFGPKM) u1))
      (try! (nft-mint? odinson (+ last-nft-id u44) 'SP324133SAXRM1C1Q06N2J6HRAQRJ3RTH9G2V54B6))
      (map-set token-count 'SP324133SAXRM1C1Q06N2J6HRAQRJ3RTH9G2V54B6 (+ (get-balance 'SP324133SAXRM1C1Q06N2J6HRAQRJ3RTH9G2V54B6) u1))
      (try! (nft-mint? odinson (+ last-nft-id u45) 'SP2R5TX6ZWT1VPYSVQHYRBSHTEKA6KA4V9QZGVKRY))
      (map-set token-count 'SP2R5TX6ZWT1VPYSVQHYRBSHTEKA6KA4V9QZGVKRY (+ (get-balance 'SP2R5TX6ZWT1VPYSVQHYRBSHTEKA6KA4V9QZGVKRY) u1))
      (try! (nft-mint? odinson (+ last-nft-id u46) 'SP3JZDCM2GWCVJYYAVS0V56T7WT0Q9152SE8HCJG5))
      (map-set token-count 'SP3JZDCM2GWCVJYYAVS0V56T7WT0Q9152SE8HCJG5 (+ (get-balance 'SP3JZDCM2GWCVJYYAVS0V56T7WT0Q9152SE8HCJG5) u1))
      (try! (nft-mint? odinson (+ last-nft-id u47) 'SP1ZFF8VKS35G33989PYT9BBZQPGSTFF7MMYDSZ97))
      (map-set token-count 'SP1ZFF8VKS35G33989PYT9BBZQPGSTFF7MMYDSZ97 (+ (get-balance 'SP1ZFF8VKS35G33989PYT9BBZQPGSTFF7MMYDSZ97) u1))
      (try! (nft-mint? odinson (+ last-nft-id u48) 'SPMQJVKSDR0N1MB0QP0AEV6BVRPC3ZZMMBZ5S2R1))
      (map-set token-count 'SPMQJVKSDR0N1MB0QP0AEV6BVRPC3ZZMMBZ5S2R1 (+ (get-balance 'SPMQJVKSDR0N1MB0QP0AEV6BVRPC3ZZMMBZ5S2R1) u1))
      (try! (nft-mint? odinson (+ last-nft-id u49) 'SP3S9CD5Z0SYWWVB2JWSBVP70SHW428K5FZDDXS64))
      (map-set token-count 'SP3S9CD5Z0SYWWVB2JWSBVP70SHW428K5FZDDXS64 (+ (get-balance 'SP3S9CD5Z0SYWWVB2JWSBVP70SHW428K5FZDDXS64) u1))
      (try! (nft-mint? odinson (+ last-nft-id u50) 'SP10MJMD78XV08EK1A9BWV9CGZZCAB7XTXQFZ9PMN))
      (map-set token-count 'SP10MJMD78XV08EK1A9BWV9CGZZCAB7XTXQFZ9PMN (+ (get-balance 'SP10MJMD78XV08EK1A9BWV9CGZZCAB7XTXQFZ9PMN) u1))
      (try! (nft-mint? odinson (+ last-nft-id u51) 'SP3MY763F72JJHKYCX1Q0DKFXSQCHMD3TEQB6CBY2))
      (map-set token-count 'SP3MY763F72JJHKYCX1Q0DKFXSQCHMD3TEQB6CBY2 (+ (get-balance 'SP3MY763F72JJHKYCX1Q0DKFXSQCHMD3TEQB6CBY2) u1))
      (try! (nft-mint? odinson (+ last-nft-id u52) 'SPQ7FX3DM3WEZSP1RMZE1TBK67DHA5TAXKQMMND3))
      (map-set token-count 'SPQ7FX3DM3WEZSP1RMZE1TBK67DHA5TAXKQMMND3 (+ (get-balance 'SPQ7FX3DM3WEZSP1RMZE1TBK67DHA5TAXKQMMND3) u1))
      (try! (nft-mint? odinson (+ last-nft-id u53) 'SP1BVFZC8H4NZSWKP4BWZT9XK5K88EZXKXJMJ8MRQ))
      (map-set token-count 'SP1BVFZC8H4NZSWKP4BWZT9XK5K88EZXKXJMJ8MRQ (+ (get-balance 'SP1BVFZC8H4NZSWKP4BWZT9XK5K88EZXKXJMJ8MRQ) u1))
      (try! (nft-mint? odinson (+ last-nft-id u54) 'SPQ55PC1M76NCV394PDBCXJFEKZZREY2X6D3P1V7))
      (map-set token-count 'SPQ55PC1M76NCV394PDBCXJFEKZZREY2X6D3P1V7 (+ (get-balance 'SPQ55PC1M76NCV394PDBCXJFEKZZREY2X6D3P1V7) u1))
      (try! (nft-mint? odinson (+ last-nft-id u55) 'SP14AFMWY74RSRNBMHM48KFXMRY47V8QBTC9GESH4))
      (map-set token-count 'SP14AFMWY74RSRNBMHM48KFXMRY47V8QBTC9GESH4 (+ (get-balance 'SP14AFMWY74RSRNBMHM48KFXMRY47V8QBTC9GESH4) u1))
      (try! (nft-mint? odinson (+ last-nft-id u56) 'SP357ZDZE68HN06YDPWFK3SAF7EDJ2VJMW692063S))
      (map-set token-count 'SP357ZDZE68HN06YDPWFK3SAF7EDJ2VJMW692063S (+ (get-balance 'SP357ZDZE68HN06YDPWFK3SAF7EDJ2VJMW692063S) u1))
      (try! (nft-mint? odinson (+ last-nft-id u57) 'SP4KBHQ38PQQ4FHJ9SNHZP0CXTBQQFYWKF204Z9W))
      (map-set token-count 'SP4KBHQ38PQQ4FHJ9SNHZP0CXTBQQFYWKF204Z9W (+ (get-balance 'SP4KBHQ38PQQ4FHJ9SNHZP0CXTBQQFYWKF204Z9W) u1))
      (try! (nft-mint? odinson (+ last-nft-id u58) 'SP1A5M0ZRSNQMF8BNPQPM8WWC5PJ6HJ4GEKFP8W4M))
      (map-set token-count 'SP1A5M0ZRSNQMF8BNPQPM8WWC5PJ6HJ4GEKFP8W4M (+ (get-balance 'SP1A5M0ZRSNQMF8BNPQPM8WWC5PJ6HJ4GEKFP8W4M) u1))
      (try! (nft-mint? odinson (+ last-nft-id u59) 'SP2R5TX6ZWT1VPYSVQHYRBSHTEKA6KA4V9QZGVKRY))
      (map-set token-count 'SP2R5TX6ZWT1VPYSVQHYRBSHTEKA6KA4V9QZGVKRY (+ (get-balance 'SP2R5TX6ZWT1VPYSVQHYRBSHTEKA6KA4V9QZGVKRY) u1))
      (try! (nft-mint? odinson (+ last-nft-id u60) 'SP2RJ51GB6QST5NJZC2TY7KGRHGTVPT4TPRVGVVMC))
      (map-set token-count 'SP2RJ51GB6QST5NJZC2TY7KGRHGTVPT4TPRVGVVMC (+ (get-balance 'SP2RJ51GB6QST5NJZC2TY7KGRHGTVPT4TPRVGVVMC) u1))
      (try! (nft-mint? odinson (+ last-nft-id u61) 'SP3HC7CD7J8ZQS8275BDMNS33RWYEJAFETHSPNJK5))
      (map-set token-count 'SP3HC7CD7J8ZQS8275BDMNS33RWYEJAFETHSPNJK5 (+ (get-balance 'SP3HC7CD7J8ZQS8275BDMNS33RWYEJAFETHSPNJK5) u1))
      (try! (nft-mint? odinson (+ last-nft-id u62) 'SP1EVD9TSSG5VD1H3PYPTWQ3SPPCCZT1KZV3BY5TB))
      (map-set token-count 'SP1EVD9TSSG5VD1H3PYPTWQ3SPPCCZT1KZV3BY5TB (+ (get-balance 'SP1EVD9TSSG5VD1H3PYPTWQ3SPPCCZT1KZV3BY5TB) u1))
      (try! (nft-mint? odinson (+ last-nft-id u63) 'SP250VJ8XE1JTS0SBMZMWYTNRMTTPJJDA9NS1D6E5))
      (map-set token-count 'SP250VJ8XE1JTS0SBMZMWYTNRMTTPJJDA9NS1D6E5 (+ (get-balance 'SP250VJ8XE1JTS0SBMZMWYTNRMTTPJJDA9NS1D6E5) u1))
      (try! (nft-mint? odinson (+ last-nft-id u64) 'SPGSDWYMSA6FTYPMV542D19FTZ73A7WPYXKF1QWE))
      (map-set token-count 'SPGSDWYMSA6FTYPMV542D19FTZ73A7WPYXKF1QWE (+ (get-balance 'SPGSDWYMSA6FTYPMV542D19FTZ73A7WPYXKF1QWE) u1))
      (try! (nft-mint? odinson (+ last-nft-id u65) 'SP2JF2SWRRYAQKZ9A130RW02EWHEH78YNTWBACXD4))
      (map-set token-count 'SP2JF2SWRRYAQKZ9A130RW02EWHEH78YNTWBACXD4 (+ (get-balance 'SP2JF2SWRRYAQKZ9A130RW02EWHEH78YNTWBACXD4) u1))
      (try! (nft-mint? odinson (+ last-nft-id u66) 'SP1VTTQ8VJ5AXAM91Y0RYS224WE2GR9RG6R49WMNN))
      (map-set token-count 'SP1VTTQ8VJ5AXAM91Y0RYS224WE2GR9RG6R49WMNN (+ (get-balance 'SP1VTTQ8VJ5AXAM91Y0RYS224WE2GR9RG6R49WMNN) u1))
      (try! (nft-mint? odinson (+ last-nft-id u67) 'SP2BHZHCFRE5310MW479DZTW82AG4F5KF26KN0WZK))
      (map-set token-count 'SP2BHZHCFRE5310MW479DZTW82AG4F5KF26KN0WZK (+ (get-balance 'SP2BHZHCFRE5310MW479DZTW82AG4F5KF26KN0WZK) u1))
      (try! (nft-mint? odinson (+ last-nft-id u68) 'SP3T7HWMNDMB0Q4N24W2DM7ANS42TP833KAK714M0))
      (map-set token-count 'SP3T7HWMNDMB0Q4N24W2DM7ANS42TP833KAK714M0 (+ (get-balance 'SP3T7HWMNDMB0Q4N24W2DM7ANS42TP833KAK714M0) u1))
      (try! (nft-mint? odinson (+ last-nft-id u69) 'SP150GJWQXH1M8DHWM38T0AHFVAFN4SC2NJHDR1HH))
      (map-set token-count 'SP150GJWQXH1M8DHWM38T0AHFVAFN4SC2NJHDR1HH (+ (get-balance 'SP150GJWQXH1M8DHWM38T0AHFVAFN4SC2NJHDR1HH) u1))
      (try! (nft-mint? odinson (+ last-nft-id u70) 'SP20BG6DH4NEVAADQX5FMWQMGPYWMVKVAM4VA9P1P))
      (map-set token-count 'SP20BG6DH4NEVAADQX5FMWQMGPYWMVKVAM4VA9P1P (+ (get-balance 'SP20BG6DH4NEVAADQX5FMWQMGPYWMVKVAM4VA9P1P) u1))
      (try! (nft-mint? odinson (+ last-nft-id u71) 'SP19BVGYWCHZCMAPYY5B0SBPMMCHJ46DZSJJBFZY8))
      (map-set token-count 'SP19BVGYWCHZCMAPYY5B0SBPMMCHJ46DZSJJBFZY8 (+ (get-balance 'SP19BVGYWCHZCMAPYY5B0SBPMMCHJ46DZSJJBFZY8) u1))
      (try! (nft-mint? odinson (+ last-nft-id u72) 'SP2AGZWPPA7QNMMDD6D66S007GSYWB93M6HYZVBZ7))
      (map-set token-count 'SP2AGZWPPA7QNMMDD6D66S007GSYWB93M6HYZVBZ7 (+ (get-balance 'SP2AGZWPPA7QNMMDD6D66S007GSYWB93M6HYZVBZ7) u1))
      (try! (nft-mint? odinson (+ last-nft-id u73) 'SPACCQ8K3ZKXNAHTH14VEAFWY9E7BDP72DCNCZWP))
      (map-set token-count 'SPACCQ8K3ZKXNAHTH14VEAFWY9E7BDP72DCNCZWP (+ (get-balance 'SPACCQ8K3ZKXNAHTH14VEAFWY9E7BDP72DCNCZWP) u1))
      (try! (nft-mint? odinson (+ last-nft-id u74) 'SPAHTV25EDZPSFPSH3DGKN0ANRSDMEHYFVA1CS3N))
      (map-set token-count 'SPAHTV25EDZPSFPSH3DGKN0ANRSDMEHYFVA1CS3N (+ (get-balance 'SPAHTV25EDZPSFPSH3DGKN0ANRSDMEHYFVA1CS3N) u1))
      (try! (nft-mint? odinson (+ last-nft-id u75) 'SP3RG2YR6E79BEJZPFYKWW42HM4YTNNKW95CNZRJX))
      (map-set token-count 'SP3RG2YR6E79BEJZPFYKWW42HM4YTNNKW95CNZRJX (+ (get-balance 'SP3RG2YR6E79BEJZPFYKWW42HM4YTNNKW95CNZRJX) u1))
      (try! (nft-mint? odinson (+ last-nft-id u76) 'SP1W41YWWPEZT66Z59X82A320NNX723D4B14RTY3G))
      (map-set token-count 'SP1W41YWWPEZT66Z59X82A320NNX723D4B14RTY3G (+ (get-balance 'SP1W41YWWPEZT66Z59X82A320NNX723D4B14RTY3G) u1))
      (try! (nft-mint? odinson (+ last-nft-id u77) 'SPKYK8BWJTT8D38SJFAQ0KHFPT88QVMZ3VMSNDKW))
      (map-set token-count 'SPKYK8BWJTT8D38SJFAQ0KHFPT88QVMZ3VMSNDKW (+ (get-balance 'SPKYK8BWJTT8D38SJFAQ0KHFPT88QVMZ3VMSNDKW) u1))
      (try! (nft-mint? odinson (+ last-nft-id u78) 'SP3GQR81NG8ERGZD46VJ7RR94XFBGFTCXXBYYT701))
      (map-set token-count 'SP3GQR81NG8ERGZD46VJ7RR94XFBGFTCXXBYYT701 (+ (get-balance 'SP3GQR81NG8ERGZD46VJ7RR94XFBGFTCXXBYYT701) u1))
      (try! (nft-mint? odinson (+ last-nft-id u79) 'SPYXQPVVZ5ZVS0W1ERGHYKEA0FH99RB8AZBK3TS5))
      (map-set token-count 'SPYXQPVVZ5ZVS0W1ERGHYKEA0FH99RB8AZBK3TS5 (+ (get-balance 'SPYXQPVVZ5ZVS0W1ERGHYKEA0FH99RB8AZBK3TS5) u1))
      (try! (nft-mint? odinson (+ last-nft-id u80) 'SP20WB1J9SEC8Y89X506QKG3J70MCMS8JTFR0KKS2))
      (map-set token-count 'SP20WB1J9SEC8Y89X506QKG3J70MCMS8JTFR0KKS2 (+ (get-balance 'SP20WB1J9SEC8Y89X506QKG3J70MCMS8JTFR0KKS2) u1))
      (try! (nft-mint? odinson (+ last-nft-id u81) 'SP2VM2QKHSNT17RA2349TFCZ1PZ0E1SE84AS3NY8N))
      (map-set token-count 'SP2VM2QKHSNT17RA2349TFCZ1PZ0E1SE84AS3NY8N (+ (get-balance 'SP2VM2QKHSNT17RA2349TFCZ1PZ0E1SE84AS3NY8N) u1))
      (try! (nft-mint? odinson (+ last-nft-id u82) 'SP150GJWQXH1M8DHWM38T0AHFVAFN4SC2NJHDR1HH))
      (map-set token-count 'SP150GJWQXH1M8DHWM38T0AHFVAFN4SC2NJHDR1HH (+ (get-balance 'SP150GJWQXH1M8DHWM38T0AHFVAFN4SC2NJHDR1HH) u1))
      (try! (nft-mint? odinson (+ last-nft-id u83) 'SP1GJ5AQ9MR1CX02GGTRFT7YF33GY7GGZ4WC70S0E))
      (map-set token-count 'SP1GJ5AQ9MR1CX02GGTRFT7YF33GY7GGZ4WC70S0E (+ (get-balance 'SP1GJ5AQ9MR1CX02GGTRFT7YF33GY7GGZ4WC70S0E) u1))
      (try! (nft-mint? odinson (+ last-nft-id u84) 'SP3XWSZ4DHQJ6CPQ2N338Y6R7YG2BEDZRPZQMKFSX))
      (map-set token-count 'SP3XWSZ4DHQJ6CPQ2N338Y6R7YG2BEDZRPZQMKFSX (+ (get-balance 'SP3XWSZ4DHQJ6CPQ2N338Y6R7YG2BEDZRPZQMKFSX) u1))
      (try! (nft-mint? odinson (+ last-nft-id u85) 'SP3F8V9ZNCTPRVHW4R027B8FYAZRM8NC1R1F8N3PG))
      (map-set token-count 'SP3F8V9ZNCTPRVHW4R027B8FYAZRM8NC1R1F8N3PG (+ (get-balance 'SP3F8V9ZNCTPRVHW4R027B8FYAZRM8NC1R1F8N3PG) u1))
      (try! (nft-mint? odinson (+ last-nft-id u86) 'SP3HSMAQNKD029880297FBXMYC2QT4BS07RTWS0FD))
      (map-set token-count 'SP3HSMAQNKD029880297FBXMYC2QT4BS07RTWS0FD (+ (get-balance 'SP3HSMAQNKD029880297FBXMYC2QT4BS07RTWS0FD) u1))
      (try! (nft-mint? odinson (+ last-nft-id u87) 'SP1EBZXQ7QX4YQCYXYSGR9CPVATZFCE759DBBRAJX))
      (map-set token-count 'SP1EBZXQ7QX4YQCYXYSGR9CPVATZFCE759DBBRAJX (+ (get-balance 'SP1EBZXQ7QX4YQCYXYSGR9CPVATZFCE759DBBRAJX) u1))
      (try! (nft-mint? odinson (+ last-nft-id u88) 'SP11ZVV9T0E7D82BFE6T54N1475E2A2EA383X422J))
      (map-set token-count 'SP11ZVV9T0E7D82BFE6T54N1475E2A2EA383X422J (+ (get-balance 'SP11ZVV9T0E7D82BFE6T54N1475E2A2EA383X422J) u1))
      (try! (nft-mint? odinson (+ last-nft-id u89) 'SP24Y9TDFABS6RMHDJ8PQB3MEDTM19TZGEB2ZJ8QF))
      (map-set token-count 'SP24Y9TDFABS6RMHDJ8PQB3MEDTM19TZGEB2ZJ8QF (+ (get-balance 'SP24Y9TDFABS6RMHDJ8PQB3MEDTM19TZGEB2ZJ8QF) u1))
      (try! (nft-mint? odinson (+ last-nft-id u90) 'SP35M6MSNH00R350P27NKC9F57NSCT50PW04DXNCK))
      (map-set token-count 'SP35M6MSNH00R350P27NKC9F57NSCT50PW04DXNCK (+ (get-balance 'SP35M6MSNH00R350P27NKC9F57NSCT50PW04DXNCK) u1))
      (try! (nft-mint? odinson (+ last-nft-id u91) 'SP2QHKHZPX0T5HX8AKDR628EYJXCSRGVVWYEWNPHJ))
      (map-set token-count 'SP2QHKHZPX0T5HX8AKDR628EYJXCSRGVVWYEWNPHJ (+ (get-balance 'SP2QHKHZPX0T5HX8AKDR628EYJXCSRGVVWYEWNPHJ) u1))
      (try! (nft-mint? odinson (+ last-nft-id u92) 'SP2RJ51GB6QST5NJZC2TY7KGRHGTVPT4TPRVGVVMC))
      (map-set token-count 'SP2RJ51GB6QST5NJZC2TY7KGRHGTVPT4TPRVGVVMC (+ (get-balance 'SP2RJ51GB6QST5NJZC2TY7KGRHGTVPT4TPRVGVVMC) u1))
      (try! (nft-mint? odinson (+ last-nft-id u93) 'SP5BNSXRM3TDKPBS1C53E1EXNWTDZXGBEBQX7VGY))
      (map-set token-count 'SP5BNSXRM3TDKPBS1C53E1EXNWTDZXGBEBQX7VGY (+ (get-balance 'SP5BNSXRM3TDKPBS1C53E1EXNWTDZXGBEBQX7VGY) u1))
      (try! (nft-mint? odinson (+ last-nft-id u94) 'SP3XAAH44RSASXE0E3HBRX42TBMP6B0FGF74Z8EPM))
      (map-set token-count 'SP3XAAH44RSASXE0E3HBRX42TBMP6B0FGF74Z8EPM (+ (get-balance 'SP3XAAH44RSASXE0E3HBRX42TBMP6B0FGF74Z8EPM) u1))
      (try! (nft-mint? odinson (+ last-nft-id u95) 'SP3V0WMCQKK3N2D56QPTJF0TG99B2Q2PAQTQVG0QD))
      (map-set token-count 'SP3V0WMCQKK3N2D56QPTJF0TG99B2Q2PAQTQVG0QD (+ (get-balance 'SP3V0WMCQKK3N2D56QPTJF0TG99B2Q2PAQTQVG0QD) u1))
      (try! (nft-mint? odinson (+ last-nft-id u96) 'SP1TX5P63EXKJJRX1DHNQTJ1FE86NRPCJD4324Q4V))
      (map-set token-count 'SP1TX5P63EXKJJRX1DHNQTJ1FE86NRPCJD4324Q4V (+ (get-balance 'SP1TX5P63EXKJJRX1DHNQTJ1FE86NRPCJD4324Q4V) u1))
      (try! (nft-mint? odinson (+ last-nft-id u97) 'SP2SAQ2TYFG977KFADQVMEY9D3GND8NHPTEW8AR0Y))
      (map-set token-count 'SP2SAQ2TYFG977KFADQVMEY9D3GND8NHPTEW8AR0Y (+ (get-balance 'SP2SAQ2TYFG977KFADQVMEY9D3GND8NHPTEW8AR0Y) u1))
      (try! (nft-mint? odinson (+ last-nft-id u98) 'SP1DBQFR54ARKEYQGAJ44D3QQ6GQVJXG1Z9X9MTB))
      (map-set token-count 'SP1DBQFR54ARKEYQGAJ44D3QQ6GQVJXG1Z9X9MTB (+ (get-balance 'SP1DBQFR54ARKEYQGAJ44D3QQ6GQVJXG1Z9X9MTB) u1))
      (try! (nft-mint? odinson (+ last-nft-id u99) 'SP236BC8GENYXZYDT2R7905F9871VBNKCH28QM079))
      (map-set token-count 'SP236BC8GENYXZYDT2R7905F9871VBNKCH28QM079 (+ (get-balance 'SP236BC8GENYXZYDT2R7905F9871VBNKCH28QM079) u1))
      (try! (nft-mint? odinson (+ last-nft-id u100) 'SP2QH5QETSYAZ2VGQAZ42AK3ZN15EF4R3P76XDAR2))
      (map-set token-count 'SP2QH5QETSYAZ2VGQAZ42AK3ZN15EF4R3P76XDAR2 (+ (get-balance 'SP2QH5QETSYAZ2VGQAZ42AK3ZN15EF4R3P76XDAR2) u1))

      (var-set last-id (+ last-nft-id u101))
      (var-set airdrop-called true)
      (ok true))))