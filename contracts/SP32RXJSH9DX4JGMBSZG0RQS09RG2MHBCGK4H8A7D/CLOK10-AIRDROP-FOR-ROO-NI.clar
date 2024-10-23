
(define-private (send-stx (recipient principal) (amount uint))
	(begin
		(try! (stx-transfer? amount tx-sender (as-contract recipient)))
		(ok true)
	)
)
(contract-call? 'SP32RXJSH9DX4JGMBSZG0RQS09RG2MHBCGK4H8A7D.clokten send-many (list {to: 'SP2M7K3YM8813404G1R7AXV106CPWH0Z5ZA80JVAV, amount: u10000000, memo: none} {to: 'SP1YH7RS8EJMJYZW0RAPJH4N7GRS2DFDZXXFVZZ08, amount: u10000000, memo: none} {to: 'SP2C1WREHGM75C7TGFAEJPFKTFTEGZKF6DFT6E2GE, amount: u10000000, memo: none} {to: 'SP2A0AHSWNYPAS1KRNMEFQMV8WQ2KZRRW8DZC8Z3K, amount: u10000000, memo: none} {to: 'SP2C72R5ZP035N7F6EC72P4AM314H8EJNB2R3B70J, amount: u10000000, memo: none} {to: 'SP256DPEE354ZGC5R8MF06A0JSX46JRT0VRFXERGM, amount: u10000000, memo: none} {to: 'SP35DJDPDNCYRPMTDW10YCQFA29HWXK2S3W5FKFA7, amount: u10000000, memo: none} {to: 'SP1Y7CZMK5EPXPCGTGWAW7BYPHKRWZ810CFKY51TD, amount: u10000000, memo: none} {to: 'SP3CPMGQNXZ3645PF168TRN3NKB1NY4QE39E4ZA3T, amount: u10000000, memo: none} {to: 'SP2K1QW076PZT0VT9M3DX7GPJ088XYB5GH0G5V2QY, amount: u10000000, memo: none} {to: 'SP14Q44DPTBA079BHN627B8JR2PJYXV8866ADT765, amount: u10000000, memo: none} {to: 'SP3A3MD8G3H40BA0TTFNVKSNSG0NG2TS5Q1H65381, amount: u10000000, memo: none} {to: 'SP37WYJM5JHY0BCZ1DM32YZMBJWQ1RY5SG1VT5C4E, amount: u10000000, memo: none} {to: 'SPNF6V2Z7SZ6NXSPQK3R5SSR3BKCBWQ6E029VZG5, amount: u10000000, memo: none} {to: 'SP38JGANYK8HVK3S62PNYDP25CR66NDKGRMQ38BQH, amount: u10000000, memo: none} {to: 'SPK42JR8Q2VNVBC8SAM1M2BQ5SEZC0JPZ295Z62Z, amount: u10000000, memo: none} {to: 'SPFFH36C7REYVJBBYS7GRNZYDYT40247F7GW07E7, amount: u10000000, memo: none} {to: 'SPV00QHST52GD7D0SEWV3R5N04RD4Q1PMA3TE2MP, amount: u10000000, memo: none} {to: 'SP177JV93RYPWWTX5F0MK9NVQ3YTXB4YQZGBPP6H4, amount: u10000000, memo: none} {to: 'SP2FA1H3K9FMY2CQ80WWT2JYMHZ5Z2B810AT41APW, amount: u10000000, memo: none} {to: 'SP2C609CVJP3Y7B28MPPR8JTQ5C3MZK220KMX227K, amount: u10000000, memo: none} {to: 'SP3A82Y231J9MPW4G8YX4M7EBXQC4HKMJFHHF5DQ7, amount: u10000000, memo: none} {to: 'SPQRJEBEVBY8K90QQ42JX71YFVX8Y6YGQ09RXJS9, amount: u10000000, memo: none} {to: 'SP1JG8REQVYP93NC3WN417CFYJ8E1V1E1C1NXAYEW, amount: u10000000, memo: none} {to: 'SP2EQP7X0WCJ70ZMQYGPXAD0S9T76JH1CDZMEMQES, amount: u10000000, memo: none} {to: 'SPVYSWPFMPA26JZNYDG0JWMZWPGXSGF328C91R3V, amount: u10000000, memo: none} {to: 'SP1983XRW15MDPPHV02HX172HEGV6GC8B6HMX01FV, amount: u10000000, memo: none} {to: 'SPQE3J7XMMK0DN0BWJZHGE6B05VDYQRXRMDV734D, amount: u10000000, memo: none} {to: 'SP277VXTHQ3E283BGBPFC148T2TH5ZRXA9HR1TJ30, amount: u10000000, memo: none} {to: 'SP22JQRHFN2DFE15ANN47P6FM40SF8B3K2JJTC6JZ, amount: u10000000, memo: none} {to: 'SP2WSYAEZ7JQ8YWBFFN1VS9TGHY66D51Y0XV2WWY6, amount: u10000000, memo: none} {to: 'SP390ATGDGQFHE5YEWKXHCGQVXNAQP25JAXXZMWSC, amount: u10000000, memo: none} {to: 'SP2N58D7RDC6N3HASYST9R6AX9DM8M8FS6JTPS46N, amount: u10000000, memo: none} {to: 'SP2TTVRSPJX5QXMAPRXJAYFWGEZ5PSS6A19G5KFES, amount: u10000000, memo: none} {to: 'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS, amount: u10000000, memo: none} {to: 'SP238X3JD22HJBMWR8E7CKTF4JCBQ73BG9YS1DBH8, amount: u10000000, memo: none} {to: 'SP2CZYYNDVCZJGVXXVD2VGHWKZKXF352B7NKJQGN3, amount: u10000000, memo: none} {to: 'SPDCC08CFQNYMGC7C1H3STQETKQE60JYREP32DQ6, amount: u10000000, memo: none} {to: 'SP3SB0Y72DXRJK2J9RGJYGKGPC0T94GY5M7G6X15F, amount: u10000000, memo: none} {to: 'SP3C6FP2JJEKMVXVS3BJH72EF7S2AYW4BD2BQXZQ5, amount: u10000000, memo: none} {to: 'SPQRH49JM9YA39R21KHN49M5S947ETH2QFAW3F02, amount: u10000000, memo: none} {to: 'SP2BTMRZDQF4DG426H4C755Y326XN4K2WK9QBQXDS, amount: u10000000, memo: none} {to: 'SPS1V0TA8RC4BNY60HEHAGN77NP5YCCTKFNKZ3C0, amount: u10000000, memo: none} {to: 'SP1D2KXCHTZ6Z1JFZZSPZZY0N0AM3PE759NSHFD7Y, amount: u10000000, memo: none} {to: 'SP2M2KRF7G9AWZBZR44MQDQTCSDSMH3KK3C5K24XJ, amount: u10000000, memo: none} {to: 'SP30MSY8NECE4SJJRQ5NVFZA58HF9Y93XX6E15WMG, amount: u10000000, memo: none} {to: 'SP3G6FJZKYH7EGSTF4RWHF7CDE7EHNBAT32MMASZ5, amount: u10000000, memo: none} {to: 'SP1697EFBW8FY52GFF1ETR7P7JH76T6M7ZQ2TR7FB, amount: u10000000, memo: none} {to: 'SP28T3SNY86D5AW62JJVP0TQR1H7TBZMP8R6B65RA, amount: u10000000, memo: none} {to: 'SP2ADZTN3BQQZ83KDBJPRK8XN191E5RXEZJKP42FQ, amount: u10000000, memo: none} {to: 'SP1FA9SHWCYDVPKEVSTY7CX21CWCJ7S8FS4K3YQMZ, amount: u10000000, memo: none} {to: 'SP3VGRCZDRG8JBGX0H0P340DZC7C3FWCA80S9TT3D, amount: u10000000, memo: none}))
(begin
	
	(try! (send-stx 'SP1FQ3DQDR5N9HJX3XC5DNKFCG4DHH48EFJQV6QH0 u1000000))
)
