(impl-trait .proposal-trait.proposal-trait)
(define-constant ONE_8 u100000000) ;; 8 decimal places
(define-constant target 'SP19ATGT7WJV5J0XGC2Y05QQBV9AFSN24V7F2SEWR)
(define-public (execute (sender principal))
	(let (			
			(legacy-bal (unwrap-panic (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token get-balance-fixed target))))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token burn-fixed legacy-bal target))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.age000-governance-token mint-fixed legacy-bal 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.executor-dao))		
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP38BW5W1SG5FBRGVZ4E5NQ9B62HQBQ9RSKFPAJHD))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP374G2MEAZYK3TCWTQ1C9T2YN6PJCBBHX86YXAT0))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP3246MD4432N2ENJ9PCSV3A06815GSPTP06VT3SH))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP18GXHXT6S0VAV360HV9S8YY0K1ZVDMW0CSC55V))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP3RDKN36M2RNSM34WR2NCBHP6TZX0JXV6KJD41SH))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP1R9ZSWJ9S28VGKA4Z329BJAYVKF9KJMHE37K0F8))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP2NX5F99G3XT0M9898QV0F46AA00HJ9R8Q5EC32E))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SPRHHT4AFS1702N1H6SRKBQA5K478AKSN81XSRGW))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP346QMDV22J8FAR028GWEF1N3A5BFP02QEYW0DQY))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP2ZWNX7D8XQSQ72KV8KP2ZD9RDEGMC5AVSV649Y0))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SPNG2HD57Q6EMMJHCCX31VKP5HPPVNKFMQ95F3PN))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP322NQYF7N6MNAPY6F04E429070M9GP0TXWYHKB))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP318TS0M6VXGKBKY479SV2CH75PM29BSRVZAVTSE))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP24ED3A64CEBW1Z23V86AP95EAYXTQ4BQN5GRXVC))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP33QK1X8J96QV300R580VZ1D8HAWSS0EZ9H9SH06))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP36MCQHXPP0DZ2KPC1KEY6ERC8GKB6QVCAK0PQYG))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP9ZWVDMGGFYJF7PVFJC4KJPV1E5ARXGXSTFG375))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP16DGT13VVFDXY5VR8C2B79TBAMAFG03XK3XTNSS))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SPS1934SMPT6FB8EG36K1QTB05HZ5MTPJR0FPKBT))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP285XV79W3C830Q1D9WFGR9XWQRK57VBX9Q4351B))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP234ZYD9BF7DRRMVYRXYSPX0G5KRASV2ANN918H9))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP95NXE5T10VAHPJPYN43Q3K9VG8GBNM0G1DRZDF))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP2PHJB880B82MS7HCH6JE0P05WC3VP7EP7040E3T))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP21G9J21046X421AAMZMMGE8KZ7BCAZJYRFNCP6A))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SPG6Q93SSJX1YDBHEV0X67TDENDCTCQMC00M5E2M))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP2WWVHS6DZGGHVRGVRRSS1K32WHK8BRNJD9668EA))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP27YRCXTHFHJY7HYHZ1DJ6GAK52HS30HZNPPJRZX))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP066TDQD6PC55SPDTFBWED0303D9SRJY48G797H))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SPFMTSBRGBBZ5B81GW9X2S78QNS2XHB5CWPCRQ0G))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP3KMGHQ0AZY23G1RABGD8VT0BY8P2C91J604AA8G))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP1PZHQW4NM1526ZHP297N16K4X51D0A62YZHHBVT))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP13KGM39MC8R8FQ4WJJV0ME3NQ5AXAJKNAFB841C))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SP252170JY5C6NYDR8JNVW0A6MCDDYMNSF6GQ52VA))
(try! (contract-call? .migrate-legacy-v2-wl finalise-migrate 'SPHQ4A816XM7NNKSHHZQZSCY9S9AP35D8SYRF45K))
		(ok true)))