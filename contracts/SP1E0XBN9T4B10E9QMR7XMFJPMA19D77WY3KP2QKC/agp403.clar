;; SPDX-License-Identifier: BUSL-1.1

(impl-trait 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.proposal-trait.proposal-trait)

(define-constant ONE_8 u100000000) ;; 8 decimal places

(define-public (execute (sender principal))
	(begin
(try! (contract-call? 'SP1E0XBN9T4B10E9QMR7XMFJPMA19D77WY3KP2QKC.self-listing-helper-v2-04 approve-request u14 .token-wswoody none))

(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2GG8NEMY69VSSHZYP46T5ZXCB27MCN4N4TGTDQX))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2JGYFJHJJ917YNPKD6ZBBK2R5K6CWADZPBZQ7P4))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2C7NEV88NEKNKTPK7DJX3H8S4V1G4KPF4QGV1BC))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP12MR4ZN9W45H22GVDF0ER8SZNT75MZ517Y04593))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPJFE3V4Y4CY8TQ6AM0NFJ83P8ZDJFD1BXHSSYFX))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP35YYETH6WFFTSVPKS5KBA4AP5656S66WQPFA9DY))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP32728WFVK74FQXC0BD48QD6BNW5A3MJ8HB5YADR))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP18ZWQMEX1K741ZXQ6FZ1J6RMZ4NWNR08YTH8HK4))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPW4TAZXDKPT0NESWN7BFVSM6Z0TVNHAN2GAEW29))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPRE3B7EY31CRJJBWND69TA2F5HRFT7SG52MV7YB))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2GKG0YZ1GS50H4GTNFVN2S5C1G8B4E6GMGQ4MFJ))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3VXK2P8X0QZSXSWF3K2963ZZRY41M0EE2Z0CBQX))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3ZX8K6NE4NPC3H0PA7D1R24TZ3DWRQE02BTG12Y))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1AVZDCAFBYGY0Y320ETPM00N3NB3W2XKK6GR6Z0))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP20AS6RQ78SKR5WQY3VQZF73M6HRPDX2246XWCAZ))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3GZ0M35TJY9QZ1F9TQMGRE4AR38JQJB63GQBX4G))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2ENVTSV6JYQY3M3ABBG9B0RHZAGH2PS40GV5TAR))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3DNEN554GN14CBGD181ZNNAM48MTAEPFHMB0KDM))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2D8P9CWYGKGYMY6C0JGF107FERQX0QEASZ0QDTT))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP147P47BR20Y1AT1DQFANMFP1M2SBEWZJBJRHBRG))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP291790V8B9QTKWG12ZZ1KFH3EMDG3RG2WY0B5AJ))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP10DW4SMJK57RJN0DV30YGZYB96HK9EGVTSXK080))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPP4TW2D6YE3F44JYTQRKPWXT19DJND5JH0NRGFQ))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1BAVJFWWJC1ZRA0WPH88F2XC4V6HKGH7B7ZC0RY))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPX9GMEFP16V0KPKAJ6MHVDJRTP3ARVE4HNAEVV6))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2PHKFRAQCP0NGEY9EC1VZ4ECVWSZP7MN2E08AGK))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP7V8YPCWRRD3MXEH5S4PVG652H83H9YX7P67PZ1))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP91CGE9XZ73HD79WSPPTYF0N6HHB8ANTMY3PD2K))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1B0Y9NJ0F53GGKACEGDC4KFZMDJJCECSTJAC7JK))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1W3RFP4V2YAHFCV17VMM97DWMQKT8V9P5J7Q51T))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP262F10X1HMTEGYFJ9N7VAG1VEWZ2Y2MY9B9Y35P))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP2748TN4BD407DF7KW6JMV7QPJ9R2EB8V62NWJDZ))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP27M9XJYQ1NGQAF64PGQJ31ADTDQW984YKJESX4F))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPANA7DAQE5QJR0HJKY3J6MFW5H5KYJHXKKCZQ8Z))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3AGGE0J2SRN4TWX8VCXWNS940VX05P42MGX5VJ7))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP39VVPVN5RYWR7QTT5R5RPBN6A5JCBFX0SJBSGX5))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1ZN4K5G9ZVF3P5KK4QCRKPQ7MCNQ0VTA7ZXDP3Z))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SPJKE9ENFNTW8QPYP8XTGYGW9VB29HM2W5570HCG))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP1TEG320TVSADKTZBNW1FS27VA2M339QZCD5VP34))
(try! (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.migrate-legacy-v2-wl finalise-migrate 'SP3JVRD6M1S38P3Z21X2YWJMV0EVS0A9JMB5N8GXV))

		(ok true)))

