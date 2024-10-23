(impl-trait .trait-sip-010-configurable.sip-010-trait)
(define-constant ERR-NOT-AUTHORIZED (err u1000))
(define-constant ERR-NOT-INITIALIZED (err u1001))
(define-constant ERR-ALREADY-INITIALIZED (err u1002))
(define-constant ERR-NOT-SUPPORTED (err u1003))
(define-constant ONE_8 u100000000)
(define-fungible-token token-43)
(define-constant token-decimals u8)
(define-data-var token-name (string-ascii 32) "")
(define-data-var token-symbol (string-ascii 32) "")
(define-data-var token-uri (optional (string-utf8 256)) (some u""))
(define-map approved-contracts principal bool)
(define-data-var initialized bool false)
(define-read-only (is-dao-or-extension)
    (ok (asserts! (or (is-eq tx-sender .executor-dao) (contract-call? .executor-dao is-extension contract-caller)) ERR-NOT-AUTHORIZED)))
(define-read-only (get-name)
	(ok (var-get token-name)))
(define-read-only (get-symbol)
	(ok (var-get token-symbol)))
(define-read-only (get-decimals)
	(ok token-decimals))
(define-read-only (get-balance (who principal))
	(ok (ft-get-balance token-43 who)))
(define-read-only (get-total-supply)
	(ok (ft-get-supply token-43)))
(define-read-only (get-token-uri)
	(ok (var-get token-uri)))
(define-read-only (get-total-supply-fixed)
  (get-total-supply))
(define-read-only (get-balance-fixed (account principal))
  (get-balance account))
(define-read-only (get-approved-contract-or-default (operator principal))
	(default-to false (map-get? approved-contracts operator)))
(define-public (set-approved-contract (operator principal) (approved bool))
	(begin
		(try! (is-dao-or-extension))
		(ok (map-set approved-contracts operator approved))))
(define-public (initialize (name (string-ascii 32)) (symbol (string-ascii 32)) (uri (optional (string-utf8 256))) (max-supply uint))
	(begin
		(asserts! (get-approved-contract-or-default tx-sender) ERR-NOT-AUTHORIZED)
		(asserts! (not (var-get initialized)) ERR-ALREADY-INITIALIZED)
		(var-set token-name name)
		(var-set token-symbol symbol)
		(var-set token-uri uri)
		(var-set initialized true)
		(try! (ft-mint? token-43 max-supply tx-sender))
		(ok true)))
(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
    (begin
        (asserts! (or (is-eq sender tx-sender) (is-eq sender contract-caller)) ERR-NOT-AUTHORIZED)
				(asserts! (var-get initialized) ERR-NOT-INITIALIZED)
        (try! (ft-transfer? token-43 amount sender recipient))
        (match memo to-print (print to-print) 0x)
        (ok true)))
(define-public (transfer-many (recipients (list 200 { amount: uint, to: principal})))
	(fold transfer-many-iter recipients (ok true)))	
(define-public (transfer-fixed (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
  (transfer amount sender recipient memo))
(define-public (transfer-fixed-many (recipients (list 200 { amount: uint, to: principal})))
	(transfer-many recipients))
(define-public (mint (amount uint) (recipient principal))
  ERR-NOT-SUPPORTED)
(define-public (burn (amount uint) (sender principal))
  ERR-NOT-SUPPORTED)
(define-public (mint-fixed (amount uint) (recipient principal))
  ERR-NOT-SUPPORTED)
(define-public (burn-fixed (amount uint) (sender principal))
  ERR-NOT-SUPPORTED)
(define-private (transfer-many-iter (recipient { amount: uint, to: principal }) (previous-response (response bool uint)))
	(match previous-response prev-ok (transfer (get amount recipient) tx-sender (get to recipient) none) prev-err previous-response))