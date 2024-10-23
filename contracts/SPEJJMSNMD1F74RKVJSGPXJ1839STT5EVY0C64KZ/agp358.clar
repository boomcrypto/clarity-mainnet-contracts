;; SPDX-License-Identifier: BUSL-1.1

(impl-trait 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.proposal-trait.proposal-trait)

(define-constant ONE_8 u100000000) ;; 8 decimal places

(define-public (execute (sender principal))
	(begin
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-registry-v2-01 set-max-ratio-limit (* u1000 ONE_8)))	
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-registry-v2-01 set-max-in-ratio 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxusd 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wusda u5000000 (* u1000 ONE_8)))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-registry-v2-01 set-max-out-ratio 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxusd 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wusda u5000000 (* u1000 ONE_8)))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-registry-v2-01 set-max-ratio-limit ONE_8))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 swap-helper 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wusda 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wxusd u5000000 u1161667448000 none))

(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1SXQQ8W8YQ4AC0P7VP0D5K09D118HY29SDFQGQA))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1G539ZC65ENYQWY9M3W2XVPG3R03HZE3A5BJPEW))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2FMBPYKA1YTNJAGW6R9FKNTWP48MH7QVY4KRKCP))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP7JZM8YSEPBVCJZ82WTWTW1YAVPTK14WY5J7Z82))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP33B8KPXHM4HJAPE6H8HBJ9TTTDXP61MS0KGK8CX))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3MPWHT7T4TK8RCTGXEYWZGK2KEXQTS6KEX570CN))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2REJXACM37J747D8TRYP423D63CEWAJ0VYSRCGG))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1RFNJBATVPGKVB9NVSVERV4NGTFPGTNB3ES85KP))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP335ZC3W6M308ZKTSCCBMR54GWA20RSXCKJPZC59))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP176Z3VWHTA9BYJZGE7KPQNE1S61B6BFMD0A29HH))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPAJMEDR4VY80W67XW61EK02170N99M9XHFWSDJZ))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1XFVT6E1789QTSX7DBT9JCRBB8YNV9BXS70Z4K7))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP19FHVCSAFD25QJMT1CX5WRP5YP16PF31FD7V25S))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3A04FQM8HQBM5YGG2SZXJC0A07RYK45K76V77KS))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP27VV8FK09R9RR8TSS2YPWYT31JST969XXA95GX4))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3P5ZAX4JBD68DZ8T952E7782HTWSP8TX7H3DVMZ))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1MTPCEPW6ERR3NFW2CHSQJZHFX24XGJQ7XVBTZ0))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3ZZHE800SM6W0C1YQ2HF58QCW82TWFCXJ9ESD9Z))
		(ok true)))

