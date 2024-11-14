;; SPDX-License-Identifier: BUSL-1.1

(impl-trait 'SP2XD7417HGPRTREMKF748VNEQPDRR0RMANB7X1NK.proposal-trait.proposal-trait)

(define-constant MAX_UINT u240282366920938463463374607431768211455)
(define-constant ONE_8 u100000000)

(define-public (execute (sender principal))
	(begin
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-drac, chain-id: u1001 } u"DRAC" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-drac, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-drac, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-drac, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-drac, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-drac, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-drac, chain-id: u1001 } false))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-drac set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-in-endpoint-v2-02 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-drac set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-out-endpoint-v2-03 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-drac burn-fixed u19720000000 'SP15JJ3MMWYBWQG8HJZ53DA10H5SD4R958JX9SZY8))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-love, chain-id: u1001 } u"LOVE" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-love, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-love, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-love, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-love, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-love, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-love, chain-id: u1001 } false))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-love set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-in-endpoint-v2-02 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-love set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-out-endpoint-v2-03 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-love burn-fixed u2348284000000 'SP15JJ3MMWYBWQG8HJZ53DA10H5SD4R958JX9SZY8))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-zbit, chain-id: u1001 } u"ZBIT" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-zbit, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-zbit, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-zbit, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-zbit, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-zbit, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-zbit, chain-id: u1001 } false))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-zbit set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-in-endpoint-v2-02 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-zbit set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-out-endpoint-v2-03 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-zbit burn-fixed u315134126360 'SP15JJ3MMWYBWQG8HJZ53DA10H5SD4R958JX9SZY8))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-chax, chain-id: u1001 } u"CHAX" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-chax, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-chax, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-chax, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-chax, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-chax, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-chax, chain-id: u1001 } false))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-chax set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-in-endpoint-v2-02 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-chax set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-out-endpoint-v2-03 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-chax burn-fixed u14080409766123057 'SP15JJ3MMWYBWQG8HJZ53DA10H5SD4R958JX9SZY8))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-lger, chain-id: u1001 } u"LGER" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-lger, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-lger, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-lger, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-lger, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-lger, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-lger, chain-id: u1001 } false))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-lger set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-in-endpoint-v2-02 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-lger set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-out-endpoint-v2-03 true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ormm, chain-id: u1001 } u"ORMM" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ormm, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ormm, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ormm, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ormm, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ormm, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ormm, chain-id: u1001 } false))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ormm set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-in-endpoint-v2-02 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ormm set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-out-endpoint-v2-03 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ormm burn-fixed u109026556208558 'SP15JJ3MMWYBWQG8HJZ53DA10H5SD4R958JX9SZY8))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ordg, chain-id: u1001 } u"ORDG" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ordg, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ordg, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ordg, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ordg, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ordg, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ordg, chain-id: u1001 } false))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ordg set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-in-endpoint-v2-02 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ordg set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-out-endpoint-v2-03 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ordg burn-fixed u20386374133975 'SP15JJ3MMWYBWQG8HJZ53DA10H5SD4R958JX9SZY8))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-reos, chain-id: u1001 } u"REOS" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-reos, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-reos, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-reos, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-reos, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-reos, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-reos, chain-id: u1001 } false))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-reos set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-in-endpoint-v2-02 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-reos set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-out-endpoint-v2-03 true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ornj, chain-id: u1001 } u"ORNJ" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ornj, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ornj, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ornj, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ornj, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ornj, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ornj, chain-id: u1001 } false))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ornj set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-in-endpoint-v2-02 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ornj set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-out-endpoint-v2-03 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-ornj burn-fixed u6573739197108 'SP15JJ3MMWYBWQG8HJZ53DA10H5SD4R958JX9SZY8))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wcorgi, chain-id: u1001 } u"XWEL" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wcorgi, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wcorgi, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wcorgi, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wcorgi, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wcorgi, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wcorgi, chain-id: u1001 } true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-tx20, chain-id: u1001 } u"TX20" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-tx20, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-tx20, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-tx20, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-tx20, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-tx20, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-tx20, chain-id: u1001 } false))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-tx20 set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-in-endpoint-v2-02 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-tx20 set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-out-endpoint-v2-03 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-tx20 burn-fixed u99327865148171 'SP15JJ3MMWYBWQG8HJZ53DA10H5SD4R958JX9SZY8))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-trio, chain-id: u1001 } u"TRIO" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-trio, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-trio, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-trio, chain-id: u1001 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-trio, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-trio, chain-id: u1001 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-trio, chain-id: u1001 } false))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-trio set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-in-endpoint-v2-02 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-trio set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-out-endpoint-v2-03 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.brc20-trio burn-fixed u4487334843394 'SP15JJ3MMWYBWQG8HJZ53DA10H5SD4R958JX9SZY8))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wnot, chain-id: u1002 } u"runes::840058:4531" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wnot, chain-id: u1002 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wnot, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wnot, chain-id: u1002 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wnot, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wnot, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wnot, chain-id: u1002 } true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wfrodo, chain-id: u1002 } u"runes::840104:554" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wfrodo, chain-id: u1002 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wfrodo, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wfrodo, chain-id: u1002 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wfrodo, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wfrodo, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wfrodo, chain-id: u1002 } true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wcorgi, chain-id: u1002 } u"runes::840772:2166" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wcorgi, chain-id: u1002 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wcorgi, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wcorgi, chain-id: u1002 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wcorgi, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wcorgi, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wcorgi, chain-id: u1002 } true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wpepe, chain-id: u1002 } u"runes::840592:2099" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wpepe, chain-id: u1002 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wpepe, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wpepe, chain-id: u1002 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wpepe, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wpepe, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.token-wpepe, chain-id: u1002 } true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-dog, chain-id: u1002 } u"runes::840000:3" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-dog, chain-id: u1002 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-dog, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-dog, chain-id: u1002 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-dog, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-dog, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-dog, chain-id: u1002 } false))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-dog set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-in-endpoint-v2-02 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-dog set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-out-endpoint-v2-03 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-dog burn-fixed u45902700000000 'SP15JJ3MMWYBWQG8HJZ53DA10H5SD4R958JX9SZY8))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 approve-pair { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-inu, chain-id: u1002 } u"runes::840053:5016" true))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-in { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-inu, chain-id: u1002 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-in-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-inu, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 pause-peg-out { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-inu, chain-id: u1002 } false))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-inu, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-peg-out-gas-fee { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-inu, chain-id: u1002 } u0))
(try! (contract-call? 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-bridge-registry-v2-03 set-token-no-burn { token: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-inu, chain-id: u1002 } false))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-inu set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-in-endpoint-v2-02 true))
(try! (contract-call? 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.runes-inu set-approved-contract 'SP673Z4BPB4R73359K9HE55F2X91V5BJTN5SXZ5T.meta-peg-out-endpoint-v2-03 true))

(ok true)))
