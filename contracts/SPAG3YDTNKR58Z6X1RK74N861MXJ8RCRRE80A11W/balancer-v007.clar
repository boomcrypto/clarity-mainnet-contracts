(define-public (balancer (dd uint) (mr uint) (ta uint))
    (begin
        (unwrap-panic (contract-call? 'SPAG3YDTNKR58Z6X1RK74N861MXJ8RCRRE80A11W.balancer-v3-6 balancer dd mr ta))
        (unwrap-panic (contract-call? 'SPAG3YDTNKR58Z6X1RK74N861MXJ8RCRRE80A11W.balancer-v4-11 balancer dd mr ta)) 
        (unwrap-panic (contract-call? 'SPAG3YDTNKR58Z6X1RK74N861MXJ8RCRRE80A11W.balancer-v29-3 balancer dd mr ta)) 
        (unwrap-panic (contract-call? 'SPAG3YDTNKR58Z6X1RK74N861MXJ8RCRRE80A11W.balancer-v2-4 balancer dd mr ta)) 
        (unwrap-panic (contract-call? 'SPAG3YDTNKR58Z6X1RK74N861MXJ8RCRRE80A11W.balancer-v7-1 balancer dd mr ta)) 
        (unwrap-panic (contract-call? 'SPAG3YDTNKR58Z6X1RK74N861MXJ8RCRRE80A11W.balancer-v41-1 balancer dd mr ta)) 
        (unwrap-panic (contract-call? 'SPAG3YDTNKR58Z6X1RK74N861MXJ8RCRRE80A11W.balancer-v23-6 balancer dd mr ta)) 
        (ok u11)
    )
)