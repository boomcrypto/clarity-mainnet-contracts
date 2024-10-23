
(define-private (send-stx (recipient principal) (amount uint))
	(begin
		(try! (stx-transfer? amount tx-sender (as-contract recipient)))
		(ok true)
	)
)
(contract-call? 'SPKP1YPE8GEG31854NBGVG5YD0HHTDGKZSM5QSZ5.unik send-many (list {to: 'SP2GV9G7QQW86A3K7ZZWKC3A0608YHNKNYSQCGJVM, amount: u65146000000, memo: none} {to: 'SP28MFVF835M9HR323Z26Q4A8FZ0PRV9E2FT0ANAG, amount: u65146000000, memo: none} {to: 'SP3Z7511VWR5WG9J3MAKER3NRZYKWT83K2XTP36EV, amount: u65146000000, memo: none} {to: 'SP1KNN40KSFQCDHX7EV7TC2RX1ACNV4J5JBC1AZGJ, amount: u65146000000, memo: none} {to: 'SP2FCJG6YYDWQV4QN28DQ8BV5E1B9NN58N4QJYZMT, amount: u65146000000, memo: none} {to: 'SP1DY3DQMVAA1F8JJAJBKPQ0HKQ1FZG67JG0YD5P3, amount: u65146000000, memo: none} {to: 'SPE0MDAFP72QG10RXQD3JDF89KHH49GSVCD18SB0, amount: u65146000000, memo: none} {to: 'SPCPVA55VTJDCVQ52NP6JZJ9CZGPGHDY8J8N0R5D, amount: u65146000000, memo: none} {to: 'SP11KMFRJ1BDRBBQ5S2XRNRZ89HJYW30683AYMSMQ, amount: u65146000000, memo: none} {to: 'SP3RKRKGAW47KZWMMHNS9RFRDX4VM0W1M8D8PWZXJ, amount: u65146000000, memo: none} {to: 'SP3FJ1WZ04H50HAB58MTJAJ4TGNB9X0BD5KTY6W2C, amount: u65146000000, memo: none} {to: 'SP14V9BXQR5A6M32REYYFDBQQE7FA0Q2R41GD90NK, amount: u65146000000, memo: none} {to: 'SP2CDY5S7VD4Z4RT93Z1RTXAS1ZXGTVMPHKNKZ27S, amount: u65146000000, memo: none} {to: 'SPBNAM3RV2ZTXAYRV70PETHWSJ65NA319JXCQX08, amount: u65146000000, memo: none} {to: 'SP1VES0WGZ4SWFW3SX2TDP7ERJGX8JZ34F8BYJTM6, amount: u65146000000, memo: none} {to: 'SP2N4P4HH1Q7Q6FGPY2X0YS7YDQCG2VQB2HXRJMTH, amount: u65146000000, memo: none} {to: 'SP1E9874H9A8DM04P8MDXH6CWF7PFWZYCQ2EV9SK0, amount: u65146000000, memo: none} {to: 'SP1M0ZSM4MDMAJ5VC74YVYZKJPJ46JX3SX4GD4ETD, amount: u65146000000, memo: none} {to: 'SP1VJ580XH7H8MFMZKA4J44YQ7A59R9YS8PC6D4NC, amount: u65146000000, memo: none} {to: 'SP57DXF9BCNES18RAFSW5G51HCN34YQBCZF3E3W4, amount: u65146000000, memo: none} {to: 'SP3X264QJWDQ83QHDH872569ZEJGX8ZHHNC8T0DRZ, amount: u65146000000, memo: none} {to: 'SP1ARMERNP9FHGMFDTGJ9WZPRJH04FC5XS12WMZ1A, amount: u65146000000, memo: none} {to: 'SP3ATFW5VSD0W4N0E3K1E4CGFE8MJXQ9XFFMQ0HBY, amount: u65146000000, memo: none} {to: 'SP2SKMAR9WMD9DBJHC4XTQXPZCDNV1258PSJTRGTV, amount: u65146000000, memo: none} {to: 'SP2Z2CBMGWB9MQZAF5Z8X56KS69XRV3SJF4WKJ7J9, amount: u65146000000, memo: none} {to: 'SP24478XYAB7DZF7850JWVYQRGGRKDWXF7WKKRY30, amount: u65146000000, memo: none} {to: 'SP1MAVN1K5D9JJDVFK6RMJABE6NAV4K67G2SG34ZN, amount: u65146000000, memo: none} {to: 'SP5ZH3A0W0GVKBMX532Z2Q9B43Q2H4DXC8DH1EH2, amount: u65146000000, memo: none} {to: 'SP14NSM2BAB9MGMYNXJB93NY4EF4NFRW3G3EFBZDX, amount: u65146000000, memo: none} {to: 'SP2RNHHQDTHGHPEVX83291K4AQZVGWEJ7WCQQDA9R, amount: u65146000000, memo: none}))
(begin
	
	(try! (send-stx 'SP1FQ3DQDR5N9HJX3XC5DNKFCG4DHH48EFJQV6QH0 u1000000))
)
