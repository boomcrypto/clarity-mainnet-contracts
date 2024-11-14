;; SPDX-License-Identifier: BUSL-1.1

(impl-trait 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.proposal-trait.proposal-trait)

(define-constant ONE_8 u100000000) ;; 8 decimal places

(define-public (execute (sender principal))
	(begin
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1ATWCW5KSE20VYAV13AXK7KTTFJ7QP3VEW31A21))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3GB3PH0T9HSDESX0F88YQEXD4ZA0G4SCWHRM86Q))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP10QS5W2570XD9SCYEV90S89N5PR7EXGMQ4HWF9Y))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1ZCYG0D3HCK2F7SY8VH9ZREB0JWCBSAPFNS8V5Z))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3Q4XYPW498Z8SVF5H9KNRKNF1C6WW9DH76RTT1F))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2AGZWPPA7QNMMDD6D66S007GSYWB93M6HYZVBZ7))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP15W9HKM9T1AZVYT2AM21A6RZGW67CGF92RRN2T7))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP27PBZW78H5W0BF65877CMRQKM0ZZ7PE1K1CGYVN))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1BHQJ6NECTHRV48J2YBBHWMYA64JGGG7105AD9V))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP18RVHVEN3YFEQT7FB412Q2YCTR6CCJGECV8KEK9))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3VBD8Q5WTPK8HJ81CA5TQPYR7NFB53XQJCAE1G))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2RKVQW7DC57NRMBSMWZQ5P15DYBT9Z0G02P662N))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2TXMXRK09XMFN3K3HSX12J60XS3Y7MN8T27ZK6G))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPYXRTPK9XVMME9Q5F1255N84NNRVZJZ5B9CCT7Z))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2VYYCQQV8HVRADVH622P0SQ8RN12AF4CMGJ84MP))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPGTVA5FHVVQSKAA0X091TVZT27AVPDE32SM2JYZ))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3AADSP6PKZTJRCR6W9EKVV9P1E2T5X41R9G19AM))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2521CV0MJWG3T1RWSK3Z6A49QQRN6W9XTXZJYC4))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP20E0RC1NWFVD6A2QC8Z4CTWK7X5FKFCB6M6P6W4))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1E30ETFNGC4YNR7F9D2PG2B04Q06FH6RJZGMTSY))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP23J06THBY4F22Q9T6KMARPEN5MCSQQB44FEHFSN))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPYD33B1KDVVAH0R6RP57YFY9F8D62X7276JQSRJ))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1W2KYB5PRFWMTG4JC9YMCQRKHEVH0R5E8PG5VFK))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1R35BRVK822EGWHTSFJBNESKCQ80SZVTZNFSPTQ))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP24QJNV6RVYVEQRR8QJVMEA1E91FSW3C1CFCWQKW))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1H4YTJQWQXS83CY8GBH6VFQYVN3H906HAGQVXP1))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1H0E04NRGCDCHNHSNN3BKV0JE2TTGDK74DKVX33))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1T1V682SNQV3HCR0XEK4J47MD3G666HDJ5N5A7G))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1MM7M1XTRYXN7G9D56RJCA5NNSYF2A8FXH8PJSE))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2G6F4AB2VRZJ55KXGAWBPQR4PB2BC9VK1NP1FWQ))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPSV0E6CNH5CVYMZKH47TNK4ZW07RRPZ9MPZRSSP))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2CC2B9B6H5VJ72F4X9891HBKK5900F77R2CQSRR))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP16A3KQ132FRSBJVT2VEFRE45E8T8M2Y4129XBD7))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3D23QJG4S1G6TBXSPFR0N3PMF53WXA50XTX9W0M))	
		(ok true)))

