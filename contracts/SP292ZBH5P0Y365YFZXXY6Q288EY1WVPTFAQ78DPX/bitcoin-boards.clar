;; bitcoin-boards

(impl-trait 'SP2PABAF9FTAJYNFZH93XENAJ8FVY99RRM50D2JG9.nft-trait.nft-trait)

(define-non-fungible-token bitcoin-boards uint)

;; Constants
(define-constant DEPLOYER tx-sender)
(define-constant COMM u500)
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

;; Internal variables
(define-data-var mint-limit uint u1)
(define-data-var last-id uint u1)
(define-data-var total-price uint u65000000)
(define-data-var artist-address principal 'SPMAP713A982CVDKND288JJXJWWBKTTG44RPCD1Q)
(define-data-var ipfs-root (string-ascii 80) "ipfs://QmYWvN5GS8m9De1gDsDuhkMXMqQ8vS5XRgAf67a2GmPXem/")
(define-data-var mint-paused bool true)
(define-data-var premint-enabled bool false)
(define-data-var sale-enabled bool false)
(define-data-var metadata-frozen bool false)
(define-data-var airdrop-called bool false)
(define-data-var mint-cap uint u10)

(define-map mints-per-user principal uint)
(define-map mint-passes principal uint)

(define-public (claim) 
  (mint (list true)))

(define-public (claim-three) (mint (list true true true)))

(define-public (claim-five) (mint (list true true true true true)))

(define-public (claim-ten) (mint (list true true true true true true true true true true)))

;; Mintpass Minting
(define-private (mint (orders (list 25 bool)))
  (let 
    (
      (passes (get-passes tx-sender))
    )
    (if (var-get premint-enabled)
      (begin
        (asserts! (>= passes (len orders)) (err ERR-NOT-ENOUGH-PASSES))
        (map-set mint-passes tx-sender (- passes (len orders)))
        (mint-many orders)
      )
      (begin
        (asserts! (var-get sale-enabled) (err ERR-PUBLIC-SALE-DISABLED))
        (mint-many orders)
      )
    )))

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
      (unwrap! (nft-mint? bitcoin-boards next-id tx-sender) next-id)
      (+ next-id u1)    
    )
    next-id))

(define-public (set-artist-address (address principal))
  (begin
    (asserts! (is-eq tx-sender DEPLOYER) (err ERR-INVALID-USER))
    (ok (var-set artist-address address))))

(define-public (set-price (price uint))
  (begin
    (asserts! (is-eq tx-sender DEPLOYER) (err ERR-INVALID-USER))
    (ok (var-set total-price price))))

(define-public (toggle-pause)
  (begin
    (asserts! (is-eq tx-sender DEPLOYER) (err ERR-INVALID-USER))
    (ok (var-set mint-paused (not (var-get mint-paused))))))

(define-public (set-mint-limit (limit uint))
  (begin
    (asserts! (is-eq tx-sender DEPLOYER) (err ERR-INVALID-USER))
    (asserts! (< limit (var-get mint-limit)) (err ERR-MINT-LIMIT))
    (ok (var-set mint-limit limit))))

(define-public (burn (token-id uint))
  (begin 
    (asserts! (is-owner token-id tx-sender) (err ERR-NOT-AUTHORIZED))
    (nft-burn? bitcoin-boards token-id tx-sender)))

(define-private (is-owner (token-id uint) (user principal))
    (is-eq user (unwrap! (nft-get-owner? bitcoin-boards token-id) false)))

(define-public (set-base-uri (new-base-uri (string-ascii 80)))
  (begin
    (asserts! (is-eq tx-sender DEPLOYER) (err ERR-NOT-AUTHORIZED))
    (asserts! (not (var-get metadata-frozen)) (err ERR-METADATA-FROZEN))
    (var-set ipfs-root new-base-uri)
    (ok true)))

(define-public (freeze-metadata)
  (begin
    (asserts! (is-eq tx-sender DEPLOYER) (err ERR-NOT-AUTHORIZED))
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
  (ok (nft-get-owner? bitcoin-boards token-id)))

(define-read-only (get-last-token-id)
  (ok (- (var-get last-id) u1)))

(define-read-only (get-token-uri (token-id uint))
  (ok (some (concat (concat (var-get ipfs-root) "{id}") ".json"))))

(define-read-only (get-paused)
  (ok (var-get mint-paused)))

(define-read-only (get-price)
  (ok (var-get total-price)))

(define-read-only (get-mints (caller principal))
  (default-to u0 (map-get? mints-per-user caller)))

(define-read-only (get-mint-limit)
  (ok (var-get mint-limit)))

;; Non-custodial marketplace extras
(define-trait commission-trait
  ((pay (uint uint) (response bool uint))))

(define-map token-count principal uint)
(define-map market uint {price: uint, commission: principal})

(define-read-only (get-balance (account principal))
  (default-to u0
    (map-get? token-count account)))

(define-private (trnsfr (id uint) (sender principal) (recipient principal))
  (match (nft-transfer? bitcoin-boards id sender recipient)
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
  (let ((owner (unwrap! (nft-get-owner? bitcoin-boards id) false)))
    (or (is-eq tx-sender owner) (is-eq contract-caller owner))))

(define-read-only (get-listing-in-ustx (id uint))
  (map-get? market id))

(define-public (list-in-ustx (id uint) (price uint) (comm-trait <commission-trait>))
  (let ((listing  {price: price, commission: (contract-of comm-trait)}))
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
  (let ((owner (unwrap! (nft-get-owner? bitcoin-boards id) (err ERR-NOT-FOUND)))
      (listing (unwrap! (map-get? market id) (err ERR-LISTING)))
      (price (get price listing)))
    (asserts! (is-eq (contract-of comm-trait) (get commission listing)) (err ERR-WRONG-COMMISSION))
    (try! (stx-transfer? price tx-sender owner))
    (try! (contract-call? comm-trait pay id price))
    (try! (trnsfr id owner tx-sender))
    (map-delete market id)
    (print {a: "buy-in-ustx", id: id})
    (ok true)))

;; Extra functionality required for mintpass
(define-public (toggle-sale-state)
  (let 
    (
      ;; (premint (not (var-get premint-enabled)))
      (sale (not (var-get sale-enabled)))
    )
    (asserts! (is-eq tx-sender DEPLOYER) (err ERR-NOT-AUTHORIZED))
    (var-set premint-enabled false)
    (var-set sale-enabled sale)
    (print { sale: sale })
    (ok true)))

(define-public (enable-premint)
  (begin
    (asserts! (is-eq tx-sender DEPLOYER) (err ERR-NOT-AUTHORIZED))
    (ok (var-set premint-enabled true))))

(define-public (disable-premint)
  (begin
    (asserts! (is-eq tx-sender DEPLOYER) (err ERR-NOT-AUTHORIZED))
    (ok (var-set premint-enabled false))))

(define-read-only (get-passes (caller principal))
  (default-to u0 (map-get? mint-passes caller)))

(define-read-only (get-premint-enabled)
  (ok (var-get premint-enabled)))

(define-read-only (get-sale-enabled)
  (ok (var-get sale-enabled)))  

(map-set mint-passes 'SP3K22XKPT9WJFCE957J94J6XXVZHP7747YNPDTFD u3)
(map-set mint-passes 'SPHK8A7P61C6ASWKYDX1PCDX9YA54DKVJN49EXGJ u3)
(map-set mint-passes 'SP1GK1YMVRYZAFQ5BCMZ8KQDXGGFRZ8V3GF1PX0KH u3)
(map-set mint-passes 'SP19KPWZDPBD13N07C7Q1BENQMEPRTNA6J6ACBJB3 u3)
(map-set mint-passes 'SP2FZ154ESZ8NB34RZ3RS147GD6DSEYNE8DQD0XDM u3)
(map-set mint-passes 'SP1GYWMYK320ASBBAERSC40TA3PA99ZHV3GF256T8 u3)
(map-set mint-passes 'SP16AZ9829ABNJ8TXV57DCDP6Q67VBSA43RYXC1F0 u3)
(map-set mint-passes 'SP20MVE16QJ3DW5RJPZ0SV6YNZX8MAJMZF1Z5M40Z u3)
(map-set mint-passes 'SP3PPBWF44PSCFN9BPVFZYZD6R8JJNQW0CPDPYB6D u3)
(map-set mint-passes 'SPZ5DJGRVZHXEEEYYGWEX84KQB8P69GC715ZRNW1 u3)
(map-set mint-passes 'SP1CQF008B5KJ477RQQQQJAQZZG4B0KHDHMJ4W444 u3)
(map-set mint-passes 'SP197GMEG6WGBRDTCTGGWMRA1G77E65TRXWYKGCT7 u3)
(map-set mint-passes 'SP3T7WAB5DMJ3JSRMCQF6SC7CG50DYYJVS4C303CN u3)
(map-set mint-passes 'SP2868VG4Q2G7CAV12M7MZ17XJ018R8D60WF27XQR u3)
(map-set mint-passes 'SP3A3P9HDMATTTERGSC373XA2RSHHXNFSSHMEADM5 u3)
(map-set mint-passes 'SP2QFXPC7ESM7NVPSP7M7M711VEJFE7GBASSJMRTP u3)
(map-set mint-passes 'SP1QJDCZ0J9NRPPPZ9186GGBFQZEZM86VKCE19D4T u3)
(map-set mint-passes 'SP329G766AV8Z01X9EEAHPDQ4WDJXT2A0XB383MGP u3)
(map-set mint-passes 'SP2HVP68NY5BD2RDFX0JNXSYRS8AA6R7S30N08NJZ u3)
(map-set mint-passes 'SP1J4SFHSMMT5Z0PG3WDD1TNGZVCWMB5QBYHNFECG u3)
(map-set mint-passes 'SP27A09VG1SH1J8Z76NXHBGKB0ZWSBZ99DRGAC8NB u3)
(map-set mint-passes 'SPZV53PK1ABCDFD6W1C9R567GEKR4R1KFN086A9Z u3)
(map-set mint-passes 'SP26RCEDHH2N7CE74KB4J1DQGNAQWF1AMSMPPCVD1 u3)
(map-set mint-passes 'SP2MDEE7BMXWTNST6PKE8MGP2EWD6412ZNPTYMQ5S u3)
(map-set mint-passes 'SP25GGWDPFJ7WCGC6YB5ZSX2C4DBP4V74R386AX69 u3)
(map-set mint-passes 'SP2Y8V41F6Z93GVTBHHE0E0ME169KN14A60V7ZYHZ u3)
(map-set mint-passes 'SP3VS5M4CT2JS74VEECCDTHSBZ4YZTAVWD4SE372K u3)
(map-set mint-passes 'SP1FR2M102H4DE4DH96R4D29RC8AGQZG5D5Y4S7CH u3)
(map-set mint-passes 'SP2C8P3MM137K1A48D1SRENG67KHEVPZV4K36G3JY u3)
(map-set mint-passes 'SPMWVJWPNA60MSNF14PR9C0G65GCDM4GXDH8CJE5 u3)
(map-set mint-passes 'SPV4GYHQ2B7R831M3F7ZNN22RDDHEKQ52ZN50CDE u3)
(map-set mint-passes 'SP16H5R1ZDFJQ7FE3ZYZKGFD8QTGPAGVEYWQXJMS5 u3)
(map-set mint-passes 'SP16PRV5FEZRH1KNFWNJTZ9HHZGWMPFB6G1QKE607 u3)
(map-set mint-passes 'SP1C671AAKE9M5T7BPR7X8F9WRK5W7A4PVMHSSPGZ u3)
(map-set mint-passes 'SP1TCA7QER9J9NKCKBB78K48TADDFC2GXYM3QQV3X u3)
(map-set mint-passes 'SP2EF3C3YBK9HCTBQTQG1883V2TSZQ3T2M13FDXR8 u3)
(map-set mint-passes 'SP3JCN7W79KNRJBBPBRPKJZ7TRCVAK1NGV2FX4ZH u3)
(map-set mint-passes 'SP2RS0YJZ2QH5VYXQ91X06B9QYR90BNGJETWP0V69 u3)
(map-set mint-passes 'SP3XMYSS7VHPQV9YP2083D3VN8VDH8ZYZYD7XAR6E u3)
(map-set mint-passes 'SP3EYT7KF5ERWQFTWW3SWHS8QRYBNSMRZ7JW73YXR u3)
(map-set mint-passes 'SPQ2HN9TYF8ZYY9D3G45NGYA9GHA6QZHQ8AXF5QM u3)
(map-set mint-passes 'SPAD6SHQNFD8JV1X9SZ3B8D1S9E09T0TB2CMAE8W u3)
(map-set mint-passes 'SP3RQVBVZQ9WC6M4NM68QR0W9G8YV8N2P323Y389D u3)
(map-set mint-passes 'SP1SA9ZTHB8QWNWJAYX54RZKA1EGB3R6YZDN4RWNJ u3)
(map-set mint-passes 'SP3YPMD71E1Q0WRW0949AT5MQ4M72GMP915CX1XTW u3)
(map-set mint-passes 'SPSS7WAYA17Y8Z5Q6GJTMH4FH4MRJ7HZZ6JPGAGR u3)
(map-set mint-passes 'SP2S5GQXWE6MB9XXMSE0D0KR3YYFJCJQ56N7WYTMM u3)
(map-set mint-passes 'SP3W7H6HASPRV7GN3342T1FXTZ463VJFYW3PXSD6B u3)
(map-set mint-passes 'SPEJ2JKG5SVZD793CEWFZQ0VDPEGZ6QVP39QFAHM u3)
(map-set mint-passes 'SP9XD6041FFN5BW6ZR9J3FSESR4S442JPYZJVXBW u3)
(map-set mint-passes 'SP3VQM46NM7Z41VP3ZR80M1YRZC92QWK6SSV1EEHG u3)
(map-set mint-passes 'SP2BZC70G79TAQXBH6NCYMKP3C9BPP2RMCM07DMDP u3)
(map-set mint-passes 'SP2Q1SZSETS27AZ9FE0BH6C6B7MVC25E4N6C2VE7D u3)
(map-set mint-passes 'SP3TZ3BCB16A0W0PPFYMGTTWTT3DVWTQEP8DFRAG1 u3)
(map-set mint-passes 'SP3356JJ54Q0YB2Q7EN3ZPV7DAY8E2NAS9P8E2WZ0 u3)
(map-set mint-passes 'SP3KPC43PAJA0ZFEYNGZDWTHKPWKSHF8ARP2CQ6ED u3)
(map-set mint-passes 'SPFZJAWND9GDB2QC54524J73DGBQ07XJ6JM1E3GN u3)
(map-set mint-passes 'SP235VD14JSA9EZJT2SPWAYS70BV5QFGF9JFS754A u3)
(map-set mint-passes 'SPPT6DNNC9KQW9MXNYTX4FH3CJXWQP90E5B6K64G u3)
(map-set mint-passes 'SPA5P51076FPT6JPC0H09ENXTCMW55ZXQCR27JSZ u3)
(map-set mint-passes 'SP2YCRG9VNTAECNP2NMPWWZD9K95SGS9PJDYYVHAJ u3)
(map-set mint-passes 'SPKFSJ4T8T39ZJN455QBY7TJX4DYF47J7344HNNF u3)
(map-set mint-passes 'SP4QA0NHP03T3T9GJKR5KEA7VQ2KNSXRK5JC74NG u3)
(map-set mint-passes 'SP271CPRFRDSX26GZND9YDD3FSE0JK2B61SBJRAG2 u3)
(map-set mint-passes 'SPHBMWA8TBJGBN35BDJ2E5MZM0EJH2QKZTVMP35F u3)
(map-set mint-passes 'SPN7C68VE0HZJ2812V5ZT444GJPZXE9G3TT9QFYT u3)
(map-set mint-passes 'SP3TNWFMV4PAH9Q5M5Z7XKN5Y7AM9QWEGAWK13K24 u3)
(map-set mint-passes 'SP2JS9HG5QCBFKHWN8F0GH2CR2ESRC8Z6BJT93SVG u3)
(map-set mint-passes 'SPE0M731X6PZ7RYVZYZWFB57YYN5Z0QA5CE863XC u3)
(map-set mint-passes 'SP2FRFKTP2GM2VM64VYBV0MG9CKRF3TZBFSRZ1C3T u3)
(map-set mint-passes 'SP39GTB1RRRQ7DX5P5456JKK4G9TERD8B8YFFTDBW u3)
(map-set mint-passes 'SPEXAF3YRNCR01Z4DFZ567Z0FB4RKPHM88DMKJSQ u3)
(map-set mint-passes 'SP2JCF3ME5QC779DQ2X1CM9S62VNJF44GC23MKQXK u3)
(map-set mint-passes 'SP337WP7AQSX8Q9H0TGY8K3RVQBBF82MTZMRE7JDB u3)
(map-set mint-passes 'SP182H8WREVR0QAAKK3EDPV82A04KGE71ZTTKFFK u3)
(map-set mint-passes 'SPFERFF3QKF0Q6WBC4Y2Y6RQWEGN3DTDD5Y7S0NY u3)
(map-set mint-passes 'SP16AG2XE83DB2CX396NS2FZTM6PY253MRR6SMYBP u3)
(map-set mint-passes 'SPDAV1G8FQ0TMEWKVE0A9WS8RNDJ7K808X2MY22E u3)
(map-set mint-passes 'SP4CFPJA53W1VHVZ6WJ00G1M4CAX904PZ8EAAY03 u3)
(map-set mint-passes 'SP20E0RC1NWFVD6A2QC8Z4CTWK7X5FKFCB6M6P6W4 u3)
(map-set mint-passes 'SP19VVDHN69J1SEE1VERVEVB0X8NH2AHPWW9VG0P6 u3)
(map-set mint-passes 'SP2MMF30WNFRQRB3H6PKZR07BA5W4YQ6XY2JF8X5R u3)
(map-set mint-passes 'SP39XMB07QV4KN4PB6X3KHNQKWARB0F9AXY6K41E0 u3)
(map-set mint-passes 'SP1FKBR4Z283A3TRF1612GG0EPC921S17FNSK3VGN u3)
(map-set mint-passes 'SP2F18PH7FP22EHS0J0X3A6EFZ9PAW0EZJRET0GXZ u3)
(map-set mint-passes 'SPS46Q8P75FGWDX11JNVER71R90VD5MV45XA5X1B u3)
(map-set mint-passes 'SPXQS1T1T2BKGSHH8H75PVFEY0R1X39F0B3MQWTJ u3)
(map-set mint-passes 'SPBN3J1JST1K4MEZXZMV95ZXNBGMMKFZGJKY7VVC u3)
(map-set mint-passes 'SP2PJRW6HTS0YF5AKAY8V3XTX6X3G2FTD5DQGQ41C u3)
(map-set mint-passes 'SP9227STGNCZPRTP2T2G3S02M7XB5ENAQB1J82FA u3)
(map-set mint-passes 'SP2V1FAZ3ZX1N3MMR7W4TJQSGV0SV7MX5J7FPYJXY u3)
(map-set mint-passes 'SP31WTJ415SNJM9H6202S3WK9AFQXQZMT48PESBQE u3)
(map-set mint-passes 'SPM1Q7YG18378H6W254YN8PABEVRPT38ZCY01SJD u3)
(map-set mint-passes 'SP26DZT4SYGQQWNSE6818DEEPK2GVZA3MT6EGN2HP u3)
(map-set mint-passes 'SP104CM671E70B0H4N6NJJKZ5JZZY5V6SWATZEFB5 u3)
(map-set mint-passes 'SP223QGRP81XNHPJKCYNR3X3QWF3ZG799TZ9PYXFS u3)
(map-set mint-passes 'SPYWT3H4JQG72G0PVZW4E2M6FAK997KN6PDC26GM u3)
(map-set mint-passes 'SP3MNY78PJ3S71D405QK86Z4G06RSFZY1J9421HVG u3)
(map-set mint-passes 'SP3XFN7YK7FQSG4BTH2YJJ4EMQXSTD2F8JWZY30V5 u3)
(map-set mint-passes 'SP28EM1AXBEG7Y0M7JCCAD67HY4YMCRFZGYAADNFW u3)
(map-set mint-passes 'SP2YTGQK34RX0G1GAKTRQN8W33CGJQ3F2PKTKE2PZ u3)
(map-set mint-passes 'SP3YDKTXXDNE6MR64YDW494N39PB7S796M8EC4GEB u3)
(map-set mint-passes 'SPZVJZANF97Y2Y365S1Q2G41Y8KJA62F4ZMGCJFW u3)
(map-set mint-passes 'SP14BDFQKCSSEAQM3MVDAWS0TRKWQTD2K0YYYYM6J u3)
(map-set mint-passes 'SP237EPT05RSS6H1GKP3GZ4MMQ9XZF2P4VDFH3MJE u3)
(map-set mint-passes 'SP2XJCFE0MZB33AAP91ZY8TXJ03HMXCJPJD71AJCM u3)
(map-set mint-passes 'SP8YCWS0AN20E5JDRXKTS4FPDGK9A4PE2T89RNVX u3)
(map-set mint-passes 'SPQY88E87FNMP1NTY2YQ7X5DPTVY810PS8T6D2Y3 u3)
(map-set mint-passes 'SP6HYDNWHSSTZFS0HAR4FDRPXK3EK603S0BYJHFJ u3)
(map-set mint-passes 'SP3MFZ67931HZHTQ9470VCN9MSD2X25EEHVMP0V4F u3)
(map-set mint-passes 'SP3ZVD6M7P4Z7YQ8PJV0J9D6PSDVXADNY7N6XXAHA u3)
(map-set mint-passes 'SP2QVAXHB90CTJ8TDJWTZ7B1TZCYB2MNH3JMW02H4 u3)
(map-set mint-passes 'SP2RWS7D7RW6DDZCTXJC0VTK86CKD0TF445116V8A u3)
(map-set mint-passes 'SP3Z7511VWR5WG9J3MAKER3NRZYKWT83K2XTP36EV u3)
(map-set mint-passes 'SP13473ZZ772R27F6MK7B8MZ92P3G1PP239RTPA4K u3)
(map-set mint-passes 'SP2YS6C13W229S7HA8HC3CF8VH3WN9X8EW9ZQRZ89 u3)
(map-set mint-passes 'SP1ZHVKGVT1KZETT4J9CGYXZE9D20N375V4M323SQ u3)
(map-set mint-passes 'SP2MJTATHW8EE7XW2JJ1X595GHBTYPXMMV7B3727K u3)
(map-set mint-passes 'SP2ZGVSV6JDJ6SCGJETE3ZT0PNRSB90FM01P830D4 u3)
(map-set mint-passes 'SP1P7Q0DV9RN8PDXXZYBB19276BSG67APCGC9971N u3)
(map-set mint-passes 'SP2REW9BF7CY2BCGV2S6639RA2ATT7ZBHTDTKRV6P u3)
(map-set mint-passes 'SP158TMAGWXVDFG1J59Z6F465T6JN3CHY56PSY0HB u3)
(map-set mint-passes 'SP2KDYP0QYJYNTYTA9MNF0K41SCKXJWGT4WMFCBVG u3)
(map-set mint-passes 'SP3QD9EVZB3E7E7Z3FWH7KBDH5RZWA4PYHSQ0FGTQ u3)
(map-set mint-passes 'SP25GF7GJF4442NB3KDK835VV0RE1PZ8MYB85GDEY u3)
(map-set mint-passes 'SP1TWJ067A66J0WG0CM7TXJMHD3SG0A9JEYKNDSFD u3)
(map-set mint-passes 'SPPZ2SNVDBKSHZDQ2HBBVMB5HEHAXRC3T8CQ35EA u3)
(map-set mint-passes 'SPJC3DADS6C97FDYBB2GCK4HKS866NK7JK8HHT7T u3)
(map-set mint-passes 'SP1GR33848GSTMFR955Z77DAB835XYE9FZG19Y7NX u3)
(map-set mint-passes 'SP2JPSWFTEP5XMNSW2YCCCH4JRSA4SPV95BJVT938 u3)
(map-set mint-passes 'SP3ADNFV3QM8QWT03D12TE5KHSP12T0KDX64ZYC8C u3)
;; Airdrop
(define-public (admin-airdrop)
  (let
    (
      (last-nft-id (var-get last-id))
    )
    (begin
      (asserts! (is-eq tx-sender DEPLOYER) (err ERR-NOT-AUTHORIZED))
      (asserts! (is-eq false (var-get airdrop-called)) (err ERR-AIRDROP-CALLED))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u0) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u1) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u2) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u3) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u4) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u5) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u6) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u7) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u8) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u9) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u10) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u11) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u12) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u13) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u14) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u15) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u16) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u17) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u18) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u19) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u20) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u21) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u22) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u23) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u24) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u25) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u26) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u27) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u28) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u29) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u30) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u31) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u32) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u33) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u34) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u35) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u36) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u37) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))
      (try! (nft-mint? bitcoin-boards (+ last-nft-id u38) 'SP37BST2H0XN49KM606ND31YZPE7YBZ4D84QCT3Z9))

      

      (var-set last-id (+ last-nft-id u39))
      (var-set airdrop-called true)
      (ok true))))