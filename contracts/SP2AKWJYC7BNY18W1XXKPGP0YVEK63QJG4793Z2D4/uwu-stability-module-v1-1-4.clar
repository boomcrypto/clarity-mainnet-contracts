;; UWU STABILITY MODULE CONTRACT Version 1.1.4
;; UWU PROTOCOL Version 1.1.0

;; This file is part of UWU PROTOCOL.

;; UWU PROTOCOL is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; UWU PROTOCOL is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with UWU PROTOCOL. If not, see <http://www.gnu.org/licenses/>.

(use-trait ft-trait .sip-010-trait-ft-standard.sip-010-trait)

(define-constant ERR_NOT_AUTHORIZED (err u1001))
(define-constant ERR_INVALID_AMOUNT (err u1002))
(define-constant ERR_SWAP_STATUS (err u6001))
(define-constant ERR_INVALID_TOKEN (err u6002))
(define-constant ERR_TOKEN_NOT_APPROVED (err u6003))
(define-constant ERR_TOKEN_ALREADY_EXISTS (err u6004))
(define-constant ERR_MINIMUM_RECEIVED (err u6005))

(define-constant CONTRACT_OWNER tx-sender)

(define-constant BPS u10000)

(define-data-var swap-status bool true)
(define-data-var fee-address principal tx-sender)

(define-map tokens principal {approved: bool, factor: uint, x-fee: uint, y-fee: uint, rate: uint, oracle: principal, oracle-height: uint})

(define-read-only (get-swap-status)
  (ok (var-get swap-status))
)

(define-read-only (get-fee-address)
  (ok (var-get fee-address))
)

(define-read-only (get-token (token-trait <ft-trait>))
  (ok (map-get? tokens (contract-of token-trait)))
)

(define-read-only (get-dy (token-trait <ft-trait>) (amount uint))
  (let (
    (token-contract (contract-of token-trait))
    (token-data (unwrap! (map-get? tokens token-contract) ERR_INVALID_TOKEN))
    (rate (get rate token-data))
    (factor (get factor token-data))
    (fee-rate (get x-fee token-data))
    (fee (/ (* amount fee-rate) BPS))
    (dy (/ (* (- amount fee) factor) rate))
  )
    (begin
      (asserts! (is-eq (var-get swap-status) true) ERR_SWAP_STATUS)
      (asserts! (is-eq (get approved token-data) true) ERR_TOKEN_NOT_APPROVED)
      (asserts! (> amount u0) ERR_INVALID_AMOUNT)
      (ok dy)
    )
  )
)

(define-read-only (get-dx (token-trait <ft-trait>) (amount uint))
  (let (
    (token-contract (contract-of token-trait))
    (token-data (unwrap! (map-get? tokens token-contract) ERR_INVALID_TOKEN))
    (rate (get rate token-data))
    (factor (get factor token-data))
    (fee-rate (get y-fee token-data))
    (fee (/ (* amount fee-rate) BPS))
    (dx (/ (* (- amount fee) rate) factor))
  )
    (begin
      (asserts! (is-eq (var-get swap-status) true) ERR_SWAP_STATUS)
      (asserts! (is-eq (get approved token-data) true) ERR_TOKEN_NOT_APPROVED)
      (asserts! (> amount u0) ERR_INVALID_AMOUNT)
      (ok dx)
    )
  )
)

(define-public (set-swap-status (status bool))
  (let (
    (sender tx-sender)
  )
    (begin
      (asserts! (is-eq sender CONTRACT_OWNER) ERR_NOT_AUTHORIZED)
      (var-set swap-status status)
      (print {action: "set-swap-status", sender: sender, status: status})
      (ok true)
    )
  )
)

(define-public (set-fee-address (address principal))
  (let (
    (sender tx-sender)
  )
    (begin
      (asserts! (is-eq sender CONTRACT_OWNER) ERR_NOT_AUTHORIZED)
      (var-set fee-address address)
      (print {action: "set-fee-address", sender: sender, address: address})
      (ok true)
    )
  )
)

(define-public (add-token (token-trait <ft-trait>) (approved bool) (factor uint) (x-fee uint) (y-fee uint) (rate uint) (oracle principal))
  (let (
    (token-contract (contract-of token-trait))
    (token-data (map-get? tokens token-contract))
    (sender tx-sender)
  )
    (begin
      (asserts! (is-eq sender CONTRACT_OWNER) ERR_NOT_AUTHORIZED)
      (asserts! (is-none token-data) ERR_TOKEN_ALREADY_EXISTS)
      (asserts! (> rate u0) ERR_INVALID_AMOUNT)
      (asserts! (> factor u0) ERR_INVALID_AMOUNT)
      (asserts! (and (< x-fee BPS) (< y-fee BPS)) ERR_INVALID_AMOUNT)
      (map-set tokens token-contract {approved: approved, factor: factor, x-fee: x-fee, y-fee: y-fee, rate: rate, oracle: oracle, oracle-height: block-height,})
      (print {action: "add-token", sender: sender, token: token-contract, approved: approved, factor: factor, x-fee: x-fee, y-fee: y-fee, rate: rate, oracle: oracle, oracle-height: block-height})
      (ok true)
    )
  )
)

(define-public (remove-token (token-trait <ft-trait>))
  (let (
    (token-contract (contract-of token-trait))
    (token-data (unwrap! (map-get? tokens token-contract) ERR_INVALID_TOKEN))
    (sender tx-sender)
  )
    (begin
      (asserts! (is-eq sender CONTRACT_OWNER) ERR_NOT_AUTHORIZED)
      (map-delete tokens token-contract)
      (print {action: "remove-token", sender: sender, token: token-contract})
      (ok true)
    )
  )
)

(define-public (set-token-approved (token-trait <ft-trait>) (approved bool))
  (let (
    (token-contract (contract-of token-trait))
    (token-data (unwrap! (map-get? tokens token-contract) ERR_INVALID_TOKEN))
    (sender tx-sender)
  )
    (begin
      (asserts! (is-eq sender CONTRACT_OWNER) ERR_NOT_AUTHORIZED)
      (map-set tokens token-contract (merge {approved: approved} token-data))
      (print {action: "set-token-approved", sender: sender, token: token-contract, approved: approved})
      (ok true)
    )
  )
)

(define-public (set-token-factor (token-trait <ft-trait>) (factor uint))
  (let (
    (token-contract (contract-of token-trait))
    (token-data (unwrap! (map-get? tokens token-contract) ERR_INVALID_TOKEN))
    (sender tx-sender)
  )
    (begin
      (asserts! (is-eq sender CONTRACT_OWNER) ERR_NOT_AUTHORIZED)
      (asserts! (> factor u0) ERR_INVALID_AMOUNT)
      (map-set tokens token-contract (merge {factor: factor} token-data))
      (print {action: "set-token-factor", sender: sender, token: token-contract, factor: factor})
      (ok true)
    )
  )
)

(define-public (set-token-fees (token-trait <ft-trait>) (x-fee uint) (y-fee uint))
  (let (
    (token-contract (contract-of token-trait))
    (token-data (unwrap! (map-get? tokens token-contract) ERR_INVALID_TOKEN))
    (sender tx-sender)
  )
    (begin
      (asserts! (is-eq sender CONTRACT_OWNER) ERR_NOT_AUTHORIZED)
      (asserts! (and (< x-fee BPS) (< y-fee BPS)) ERR_INVALID_AMOUNT)
      (map-set tokens token-contract (merge {x-fee: x-fee, y-fee: y-fee} token-data))
      (print {action: "set-token-fees", sender: sender, token: token-contract, x-fee: x-fee, y-fee: y-fee})
      (ok true)
    )
  )
)

(define-public (set-token-rate (token-trait <ft-trait>) (rate uint))
  (let (
    (token-contract (contract-of token-trait))
    (token-data (unwrap! (map-get? tokens token-contract) ERR_INVALID_TOKEN))
    (oracle (get oracle token-data))
    (sender tx-sender)
  )
    (begin
      (asserts! (or (is-eq sender CONTRACT_OWNER) (is-eq sender oracle)) ERR_NOT_AUTHORIZED)
      (asserts! (> rate u0) ERR_INVALID_AMOUNT)
      (map-set tokens token-contract (merge {rate: rate, oracle-height: block-height} token-data))
      (print {action: "set-token-rate", sender: sender, token: token-contract, rate: rate, oracle: oracle, oracle-height: block-height})
      (ok true)
    )
  )
)

(define-public (set-token-oracle (token-trait <ft-trait>) (oracle principal))
  (let (
    (token-contract (contract-of token-trait))
    (token-data (unwrap! (map-get? tokens token-contract) ERR_INVALID_TOKEN))
    (sender tx-sender)
  )
    (begin
      (asserts! (or (is-eq sender CONTRACT_OWNER) (is-eq sender (get oracle token-data))) ERR_NOT_AUTHORIZED)
      (map-set tokens token-contract (merge {oracle: oracle} token-data))
      (print {action: "set-token-oracle", sender: sender, token: token-contract, oracle: oracle})
      (ok true)
    )
  )
)

(define-public (withdraw-reserve (token-trait <ft-trait>) (amount uint) (recipient principal))
  (let (
    (sender tx-sender)
  )
    (begin
      (asserts! (is-eq sender CONTRACT_OWNER) ERR_NOT_AUTHORIZED)
      (asserts! (> amount u0) ERR_INVALID_AMOUNT)
      (try! (as-contract (contract-call? token-trait transfer amount tx-sender recipient none)))
      (print {action: "withdraw-reserve", sender: sender, token: (contract-of token-trait), amount: amount, recipient: recipient})
      (ok amount)
    )
  )
)

(define-public (swap-x-for-y (token-trait <ft-trait>) (amount uint) (min-dy uint))
  (let (
    (token-contract (contract-of token-trait))
    (token-data (unwrap! (map-get? tokens token-contract) ERR_INVALID_TOKEN))
    (rate (get rate token-data))
    (factor (get factor token-data))
    (fee-rate (get x-fee token-data))
    (fee (/ (* amount fee-rate) BPS))
    (dy (/ (* (- amount fee) factor) rate))
    (sender tx-sender)
  )
    (begin
      (asserts! (is-eq (var-get swap-status) true) ERR_SWAP_STATUS)
      (asserts! (is-eq (get approved token-data) true) ERR_TOKEN_NOT_APPROVED)
      (asserts! (and (> amount u0) (> min-dy u0)) ERR_INVALID_AMOUNT)
      (asserts! (> dy min-dy) ERR_MINIMUM_RECEIVED)
      (try! (contract-call? .uwu-token-v1-1-0 transfer (- amount fee) sender (as-contract tx-sender) none))
      (if (> fee u0)
        (try! (contract-call? .uwu-token-v1-1-0 transfer fee sender (var-get fee-address) none))
        false
      )
      (try! (as-contract (contract-call? token-trait transfer dy tx-sender sender none)))
      (print {action: "swap-x-for-y", sender: sender, token: token-contract, amount: amount, dy: dy, min-dy: min-dy, fee: fee, fee-rate: fee-rate, rate: rate, factor: factor})
      (ok dy)
    )
  )
)

(define-public (swap-y-for-x (token-trait <ft-trait>) (amount uint) (min-dx uint))
  (let (
    (token-contract (contract-of token-trait))
    (token-data (unwrap! (map-get? tokens token-contract) ERR_INVALID_TOKEN))
    (rate (get rate token-data))
    (factor (get factor token-data))
    (fee-rate (get y-fee token-data))
    (fee (/ (* amount fee-rate) BPS))
    (dx (/ (* (- amount fee) rate) factor))
    (sender tx-sender)
  )
    (begin
      (asserts! (is-eq (var-get swap-status) true) ERR_SWAP_STATUS)
      (asserts! (is-eq (get approved token-data) true) ERR_TOKEN_NOT_APPROVED)
      (asserts! (and (> amount u0) (> min-dx u0)) ERR_INVALID_AMOUNT)
      (asserts! (> dx min-dx) ERR_MINIMUM_RECEIVED)
      (try! (contract-call? token-trait transfer (- amount fee) sender (as-contract tx-sender) none))
      (if (> fee u0)
        (try! (contract-call? token-trait transfer fee sender (var-get fee-address) none))
        false
      )
      (try! (as-contract (contract-call? .uwu-token-v1-1-0 transfer dx tx-sender sender none)))
      (print {action: "swap-y-for-x", sender: sender, token: token-contract, amount: amount, dx: dx, min-dx: min-dx, fee: fee, fee-rate: fee-rate, rate: rate, factor: factor})
      (ok dx)
    )
  )
)