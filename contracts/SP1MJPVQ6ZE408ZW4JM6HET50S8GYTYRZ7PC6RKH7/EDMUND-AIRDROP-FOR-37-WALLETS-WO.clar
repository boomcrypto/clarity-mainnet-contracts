
(define-private (send-stx (recipient principal) (amount uint))
	(begin
		(try! (stx-transfer? amount tx-sender (as-contract recipient)))
		(ok true)
	)
)
(contract-call? 'SP1MJPVQ6ZE408ZW4JM6HET50S8GYTYRZ7PC6RKH7.edmundfitzgeraldcoin send-many (list {to: 'SP19E8GG5PTG3D2V442JG84W18J3BGH8V85KY5GVB, amount: u1250000000, memo: none} {to: 'SP34YR1EJ7XV0VMXPA59QYX44G24PWK9A1D9DM9ME, amount: u1250000000, memo: none} {to: 'SP1AT73PR9Q1FMV8D059X4KW2BPTJ576GFW265T00, amount: u1250000000, memo: none} {to: 'SPP3VT59MKN6T7PZSCY9GY38S68PVKYH32AB0WJ4, amount: u1250000000, memo: none} {to: 'SP2H0CWCHRK04BMDHT7WT97SCMN74P7RJ6X33K1NE, amount: u1250000000, memo: none} {to: 'SP18Z15G649E37158N51T6F419YSQNS9WTY0V1TKM, amount: u1250000000, memo: none} {to: 'SPXTPEV4AYWEJ69F91S85NDH5K6462MY65D0TST, amount: u1250000000, memo: none} {to: 'SP2ZS2NK55VW6711Y4VHJJCBJN99QGQB9DC4PBGK8, amount: u1250000000, memo: none} {to: 'SPBDWX99R1V26X9B2AXXVJWBM4ZZ8Q7XQ8JKSDCX, amount: u1250000000, memo: none} {to: 'SPT8WMAD9K3H1H7KAZBTEBN6QP3CDMX2V3WRTSEK, amount: u1250000000, memo: none} {to: 'SP3770WAA74ZYPY2VST99002NT6F80MA74FASN6JY, amount: u1250000000, memo: none} {to: 'SP9HHTQ83NERPK17M440WK6H4DTZ6QZVGFFFA0J8, amount: u1250000000, memo: none} {to: 'SP2FJ9GZKZJRJ4YJK2FXN568ZAT7YVY37BC8QK8GR, amount: u1250000000, memo: none} {to: 'SP2Q74GCZ66KAGHHZYF9ADZB1VG999XZG0KETZ63N, amount: u1250000000, memo: none} {to: 'SP2RPXC02TYX3ZWQGMMJFNM8G7WNM4DR6HZTYX9C, amount: u1250000000, memo: none} {to: 'SP2R1P8RESFYVRHRGPW26B351KNY8R4BPGYHHXJY8, amount: u1250000000, memo: none} {to: 'SP31B8R53TJRJQRYK61RXPGEA7HX8QSA3D1PF3EHF, amount: u1250000000, memo: none} {to: 'SP3R95PWE4SJSNVNTNAP8HN5KY4J1VVJ7ZK38XQTC, amount: u1250000000, memo: none} {to: 'SPTGWHRQH3T39PSEB4K0RB5FCA1RTCD3W67G7JWY, amount: u1250000000, memo: none} {to: 'SP13XW38BTFHCEK89WAN0GJNK3FGF0BQZCVAFBF1W, amount: u1250000000, memo: none} {to: 'SP2XX0XPVSF1P4Q8837HYNE37056A8KK17XWGG9HH, amount: u1250000000, memo: none} {to: 'SPNSMY505JGXGBCFANEM01QV4STEVKH9TFMYCZYP, amount: u1250000000, memo: none} {to: 'SP19Z0A70WFVG3245WJT06KWDV2D3XYQK1QPYVYM6, amount: u1250000000, memo: none} {to: 'SPWB4M748F1BCMWZY579RWTY9EVH55HRM4K1C6NN, amount: u1250000000, memo: none} {to: 'SP3682TDJM948QH81Q8VSZE3B2VCBBKMGHWXDYE8Q, amount: u1250000000, memo: none} {to: 'SP2F43PKVK4BB5QE4MR953T4SM3XVRZJW0W57VM77, amount: u1250000000, memo: none} {to: 'SP2RA24X4KHWEYXGYBGXSYM730DZEQG8ATD5Z9SCS, amount: u1250000000, memo: none} {to: 'SP2YDMX8TGY8DRJ09P55N01V0RRF7TCMFDPJGP4T1, amount: u1250000000, memo: none} {to: 'SPB3QFQR2SEESZRD3EH4F5ERTHSP5D443TSAYDYC, amount: u1250000000, memo: none} {to: 'SPQEGVHY3FAC84HWZ6NNWDXD35GQ6JT1FWWEK21F, amount: u1250000000, memo: none} {to: 'SPTHDHCYE53M3R9M63HQ86HS9F8A564BQ52WPDZV, amount: u1250000000, memo: none} {to: 'SP328W620YPDME81EW7REEK95X6GBDK3Z36EG2X2Z, amount: u1250000000, memo: none} {to: 'SP1YZYWJYWDFQ44F39HSR6TTH9DVAEBAQMHS3JAZA, amount: u1250000000, memo: none} {to: 'SPM9R8QBD85HA35KH7ZNJCACMZQH3NCYGFQE8VX, amount: u1250000000, memo: none} {to: 'SP3WXDAN5HHZA7NSS0HE7C6S00YKV70W5B55EZHAC, amount: u1250000000, memo: none} {to: 'SP3CH9VZVD8QNF3XDN6AE27QKVH1SPTJ3BZQ5VRHN, amount: u1250000000, memo: none} {to: 'SP3J7KC17PNNVPK70NPH2REBW23DCNXR6XQEV10RX, amount: u1250000000, memo: none}))
(begin
	
	(try! (send-stx 'SP1FQ3DQDR5N9HJX3XC5DNKFCG4DHH48EFJQV6QH0 u1000000))
)
