
;;  ---------------------------------------------------------
;; Welcome to the world of BONK Token, the ultimate community-owned meme coin on the Stacks blockchain! Born out of STXCITY's innovative bonding curve mechanism, BONK Token brings a whole new level of fun and engagement to the crypto space. Heres why youll want to be a part of the BONK revolution:
;; 
;;  Community-Driven and Fair Launch
;; BONK Token was launched with fairness and community in mind. No pre-mines, no shady dealsjust pure, unadulterated meme magic! Everyone had an equal shot at getting in on the ground floor, making BONK truly unruggable.
;; 
;;  Secure and Trustworthy
;; With its solid foundation on the Stacks blockchain, BONK Token offers a secure and transparent platform for all its holders. Say goodbye to rug pulls and hello to peace of mind. Your BONK is safe and sound!
;; 
;;  Social Layer and Community Vibes
;; BONK isn't just a token; its a vibrant social layer! Whether you're trading, sharing memes, or just hanging out in the community, BONK brings people together. Its the SOCIAL LAYER AND COMMUNITY MEME COIN OF STACKS, making crypto fun and accessible for everyone.
;; 
;;  Unleash the Power of the Bonding Curve
;; Thanks to STXCITY's bonding curve mechanism, BONK Token has a dynamic and fair pricing model. This ensures stability and growth potential, allowing the BONK community to thrive and bonk all the way to the moon!
;; 
;;  Get BONK'd!
;; Join the BONK pack and become part of the most exciting meme coin community on the Stacks blockchain. Trade, earn, and bonk your way to glory while enjoying the camaraderie of fellow BONKers.
;; 
;; SIP-10 Fungible Token Contract | Created on: stx.city/deploy
;; ---------------------------------------------------------

;; Errors 
(define-constant ERR-UNAUTHORIZED u401)
(define-constant ERR-NOT-OWNER u402)
(define-constant ERR-INVALID-PARAMETERS u403)
(define-constant ERR-NOT-ENOUGH-FUND u101)

(impl-trait 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.sip-010-trait-ft-standard.sip-010-trait)

;; Constants
(define-constant MAXSUPPLY u1000000000000000000)

;; Variables
(define-fungible-token BONK MAXSUPPLY)
(define-data-var contract-owner principal tx-sender) 



;; SIP-10 Functions
(define-public (transfer (amount uint) (from principal) (to principal) (memo (optional (buff 34))))
    (begin
        (asserts! (is-eq from tx-sender)
            (err ERR-UNAUTHORIZED))
        ;; Perform the token transfer
        (ft-transfer? BONK amount from to)
    )
)


;; DEFINE METADATA
(define-data-var token-uri (optional (string-utf8 256)) (some u"https://gaia.hiro.so/hub/1ACEm3pp11oooSiWry52LVXNYHLP8RQjaQ/bonk-8-decimals.json"))

(define-public (set-token-uri (value (string-utf8 256)))
    (begin
        (asserts! (is-eq tx-sender (var-get contract-owner)) (err ERR-UNAUTHORIZED))
        (var-set token-uri (some value))
        (ok (print {
              notification: "token-metadata-update",
              payload: {
                contract-id: (as-contract tx-sender),
                token-class: "ft"
              }
            })
        )
    )
)


(define-read-only (get-balance (owner principal))
  (ok (ft-get-balance BONK owner))
)
(define-read-only (get-name)
  (ok "bonk")
)

(define-read-only (get-symbol)
  (ok "BONK")
)

(define-read-only (get-decimals)
  (ok u8)
)

(define-read-only (get-total-supply)
  (ok (ft-get-supply BONK))
)

(define-read-only (get-token-uri)
  (ok (var-get token-uri))
)

;; transfer ownership
(define-public (transfer-ownership (new-owner principal))
  (begin
    ;; Checks if the sender is the current owner
    (if (is-eq tx-sender (var-get contract-owner))
      (begin
        ;; Sets the new owner
        (var-set contract-owner new-owner)
        ;; Returns success message
        (ok "Ownership transferred successfully"))
      ;; Error if the sender is not the owner
      (err ERR-NOT-OWNER)))
)


;; ---------------------------------------------------------
;; Utility Functions
;; ---------------------------------------------------------
(define-public (send-many (recipients (list 200 { to: principal, amount: uint, memo: (optional (buff 34)) })))
  (fold check-err (map send-token recipients) (ok true))
)

(define-private (check-err (result (response bool uint)) (prior (response bool uint)))
  (match prior ok-value result err-value (err err-value))
)

(define-private (send-token (recipient { to: principal, amount: uint, memo: (optional (buff 34)) }))
  (send-token-with-memo (get amount recipient) (get to recipient) (get memo recipient))
)

(define-private (send-token-with-memo (amount uint) (to principal) (memo (optional (buff 34))))
  (let ((transferOk (try! (transfer amount tx-sender to memo))))
    (ok transferOk)
  )
)

(define-private (send-stx (recipient principal) (amount uint))
  (begin
    (try! (stx-transfer? amount tx-sender recipient))
    (ok true) 
  )
)

;; ---------------------------------------------------------
;; Mint
;; ---------------------------------------------------------
(begin
    (try! (send-stx 'SP1FQ3DQDR5N9HJX3XC5DNKFCG4DHH48EFJQV6QH0 u3000000))
    (try! (ft-mint? BONK u999000000000000000 (var-get contract-owner)))
  (try! (ft-mint? BONK u1000000000000000 'SP1FQ3DQDR5N9HJX3XC5DNKFCG4DHH48EFJQV6QH0))
  
)
