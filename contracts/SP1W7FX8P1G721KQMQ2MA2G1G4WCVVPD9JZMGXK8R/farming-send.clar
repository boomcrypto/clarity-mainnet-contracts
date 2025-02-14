;;; Send tokens and notify receiver.

(define-constant err-send-preconditions  (err u501))
(define-constant err-send-postconditions (err u502))

(use-trait ft-trait 'SP1W7FX8P1G721KQMQ2MA2G1G4WCVVPD9JZMGXK8R.sip-010-trait-ft-standard.sip-010-trait)
(use-trait farming-receive-trait .farming-receive-trait.farming-receive-trait)

(define-public
  (send
   (token <ft-trait>)
   (amt   uint)
   (to    <farming-receive-trait>))

  (let ((bal (try! (contract-call? token get-balance tx-sender))))

    (try! (contract-call?
      token transfer amt tx-sender (contract-of to) none))

    (try! (contract-call?
      to receive token amt tx-sender))

    (asserts!
     (>= (try! (contract-call? token get-balance tx-sender))
         (- bal amt))
     err-send-postconditions)

    (ok true)))

;;; eof