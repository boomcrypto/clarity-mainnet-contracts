;; welsh-gang
;; contractType: editions

(impl-trait 'SP2PABAF9FTAJYNFZH93XENAJ8FVY99RRM50D2JG9.nft-trait.nft-trait)

(define-non-fungible-token welsh-gang uint)

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
(define-constant ERR-CONTRACT-LOCKED u115)

;; Internal variables
(define-data-var mint-limit uint u0)
(define-data-var last-id uint u1)
(define-data-var total-price uint u7000000)
(define-data-var artist-address principal 'SP3EB7YHV5NERS2HMCGSGKNMN0BEH52W9H7YE4T9C)
(define-data-var ipfs-root (string-ascii 80) "ipfs://ipfs/QmXanKMvfJWhFXSCX87SvtqVkUq26zJqSGYW3xy46pEJtB/")
(define-data-var mint-paused bool false)
(define-data-var premint-enabled bool false)
(define-data-var sale-enabled bool false)
(define-data-var metadata-frozen bool false)
(define-data-var airdrop-called bool false)
(define-data-var mint-cap uint u0)
(define-data-var locked bool false)

(define-map mints-per-user principal uint)
(define-map mint-passes principal uint)

(define-public (lock-contract)
  (begin
    (asserts! (or (is-eq tx-sender (var-get artist-address)) (is-eq tx-sender DEPLOYER)) (err ERR-NOT-AUTHORIZED))
    (var-set locked true)
    (ok true)))

(define-public (claim) 
  (mint (list true)))

(define-public (claim-three) (mint (list true true true)))

;; Default Minting
(define-private (mint (orders (list 25 bool)))
  (mint-many orders))

(define-private (mint-many (orders (list 25 bool )))  
  (let 
    (
      (last-nft-id (var-get last-id))
      (enabled (asserts! (or (is-eq (var-get mint-limit) u0) (<= last-nft-id (var-get mint-limit))) (err ERR-NO-MORE-NFTS)))
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
    (asserts! (is-eq (var-get locked) false) (err ERR-CONTRACT-LOCKED))
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
  (if (or (is-eq (var-get mint-limit) u0) (<= next-id (var-get mint-limit)))
    (begin
      (unwrap! (nft-mint? welsh-gang next-id tx-sender) next-id)
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
    (nft-burn? welsh-gang token-id tx-sender)))

(define-private (is-owner (token-id uint) (user principal))
    (is-eq user (unwrap! (nft-get-owner? welsh-gang token-id) false)))

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
  (ok (nft-get-owner? welsh-gang token-id)))

(define-read-only (get-last-token-id)
  (ok (- (var-get last-id) u1)))

(define-read-only (get-token-uri (token-id uint))
  (ok (some (var-get ipfs-root))))

(define-read-only (get-paused)
  (ok (var-get mint-paused)))

(define-read-only (get-price)
  (ok (var-get total-price)))

(define-read-only (get-artist-address)
  (ok (var-get artist-address)))

(define-read-only (get-locked)
  (ok (var-get locked)))

(define-read-only (get-mints (caller principal))
  (default-to u0 (map-get? mints-per-user caller)))

(define-read-only (get-mint-limit)
  (ok (var-get mint-limit)))

(define-data-var license-uri (string-ascii 80) "https://arweave.net/zmc1WTspIhFyVY82bwfAIcIExLFH5lUcHHUN0wXg4W8/5")
(define-data-var license-name (string-ascii 40) "PERSONAL-NO-HATE")

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
  (match (nft-transfer? welsh-gang id sender recipient)
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
  (let ((owner (unwrap! (nft-get-owner? welsh-gang id) false)))
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
  (let ((owner (unwrap! (nft-get-owner? welsh-gang id) (err ERR-NOT-FOUND)))
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
      (try! (nft-mint? welsh-gang (+ last-nft-id u0) 'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS))
      (map-set token-count 'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS (+ (get-balance 'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u1) 'SP1EMXT9RET8W5TXQ325BG3TJ6X15NXV5GKEGVQE6))
      (map-set token-count 'SP1EMXT9RET8W5TXQ325BG3TJ6X15NXV5GKEGVQE6 (+ (get-balance 'SP1EMXT9RET8W5TXQ325BG3TJ6X15NXV5GKEGVQE6) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u2) 'SP3SMQNVWRBVWC81SRJYFV4X1ZQ7AWWJFBQJMC724))
      (map-set token-count 'SP3SMQNVWRBVWC81SRJYFV4X1ZQ7AWWJFBQJMC724 (+ (get-balance 'SP3SMQNVWRBVWC81SRJYFV4X1ZQ7AWWJFBQJMC724) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u3) 'SP177JV93RYPWWTX5F0MK9NVQ3YTXB4YQZGBPP6H4))
      (map-set token-count 'SP177JV93RYPWWTX5F0MK9NVQ3YTXB4YQZGBPP6H4 (+ (get-balance 'SP177JV93RYPWWTX5F0MK9NVQ3YTXB4YQZGBPP6H4) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u4) 'SP1B7GX87NSVNG4NZ3Q74Q97F0E8HEBW25JY2VFGQ))
      (map-set token-count 'SP1B7GX87NSVNG4NZ3Q74Q97F0E8HEBW25JY2VFGQ (+ (get-balance 'SP1B7GX87NSVNG4NZ3Q74Q97F0E8HEBW25JY2VFGQ) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u5) 'SP1S8M0JGYMEANDY36P6KBYJV2PY6P4KQE66FGFSC))
      (map-set token-count 'SP1S8M0JGYMEANDY36P6KBYJV2PY6P4KQE66FGFSC (+ (get-balance 'SP1S8M0JGYMEANDY36P6KBYJV2PY6P4KQE66FGFSC) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u6) 'SP2JZYP78MF3BWPYRNZMHP5EMZ1G490HT1PKT2D7J))
      (map-set token-count 'SP2JZYP78MF3BWPYRNZMHP5EMZ1G490HT1PKT2D7J (+ (get-balance 'SP2JZYP78MF3BWPYRNZMHP5EMZ1G490HT1PKT2D7J) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u7) 'SPWRJV2484ZDBW36GY2FHPEAX1FX6ERMVRZZ6DJN))
      (map-set token-count 'SPWRJV2484ZDBW36GY2FHPEAX1FX6ERMVRZZ6DJN (+ (get-balance 'SPWRJV2484ZDBW36GY2FHPEAX1FX6ERMVRZZ6DJN) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u8) 'SP2MA07XZ816092VH2FYP3TNM3ECBY4Q2QMX3TWND))
      (map-set token-count 'SP2MA07XZ816092VH2FYP3TNM3ECBY4Q2QMX3TWND (+ (get-balance 'SP2MA07XZ816092VH2FYP3TNM3ECBY4Q2QMX3TWND) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u9) 'SP2TJVMD6794VGTYS68DSQ0XA6D4GHAR8G06D0JRZ))
      (map-set token-count 'SP2TJVMD6794VGTYS68DSQ0XA6D4GHAR8G06D0JRZ (+ (get-balance 'SP2TJVMD6794VGTYS68DSQ0XA6D4GHAR8G06D0JRZ) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u10) 'SP35MER4PHM6XGB99YDRQAK0M0JQ8F9CVF04VZ1VX))
      (map-set token-count 'SP35MER4PHM6XGB99YDRQAK0M0JQ8F9CVF04VZ1VX (+ (get-balance 'SP35MER4PHM6XGB99YDRQAK0M0JQ8F9CVF04VZ1VX) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u11) 'SP2FPTH274BXVB1E2HNXBAMGABV5TCSZTFNC16FR3))
      (map-set token-count 'SP2FPTH274BXVB1E2HNXBAMGABV5TCSZTFNC16FR3 (+ (get-balance 'SP2FPTH274BXVB1E2HNXBAMGABV5TCSZTFNC16FR3) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u12) 'SP3EY6W4Q0JFBNYQQXM3J4QV80G0ZZ7N8XQ2JG0B4))
      (map-set token-count 'SP3EY6W4Q0JFBNYQQXM3J4QV80G0ZZ7N8XQ2JG0B4 (+ (get-balance 'SP3EY6W4Q0JFBNYQQXM3J4QV80G0ZZ7N8XQ2JG0B4) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u13) 'SP2TA4FGB43WVAS8MVS6YCWTSN2BZNQ1ASGEAKSDD))
      (map-set token-count 'SP2TA4FGB43WVAS8MVS6YCWTSN2BZNQ1ASGEAKSDD (+ (get-balance 'SP2TA4FGB43WVAS8MVS6YCWTSN2BZNQ1ASGEAKSDD) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u14) 'SPSTE5R54386QDCDNJJWH2EXQFST44QYZW3RPMD3))
      (map-set token-count 'SPSTE5R54386QDCDNJJWH2EXQFST44QYZW3RPMD3 (+ (get-balance 'SPSTE5R54386QDCDNJJWH2EXQFST44QYZW3RPMD3) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u15) 'SP1ZP88CVG8NNCK60BJW0BNBJD2BDV6NHRTPZ0P8Q))
      (map-set token-count 'SP1ZP88CVG8NNCK60BJW0BNBJD2BDV6NHRTPZ0P8Q (+ (get-balance 'SP1ZP88CVG8NNCK60BJW0BNBJD2BDV6NHRTPZ0P8Q) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u16) 'SP35PE5RZDTG398F34S9GVRYRTCZMANMGKST1KDQ1))
      (map-set token-count 'SP35PE5RZDTG398F34S9GVRYRTCZMANMGKST1KDQ1 (+ (get-balance 'SP35PE5RZDTG398F34S9GVRYRTCZMANMGKST1KDQ1) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u17) 'SP3HYFVG35TW1RF47N6RKYYDNPX6T47J6ZJB3B4PE))
      (map-set token-count 'SP3HYFVG35TW1RF47N6RKYYDNPX6T47J6ZJB3B4PE (+ (get-balance 'SP3HYFVG35TW1RF47N6RKYYDNPX6T47J6ZJB3B4PE) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u18) 'SP314V242VC78WTHNXSMH9RF8NFVDYFPE1MSBVTHZ))
      (map-set token-count 'SP314V242VC78WTHNXSMH9RF8NFVDYFPE1MSBVTHZ (+ (get-balance 'SP314V242VC78WTHNXSMH9RF8NFVDYFPE1MSBVTHZ) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u19) 'SP28MEEXMSDCK1P8K1JAQ3WVVXBNB563F7DZXE3WD))
      (map-set token-count 'SP28MEEXMSDCK1P8K1JAQ3WVVXBNB563F7DZXE3WD (+ (get-balance 'SP28MEEXMSDCK1P8K1JAQ3WVVXBNB563F7DZXE3WD) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u20) 'SP1V2FR1QYKHEYH3PMCMX1PQ1CBA1F2CCBQFQ5P8N))
      (map-set token-count 'SP1V2FR1QYKHEYH3PMCMX1PQ1CBA1F2CCBQFQ5P8N (+ (get-balance 'SP1V2FR1QYKHEYH3PMCMX1PQ1CBA1F2CCBQFQ5P8N) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u21) 'SP1XJ6GNTDVF6HR1VHPQDMFZJY87D9W6TGMH3QCP))
      (map-set token-count 'SP1XJ6GNTDVF6HR1VHPQDMFZJY87D9W6TGMH3QCP (+ (get-balance 'SP1XJ6GNTDVF6HR1VHPQDMFZJY87D9W6TGMH3QCP) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u22) 'SP10MJMD78XV08EK1A9BWV9CGZZCAB7XTXQFZ9PMN))
      (map-set token-count 'SP10MJMD78XV08EK1A9BWV9CGZZCAB7XTXQFZ9PMN (+ (get-balance 'SP10MJMD78XV08EK1A9BWV9CGZZCAB7XTXQFZ9PMN) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u23) 'SP2FYNHJNZ78W940EWK618762Z8D21S9XGJ0BBS4H))
      (map-set token-count 'SP2FYNHJNZ78W940EWK618762Z8D21S9XGJ0BBS4H (+ (get-balance 'SP2FYNHJNZ78W940EWK618762Z8D21S9XGJ0BBS4H) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u24) 'SP2J7H5NGABDA6J2J0D7ND15TR3QQNSXKZXQAE9YF))
      (map-set token-count 'SP2J7H5NGABDA6J2J0D7ND15TR3QQNSXKZXQAE9YF (+ (get-balance 'SP2J7H5NGABDA6J2J0D7ND15TR3QQNSXKZXQAE9YF) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u25) 'SP355T5JC0NXYDCC2Q5YMPHKDMDXF3VENZ2PP21HT))
      (map-set token-count 'SP355T5JC0NXYDCC2Q5YMPHKDMDXF3VENZ2PP21HT (+ (get-balance 'SP355T5JC0NXYDCC2Q5YMPHKDMDXF3VENZ2PP21HT) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u26) 'SPEXAF3YRNCR01Z4DFZ567Z0FB4RKPHM88DMKJSQ))
      (map-set token-count 'SPEXAF3YRNCR01Z4DFZ567Z0FB4RKPHM88DMKJSQ (+ (get-balance 'SPEXAF3YRNCR01Z4DFZ567Z0FB4RKPHM88DMKJSQ) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u27) 'SP1JQXR7ZFVZDT68V3VWC65J4WMX7SJY2GCVGNPCK))
      (map-set token-count 'SP1JQXR7ZFVZDT68V3VWC65J4WMX7SJY2GCVGNPCK (+ (get-balance 'SP1JQXR7ZFVZDT68V3VWC65J4WMX7SJY2GCVGNPCK) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u28) 'SP19GA0VBJBJWSVQRRBJ1SR35A3MR2SNM9Z6RN7W0))
      (map-set token-count 'SP19GA0VBJBJWSVQRRBJ1SR35A3MR2SNM9Z6RN7W0 (+ (get-balance 'SP19GA0VBJBJWSVQRRBJ1SR35A3MR2SNM9Z6RN7W0) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u29) 'SP2RS0YJZ2QH5VYXQ91X06B9QYR90BNGJETWP0V69))
      (map-set token-count 'SP2RS0YJZ2QH5VYXQ91X06B9QYR90BNGJETWP0V69 (+ (get-balance 'SP2RS0YJZ2QH5VYXQ91X06B9QYR90BNGJETWP0V69) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u30) 'SP2AYX2WTDQ1XXEQQ8DF4A1TJFRK8XS7X3ZF9XYXR))
      (map-set token-count 'SP2AYX2WTDQ1XXEQQ8DF4A1TJFRK8XS7X3ZF9XYXR (+ (get-balance 'SP2AYX2WTDQ1XXEQQ8DF4A1TJFRK8XS7X3ZF9XYXR) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u31) 'SP2AGZS6PEK879ZCVNQ1MVA7N5KP9XRN6JTPM7PRS))
      (map-set token-count 'SP2AGZS6PEK879ZCVNQ1MVA7N5KP9XRN6JTPM7PRS (+ (get-balance 'SP2AGZS6PEK879ZCVNQ1MVA7N5KP9XRN6JTPM7PRS) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u32) 'SP1CAZDYD70FHJVKVJENH4ECBDV9KKZY6DP3YM8TW))
      (map-set token-count 'SP1CAZDYD70FHJVKVJENH4ECBDV9KKZY6DP3YM8TW (+ (get-balance 'SP1CAZDYD70FHJVKVJENH4ECBDV9KKZY6DP3YM8TW) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u33) 'SP164K6WF31NQ1HBNPD96DPY4F4YN1SWVHF2PV782))
      (map-set token-count 'SP164K6WF31NQ1HBNPD96DPY4F4YN1SWVHF2PV782 (+ (get-balance 'SP164K6WF31NQ1HBNPD96DPY4F4YN1SWVHF2PV782) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u34) 'SP30Z0C24JH6H73MCAKH4EET0JHZNFTPBDMXHEMYE))
      (map-set token-count 'SP30Z0C24JH6H73MCAKH4EET0JHZNFTPBDMXHEMYE (+ (get-balance 'SP30Z0C24JH6H73MCAKH4EET0JHZNFTPBDMXHEMYE) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u35) 'SP1X9WS1VTYBV9MR0YR0X8934C9575K1X3Q6YSTH9))
      (map-set token-count 'SP1X9WS1VTYBV9MR0YR0X8934C9575K1X3Q6YSTH9 (+ (get-balance 'SP1X9WS1VTYBV9MR0YR0X8934C9575K1X3Q6YSTH9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u36) 'SP21XPYZX9E156065K65CWY4EQ6Z79P1QP4JC6JXW))
      (map-set token-count 'SP21XPYZX9E156065K65CWY4EQ6Z79P1QP4JC6JXW (+ (get-balance 'SP21XPYZX9E156065K65CWY4EQ6Z79P1QP4JC6JXW) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u37) 'SP9Z3SE1VP0WVJECPDCXQ70DD5R32TET5X6TDXF7))
      (map-set token-count 'SP9Z3SE1VP0WVJECPDCXQ70DD5R32TET5X6TDXF7 (+ (get-balance 'SP9Z3SE1VP0WVJECPDCXQ70DD5R32TET5X6TDXF7) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u38) 'SPEW42NMB4F832CDN4GDFQV8D7JD33B22VRFF7WY))
      (map-set token-count 'SPEW42NMB4F832CDN4GDFQV8D7JD33B22VRFF7WY (+ (get-balance 'SPEW42NMB4F832CDN4GDFQV8D7JD33B22VRFF7WY) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u39) 'SP10KDAPPHW7RVHXD1YDN85Y07FDW53W1JE0EG803))
      (map-set token-count 'SP10KDAPPHW7RVHXD1YDN85Y07FDW53W1JE0EG803 (+ (get-balance 'SP10KDAPPHW7RVHXD1YDN85Y07FDW53W1JE0EG803) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u40) 'SP1SZVJS15W0MC5GK8QVGZRE1336PME1979XXCMSC))
      (map-set token-count 'SP1SZVJS15W0MC5GK8QVGZRE1336PME1979XXCMSC (+ (get-balance 'SP1SZVJS15W0MC5GK8QVGZRE1336PME1979XXCMSC) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u41) 'SP3KVRE3RDYYSJ3JDGXKA0K15CC4JEA2ZGX4TJ5EC))
      (map-set token-count 'SP3KVRE3RDYYSJ3JDGXKA0K15CC4JEA2ZGX4TJ5EC (+ (get-balance 'SP3KVRE3RDYYSJ3JDGXKA0K15CC4JEA2ZGX4TJ5EC) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u42) 'SP3KVRE3RDYYSJ3JDGXKA0K15CC4JEA2ZGX4TJ5EC))
      (map-set token-count 'SP3KVRE3RDYYSJ3JDGXKA0K15CC4JEA2ZGX4TJ5EC (+ (get-balance 'SP3KVRE3RDYYSJ3JDGXKA0K15CC4JEA2ZGX4TJ5EC) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u43) 'SP0DE62QSVEWM35056Y04XV55KQB59SM7S9G0REB))
      (map-set token-count 'SP0DE62QSVEWM35056Y04XV55KQB59SM7S9G0REB (+ (get-balance 'SP0DE62QSVEWM35056Y04XV55KQB59SM7S9G0REB) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u44) 'SPGKBV2Z2RPQD8VHQ713WA7EYZV9PNQR5DRCNHW9))
      (map-set token-count 'SPGKBV2Z2RPQD8VHQ713WA7EYZV9PNQR5DRCNHW9 (+ (get-balance 'SPGKBV2Z2RPQD8VHQ713WA7EYZV9PNQR5DRCNHW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u45) 'SP32WG40PAKDKPX129VNJN50R5NDX6KJ54Z8NV74M))
      (map-set token-count 'SP32WG40PAKDKPX129VNJN50R5NDX6KJ54Z8NV74M (+ (get-balance 'SP32WG40PAKDKPX129VNJN50R5NDX6KJ54Z8NV74M) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u46) 'SPACCQ8K3ZKXNAHTH14VEAFWY9E7BDP72DCNCZWP))
      (map-set token-count 'SPACCQ8K3ZKXNAHTH14VEAFWY9E7BDP72DCNCZWP (+ (get-balance 'SPACCQ8K3ZKXNAHTH14VEAFWY9E7BDP72DCNCZWP) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u47) 'SP239PCNQ0C366NRNP54PCN1PQWX665FXVEZ14X0Z))
      (map-set token-count 'SP239PCNQ0C366NRNP54PCN1PQWX665FXVEZ14X0Z (+ (get-balance 'SP239PCNQ0C366NRNP54PCN1PQWX665FXVEZ14X0Z) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u48) 'SP16QNZ84F3BCT1M1MDRGYDJN93DPV1T7F023QKXT))
      (map-set token-count 'SP16QNZ84F3BCT1M1MDRGYDJN93DPV1T7F023QKXT (+ (get-balance 'SP16QNZ84F3BCT1M1MDRGYDJN93DPV1T7F023QKXT) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u49) 'SP14F2PGC415EVMQ89C72GKMJZR4T67GK9DWN1VWJ))
      (map-set token-count 'SP14F2PGC415EVMQ89C72GKMJZR4T67GK9DWN1VWJ (+ (get-balance 'SP14F2PGC415EVMQ89C72GKMJZR4T67GK9DWN1VWJ) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u50) 'SP298GX9KVP33445NK5CCK1P9A9MEVK3YWMW0GE8Y))
      (map-set token-count 'SP298GX9KVP33445NK5CCK1P9A9MEVK3YWMW0GE8Y (+ (get-balance 'SP298GX9KVP33445NK5CCK1P9A9MEVK3YWMW0GE8Y) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u51) 'SP38XNSM55GSEEBE9RQ5YVNMRFVMGAC0GRHFT2QVN))
      (map-set token-count 'SP38XNSM55GSEEBE9RQ5YVNMRFVMGAC0GRHFT2QVN (+ (get-balance 'SP38XNSM55GSEEBE9RQ5YVNMRFVMGAC0GRHFT2QVN) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u52) 'SP21575M2GHBJHSC97FDSRSTP4H5WS750FY6H2HQE))
      (map-set token-count 'SP21575M2GHBJHSC97FDSRSTP4H5WS750FY6H2HQE (+ (get-balance 'SP21575M2GHBJHSC97FDSRSTP4H5WS750FY6H2HQE) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u53) 'SP135Q4A1W9HFT0ZW2VC4F0ER32EJAFX5ZME05JYW))
      (map-set token-count 'SP135Q4A1W9HFT0ZW2VC4F0ER32EJAFX5ZME05JYW (+ (get-balance 'SP135Q4A1W9HFT0ZW2VC4F0ER32EJAFX5ZME05JYW) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u54) 'SP2SKY558ZQN3TYF1RQ9FAGHT5MCV596D4G49WQ1P))
      (map-set token-count 'SP2SKY558ZQN3TYF1RQ9FAGHT5MCV596D4G49WQ1P (+ (get-balance 'SP2SKY558ZQN3TYF1RQ9FAGHT5MCV596D4G49WQ1P) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u55) 'SP25NZ15YKFMDMCSYE1VR9HSHXF1W0Y5D79852ABJ))
      (map-set token-count 'SP25NZ15YKFMDMCSYE1VR9HSHXF1W0Y5D79852ABJ (+ (get-balance 'SP25NZ15YKFMDMCSYE1VR9HSHXF1W0Y5D79852ABJ) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u56) 'SP2NSPCQKM4MF0PENWN95R7A0B1E9425CX9CDZE09))
      (map-set token-count 'SP2NSPCQKM4MF0PENWN95R7A0B1E9425CX9CDZE09 (+ (get-balance 'SP2NSPCQKM4MF0PENWN95R7A0B1E9425CX9CDZE09) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u57) 'SP3B8ECZ55QJRVVTGDJZAAE6CMFT8VY2NJW4VBA2T))
      (map-set token-count 'SP3B8ECZ55QJRVVTGDJZAAE6CMFT8VY2NJW4VBA2T (+ (get-balance 'SP3B8ECZ55QJRVVTGDJZAAE6CMFT8VY2NJW4VBA2T) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u58) 'SP3T7AQYJVA0S12SQ084BG4NKGEHP4C068PAQRBQZ))
      (map-set token-count 'SP3T7AQYJVA0S12SQ084BG4NKGEHP4C068PAQRBQZ (+ (get-balance 'SP3T7AQYJVA0S12SQ084BG4NKGEHP4C068PAQRBQZ) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u59) 'SP33J6TZ86XMVDEG4KDJPXC960WSCX3P7G99Q3DDC))
      (map-set token-count 'SP33J6TZ86XMVDEG4KDJPXC960WSCX3P7G99Q3DDC (+ (get-balance 'SP33J6TZ86XMVDEG4KDJPXC960WSCX3P7G99Q3DDC) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u60) 'SP10F5W11YT4HH62VSKA7R9TY1PAXC2JPKNN8ZD5A))
      (map-set token-count 'SP10F5W11YT4HH62VSKA7R9TY1PAXC2JPKNN8ZD5A (+ (get-balance 'SP10F5W11YT4HH62VSKA7R9TY1PAXC2JPKNN8ZD5A) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u61) 'SP2PX1R2ZHCCD0FYXQC63YZJWX26M3XDJJP8XCRW2))
      (map-set token-count 'SP2PX1R2ZHCCD0FYXQC63YZJWX26M3XDJJP8XCRW2 (+ (get-balance 'SP2PX1R2ZHCCD0FYXQC63YZJWX26M3XDJJP8XCRW2) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u62) 'SP2KDEQS7Q3BAJT4BPP94FGT963ESXPKS7S8A995S))
      (map-set token-count 'SP2KDEQS7Q3BAJT4BPP94FGT963ESXPKS7S8A995S (+ (get-balance 'SP2KDEQS7Q3BAJT4BPP94FGT963ESXPKS7S8A995S) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u63) 'SP8VH92GXA0Y9STX8MQ4N03X9NAV3MJFZW8W0JT1))
      (map-set token-count 'SP8VH92GXA0Y9STX8MQ4N03X9NAV3MJFZW8W0JT1 (+ (get-balance 'SP8VH92GXA0Y9STX8MQ4N03X9NAV3MJFZW8W0JT1) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u64) 'SP3XMSY4VSHJBTC519R5D2VC146MAJFJ06TZZ90KJ))
      (map-set token-count 'SP3XMSY4VSHJBTC519R5D2VC146MAJFJ06TZZ90KJ (+ (get-balance 'SP3XMSY4VSHJBTC519R5D2VC146MAJFJ06TZZ90KJ) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u65) 'SP2Y47K3ZGH6K0B8GPCSNYREFX4MXM809MFDZJ0PF))
      (map-set token-count 'SP2Y47K3ZGH6K0B8GPCSNYREFX4MXM809MFDZJ0PF (+ (get-balance 'SP2Y47K3ZGH6K0B8GPCSNYREFX4MXM809MFDZJ0PF) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u66) 'SP1P679V9X4MB9W4F2A5DJ5AK4XETD701A4ZB8CQ2))
      (map-set token-count 'SP1P679V9X4MB9W4F2A5DJ5AK4XETD701A4ZB8CQ2 (+ (get-balance 'SP1P679V9X4MB9W4F2A5DJ5AK4XETD701A4ZB8CQ2) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u67) 'SPEXRA92V0H67ETCVGCX89D3Q4YRCV40T3DB001S))
      (map-set token-count 'SPEXRA92V0H67ETCVGCX89D3Q4YRCV40T3DB001S (+ (get-balance 'SPEXRA92V0H67ETCVGCX89D3Q4YRCV40T3DB001S) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u68) 'SP3TW3JRGF1ZZ6X7SQ9A9PS8H005KNZWQM70VTFVZ))
      (map-set token-count 'SP3TW3JRGF1ZZ6X7SQ9A9PS8H005KNZWQM70VTFVZ (+ (get-balance 'SP3TW3JRGF1ZZ6X7SQ9A9PS8H005KNZWQM70VTFVZ) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u69) 'SP1K98DG5F7PCKVX3PBS8QYPXPRH25C0K5NZGF6QB))
      (map-set token-count 'SP1K98DG5F7PCKVX3PBS8QYPXPRH25C0K5NZGF6QB (+ (get-balance 'SP1K98DG5F7PCKVX3PBS8QYPXPRH25C0K5NZGF6QB) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u70) 'SPJ9PHAQWGMRHM4YGGE3381G7YY6FJ1ADFDMSM31))
      (map-set token-count 'SPJ9PHAQWGMRHM4YGGE3381G7YY6FJ1ADFDMSM31 (+ (get-balance 'SPJ9PHAQWGMRHM4YGGE3381G7YY6FJ1ADFDMSM31) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u71) 'SPRS26BHGZGZ0AP9VEX718S9H8XT4KFHWSV8NY07))
      (map-set token-count 'SPRS26BHGZGZ0AP9VEX718S9H8XT4KFHWSV8NY07 (+ (get-balance 'SPRS26BHGZGZ0AP9VEX718S9H8XT4KFHWSV8NY07) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u72) 'SP235DV9CZGRGMFN1PZ3NC7Z2TGT1YV4XNMM9P7BY))
      (map-set token-count 'SP235DV9CZGRGMFN1PZ3NC7Z2TGT1YV4XNMM9P7BY (+ (get-balance 'SP235DV9CZGRGMFN1PZ3NC7Z2TGT1YV4XNMM9P7BY) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u73) 'SP14EFAF85KE7G42GR9SVEGWXT8XW2VDP3QTPBTKY))
      (map-set token-count 'SP14EFAF85KE7G42GR9SVEGWXT8XW2VDP3QTPBTKY (+ (get-balance 'SP14EFAF85KE7G42GR9SVEGWXT8XW2VDP3QTPBTKY) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u74) 'SP2M53KG6866HGKX1E2S0NPBWGJRN9RYK0MK624T3))
      (map-set token-count 'SP2M53KG6866HGKX1E2S0NPBWGJRN9RYK0MK624T3 (+ (get-balance 'SP2M53KG6866HGKX1E2S0NPBWGJRN9RYK0MK624T3) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u75) 'SP3XD5DBGRQZ4SNZ4T0P9DQBC21KEM8VSQZ05KGNM))
      (map-set token-count 'SP3XD5DBGRQZ4SNZ4T0P9DQBC21KEM8VSQZ05KGNM (+ (get-balance 'SP3XD5DBGRQZ4SNZ4T0P9DQBC21KEM8VSQZ05KGNM) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u76) 'SP2KKRV242G80F74R7VE4M3BMQD5PZSM2V2CWHAQ4))
      (map-set token-count 'SP2KKRV242G80F74R7VE4M3BMQD5PZSM2V2CWHAQ4 (+ (get-balance 'SP2KKRV242G80F74R7VE4M3BMQD5PZSM2V2CWHAQ4) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u77) 'SP342C5W1EFW5ZEG9DAW3TX5YE5C5341T426H8RMA))
      (map-set token-count 'SP342C5W1EFW5ZEG9DAW3TX5YE5C5341T426H8RMA (+ (get-balance 'SP342C5W1EFW5ZEG9DAW3TX5YE5C5341T426H8RMA) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u78) 'SPDSTGSZ8S59H8RD2P8KC4BSNGGVGW9MS7DHNPCY))
      (map-set token-count 'SPDSTGSZ8S59H8RD2P8KC4BSNGGVGW9MS7DHNPCY (+ (get-balance 'SPDSTGSZ8S59H8RD2P8KC4BSNGGVGW9MS7DHNPCY) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u79) 'SP1DNT6ZED5A97DPJ6CCV8TP2KF3G47S3YVWESVZR))
      (map-set token-count 'SP1DNT6ZED5A97DPJ6CCV8TP2KF3G47S3YVWESVZR (+ (get-balance 'SP1DNT6ZED5A97DPJ6CCV8TP2KF3G47S3YVWESVZR) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u80) 'SP37MKBSFBG1XBW0QFB3HB1TAWENKNNKD2C2VXVYG))
      (map-set token-count 'SP37MKBSFBG1XBW0QFB3HB1TAWENKNNKD2C2VXVYG (+ (get-balance 'SP37MKBSFBG1XBW0QFB3HB1TAWENKNNKD2C2VXVYG) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u81) 'SP3QKFK4B3NBMV7XM0VS606YZJKESNQDV8MCVG69V))
      (map-set token-count 'SP3QKFK4B3NBMV7XM0VS606YZJKESNQDV8MCVG69V (+ (get-balance 'SP3QKFK4B3NBMV7XM0VS606YZJKESNQDV8MCVG69V) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u82) 'SP1MMWCHSY2R58KNASM35W6X49C0EDT93HP4EN5GF))
      (map-set token-count 'SP1MMWCHSY2R58KNASM35W6X49C0EDT93HP4EN5GF (+ (get-balance 'SP1MMWCHSY2R58KNASM35W6X49C0EDT93HP4EN5GF) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u83) 'SP7CP1QGW8TX59TY4TE2HZ50FWWVB701K6C5SJD4))
      (map-set token-count 'SP7CP1QGW8TX59TY4TE2HZ50FWWVB701K6C5SJD4 (+ (get-balance 'SP7CP1QGW8TX59TY4TE2HZ50FWWVB701K6C5SJD4) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u84) 'SP16EP25D1TJVN3VXR50QQG5YB07WXGEE5WYVH5YY))
      (map-set token-count 'SP16EP25D1TJVN3VXR50QQG5YB07WXGEE5WYVH5YY (+ (get-balance 'SP16EP25D1TJVN3VXR50QQG5YB07WXGEE5WYVH5YY) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u85) 'SP1A11S3P177BCR1YKSCPCNP8C2WH7MWWF0TXR39T))
      (map-set token-count 'SP1A11S3P177BCR1YKSCPCNP8C2WH7MWWF0TXR39T (+ (get-balance 'SP1A11S3P177BCR1YKSCPCNP8C2WH7MWWF0TXR39T) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u86) 'SP301D8E6XYWA05DX8F8HSD73NT2XB376R47G0STV))
      (map-set token-count 'SP301D8E6XYWA05DX8F8HSD73NT2XB376R47G0STV (+ (get-balance 'SP301D8E6XYWA05DX8F8HSD73NT2XB376R47G0STV) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u87) 'SP1TZDFBCHC7XTB1ERZJ603A4TPEXFZEFVX0ZMKPK))
      (map-set token-count 'SP1TZDFBCHC7XTB1ERZJ603A4TPEXFZEFVX0ZMKPK (+ (get-balance 'SP1TZDFBCHC7XTB1ERZJ603A4TPEXFZEFVX0ZMKPK) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u88) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u89) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u90) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u91) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u92) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u93) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u94) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u95) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u96) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u97) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u98) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u99) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u100) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u101) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u102) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u103) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u104) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u105) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u106) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u107) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u108) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u109) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u110) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u111) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u112) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u113) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u114) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u115) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u116) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u117) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u118) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u119) 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9))
      (map-set token-count 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9 (+ (get-balance 'SPNKS4MR41GH8PVXAA2R0KVG4S3KYG68Z5TANYW9) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u120) 'SPR6K4VQ0JQN677W4GGCN5JTPN7XF7YTP7WKAJXH))
      (map-set token-count 'SPR6K4VQ0JQN677W4GGCN5JTPN7XF7YTP7WKAJXH (+ (get-balance 'SPR6K4VQ0JQN677W4GGCN5JTPN7XF7YTP7WKAJXH) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u121) 'SP1P38EZ7DKY3RP2DA3D6HSE4XMG1VG1BJW7KZTAQ))
      (map-set token-count 'SP1P38EZ7DKY3RP2DA3D6HSE4XMG1VG1BJW7KZTAQ (+ (get-balance 'SP1P38EZ7DKY3RP2DA3D6HSE4XMG1VG1BJW7KZTAQ) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u122) 'SP1FF8MVW3RD1KT6KJ0G0WPMWARRH7FN49DGE3SNT))
      (map-set token-count 'SP1FF8MVW3RD1KT6KJ0G0WPMWARRH7FN49DGE3SNT (+ (get-balance 'SP1FF8MVW3RD1KT6KJ0G0WPMWARRH7FN49DGE3SNT) u1))
      (try! (nft-mint? welsh-gang (+ last-nft-id u123) 'SP10ECZKBTMVGV9Z41A9QQP80TQFZK2QRSV5BWNMX))
      (map-set token-count 'SP10ECZKBTMVGV9Z41A9QQP80TQFZK2QRSV5BWNMX (+ (get-balance 'SP10ECZKBTMVGV9Z41A9QQP80TQFZK2QRSV5BWNMX) u1))

      (var-set last-id (+ last-nft-id u124))
      (var-set airdrop-called true)
      (ok true))))