(define-constant owner tx-sender)
(define-constant D8 u100000000) 

(define-constant D13 u10000000000000)

(define-constant FEE u995)
(define-constant scale u291064)




(define-read-only (stx-nyc-pool-details (x-in-y-out uint) )
  (let
    (

      (gety 
        (try! 
          (contract-call? 
          'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 
          get-y-given-x 
          'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wstx-v2 
          'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wnyc D8 x-in-y-out)))

      (nofee (* gety FEE))
      (scaled-gety (/ (* nofee scale) D13))
    )

     (ok (tuple (gety gety) (nofee nofee) (scaled-gety scaled-gety))) 
  )
)


