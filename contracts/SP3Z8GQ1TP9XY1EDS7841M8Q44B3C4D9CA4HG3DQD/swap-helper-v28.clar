(use-trait ocb3efe2975f75d1d 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.sip-010-trait-ft-standard.sip-010-trait) (use-trait o61f60b1a41db3adf 'SP2AKWJYC7BNY18W1XXKPGP0YVEK63QJG4793Z2D4.sip-010-trait-ft-standard.sip-010-trait) (define-constant o251d9c806aa06446 tx-sender) (define-constant o658cd23527ef3be7 (err u100)) (define-private (o76c0dbe41b8c1e62 (o74b9b51d30202888 <ocb3efe2975f75d1d>) (oe04ad8b890c54ac0 <ocb3efe2975f75d1d>) (o95cd26b1dca09f7c bool) (o977b01773ea33d9d uint)) (let ((o0528a5fe71ef2ab0 (try! (as-contract (if o95cd26b1dca09f7c (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x o74b9b51d30202888 oe04ad8b890c54ac0 o977b01773ea33d9d u0) (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y o74b9b51d30202888 oe04ad8b890c54ac0 o977b01773ea33d9d u0)))))) (ok (unwrap-panic (element-at o0528a5fe71ef2ab0 (if o95cd26b1dca09f7c u0 u1)))))) (define-private (o2ee4fb2388ad5104 (o5183708558b845a4 <o61f60b1a41db3adf>) (o5fea83bcb8e0304e <o61f60b1a41db3adf>) (o9fc055c63f245c01 uint) (oa54fdbb339c82f79 bool) (o977b01773ea33d9d uint)) (let ((o0528a5fe71ef2ab0 (try! (as-contract (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens o9fc055c63f245c01 o5183708558b845a4 o5fea83bcb8e0304e (if oa54fdbb339c82f79 o5fea83bcb8e0304e o5183708558b845a4) (if oa54fdbb339c82f79 o5183708558b845a4 o5fea83bcb8e0304e) 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to o977b01773ea33d9d u1))))) (ok (get amt-out o0528a5fe71ef2ab0)))) (define-public (swap-helper (o87c7a796c552562f <ocb3efe2975f75d1d>) (od1e16e39c3ae077e <ocb3efe2975f75d1d>) (oa9556f6ebeee1aa6 bool) (o6222ee5620048475 <o61f60b1a41db3adf>) (o058a5af358019b66 <o61f60b1a41db3adf>) (ob18b8c20d14820b3 uint) (o9100364e4509e17c bool) (ofddb7909dc88b496 <o61f60b1a41db3adf>) (o308ebec51bfd0456 <o61f60b1a41db3adf>) (o1c00ac1a22dcfdd4 uint) (o9c872ac3126295d6 bool) (o64bf53b61a82e231 <o61f60b1a41db3adf>) (o32471ceb4b83bb82 <o61f60b1a41db3adf>) (o6ce3e0b7b3fb5f52 uint) (o29d03067121926b6 bool) (o7f3673b9f15cfe2d uint)) (begin (asserts! (is-eq tx-sender o251d9c806aa06446) o658cd23527ef3be7) (try! (stx-transfer? o7f3673b9f15cfe2d tx-sender (as-contract tx-sender))) (let ((oa45c4de00028fb53 (unwrap-panic (o76c0dbe41b8c1e62 o87c7a796c552562f od1e16e39c3ae077e oa9556f6ebeee1aa6 o7f3673b9f15cfe2d))) (o24ee854d6599d6a5 (unwrap-panic (o2ee4fb2388ad5104 o6222ee5620048475 o058a5af358019b66 ob18b8c20d14820b3 o9100364e4509e17c oa45c4de00028fb53))) (o4e18b94dbd373379 (unwrap-panic (o2ee4fb2388ad5104 ofddb7909dc88b496 o308ebec51bfd0456 o1c00ac1a22dcfdd4 o9c872ac3126295d6 o24ee854d6599d6a5))) (o0a990e2e6120c115 (unwrap-panic (o2ee4fb2388ad5104 o64bf53b61a82e231 o32471ceb4b83bb82 o6ce3e0b7b3fb5f52 o29d03067121926b6 o4e18b94dbd373379)))) (asserts! (> o0a990e2e6120c115 o7f3673b9f15cfe2d) (err u101)) (try! (as-contract (stx-transfer? o0a990e2e6120c115 tx-sender o251d9c806aa06446))) (ok o0a990e2e6120c115))))