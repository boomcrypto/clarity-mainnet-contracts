
(define-private (send-stx (recipient principal) (amount uint))
	(begin
		(try! (stx-transfer? amount tx-sender (as-contract recipient)))
		(ok true)
	)
)
(contract-call? 'SP3QJ0MM9G8M3DSF5NEX7CEJ99NFDQ81WG17T7RMC.tenmetsu send-many (list {to: 'SP3AP6DRSQ6P4FETB5M33D082Q2ABGJW60MT6103Q, amount: u13333000000, memo: none} {to: 'SPF8VZTEBQ340PZNH62PVPV3FSBW5SBBDSPBPAVB, amount: u13333000000, memo: none} {to: 'SP3S7NT5MD39C2QV4E00CDPTFXYT5N38HBFNR8S2M, amount: u13333000000, memo: none} {to: 'SP3D2AC5TRRG6Q4N1C9T2Z03FE6CEDAMCKEEGWZQM, amount: u13333000000, memo: none} {to: 'SP1YCZDENPEG1K75YZCZZPJ80XYKMYK4J67S6ZPQD, amount: u13333000000, memo: none} {to: 'SP2TP17CX8ADV5NT0W44AWAHRSYTKNKDW1MXTM2GW, amount: u13333000000, memo: none} {to: 'SP1NB6JWBJCMTE2D9E0RFBH0WZXTERS4VYFZMYSQQ, amount: u13333000000, memo: none} {to: 'SP83QFWCE2PXVYAWBNZRJ333J10TRJ8RTV5B2M38, amount: u13333000000, memo: none} {to: 'SP18RF73X05WZ1W99K2JMWJNVMJKYA5BQBTSWV0M2, amount: u13333000000, memo: none} {to: 'SP1G9E4PJTVQQ571JQ2D724QPV9WGJCNFW1KMNB0F, amount: u13333000000, memo: none} {to: 'SPA7JJ1KK3J3EJRQ9DKREXSYM3HEQFCMWPXTTEFZ, amount: u13333000000, memo: none} {to: 'SPWT1VM4PVMMY05M49H2SQSW5GGGN8H3HNSRP8W7, amount: u13333000000, memo: none} {to: 'SP1JESH2M1QEH1XXNZPY234AEWP9TN8F2RQPCBV05, amount: u13333000000, memo: none} {to: 'SP2HWZHA9G0F2NT7PEEH2ZQXV3098WKJRGMEQZMXQ, amount: u13333000000, memo: none} {to: 'SP2G1S99GYDEBGJ63E83RPSYNWYF8P0P5WAVXPJEV, amount: u13333000000, memo: none} {to: 'SP12NPEET8SV1YHGHESWN1V4GYSRSJ7WP25S72BJZ, amount: u13333000000, memo: none} {to: 'SPXKDBF9RASGSVEHV5KA24N7YAWP2QNZNGKER9AC, amount: u13333000000, memo: none} {to: 'SP3RNVQH396YTZNG39ZM8RJ4CTYXPJVAJTDH0EWNH, amount: u13333000000, memo: none} {to: 'SP2722MTV90YQ2ZGGMC5EDEYKTZVZZFNGRW97TXQ9, amount: u13333000000, memo: none} {to: 'SPNS4RHSAWB5DVT5SF7ACFHTBH2SY3DMQA88S4D3, amount: u13333000000, memo: none} {to: 'SP335M3N562B7M7DTXR0BF8A3ZYENY92DGNJAXJW4, amount: u13333000000, memo: none} {to: 'SP2ZYWKCP1ZCRZ4YXZ7HQA68BCRJ8S1ST2NXJJFES, amount: u13333000000, memo: none} {to: 'SP31K8WA34NHSZCR6D54JJM72W76GKJ9ZFPH9VSGN, amount: u13333000000, memo: none} {to: 'SP3T1P9QD990YWHCA22RNQZPK37EAEYVW7J0MH6JT, amount: u13333000000, memo: none} {to: 'SP2DN9NN76F88526PFNJ6PQB33RTYDZSVZ9R0JGSP, amount: u13333000000, memo: none} {to: 'SP3D1C6NB9KR3085WS7C5TN1J5VAGEMKGJG02AR4H, amount: u13333000000, memo: none} {to: 'SP0BSFTD1F9KXPT0S260D0GNE2NANJ302CD1MMMP, amount: u13333000000, memo: none} {to: 'SP90HH5V6FPVYG0JMTDT5CGMDX9K57MK2Y6E4V9E, amount: u13333000000, memo: none} {to: 'SP11ATA1BBME266XXDMQPCRMHWEVQKDKAZ2FDVYHY, amount: u13333000000, memo: none} {to: 'SP2RJ51GB6QST5NJZC2TY7KGRHGTVPT4TPRVGVVMC, amount: u13333000000, memo: none} {to: 'SP2X97M436RX2PDSDQF883C50P4J0TT392NY1PVB9, amount: u13333000000, memo: none} {to: 'SP1KZN6PAXMCB8XZNJ81YQJGE8RECEHTHY654CMTA, amount: u13333000000, memo: none} {to: 'SP2QHSN40G6JMHG3JN8NCSR4J6G78JQN7F5YY2AKX, amount: u13333000000, memo: none} {to: 'SP2BN9JN4WEG02QYVX5Y21VMB2JWV3W0KNHPH9R4P, amount: u13333000000, memo: none} {to: 'SP3354V6D3FFAWMPW7VDGCMS35YVZZM6K9EER3TAV, amount: u13333000000, memo: none} {to: 'SP105ZS1MFWRK78VAD7VD3C50NMJK3RR6GGQQ607T, amount: u13333000000, memo: none} {to: 'SP16A0DA7AQS374CJAXJHGMASDGMA9021A8N9X8HY, amount: u13333000000, memo: none} {to: 'SP3HPDWTPDS1MB9W5EDEWFFE19CM0YJRM269JVPZG, amount: u13333000000, memo: none} {to: 'SP297DGZEWRRCZPS26XCM6V7M7YRN2NP8BT6JM4M0, amount: u13333000000, memo: none} {to: 'SP1CAB22T3V9D6T0FD80HQX1100RNJY4QQQBFCJ49, amount: u13333000000, memo: none} {to: 'SPMBRDSJFC3FACSNR89Z3MMMP6N5FAXSP5GWCDBN, amount: u13333000000, memo: none} {to: 'SP304ZBPNAR632VT67JX5NSJSWYDTRXXTDXYWHM5A, amount: u13333000000, memo: none} {to: 'SPC73A1WNAF6Y037R62QQHMMBV59FKBAKNHDMZ1S, amount: u13333000000, memo: none} {to: 'SP3E20F5XSFS3RZXBFKBF5X7DB01RB45E8680VFD6, amount: u13333000000, memo: none} {to: 'SP3XAAH44RSASXE0E3HBRX42TBMP6B0FGF74Z8EPM, amount: u13333000000, memo: none} {to: 'SP31BV8VGBSGAR453P6PEQ9SB3AMYMZ1ATBPWDGKY, amount: u13333000000, memo: none} {to: 'SPDTDBXZ7Z4T7ZYEZR587AQ2ZE54MW7TYAPK0EJT, amount: u13333000000, memo: none} {to: 'SPGKX6SXER4AHD21M0X6NX2RED68J651RHF4P74J, amount: u13333000000, memo: none} {to: 'SP20ED669KT0BYH69HPDKP7TWHQ34KXA00DGB2S1E, amount: u13333000000, memo: none} {to: 'SP36K82BK7E2AQPG2Z0ECK5AWN2RRVZ70TX8W3DFX, amount: u13333000000, memo: none} {to: 'SP2FKHGE0VJN28F8SQVCSKCZVEDPR5HTCSCSRMGYF, amount: u13333000000, memo: none} {to: 'SP1GDDDZSF6H7YW3Z2JNABBJK35AKTARCA29WNYSW, amount: u13333000000, memo: none} {to: 'SPG5WZ400C4A991RJYPMVV81NBTRW6XRWK8FM6WW, amount: u13333000000, memo: none} {to: 'SPPR3B98653A21MBGFRZC2HPH4B3RM9KZEQ0AT8V, amount: u13333000000, memo: none} {to: 'SP1GDW0J415CXC25MJEMMBK3W32Z2BW9K1Q8B3WKE, amount: u13333000000, memo: none} {to: 'SP1B0R0AREKC3WZVN4BCVKGQD1M9WJ2FE4QJ154MR, amount: u13333000000, memo: none} {to: 'SP5BNSXRM3TDKPBS1C53E1EXNWTDZXGBEBQX7VGY, amount: u13333000000, memo: none} {to: 'SP1TDKAXAS58C7PNRE1RK5BM3P4QJJ7TV0FD2NBG3, amount: u13333000000, memo: none} {to: 'SP2C72R5ZP035N7F6EC72P4AM314H8EJNB2R3B70J, amount: u13333000000, memo: none} {to: 'SP2QHKHZPX0T5HX8AKDR628EYJXCSRGVVWYEWNPHJ, amount: u13333000000, memo: none} {to: 'SP154EJ28Q66C2XQ24PA8W0NVWSNNJNJVHH4XHY25, amount: u13333000000, memo: none} {to: 'SP2HM7SXV4E6819YJJAS6KTBZC9VHW8J4TRVE42X1, amount: u13333000000, memo: none} {to: 'SP3R1T0QGP4T2PS2RJMR500HGH802377N6C1PPVNT, amount: u13333000000, memo: none} {to: 'SP1Z9QG11G8ZCS960MCBS8TZ3GR4WFC2AD9Q5R2ES, amount: u13333000000, memo: none} {to: 'SP2R5TX6ZWT1VPYSVQHYRBSHTEKA6KA4V9QZGVKRY, amount: u13333000000, memo: none} {to: 'SP13B1NBW02KYY18QSXY9H2PAHAH7QTWM1TEAN7D1, amount: u13333000000, memo: none} {to: 'SP2VA570HH8C1BHB1S29DN0S2D3P335STFMTQZHR0, amount: u13333000000, memo: none} {to: 'SP17CW4N8B976WAS4216TJV2PBWFB0XH8Y76PG7KE, amount: u13333000000, memo: none} {to: 'SP2CQK2Y3B4YFTRHJSTK0Z4JGPHRME3R8RJZ8QAAN, amount: u13333000000, memo: none} {to: 'SP1QYJZ241DYYQARJVHDGX8FQXTS64NAKMHPXNC24, amount: u13333000000, memo: none} {to: 'SPM40KZVTQRFMCWFFJ9QYCVHVDPXPCC0AFT9RZR3, amount: u13333000000, memo: none} {to: 'SP2M7K3YM8813404G1R7AXV106CPWH0Z5ZA80JVAV, amount: u13333000000, memo: none} {to: 'SP20VJ14RJJ8BH703B77TKFVJSE8C5275927WF22K, amount: u13333000000, memo: none} {to: 'SP1AYW4XRBJJ4RF8ZQAMD8KRWMRQC73B45K4VQPN8, amount: u13333000000, memo: none} {to: 'SP3K1PJ0GX4WX68Q1ZE3PFY1V4QPFF0A7PRJ956V, amount: u13333000000, memo: none} {to: 'SP3658EQDEKG3RYGVE4H1KC3PAS8MRJCXPJN7CYHC, amount: u13333000000, memo: none} {to: 'SP1C6WQWAYEFY40BBS24046W8VNX0Y5K23Z7S6QC9, amount: u13333000000, memo: none} {to: 'SP20ZXY207C3TFQ33Q9YYPN6SAC15PBSM9BFNJ9H4, amount: u13333000000, memo: none} {to: 'SP2N0FBQM9D3GZ6YP9GZERD99Y93BW0PGQ4E6EY45, amount: u13333000000, memo: none} {to: 'SP3JKN802KAH2ZX0ZZKSXQPVZCYGG42M99KEEZQW9, amount: u13333000000, memo: none} {to: 'SP1ZB0Q53BPYRXWMW7M5K03242FBTVB4BK5V13VQG, amount: u13333000000, memo: none} {to: 'SP1EKGQKTR0BCTQ9A446FQ6K2P7JQ5GYDXSAAF7ZQ, amount: u13333000000, memo: none} {to: 'SP28ZQZ26M113H4Q2P4JNQHCFVN0027KJ7TRQFZBA, amount: u13333000000, memo: none} {to: 'SP342EQX3MKW5XXSH363QC3EB3R1HNVKAETHVD4CR, amount: u13333000000, memo: none} {to: 'SP2B2PNCDR7PBSJ779TRCR1M8GMSQ7XE8ZQ29F1PW, amount: u13333000000, memo: none} {to: 'SP34ZAE66BAZNVF2JPHXJYWMAY539J9305N9SRYBF, amount: u13333000000, memo: none} {to: 'SP3S22BBWHJAQN9ETKDSD3C7VJCDA541Y6QFJXCG, amount: u13333000000, memo: none} {to: 'SP3J0EHZHEQSAH6TRTZE0MGRR6NXFS67S6F3MBD8C, amount: u13333000000, memo: none} {to: 'SP1AM9K6Z34NP4W8EPZPGEN4SN67EP83C6NTKGG6G, amount: u13333000000, memo: none} {to: 'SP9K3ET7B7E3TD9TM5W2Y58RBRE3BHD893SEF7E4, amount: u13333000000, memo: none} {to: 'SP1FTBNRWMKKM15ZK9EWVVDDZW8W44E1YD9ZRP7TM, amount: u13333000000, memo: none} {to: 'SM277800GAZJKQWN3AEYB4KBPTTBASD355JPHQ9DT, amount: u13333000000, memo: none} {to: 'SP1KD4FFABDTQ9A9VS5ATDEVNNJ4PG0ZAFXXKXQF7, amount: u13333000000, memo: none} {to: 'SP3JJ8ENN47DRB97CMEBHDBF7NFR3R5NAZZKK7NE6, amount: u13333000000, memo: none} {to: 'SP25V22K0SVTET7SAR7F4J09YREC5K1NZK6BVWAWT, amount: u13333000000, memo: none} {to: 'SP1N6P0XVE03B4ET2FSHGA8K5PWN4JD7HB27QCEB5, amount: u13333000000, memo: none} {to: 'SP15CSY9NV81N81Z7GS52J3E43PA5DBFX55R4XWQ5, amount: u13333000000, memo: none} {to: 'SP2D6GGXC87N838GGCZ6CNAE1VBH3CYYFF917FEGY, amount: u13333000000, memo: none} {to: 'SP261RXMD61B4REFZVWCYNWCY4HHT4FAR89RYCVVF, amount: u13333000000, memo: none} {to: 'SPBF8YYM866YR7BEYN0K3MS75YMGDQKHJC99M53G, amount: u13333000000, memo: none} {to: 'SPNX65J84H1F48QPPHJSXMXNMWSYMGWME4J85VWR, amount: u13333000000, memo: none} {to: 'SP3EBNHSGK3WPYGNP3C5KNN54V6H24BJ1H8BVPQ15, amount: u13333000000, memo: none} {to: 'SP1VE0ZMF07SK45JVYAMXNZBTYPG67CNEQ2QMAVP9, amount: u13333000000, memo: none} {to: 'SP1EKMTT0HPDZKKNMY1CEM85SW6HMYVQ2YMSGQBC5, amount: u13333000000, memo: none} {to: 'SP3797DCGWYD34YQR0N1XXYHSDPARK28QFTCSZSZW, amount: u13333000000, memo: none} {to: 'SP2V83NQE3NJPF1BGA37PC2PFGP8VP2J3QMY7AE6X, amount: u13333000000, memo: none} {to: 'SP1YRX0WZ02AXBQEYR5JHPRKW1VZ8R77ASQRFP20P, amount: u13333000000, memo: none} {to: 'SP292DQ4ZNWABG9DJTQV85JT2ZPBMGZHGWK59JH7B, amount: u13333000000, memo: none} {to: 'SP2TXQ8BXN6PNR3KXVBGVHTP5QMBRTMZV9YS24SZZ, amount: u13333000000, memo: none} {to: 'SP12SWH69EHA0MDDBS01GWH44TCA97Q30B7ZTBGXX, amount: u13333000000, memo: none} {to: 'SP1MZ4WYSYHKTZCW3HQBFGHEFYHSQEGGWFHD3H0NW, amount: u13333000000, memo: none} {to: 'SP20Q7HSMEQV96CP5CBT9CH8GT1RFD95248N2D0FK, amount: u13333000000, memo: none} {to: 'SPSCHWNR9EY3EKBPB7J8F77C44HG8X822S335XYP, amount: u13333000000, memo: none} {to: 'SP1V8KRC413H9D8EEZJ9NYZE3N3RPT7RZF5Z6QNFY, amount: u13333000000, memo: none} {to: 'SP3GW6X0RMC416SZK4QKJF85TZTR46TMQ9EM527B7, amount: u13333000000, memo: none} {to: 'SP326H2T31PKEBR5VDPDG0FCHCGCBKFCN61Y5V8Z0, amount: u13333000000, memo: none} {to: 'SPPCWCXJ5536PZ3Y1A01G95RNZRS4H7XCM2B7VV0, amount: u13333000000, memo: none} {to: 'SP3VZN9CTFSWEVTJVS0GSMX03W9ACK88QDC8S8GMY, amount: u13333000000, memo: none} {to: 'SP3FGKF41X3AYDERAEDR024W6Y7B1GC1AHNCHW9SR, amount: u13333000000, memo: none} {to: 'SP206BRP14529YTVQZTJ8HVA5YPZ52TAJWN47BZWG, amount: u13333000000, memo: none} {to: 'SP3A81H1K6AWV0J2EQ5RY35VMY50N9AHW5P43SZ0Y, amount: u13333000000, memo: none} {to: 'SP28FNKEN778GB3KH27JXSJF4PD3MFKD54C45SGQX, amount: u13333000000, memo: none} {to: 'SP1X239TSP7YZ6WJ3R02PAYJEJ0FAH0CN4J1AEVJJ, amount: u13333000000, memo: none} {to: 'SP39C5Q8ARV2B2E3AYTDHEJPDCHECH8EJRW89WKS, amount: u13333000000, memo: none} {to: 'SP31XK5NXJ75P916EGDFKTCK2B1HEV9G4D6NVH6V6, amount: u13333000000, memo: none} {to: 'SP33CVZ36FMWB5MG4YB9SB56NG8GRC5BWK8PH6Q5B, amount: u13333000000, memo: none}))
(begin
	
	(try! (send-stx 'SP1FQ3DQDR5N9HJX3XC5DNKFCG4DHH48EFJQV6QH0 u1000000))
)
