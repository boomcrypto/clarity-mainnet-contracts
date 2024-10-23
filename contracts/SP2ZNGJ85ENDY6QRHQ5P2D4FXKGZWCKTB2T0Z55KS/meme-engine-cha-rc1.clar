;; Charisma Meme Engine
;;
;; This contract implements the core energy generation mechanism of the Charisma protocol.
;; It calculates energy output based on users' token balance history, utilizing integral
;; calculus for accurate and fair representation of token holding over time. The contract
;; incorporates dynamic multipliers to adjust energy generation based on token-specific
;; factors and protocol incentives.
;;
;; Key Components:
;; 1. Balance Integral Calculation: Uses trapezoidal rule to approximate the integral
;;    of user's token balance over time, providing a time-weighted measure of token holding.
;; 2. Dynamic Sample Point Generation: Adapts the number of sample points based on the
;;    time period, managed by the Meme Engine Manager for consistency across all engines.
;; 3. Energy Output Calculation: Combines balance integral with quality and incentive
;;    scores, normalized by circulating supply.
;; 4. Interaction with Charisma Ecosystem: Integrates with Arcana for quality scores,
;;    Aura for incentive scores, and the Energy contract for minting.
;;
;; Core Functions:
;; - tap: Main entry point for users to generate energy based on their token holding.
;; - calculate-balance-integral: Computes the balance integral using appropriate sample points.
;; - get-balance: Retrieves token balance at specific blocks, handling historical data.
;;
;; Integration with Charisma Protocol:
;; - Implements the engine-trait defined in dao-traits-v6.
;; - Utilizes the Meme Engine Manager for shared parameters and sample point generation.
;; - Interacts with token-specific contracts (e.g., .charisma-token) for balance checks.
;; - Calls Arcana and Aura contracts for dynamic multipliers.
;;
;; Security and Efficiency:
;; - Non-custodial: Users retain control of their tokens while participating.
;; - Retroactive Calculation: Fairly rewards users based on historical holding patterns.
;; - Scalable: Can be adapted for various tokens in the Charisma ecosystem.
;;
;; This contract is a crucial component of the Charisma protocol, enabling
;; a novel approach to "stake-less staking" and forming the foundation for
;; diverse applications in DeFi, GameFi, and beyond.

;; Traits
(impl-trait .dao-traits-v6.engine-trait)

;; Constants
(define-constant ERR_UNAUTHORIZED (err u401))
(define-constant ERR_INVALID_CLIENT (err u403))

;; Data Variables
(define-data-var first-start-block uint block-height)

;; Maps
(define-map last-tap-block principal uint)

;; Hold-to-Earn functions

(define-private (get-balance (data { address: principal, block: uint }))
    (let
        ((target-block (get block data)))
        (if (< target-block block-height)
            (let
                ((block-hash (unwrap-panic (get-block-info? id-header-hash target-block))))
                (at-block block-hash (unwrap-panic (contract-call? .charisma-token get-balance (get address data))))
            )
            (unwrap-panic (contract-call? .charisma-token get-balance (get address data)))
        )
    )
)

(define-private (calculate-trapezoid-areas-39 (balances (list 39 uint)) (dx uint))
    (list
        (/ (* (+ (unwrap-panic (element-at balances u0)) (unwrap-panic (element-at balances u1))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u1)) (unwrap-panic (element-at balances u2))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u2)) (unwrap-panic (element-at balances u3))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u3)) (unwrap-panic (element-at balances u4))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u4)) (unwrap-panic (element-at balances u5))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u5)) (unwrap-panic (element-at balances u6))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u6)) (unwrap-panic (element-at balances u7))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u7)) (unwrap-panic (element-at balances u8))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u8)) (unwrap-panic (element-at balances u9))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u9)) (unwrap-panic (element-at balances u10))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u10)) (unwrap-panic (element-at balances u11))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u11)) (unwrap-panic (element-at balances u12))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u12)) (unwrap-panic (element-at balances u13))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u13)) (unwrap-panic (element-at balances u14))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u14)) (unwrap-panic (element-at balances u15))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u15)) (unwrap-panic (element-at balances u16))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u16)) (unwrap-panic (element-at balances u17))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u17)) (unwrap-panic (element-at balances u18))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u18)) (unwrap-panic (element-at balances u19))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u19)) (unwrap-panic (element-at balances u20))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u20)) (unwrap-panic (element-at balances u21))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u21)) (unwrap-panic (element-at balances u22))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u22)) (unwrap-panic (element-at balances u23))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u23)) (unwrap-panic (element-at balances u24))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u24)) (unwrap-panic (element-at balances u25))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u25)) (unwrap-panic (element-at balances u26))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u26)) (unwrap-panic (element-at balances u27))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u27)) (unwrap-panic (element-at balances u28))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u28)) (unwrap-panic (element-at balances u29))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u29)) (unwrap-panic (element-at balances u30))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u30)) (unwrap-panic (element-at balances u31))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u31)) (unwrap-panic (element-at balances u32))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u32)) (unwrap-panic (element-at balances u33))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u33)) (unwrap-panic (element-at balances u34))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u34)) (unwrap-panic (element-at balances u35))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u35)) (unwrap-panic (element-at balances u36))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u36)) (unwrap-panic (element-at balances u37))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u37)) (unwrap-panic (element-at balances u38))) dx) u2)
    )
)

(define-private (calculate-trapezoid-areas-19 (balances (list 19 uint)) (dx uint))
    (list
        (/ (* (+ (unwrap-panic (element-at balances u0)) (unwrap-panic (element-at balances u1))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u1)) (unwrap-panic (element-at balances u2))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u2)) (unwrap-panic (element-at balances u3))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u3)) (unwrap-panic (element-at balances u4))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u4)) (unwrap-panic (element-at balances u5))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u5)) (unwrap-panic (element-at balances u6))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u6)) (unwrap-panic (element-at balances u7))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u7)) (unwrap-panic (element-at balances u8))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u8)) (unwrap-panic (element-at balances u9))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u9)) (unwrap-panic (element-at balances u10))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u10)) (unwrap-panic (element-at balances u11))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u11)) (unwrap-panic (element-at balances u12))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u12)) (unwrap-panic (element-at balances u13))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u13)) (unwrap-panic (element-at balances u14))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u14)) (unwrap-panic (element-at balances u15))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u15)) (unwrap-panic (element-at balances u16))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u16)) (unwrap-panic (element-at balances u17))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u17)) (unwrap-panic (element-at balances u18))) dx) u2)
    )
)

(define-private (calculate-trapezoid-areas-9 (balances (list 9 uint)) (dx uint))
    (list
        (/ (* (+ (unwrap-panic (element-at balances u0)) (unwrap-panic (element-at balances u1))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u1)) (unwrap-panic (element-at balances u2))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u2)) (unwrap-panic (element-at balances u3))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u3)) (unwrap-panic (element-at balances u4))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u4)) (unwrap-panic (element-at balances u5))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u5)) (unwrap-panic (element-at balances u6))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u6)) (unwrap-panic (element-at balances u7))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u7)) (unwrap-panic (element-at balances u8))) dx) u2)
    )
)

(define-private (calculate-trapezoid-areas-5 (balances (list 5 uint)) (dx uint))
    (list
        (/ (* (+ (unwrap-panic (element-at balances u0)) (unwrap-panic (element-at balances u1))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u1)) (unwrap-panic (element-at balances u2))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u2)) (unwrap-panic (element-at balances u3))) dx) u2)
        (/ (* (+ (unwrap-panic (element-at balances u3)) (unwrap-panic (element-at balances u4))) dx) u2)
    )
)

(define-private (calculate-trapezoid-areas-2 (balances (list 2 uint)) (dx uint))
    (list
        (/ (* (+ (unwrap-panic (element-at balances u0)) (unwrap-panic (element-at balances u1))) dx) u2)
    )
)

(define-private (calculate-balance-integral-39 (address principal) (start-block uint) (end-block uint))
    (let
        (
            (sample-points (contract-call? .meme-engine-manager-rc1 generate-sample-points-39 address start-block end-block))
            (balances (map get-balance sample-points))
            (dx (/ (- end-block start-block) u38))
            (areas (calculate-trapezoid-areas-39 balances dx))
        )
        (fold + areas u0)
    )
)

(define-private (calculate-balance-integral-19 (address principal) (start-block uint) (end-block uint))
    (let
        (
            (sample-points (contract-call? .meme-engine-manager-rc1 generate-sample-points-19 address start-block end-block))
            (balances (map get-balance sample-points))
            (dx (/ (- end-block start-block) u18))
            (areas (calculate-trapezoid-areas-19 balances dx))
        )
        (fold + areas u0)
    )
)

(define-private (calculate-balance-integral-9 (address principal) (start-block uint) (end-block uint))
    (let
        (
            (sample-points (contract-call? .meme-engine-manager-rc1 generate-sample-points-9 address start-block end-block))
            (balances (map get-balance sample-points))
            (dx (/ (- end-block start-block) u8))
            (areas (calculate-trapezoid-areas-9 balances dx))
        )
        (fold + areas u0)
    )
)

(define-private (calculate-balance-integral-5 (address principal) (start-block uint) (end-block uint))
    (let
        (
            (sample-points (contract-call? .meme-engine-manager-rc1 generate-sample-points-5 address start-block end-block))
            (balances (map get-balance sample-points))
            (dx (/ (- end-block start-block) u4))
            (areas (calculate-trapezoid-areas-5 balances dx))
        )
        (fold + areas u0)
    )
)

(define-private (calculate-balance-integral-2 (address principal) (start-block uint) (end-block uint))
    (let
        (
            (sample-points (contract-call? .meme-engine-manager-rc1 generate-sample-points-2 address start-block end-block))
            (balances (map get-balance sample-points))
            (dx (/ (- end-block start-block) u1))
            (areas (calculate-trapezoid-areas-2 balances dx))
        )
        (fold + areas u0)
    )
)

(define-read-only (get-last-tap-block (address principal))
    (default-to (var-get first-start-block) (map-get? last-tap-block address))
)

(define-private (calculate-balance-integral (address principal) (start-block uint) (end-block uint))
    (let
        (
            (block-difference (- end-block start-block))
            (thresholds (unwrap-panic (contract-call? .meme-engine-manager-rc1 get-thresholds)))
        )
        (if (>= block-difference (get threshold-39-point thresholds))
            (ok (calculate-balance-integral-39 address start-block end-block))
            (if (>= block-difference (get threshold-19-point thresholds))
                (ok (calculate-balance-integral-19 address start-block end-block))
                (if (>= block-difference (get threshold-9-point thresholds))
                    (ok (calculate-balance-integral-9 address start-block end-block))
                    (if (>= block-difference (get threshold-5-point thresholds))
                        (ok (calculate-balance-integral-5 address start-block end-block))
                        (ok (calculate-balance-integral-2 address start-block end-block))
                    )
                )
            )
        )
    )
)

(define-public (tap)
  (let
    (
      (end-block block-height)
      (start-block (get-last-tap-block tx-sender))
      (balance-integral (unwrap-panic (calculate-balance-integral tx-sender start-block end-block)))
      (quality-score (contract-call? .arcana get-quality-score .charisma-token))
      (incentive-score (contract-call? .aura get-incentive-score .charisma-token))
      (circulating-supply (contract-call? .arcana get-circulating-supply .charisma-token))
      (energy-output (/ (* (* balance-integral quality-score) incentive-score) circulating-supply))
    )
    (asserts! (contract-call? .meme-engine-manager-rc1 is-enabled-client contract-caller) ERR_INVALID_CLIENT)
    (map-set last-tap-block tx-sender end-block)
    (try! (contract-call? .energy mint energy-output tx-sender))
    (ok {
      tapper: tx-sender,
      end-block: end-block, 
      start-block: start-block, 
      balance-integral: balance-integral, 
      quality-score: quality-score, 
      incentive-score: incentive-score,
      circulating-supply: circulating-supply, 
      energy-output: energy-output
    })
  )
)