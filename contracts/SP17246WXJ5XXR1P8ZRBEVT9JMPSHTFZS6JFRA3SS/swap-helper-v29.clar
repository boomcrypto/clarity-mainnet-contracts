(use-trait o61f60b1a41db3adf 'SP2AKWJYC7BNY18W1XXKPGP0YVEK63QJG4793Z2D4.sip-010-trait-ft-standard.sip-010-trait) (define-constant o251d9c806aa06446 tx-sender) (define-constant o658cd23527ef3be7 (err u100)) (define-private (o2ee4fb2388ad5104 (o5183708558b845a4 <o61f60b1a41db3adf>) (o5fea83bcb8e0304e <o61f60b1a41db3adf>) (o9fc055c63f245c01 uint) (oa54fdbb339c82f79 bool) (o977b01773ea33d9d uint)) (let ((o0528a5fe71ef2ab0 (try! (as-contract (contract-call? 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-router swap-exact-tokens-for-tokens o9fc055c63f245c01 o5183708558b845a4 o5fea83bcb8e0304e (if oa54fdbb339c82f79 o5fea83bcb8e0304e o5183708558b845a4) (if oa54fdbb339c82f79 o5183708558b845a4 o5fea83bcb8e0304e) 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to o977b01773ea33d9d u1))))) (ok (get amt-out o0528a5fe71ef2ab0)))) (define-public (swap-helper (o87c7a796c552562f <o61f60b1a41db3adf>) (od1e16e39c3ae077e <o61f60b1a41db3adf>) (oacd4b9a0a83a3697 uint) (oa9556f6ebeee1aa6 bool) (o6222ee5620048475 <o61f60b1a41db3adf>) (o058a5af358019b66 <o61f60b1a41db3adf>) (ob18b8c20d14820b3 uint) (o9100364e4509e17c bool) (o7f3673b9f15cfe2d uint)) (begin (asserts! (is-eq tx-sender o251d9c806aa06446) o658cd23527ef3be7) (try! (stx-transfer? o7f3673b9f15cfe2d tx-sender (as-contract tx-sender))) (let ((oa45c4de00028fb53 (unwrap-panic (o2ee4fb2388ad5104 o87c7a796c552562f od1e16e39c3ae077e oacd4b9a0a83a3697 oa9556f6ebeee1aa6 o7f3673b9f15cfe2d))) (o24ee854d6599d6a5 (unwrap-panic (o2ee4fb2388ad5104 o6222ee5620048475 o058a5af358019b66 ob18b8c20d14820b3 o9100364e4509e17c oa45c4de00028fb53)))) (asserts! (> o24ee854d6599d6a5 o7f3673b9f15cfe2d) (err u101)) (try! (as-contract (stx-transfer? o24ee854d6599d6a5 tx-sender o251d9c806aa06446))) (ok o24ee854d6599d6a5))))