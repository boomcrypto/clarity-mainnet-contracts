(impl-trait .proposal-trait.proposal-trait)
(define-constant ONE_8 u100000000)
(define-constant amount u5000000)
(define-public (execute (sender principal))
    (begin  
        (try! (contract-call? .age000-governance-token mint-fixed (* amount ONE_8) 'SP22PCWZ9EJMHV4PHVS0C8H3B3E4Q079ZHY6CXDS1))
        
        (ok true)
    )
)