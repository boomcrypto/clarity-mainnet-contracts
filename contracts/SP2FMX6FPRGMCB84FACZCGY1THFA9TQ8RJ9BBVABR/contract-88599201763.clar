(impl-trait 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.sip-010-trait-ft-standard.sip-010-trait)

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-token-owner (err u101))

;; No maximum supply!
(define-fungible-token cococ)

(define-data-var token-name (string-ascii 32) "Coco Boss You")
(define-data-var token-symbol (string-ascii 10) "cococ-boss")

(define-public (set-name (new-name (string-ascii 32)))
  (begin
    (ok (var-set token-name new-name))))

(define-public (set-symbol (new-symbol (string-ascii 10)))
  (begin
    (ok (var-set token-symbol new-symbol))))

(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
  (begin
     (asserts! (is-eq tx-sender sender) err-not-token-owner)
     (try! (ft-transfer? cococ amount sender recipient))
     (match memo to-print (print to-print) 0x)
     (ok true)))

(define-read-only (get-name)
  (ok (var-get token-name)))

(define-read-only (get-symbol)
  (ok (var-get token-symbol)))

(define-read-only (get-decimals)
  (ok u0))

(define-read-only (get-balance (who principal))
  (ok (ft-get-balance cococ who)))

(define-read-only (get-total-supply)
  (ok (ft-get-supply cococ)))

(define-read-only (get-token-uri)
  (ok none))

(define-public (mint (amount uint) (recipient principal))
  (begin
     (asserts! (is-eq tx-sender contract-owner) err-owner-only)
     (ft-mint? cococ amount recipient)))