;; SCS constants
(define-constant SCS_RATIO_BASE u293758009048)
(define-constant SCS_STX_MULTIPLIER u90711607748)
(define-constant SCS_SCHA_MULTIPLIER u982604817795)

;; WCS constants
(define-constant WCS_RATIO_BASE u80489226083)
(define-constant WCS_STX_MULTIPLIER u24022473965)
(define-constant WCS_WCHA_MULTIPLIER u282617340771)

(define-read-only (calculate-ratio (value-1 uint) (value-2 uint) (value-3 uint) (ratio-base uint))
  (let
    (
      (total (+ value-1 value-2 value-3))
      (ratio (/ (* total u1000000) ratio-base))  ;; Multiply by 1000000 for precision
    )
    ratio
  )
)

(define-read-only (calculate-result (ratio uint) (multiplier uint))
  (/ (* ratio multiplier) u1000000)
)

(define-public (check-lp (user-address principal))
  (let
    (
      ;; SCS calculations
      (scs-lands-lp (contract-call? .lp-balance-checker scs-lands-lp-checker user-address))
      (scs-user-lp (contract-call? .lp-balance-checker scs-user-lp-checker user-address))
      (scs-velar-lp (contract-call? .lp-balance-checker scs-velar-lp-checker user-address))
      (scs-ratio (calculate-ratio scs-lands-lp scs-user-lp (get end scs-velar-lp) SCS_RATIO_BASE))
      (scs-stx-result (calculate-result scs-ratio SCS_STX_MULTIPLIER))
      (scs-scha-result (calculate-result scs-ratio SCS_SCHA_MULTIPLIER))
      
      ;; WCS calculations
      (wcs-lands-lp (contract-call? .lp-balance-checker wcs-lands-lp-checker user-address))
      (wcs-user-lp (contract-call? .lp-balance-checker wcs-user-lp-checker user-address))
      (wcs-velar-lp (contract-call? .lp-balance-checker wcs-velar-lp-checker user-address))
      (wcs-ratio (calculate-ratio wcs-lands-lp wcs-user-lp (get end wcs-velar-lp) WCS_RATIO_BASE))
      (wcs-stx-result (calculate-result wcs-ratio WCS_STX_MULTIPLIER))
      (wcs-wcha-result (calculate-result wcs-ratio WCS_WCHA_MULTIPLIER))
    )
    (ok {
      scs: {
        lands-lp: scs-lands-lp,
        user-lp: scs-user-lp,
        velar-lp: scs-velar-lp,
        stx: scs-stx-result,
        scha: scs-scha-result
      },
      wcs: {
        lands-lp: wcs-lands-lp,
        user-lp: wcs-user-lp,
        velar-lp: wcs-velar-lp,
        stx: wcs-stx-result,
        wcha: wcs-wcha-result
      }
    })
  )
)