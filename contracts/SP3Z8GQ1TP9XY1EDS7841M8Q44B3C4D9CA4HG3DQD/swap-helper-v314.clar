(use-trait o7813309820cd7b19 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9.trait-sip-010.sip-010-trait) (use-trait o61f60b1a41db3adf 'SP2AKWJYC7BNY18W1XXKPGP0YVEK63QJG4793Z2D4.sip-010-trait-ft-standard.sip-010-trait) (define-constant o251d9c806aa06446 tx-sender) (define-constant o658cd23527ef3be7 (err u100)) (define-private (o8adeff1da6d86250 (o0fd42d84ad7b6a1c <o7813309820cd7b19>) (o732c6740b1ca2702 <o7813309820cd7b19>) (of9072970fa5f70f9 uint) (oa7a6b3d31391d51c uint) (o5cea0eb4dd77c883 uint) (o977b01773ea33d9d uint)) (let ((ob2906abcf7e5d8aa (/ (* o977b01773ea33d9d (pow u10 u8)) (pow u10 oa7a6b3d31391d51c))) (occ050efa6f1ad2eb (try! (as-contract (contract-call? 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 swap-helper o0fd42d84ad7b6a1c o732c6740b1ca2702 of9072970fa5f70f9 ob2906abcf7e5d8aa none))))) (ok (/ (* occ050efa6f1ad2eb (pow u10 o5cea0eb4dd77c883)) (pow u10 u8))))) (define-private (o2ee4fb2388ad5104 (o5183708558b845a4 <o61f60b1a41db3adf>) (o5fea83bcb8e0304e <o61f60b1a41db3adf>) (o9fc055c63f245c01 uint) (oa54fdbb339c82f79 bool) (o977b01773ea33d9d uint)) (let ((o0528a5fe71ef2ab0 (try! (as-contract (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens o9fc055c63f245c01 o5183708558b845a4 o5fea83bcb8e0304e (if oa54fdbb339c82f79 o5fea83bcb8e0304e o5183708558b845a4) (if oa54fdbb339c82f79 o5183708558b845a4 o5fea83bcb8e0304e) 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to o977b01773ea33d9d u1))))) (ok (get amt-out o0528a5fe71ef2ab0)))) (define-public (swap-helper (o87c7a796c552562f <o7813309820cd7b19>) (od1e16e39c3ae077e <o7813309820cd7b19>) (oa50276e4cadd7eec uint) (o7cb229189ad207e4 uint) (o3fb1a657efbba615 uint) (o6222ee5620048475 <o61f60b1a41db3adf>) (o058a5af358019b66 <o61f60b1a41db3adf>) (ob18b8c20d14820b3 uint) (o9100364e4509e17c bool) (ofddb7909dc88b496 <o7813309820cd7b19>) (o308ebec51bfd0456 <o7813309820cd7b19>) (o3240f72b7d63ad5c uint) (o0e4bf6db9328f071 uint) (of70e8036c4578b8e uint) (o64bf53b61a82e231 <o61f60b1a41db3adf>) (o32471ceb4b83bb82 <o61f60b1a41db3adf>) (o6ce3e0b7b3fb5f52 uint) (o29d03067121926b6 bool) (o7f3673b9f15cfe2d uint)) (begin (asserts! (is-eq tx-sender o251d9c806aa06446) o658cd23527ef3be7) (try! (stx-transfer? o7f3673b9f15cfe2d tx-sender (as-contract tx-sender))) (let ((oa45c4de00028fb53 (unwrap-panic (o8adeff1da6d86250 o87c7a796c552562f od1e16e39c3ae077e oa50276e4cadd7eec o7cb229189ad207e4 o3fb1a657efbba615 o7f3673b9f15cfe2d))) (o24ee854d6599d6a5 (unwrap-panic (o2ee4fb2388ad5104 o6222ee5620048475 o058a5af358019b66 ob18b8c20d14820b3 o9100364e4509e17c oa45c4de00028fb53))) (o4e18b94dbd373379 (unwrap-panic (o8adeff1da6d86250 ofddb7909dc88b496 o308ebec51bfd0456 o3240f72b7d63ad5c o0e4bf6db9328f071 of70e8036c4578b8e o24ee854d6599d6a5))) (o0a990e2e6120c115 (unwrap-panic (o2ee4fb2388ad5104 o64bf53b61a82e231 o32471ceb4b83bb82 o6ce3e0b7b3fb5f52 o29d03067121926b6 o4e18b94dbd373379)))) (asserts! (> o0a990e2e6120c115 o7f3673b9f15cfe2d) (err u101)) (try! (as-contract (stx-transfer? o0a990e2e6120c115 tx-sender o251d9c806aa06446))) (ok o0a990e2e6120c115))))