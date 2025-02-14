
;; Administrative subroutines for wannabe contracts

;;
;; =========
;; CONSTANTS
;; =========
;;
(define-constant contract-owner tx-sender)

;;
;; ERROR DEFINITIONS
;;

;; Invocation not allowed in given context (i.e. restricted 
;; to owner)
(define-constant err-forbidden (err u403))

;; Operator for this contract hasn't been set
(define-constant err-operator-unset (err u1001))
(define-constant err-invalid-signature (err u1002))

;;
;; ==================
;; DATA MAPS AND VARS
;; ==================
;;

(define-data-var operator (optional principal) none)

;;
;; =================
;; PRIVATE FUNCTIONS
;; =================
;;
(define-private (byte-at (value uint) (index uint))
    (let
        (
         (bytes
          (list 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08
                0x09 0x0a 0x0b 0x0c 0x0d 0x0e 0x0f 0x10 0x11
                0x12 0x13 0x14 0x15 0x16 0x17 0x18 0x19 0x1a
                0x1b 0x1c 0x1d 0x1e 0x1f 0x20 0x21 0x22 0x23
                0x24 0x25 0x26 0x27 0x28 0x29 0x2a 0x2b 0x2c
                0x2d 0x2e 0x2f 0x30 0x31 0x32 0x33 0x34 0x35
                0x36 0x37 0x38 0x39 0x3a 0x3b 0x3c 0x3d 0x3e
                0x3f 0x40 0x41 0x42 0x43 0x44 0x45 0x46 0x47
                0x48 0x49 0x4a 0x4b 0x4c 0x4d 0x4e 0x4f 0x50
                0x51 0x52 0x53 0x54 0x55 0x56 0x57 0x58 0x59
                0x5a 0x5b 0x5c 0x5d 0x5e 0x5f 0x60 0x61 0x62
                0x63 0x64 0x65 0x66 0x67 0x68 0x69 0x6a 0x6b
                0x6c 0x6d 0x6e 0x6f 0x70 0x71 0x72 0x73 0x74
                0x75 0x76 0x77 0x78 0x79 0x7a 0x7b 0x7c 0x7d
                0x7e 0x7f 0x80 0x81 0x82 0x83 0x84 0x85 0x86
                0x87 0x88 0x89 0x8a 0x8b 0x8c 0x8d 0x8e 0x8f
                0x90 0x91 0x92 0x93 0x94 0x95 0x96 0x97 0x98
                0x99 0x9a 0x9b 0x9c 0x9d 0x9e 0x9f 0xa0 0xa1
                0xa2 0xa3 0xa4 0xa5 0xa6 0xa7 0xa8 0xa9 0xaa
                0xab 0xac 0xad 0xae 0xaf 0xb0 0xb1 0xb2 0xb3
                0xb4 0xb5 0xb6 0xb7 0xb8 0xb9 0xba 0xbb 0xbc
                0xbd 0xbe 0xbf 0xc0 0xc1 0xc2 0xc3 0xc4 0xc5
                0xc6 0xc7 0xc8 0xc9 0xca 0xcb 0xcc 0xcd 0xce
                0xcf 0xd0 0xd1 0xd2 0xd3 0xd4 0xd5 0xd6 0xd7
                0xd8 0xd9 0xda 0xdb 0xdc 0xdd 0xde 0xdf 0xe0
                0xe1 0xe2 0xe3 0xe4 0xe5 0xe6 0xe7 0xe8 0xe9
                0xea 0xeb 0xec 0xed 0xee 0xef 0xf0 0xf1 0xf2
                0xf3 0xf4 0xf5 0xf6 0xf7 0xf8 0xf9 0xfa 0xfb
                0xfc 0xfd 0xfe 0xff )
           )
         )
      (unwrap-panic
       (element-at bytes (mod (/ value (pow u256 index)) u256))
       )
    )
  )

(define-private (uint-to-buff (val uint))
      (concat
       (byte-at val u0)
       (concat
        (byte-at val u1)
        (concat
         (byte-at val u2)
         (concat 
          (byte-at val u3)
          (concat 
           (byte-at val u4)
           (concat 
            (byte-at val u5)
            (concat
             (byte-at val u6)
             (concat
              (byte-at val u7)
              (concat
               (byte-at val u8)
               (concat
                (byte-at val u9)
                (concat
                 (byte-at val u10)
                 (concat
                  (byte-at val u11)
                  (concat
                   (byte-at val u12)
                   (concat
                    (byte-at val u13)
                    (concat
                     (byte-at val u14)
                     (byte-at val u15)
                     )))))))))))))))
  )
    
(define-private (concat-buff (a (optional (buff 800))) 
                             (b (optional (buff 800))))
    (match b
           val (some (unwrap-panic (as-max-len? 
                                    (concat val
                                            (unwrap-panic a) 
                                            ) u800)))
           a))

(define-private (make-optional (val (buff 225)))
    (some val))

(define-private (verify-signature-internal
                 (operator-sig (buff 65))
                 (sender-pk (buff 33))
                 (argbuff (buff 800)))
    (let (
          (sender (unwrap! (principal-of? sender-pk)
                           err-invalid-signature))
          (msgbuff (unwrap-panic (as-max-len?
                                  (concat sender-pk argbuff)
                                  u800)))
          (msghash (sha256 msgbuff))
          (operator-pk (unwrap! 
                        (secp256k1-recover? msghash
                                            operator-sig)
                        err-invalid-signature))
          (operator-principal (unwrap! 
                               (principal-of? operator-pk)
                               err-invalid-signature))
          (cop (unwrap! (var-get operator)
                        err-operator-unset))
          )

      (if (and (is-eq sender tx-sender)
               (is-eq operator-principal cop))
          (ok true)
          err-invalid-signature
      )
  )
)


(define-private (utf8-to-buff (val (string-utf8 150)))
    (to-consensus-buff? val))
(define-private (ascii-to-buff (val (string-ascii 256)))
    (to-consensus-buff? val))


;;
;; ================
;; PUBLIC FUNCTIONS
;; ================
;;

;;
;; Assertion which fails unless transaction is initiated
;; by the operator. Should be used in contract functions
;; that can only be called by operator.
(define-read-only (assert-invoked-by-operator)
    (ok (asserts! (is-eq (unwrap! (var-get operator) 
                                  err-operator-unset)
                         tx-sender) err-forbidden)
        )
  )

(define-read-only (get-operator)
    (ok (var-get operator)))

;;
;; Used to set new operator account. Operator represents
;; backend service, maintains payout pools and authorizes
;; payouts.
;;
;; Arguments:
;; - new-operator: operator principal
;;
;; Setting operator to none (a default) will render 
;; operator-dependent features defunct.
;; 
;; Security:
;; - can only be called by contract deployer
(define-public (set-operator 
                (new-operator (optional principal)))
    (if (is-eq tx-sender contract-owner)
        (if (is-eq (var-get operator) new-operator)
            (ok false)
            (ok (var-set operator new-operator)))
        err-forbidden))

;;
;;
;; Verify if the argument list signatures are correct
;;
;; Signature is correct if operator-sig is a valid signature
;; placed by operator over sha256  hash of sender-pk and 
;; argument list.
;;
;; Returns: (ok true) if verification was successful
;;          (err u1001) if operator principal is not set
;;          (err u1002) in case of verification failure
(define-read-only (verify-signature
                   (operator-sig (buff 65))
                   (sender-pk (buff 33))
                   (args (list 26 uint)))
    (let (
          (argbuff (unwrap-panic
                        (fold concat-buff
                              (map make-optional 
                                   (map uint-to-buff args))
                              none)))
      )

      (verify-signature-internal operator-sig sender-pk argbuff)
      )
)

(define-read-only (verify-signature-string
                   (operator-sig (buff 65))
                   (sender-pk (buff 33))
                   (utf8-args (optional (list 10 (string-utf8 150))))
                   (ascii-args (optional (list 10 (string-ascii 256)))))
    (let (
          (argbuff  
           (match utf8-args
                  utf8vals 
                  (match ascii-args
                         asciivals
                         (concat-buff
                          (fold concat-buff (map utf8-to-buff utf8vals) none)
                          (fold concat-buff (map ascii-to-buff asciivals) none)
                          )
                         (fold concat-buff (map utf8-to-buff utf8vals) none)
                         )
                  (fold concat-buff 
                        (map ascii-to-buff (unwrap-panic ascii-args)) none)
                  )
            )
          )

      (verify-signature-internal operator-sig sender-pk (unwrap-panic argbuff))
      )
  )


(define-read-only (get-owner) contract-owner)