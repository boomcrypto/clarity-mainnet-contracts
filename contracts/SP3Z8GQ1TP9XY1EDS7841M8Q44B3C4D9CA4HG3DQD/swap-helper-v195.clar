(use-trait ocb3efe2975f75d1d 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.sip-010-trait-ft-standard.sip-010-trait) (use-trait o7813309820cd7b19 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.trait-sip-010.sip-010-trait) (define-constant o251d9c806aa06446 tx-sender) (define-constant o658cd23527ef3be7 (err u100)) (define-private (o8adeff1da6d86250 (o0fd42d84ad7b6a1c <o7813309820cd7b19>) (o732c6740b1ca2702 <o7813309820cd7b19>) (of9072970fa5f70f9 uint) (oa7a6b3d31391d51c uint) (o5cea0eb4dd77c883 uint) (o977b01773ea33d9d uint)) (let ((ob2906abcf7e5d8aa (/ (* o977b01773ea33d9d (pow u10 u8)) (pow u10 oa7a6b3d31391d51c))) (occ050efa6f1ad2eb (try! (as-contract (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 swap-helper o0fd42d84ad7b6a1c o732c6740b1ca2702 of9072970fa5f70f9 ob2906abcf7e5d8aa none))))) (ok (/ (* occ050efa6f1ad2eb (pow u10 o5cea0eb4dd77c883)) (pow u10 u8))))) (define-private (o76c0dbe41b8c1e62 (o74b9b51d30202888 <ocb3efe2975f75d1d>) (oe04ad8b890c54ac0 <ocb3efe2975f75d1d>) (o95cd26b1dca09f7c bool) (o977b01773ea33d9d uint)) (let ((o0528a5fe71ef2ab0 (try! (as-contract (if o95cd26b1dca09f7c (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x o74b9b51d30202888 oe04ad8b890c54ac0 o977b01773ea33d9d u0) (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y o74b9b51d30202888 oe04ad8b890c54ac0 o977b01773ea33d9d u0)))))) (ok (unwrap-panic (element-at o0528a5fe71ef2ab0 (if o95cd26b1dca09f7c u0 u1)))))) (define-public (swap-helper (o87c7a796c552562f <ocb3efe2975f75d1d>) (od1e16e39c3ae077e <ocb3efe2975f75d1d>) (oa9556f6ebeee1aa6 bool) (o6222ee5620048475 <o7813309820cd7b19>) (o058a5af358019b66 <o7813309820cd7b19>) (o0f67b4e6fe5826fd uint) (oe987b5eac483fc19 uint) (o8787ffc6287d1006 uint) (ofddb7909dc88b496 <ocb3efe2975f75d1d>) (o308ebec51bfd0456 <ocb3efe2975f75d1d>) (o9c872ac3126295d6 bool) (o64bf53b61a82e231 <ocb3efe2975f75d1d>) (o32471ceb4b83bb82 <ocb3efe2975f75d1d>) (o29d03067121926b6 bool) (o7f3673b9f15cfe2d uint)) (begin (asserts! (is-eq tx-sender o251d9c806aa06446) o658cd23527ef3be7) (try! (stx-transfer? o7f3673b9f15cfe2d tx-sender (as-contract tx-sender))) (let ((oa45c4de00028fb53 (unwrap-panic (o76c0dbe41b8c1e62 o87c7a796c552562f od1e16e39c3ae077e oa9556f6ebeee1aa6 o7f3673b9f15cfe2d))) (o24ee854d6599d6a5 (unwrap-panic (o8adeff1da6d86250 o6222ee5620048475 o058a5af358019b66 o0f67b4e6fe5826fd oe987b5eac483fc19 o8787ffc6287d1006 oa45c4de00028fb53))) (o4e18b94dbd373379 (unwrap-panic (o76c0dbe41b8c1e62 ofddb7909dc88b496 o308ebec51bfd0456 o9c872ac3126295d6 o24ee854d6599d6a5))) (o0a990e2e6120c115 (unwrap-panic (o76c0dbe41b8c1e62 o64bf53b61a82e231 o32471ceb4b83bb82 o29d03067121926b6 o4e18b94dbd373379)))) (asserts! (> o0a990e2e6120c115 o7f3673b9f15cfe2d) (err u101)) (try! (as-contract (stx-transfer? o0a990e2e6120c115 tx-sender o251d9c806aa06446))) (ok o0a990e2e6120c115))))