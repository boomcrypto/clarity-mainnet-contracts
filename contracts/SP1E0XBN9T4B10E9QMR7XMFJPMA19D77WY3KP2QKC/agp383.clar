;; SPDX-License-Identifier: BUSL-1.1

(impl-trait 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.proposal-trait.proposal-trait)

(define-constant ONE_8 u100000000) ;; 8 decimal places

(define-public (execute (sender principal))
	(begin
(try! (contract-call? 'SP1E0XBN9T4B10E9QMR7XMFJPMA19D77WY3KP2QKC.self-listing-helper-v2-03 approve-request u3 .token-welon none))			
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1YFBFQYPXTD0GS180M868YVZ8BXKZYK06QC0WZC))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP353KQ79D24G2Y30XYMFBXY312S9JAP3X4CT049Z))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP7R6VARSP0QDNAZF5WJ5PCT5DYMJHSWK8VE2EH8))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPVJQT0ANS8CBRF1FC57VMWSBNGSMXSQXYW2PE7H))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3PR3ETRNRY4MRTCPAGG2VF7HBC577Q87R0GXQV6))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPZMB5KZ1J5TASVW4EFXXV04N6Q0V3KC3NPWMGRW))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1ZTKR5R3PSFRAGHQB5HXQFHAYB2P5D6A1ZJBE7A))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP315DGMYY1GQ4YDJ2GT07W67WPPYGY3XNEPNCEHX))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPQ976ADR6T4R41V0TXS7BZ15WDX8GKY62YNSFRJ))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1E89NBEQFC4D31FB15N937A009M52VD7VSMHB2T))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP24WR3YD0B90MFCK3F25NM4CK2AEBQ46MT5358W3))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP9H6RW69EM0APP2EMXC1C8ZFXEQF7P0H5D6BMX4))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPNNFAM88J85E3XK17N5HH49ZPEAJQE398JCTDNR))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2SS810XCWN9167FHSEGQTZRMR8DZW5ZG7T5KW5X))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3GP9YHBYCSCHV7ZPWVKNC6XS9RXQJZV7B0T97G8))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP146DKQA60R47522ABBERDDSWEEGJ4J12K0WZTMJ))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP71H8R4BDJBCZC0JS0SM2EZFKQ6VJMHN2ZDVG8Y))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP12BPX5C1X48FF2R5W1JNT6PPVWV6PM42FT8EWK2))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP38QTGVQB4CWMS112Y3ZNGG778XMG3827H3K9NA1))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3P1EXMYPD2KQ6DXRTF54SANC9A38EQH88W1TWGE))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2RJNRT1SFM6XJZ4TRP3EMKYDFTWY15Z1D9Q3X0B))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP14YJ7PKAAPP541Q27EP97RECCB14K3W60K7D844))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP13ZNFC1422XKPQRJYBP5M23VNEVEBE9CDT6CJ1T))
		(ok true)))

