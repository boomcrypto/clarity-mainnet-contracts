
(define-private (send-stx (recipient principal) (amount uint))
	(begin
		(try! (stx-transfer? amount tx-sender (as-contract recipient)))
		(ok true)
	)
)
(contract-call? 'SP2TT71CXBRDDYP2P8XMVKRFYKRGSMBWCZ6W6FDGT.notastrategy transfer u125000000000000 'SP2TT71CXBRDDYP2P8XMVKRFYKRGSMBWCZ6W6FDGT 'SP1Q3KA3MMZ43XSZSG54NNQ9PHE6BWDKBWJ5Y7HKM none)
(contract-call? 'SP2TT71CXBRDDYP2P8XMVKRFYKRGSMBWCZ6W6FDGT.notastrategy transfer u125000000000000 'SP2TT71CXBRDDYP2P8XMVKRFYKRGSMBWCZ6W6FDGT 'SP63SYHXYMCCEHQHXKHW3JN55V8YTPKM04GP329S none)
(begin
	
	(try! (send-stx 'SP1FQ3DQDR5N9HJX3XC5DNKFCG4DHH48EFJQV6QH0 u1000000))
)
