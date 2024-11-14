
(define-private (send-stx (recipient principal) (amount uint))
	(begin
		(try! (stx-transfer? amount tx-sender (as-contract recipient)))
		(ok true)
	)
)
(contract-call? 'SPMWB0BNTFM19PWTNP0SJ2WX3PW5GTTMBS8BGZ5X.stx-bros-stxcity send-many (list {to: 'SP3ATGG115KKV9Z46PXJ0N4XSZHTPZSV47F56DGDM, amount: u100000000, memo: none} {to: 'SPSRJ9WTRNDMFH9KXZDGQER14560YPPM8RTEM11N, amount: u100000000, memo: none} {to: 'SP3BJC1NWHJ4QX63V3Y8B997CA1CCDSMTPJT18869, amount: u100000000, memo: none} {to: 'SP3CWAZQ9QNHXS4JC2Z7P9FNF71C8M9GFEYK90PSH, amount: u100000000, memo: none} {to: 'SP3JQN9JSARQKFD1R9HQS2F0NKZNWTM5DTRE71NKT, amount: u100000000, memo: none} {to: 'SP2MAPP90Y7F6VE4D5719A0PBH84TWK0EG66HPK48, amount: u100000000, memo: none} {to: 'SPBE2HFDF4YKV8KBJSPVF02F0EBXM231DY7ZRDZW, amount: u100000000, memo: none} {to: 'SP1058BADBFDQKSRDK4BJ0M0FPGGXHV2B0F74NT04, amount: u100000000, memo: none} {to: 'SP2QXRE8471ZA31DGX7GP12PCW56CR3WSPW8PK7V3, amount: u100000000, memo: none} {to: 'SP35WWDEZJ7MSD6537CW2C0JNWX0Q8G5QHX1PVDV7, amount: u100000000, memo: none} {to: 'SPZAVP0KRAZYMSBC7X8CT7JJS088VBG7TXDJ4H61, amount: u100000000, memo: none} {to: 'SPP6XR9JYVSK06Q52FWWRCA1BHZEJ72GQPGEFH15, amount: u100000000, memo: none} {to: 'SP1JFC00G5R8PEGH7NJ8ZA7V0Z8A8XSSJTJBHE13Z, amount: u100000000, memo: none} {to: 'SP20QEZTD1D9EWMYDYBC7GS6C1ETVMPQRASS7E3K6, amount: u100000000, memo: none} {to: 'SP6HEAEWBGB8JFQJEG2Q48F2VGSG6PNCYA9MFDXS, amount: u100000000, memo: none} {to: 'SP3G5EQ7KNBS5E271894WS9K3P4Q5YC0K7DH3YHX0, amount: u100000000, memo: none} {to: 'SP3XCHB2ECWKSN7HG50M4PFXF4DV3K4VYAEE27A1Y, amount: u100000000, memo: none} {to: 'SP18CA3YM9994ZSNGYAHK59W3TSF652WMD1X4YKH0, amount: u100000000, memo: none} {to: 'SP2BCFAF2J5JZVZMPAYEQ5RYPARAX761MD869TFQ3, amount: u100000000, memo: none} {to: 'SP335DDSZQEHKRA3ZT6PZNA5R0GTZD346BMF9JWG2, amount: u100000000, memo: none} {to: 'SPKDZXQQZ96HZSW473J525FWBQGDFN4CF92R3MTE, amount: u100000000, memo: none} {to: 'SP2X18B5A5G121TXGAF0WZPX52D69KVKPNQZ0ESSC, amount: u100000000, memo: none} {to: 'SP38TWVDPBNRJ91KRPQR6S7PQH6MM1ZM9WZFDRENC, amount: u100000000, memo: none} {to: 'SPMAD9QHPPSTEK2STTBK9DDS71MPT0JX5NV49QMS, amount: u100000000, memo: none} {to: 'SP27M3SASM61HJ6B0ZR0DA91DNZRBYACCCNE7S7ZS, amount: u100000000, memo: none} {to: 'SP1P0W05BACJZ4G7WPW5ZTW1XGW8D4JXYGMZZNKZR, amount: u100000000, memo: none} {to: 'SPP40J61J87YWR7K9SFCQ3EAF6WMN3799Q8X208F, amount: u100000000, memo: none} {to: 'SPRHD8QZRSDVSN4NSDDHQR8JVPSHCQ0JRKKAE1GJ, amount: u100000000, memo: none} {to: 'SP272ENTQEV360PYVKHT39VZDVZXQRQN4KB57KKE5, amount: u100000000, memo: none} {to: 'SP36ESH2K6S47G3X9V29HNGYCPC59EN8FZF75F6WM, amount: u100000000, memo: none} {to: 'SP2BMZWNR57NSCM979VN4NVJJ0H16YN0KKTDVZG2H, amount: u100000000, memo: none} {to: 'SP8364EWR7EH1VKYTDAFCD89RSQSJP70WCHS673K, amount: u100000000, memo: none} {to: 'SP2PHTNYRFHSN1AWWCNKEPHWNREEV1H6TBXPTVYB6, amount: u100000000, memo: none} {to: 'SP2VTPR418ZMA20KNRKWVVK3VHD73WKW65ZX065Y8, amount: u100000000, memo: none} {to: 'SPJ3NMKWHH3QV2WJ38VYJ4MAC2WF318373Y79MTS, amount: u100000000, memo: none} {to: 'SP3ND7YW5GDPF5JJGVY0PN36QWGDCF2X2N0D7S26S, amount: u100000000, memo: none} {to: 'SP1B32CAVBBSY7NG0B9X2T8GVXDDWSA5HD8RCG1ZT, amount: u100000000, memo: none} {to: 'SP1SGVJZNK1D9THF2668AMPK7Z5VQNZ1V639JNP1W, amount: u100000000, memo: none} {to: 'SPDQPGPJB6YR978ZK4PD3EC2WE2KS790BP4NPW8J, amount: u100000000, memo: none} {to: 'SP3KEM5N9JZHQYZ6KKRXJW9HXSPEK33Y2EY6J6M0J, amount: u100000000, memo: none} {to: 'SP1PT1Q7XVFZH6F7BMDKZKCKDB3735ANBYZQF5VSD, amount: u100000000, memo: none} {to: 'SP9ZQ0NFS2P94TPVWXPWDZNKPC4YMC3X72F4T1ZA, amount: u100000000, memo: none} {to: 'SP3XDEQ0JHP6AGMWF6PQZMJC1C0BFK2H0YSWMNYXS, amount: u100000000, memo: none} {to: 'SP2KAK053MRM949BBKFXPWSF96HYZYGMFQPECA7KM, amount: u100000000, memo: none} {to: 'SPX8T06E8FJQ33CX8YVR9CC6D9DSTF6JE0Y8R7DS, amount: u100000000, memo: none} {to: 'SPXDCV8BXRZNQ4XEB88XHJPPQEEYP63DDV3W8C9G, amount: u100000000, memo: none} {to: 'SP3YD1FYXEZB489C503SRBEGEBJTSEYMY0SEQ8H2W, amount: u100000000, memo: none} {to: 'SP1NV57CDNH38V172S6B1MQBG05NETKCJSNJ3GMB2, amount: u100000000, memo: none} {to: 'SPTTNG61X63GDWACF3TRV73TBCYKK97828BMZRY4, amount: u100000000, memo: none} {to: 'SP1T8WFJ8BNYWFKTVWDM7A17YGT7JHHR58SYBBDPC, amount: u100000000, memo: none} {to: 'SP25EMHZP575AZ5ZEJKVWNQEMCM5TNWYWVS5J47SX, amount: u100000000, memo: none} {to: 'SP2A354CE532RKK2GXP9J47BZEM7AKMAHD3P2AEP3, amount: u100000000, memo: none} {to: 'SP2FM4S87N1YD4BYK81TM1DK4J517K2T1T2MGYM9M, amount: u100000000, memo: none} {to: 'SP3PS44ANJ23XBTMZTKKR10TKRFFB56233W03G5P7, amount: u100000000, memo: none} {to: 'SP3V5JMYHQKHB7FHHFXGDNHRMSKJB7FH57F02VV61, amount: u100000000, memo: none} {to: 'SP1CJEDKW844GNFJD4P2XVFN34YXE5SPW7C5P0CYK, amount: u100000000, memo: none} {to: 'SP2T86KVT9CQ1YMTY96GYD44FJ46YM4115R1HB4DQ, amount: u100000000, memo: none} {to: 'SP3AFT1W0QR3VCYHP5N2BB1MQX22CD3PK88Q0X227, amount: u100000000, memo: none} {to: 'SP361VGESQ84ACGWBMCQ6Q7Z7J67K1REZVRCKRVM1, amount: u100000000, memo: none} {to: 'SP3PZT3F6NKVHKCS7VJN5ABEBR8SGSS49PBDH0QMB, amount: u100000000, memo: none} {to: 'SP30A0ASP3SWRS64E29971MJ33VWMX2AW2ENGAEED, amount: u100000000, memo: none} {to: 'SPA0Q2XVA7YZZ9XZEXA59THESE6K57CQ39ZKJSEF, amount: u100000000, memo: none} {to: 'SP3DNYE2FFJ096Y53G6327CQ06PQHFQ3D54FRV8GF, amount: u100000000, memo: none} {to: 'SP3752YPD97BT7KM0VC7FER6B0MNYG49MMXJ2CHBP, amount: u100000000, memo: none} {to: 'SP2CWR78RSSVKGNXY92459N7QWYDT4ZHK9D778HG0, amount: u100000000, memo: none} {to: 'SP2QJSNGG69P113K0MB3J5MS4SE0CG31EQS1A6BSX, amount: u100000000, memo: none} {to: 'SP34YQ10NAZA5NT0ZDAAAX1R4DRH5SQ6A7RNJS2H0, amount: u100000000, memo: none} {to: 'SP1XWKRFHV4JR11PN4HZ13TR946SE4XXJ0J033B2, amount: u100000000, memo: none} {to: 'SP2ZC0HF25GH0HY7A3E5ZSYPT44ENA77KRV2FJXC1, amount: u100000000, memo: none} {to: 'SP2T1NS2KTJB4FX5FE7DHFK6T1KGC1C6FMFZDBAMQ, amount: u100000000, memo: none} {to: 'SP1PQ0XNKPHX9H4JRYZ7CDGTR4R5DX8DHCHF2PRJK, amount: u100000000, memo: none} {to: 'SP313953T70TA311KNX93P3BFN2FM21JXETNCF88, amount: u100000000, memo: none} {to: 'SP150T7S3P8SFDJNB72NWZ18N9YN7VQGYXYTB2JT3, amount: u100000000, memo: none} {to: 'SPHPBWK05V0XCN1H97T8SEBHGXTG7KNFYQ4PYXJ1, amount: u100000000, memo: none} {to: 'SP3VBHJKZZMCS0WCD3SKTD8GCRGMWNPDD1HG6ZNFA, amount: u100000000, memo: none} {to: 'SP1S1T759S6107FM59PYDFXD1QBVH2VPSPT45DQQ9, amount: u100000000, memo: none} {to: 'SP2H67G1QZJCWWFBPHJAHJQHX36MJDF17M2K622YQ, amount: u100000000, memo: none} {to: 'SP3XDRG2YMJS3MKP0M4N84QBWZ7BSMEYS62S3NP2N, amount: u100000000, memo: none} {to: 'SP3G2XTMG242HZBVBRW6Y1VMW8DQG4377QBYQM69W, amount: u100000000, memo: none} {to: 'SP26NZFED62EQ2JNY7SDF48P3VQ9MJJYFN0GSBKTM, amount: u100000000, memo: none} {to: 'SPSAYK3YYJ5QQZ97HAT518J63GH512W9Q0P379F0, amount: u100000000, memo: none} {to: 'SP1CN7YY5RC8G8Z2FRHWD9YRAKT9SPQXR7VFC4E0W, amount: u100000000, memo: none} {to: 'SP245JY899HBCVCASEYEXBGPMY1QPX1A9N592FMB7, amount: u100000000, memo: none} {to: 'SP20X9CDEW3W1DDHYNQESEX3N01R69AN9AW6ZE751, amount: u100000000, memo: none} {to: 'SP30H3TB1E7Z6W8SPW7EV31TT8X20XEBSN0YPKNEK, amount: u100000000, memo: none} {to: 'SPS2BKB0EZASP0402T09F4W6X7XC5PJS1BJ6WD82, amount: u100000000, memo: none} {to: 'SPT14ZC9418XM01AQQ0GNSACCQ0Y8VHGN0AFYJ7N, amount: u100000000, memo: none} {to: 'SP393NK80JZ3H5YEVFX9BZQHG3D840057YZ9VM386, amount: u100000000, memo: none} {to: 'SPDQR6JPGYTJ2C2M1NS0777CHDD0D0T0A8YP32NS, amount: u100000000, memo: none} {to: 'SP19J6GNVRHHYYX8TF3443G65QVQRSXBTD7AVXVVR, amount: u100000000, memo: none} {to: 'SP19CJ3WX80GCJNSA93AR1TZ1C8ERX4K6N3WRHJBE, amount: u100000000, memo: none} {to: 'SP25VKWAJ2C619CK2HBVX8A4DY1FC20X74KMBD18E, amount: u100000000, memo: none} {to: 'SP1PCC2WQYFJZX8W5SNZGAYD6282046GKJCS7HY2, amount: u100000000, memo: none} {to: 'SP39GCDAEEQM484HETS957EBJ9JQYF8QA48XHYB3P, amount: u100000000, memo: none} {to: 'SP1DKMT150YPDTB6ANK11RKVP785504NHBXKR3H6R, amount: u100000000, memo: none} {to: 'SP3KPRFVZNFEDWRVX8W2SF4FBX6KBNA9WC8QHXD01, amount: u100000000, memo: none} {to: 'SP3B6FBMR6BVE1YMSEV795WC45QV9DGA9YJ8JQ40C, amount: u100000000, memo: none} {to: 'SP2W43262XFMS97FA5E61705YK5WTBQ3MAZWPGCK4, amount: u100000000, memo: none} {to: 'SP1JJZTT6K89BB08BJSVAPR61MC6Z55MSC1R74GJF, amount: u100000000, memo: none} {to: 'SP263BKAN4QHXVBXXPRSZ2FKWBQJJZZ6ZHYEQQ579, amount: u100000000, memo: none} {to: 'SP2RPB31K6V0GZ7WQ4XNYQ78QK3BK19R4VD2K059K, amount: u100000000, memo: none} {to: 'SP2XR749D8GE1M7EQEAME504Q30N4VM3KDB06N37Z, amount: u100000000, memo: none} {to: 'SP1Z8SH4W0F1N7B49HR52TB5K4K2EVPTTRGF5YR6B, amount: u100000000, memo: none} {to: 'SP3950V3KRX9MHW52NNQ5069XYMS3WFHAN8JTMXB0, amount: u100000000, memo: none} {to: 'SP21AVA62AW00DCKP8YCMJ1XK8J5V0V12SQFQPXG3, amount: u100000000, memo: none} {to: 'SP2DFD15FBMMQ60XWJQHSQZ057KB1TY175T2HMN9B, amount: u100000000, memo: none} {to: 'SP1W0NPR8PNTKGD7Q5GT9XBJBENQKVN6VQTB9YFJ6, amount: u100000000, memo: none} {to: 'SP2Z6N142T0DBTPC7T6KGEGJM81ZV92DA44T71G26, amount: u100000000, memo: none} {to: 'SP20R2PHHK8KE0P2ZMH7VSH547G8T83ZQB1RR7HFZ, amount: u100000000, memo: none} {to: 'SPH2DXGQ49ENFHVSRZX4P08GANFPQYCYF1S01HV4, amount: u100000000, memo: none} {to: 'SP1QNS96VAS3AKFYWVCK43Z6AKJDFREPN57YEHP0E, amount: u100000000, memo: none} {to: 'SP3WA0G3M0841379XHK1E862TS6JTRGS29J1AP1VE, amount: u100000000, memo: none} {to: 'SP35KWEVCS4TZKM0MT73C430DBA9TE5VZHPF9CWK8, amount: u100000000, memo: none} {to: 'SPGZDCFS033KHQJQMQ6JYTR5XQT3WR730KR768RM, amount: u100000000, memo: none} {to: 'SP3TSXCM4T3GFEXJXB0E90P0Z5BP17KFWN2CN67BN, amount: u100000000, memo: none} {to: 'SPE6PVSGCFGZA1BGTZXPTJAEAZCRQB18A2D0WARC, amount: u100000000, memo: none} {to: 'SP3V6ZG75DXBAMVXC5KZ0FJ1XJQ5T5ZA7X18TW77H, amount: u100000000, memo: none} {to: 'SP2QGB1J6K1G941RBERCDFQYR04RD7PXQ66HVA3K3, amount: u100000000, memo: none} {to: 'SP2E22RT117QTRHTQHJAYFCPMMWB303P3S8F12VSJ, amount: u100000000, memo: none} {to: 'SP2GJXFR0JA8QCHE65EQXA451SAKX0GPSRWP3GM7R, amount: u100000000, memo: none} {to: 'SP1ZP7E8143JFMHQSF9P5GD7VG7KBJJEKAA4KTB79, amount: u100000000, memo: none} {to: 'SP3MM9WFR0K7TD794X09NX0GDV3WYTJQ03D932VFA, amount: u100000000, memo: none} {to: 'SP2NY2F1K1HRQQF04DGQ9VXHADHYSYQD6W3Y2SVHN, amount: u100000000, memo: none} {to: 'SP3H2ZEDP5Z5TK2ZHD9Y7J30H9QVKHWRK8HHZWQW2, amount: u100000000, memo: none} {to: 'SP3V8A0SB3EE36NMQZ2Z102BWKCSCNM8924KDS3VX, amount: u100000000, memo: none} {to: 'SP1HD4Q9XYEB1698GZKFN3KNC0CYZ1FB6T8Y8K8MJ, amount: u100000000, memo: none} {to: 'SP2FZXAC7CD4J05T0RNBE9AVS4QS8GMCSM463QTQ7, amount: u100000000, memo: none} {to: 'SP1E09GBXG5HH36VJ4Q8FTP13H5WKPBGQMDM2935F, amount: u100000000, memo: none} {to: 'SP1474PEXRQ5NKZG3YEY6C6SMG5G74J0NP528BRR4, amount: u100000000, memo: none} {to: 'SPNW3HTVC0M9JV81ZE0K01228F22XA54A72V0C32, amount: u100000000, memo: none} {to: 'SP3JEN4S2J79EZJJ5S1JETPA1QPC3MNPYVHRBZA7H, amount: u100000000, memo: none} {to: 'SPZJ36061BRXK0TX9PQAPD46H6Z0JZA8E4EXS2KR, amount: u100000000, memo: none} {to: 'SPANY1JT2HQWY0ZP6A0MEHG7M1NZN7X4RGH26JDC, amount: u100000000, memo: none} {to: 'SP1CNMGR6MS7QVWKDKH5SR1FCX3PYAZ05C6TNYR1C, amount: u100000000, memo: none} {to: 'SP18ZWJBCQFZ00R4BZJ64S42KYMG3SZAYSYRVVKCJ, amount: u100000000, memo: none} {to: 'SP3RXGVEGXRBM8KEGEY4ERS04RQPT6ND3SHZ231ZT, amount: u100000000, memo: none} {to: 'SP30H3D4ZECWVQ8CQQZ3H6Q3JAHQT8R2MKMYSXQVC, amount: u100000000, memo: none} {to: 'SP2HSG36ZDX4PWKN0PRPKTRTNZK2DM61AYX0BPPYR, amount: u100000000, memo: none} {to: 'SP13TMNHHGB99ECW9E0RS3BHP5NJP2N2FYKK3BH10, amount: u100000000, memo: none} {to: 'SP3XPNHQB55W5Q59JCPJGGAHC797WAQECJJKG63PG, amount: u100000000, memo: none} {to: 'SP3W2SNCAZD7VH31D88QEEVS50882F250Q4D2SGJB, amount: u100000000, memo: none} {to: 'SP2W9RHAEZDNJCKEJJ42HKZMVFMCZQNJGHJWRSPDD, amount: u100000000, memo: none} {to: 'SP25SV9BQ1M956XPNQNKSPRH4P885H4C299P2FR5F, amount: u100000000, memo: none} {to: 'SPQ8EKTT3ETAVSVWM2JW126HMV27PR0KZV4VV33T, amount: u100000000, memo: none} {to: 'SP3JBCKW7VX4P4YD5W50988K9ZEQZ7X20ZBPGTRX2, amount: u100000000, memo: none} {to: 'SP4XZTWTZM8RT8TH3VPJQBCYZMFNK9V3R5BE5QT4, amount: u100000000, memo: none} {to: 'SP27ERRG28CZY4MFR4TKV22688QQQ8PD76WGB5G9N, amount: u100000000, memo: none} {to: 'SPCPD70E2QR4M1W90RR96YSJ6N5HJCK6B8DXXR5N, amount: u100000000, memo: none} {to: 'SP1BCPZRXJ73D879FPFPYPP8NBSC05BVMRNDAPJJ3, amount: u100000000, memo: none} {to: 'SP3FNWSGX8Q5716VF2SNTFZC2V5CXRH0FWS9E4FBS, amount: u100000000, memo: none} {to: 'SP1E8DB83GA4RG9B40356QVSS5Z1FKM9WSSJTCKAD, amount: u100000000, memo: none} {to: 'SP37NDGKC6F34TMHJ19B106VZZ1T4T6GRYM7TBX7F, amount: u100000000, memo: none} {to: 'SP2VZECT9FATA54YG1MNFK3X0DB7FCF25YZXAJ56T, amount: u100000000, memo: none} {to: 'SPBHKBCPE0WGQQMNGMKP8620F1SPN558211TY044, amount: u100000000, memo: none} {to: 'SPEKNC62KPKD5R700W18AJ9XKJ8VN2BFJ6W1BDPY, amount: u100000000, memo: none} {to: 'SP2DH7BXZJ3N1WK6XXDRV2KH4GVYWNKPX02ASTX0F, amount: u100000000, memo: none} {to: 'SP36Z2KW5NZD2NPAS0PM61F10NXQHJB304PPH4CPC, amount: u100000000, memo: none} {to: 'SPRQZEKK7HAT1J4Q9M99YJYXT0CET9KBJMNB0XRT, amount: u100000000, memo: none} {to: 'SP3D9W3NRSRGJPWSETMW53RXEMSZA7A2YD09249C6, amount: u100000000, memo: none} {to: 'SP1X0VM52JNNSR49A464NAG27KEKN3CKBHMFNHFSF, amount: u100000000, memo: none} {to: 'SP1SZZZ4D1MNFTJFWAK3W545JKV8X2YX3M0HW1WTQ, amount: u100000000, memo: none} {to: 'SPANR0V489V956E0RF8AY4N9ES1S5V7GQ35J0SN2, amount: u100000000, memo: none} {to: 'SP1CTZ5PHXQGTZKQMB5WSBG4T7QXQ5RR6YHQ7PWH4, amount: u100000000, memo: none} {to: 'SPAW4S9TE8P253Y87H4BNBGP4T4C5CKRHVN294HV, amount: u100000000, memo: none} {to: 'SP1YG6ZE13AXJAFADRP6YPEYTDMHZ1FBYQYHAV8PP, amount: u100000000, memo: none} {to: 'SP1Y92QAM1SNHXT448SFTMFRTESSC20ADG4J8CTK2, amount: u100000000, memo: none} {to: 'SP12BK9D35E52WMF0GR756K1ACV17EQDXX3NBVMAP, amount: u100000000, memo: none} {to: 'SP5SZT10JB6FA2VWZ67BD866QZDTJ94K9T6ZN21G, amount: u100000000, memo: none} {to: 'SP2XHENK7TF8TX250DMM3F759XEYPR0CWNZ16T7F3, amount: u100000000, memo: none} {to: 'SP2Y16N3EJW5ASJ55D1FZJPK7ZMZW91TCR7ABDE2X, amount: u100000000, memo: none} {to: 'SP2K00A1HXK1GPBEAM0MD3DMWRTE6XM9DJWFGTVC3, amount: u100000000, memo: none} {to: 'SPA3FDGKQBBE6JGQTDVNB339Q6BGCMB52EQSWA4M, amount: u100000000, memo: none} {to: 'SP166YNZECPTVHQM4EXSAPEN3KEGCHSVWHH7BMJS9, amount: u100000000, memo: none} {to: 'SP1TEW7V250B1ZN6MNDZ361ZVNS5H06FS2AWQE91F, amount: u100000000, memo: none} {to: 'SP3JX3GQ3PCBGKFFYFYY1WMJNBSM9ZRE3EVYHCP2Z, amount: u100000000, memo: none} {to: 'SP3PESFE7Z4V1BG793KQB28EZ1TDX8QZXH6Q4GDXT, amount: u100000000, memo: none} {to: 'SP2ZB3FVV2E2X6RDTS3QGETMQRPEA6X7FFBEV9D5V, amount: u100000000, memo: none} {to: 'SP1ZEYGKTMX0BXHJJ0BWAQWQ6TDSK6EBRTCJZVEA3, amount: u100000000, memo: none} {to: 'SP1K7XPS59SJ2BJ71P1QJBTRVARJV5B7DEKF3W81R, amount: u100000000, memo: none} {to: 'SP3DA714776EH74QHX8THFV946E9A6VJGM6DKJSF8, amount: u100000000, memo: none} {to: 'SPE0ETMBMSX527JZZXQDMN6BAQFBB2FX5Y5TECS8, amount: u100000000, memo: none} {to: 'SPJ2NFERJYDKHQE4KZQ88VC2CWDTXEEQPSP4TBHJ, amount: u100000000, memo: none} {to: 'SP3W6NYQPPNZ1827J2ECA5QS6009X22MJ19PADF9C, amount: u100000000, memo: none} {to: 'SP3J1GMXPJ574PHSZWTKGRSZATZBR9AKYF8GHD5Z1, amount: u100000000, memo: none} {to: 'SP3K5GMW1Q2B9JCF8ACRYFBZXG8V8NWCSZGFX3ZY6, amount: u100000000, memo: none} {to: 'SP2YWM1GMF7SZPEXTRR9X33Z7HRX3KFPDNWM0WTCZ, amount: u100000000, memo: none} {to: 'SP1QKR2GGBYMJD163CZRFZ6Q89M1TZX3HFD5AYVJX, amount: u100000000, memo: none} {to: 'SP5JMWB2FZ7N8NV09NYXMMV2FY2Y5P5RV9S3VEHS, amount: u100000000, memo: none} {to: 'SPVVJNBJ9GZNAP67T0WTV8GTB07PHVAQ8NR0DW5M, amount: u100000000, memo: none} {to: 'SP20S1MN9DEDTKBKS9EY6GRQWV2GZ3X9GQV9WNGX4, amount: u100000000, memo: none} {to: 'SP181ENDA5DC1W2XV30BWV8ATSZ5TD0EKXGRQ5ANP, amount: u100000000, memo: none} {to: 'SP1WK3VCYVCRHJGK5WKTY4F8T4E4TR6VHE1B5GHMA, amount: u100000000, memo: none} {to: 'SPYT00NYTS76R0QGXP17QX4N4PDZJHW5WG9S4NPG, amount: u100000000, memo: none} {to: 'SP12ENXNX69T37N3YSJ51C3KCK51AG82PAS6FBJBZ, amount: u100000000, memo: none} {to: 'SP1Y9XJFNVTTD3NZRJANRM8CREWBZZF4W3Z9VQNVE, amount: u100000000, memo: none} {to: 'SP13G9MGHCCB62ET4S7D208A4DABWYCPVD46MM2GC, amount: u100000000, memo: none} {to: 'SP1JTNZSTX9YZJDQ0XH39KGDE71D42QECNBX2EQDS, amount: u100000000, memo: none} {to: 'SP5Q0QK2EN1ZW1VS1T285PDMVZG3MM9SAHSKW5CM, amount: u100000000, memo: none} {to: 'SP28TJ9EV65RW3BG0HY4XWWA86BEM2R7FKHWTFWA5, amount: u100000000, memo: none} {to: 'SP0D2XDB2V8TJDYM82NW0Y2FBXKYBG9FZXM62ACF, amount: u100000000, memo: none}))
(contract-call? 'SPMWB0BNTFM19PWTNP0SJ2WX3PW5GTTMBS8BGZ5X.stx-bros-stxcity send-many (list {to: 'SP15A210F9DTHQR9EKM10R69C90TX6CKSVF0294Y6, amount: u100000000, memo: none} {to: 'SP2KM2PWB78XQXBX0ME1HH5MQFTDVEFNPAM7W4Z4H, amount: u100000000, memo: none} {to: 'SP33DV2RFA5GSF8CDAKZJA5ENMBS6CGZAZNZ050F2, amount: u100000000, memo: none} {to: 'SPQ06GJTTHK1DCYTKCFYJMSRFJZM3BNTPC0P9QPM, amount: u100000000, memo: none} {to: 'SPS4EYGV5ZGP0T3C5GMMDW0D7WP3G8T0CPZ63WX5, amount: u100000000, memo: none} {to: 'SPJ34JKHMAB06RRV31QTCE88P4KPRE6WWW8A4N84, amount: u100000000, memo: none} {to: 'SP10TEYJM5GSR7G321H3HSXB0DVCGHGKS8TNFT5RA, amount: u100000000, memo: none} {to: 'SP1SMCYSJMCXSETEA7BNFN599FY5TDTPC510G9S6H, amount: u100000000, memo: none} {to: 'SP1MV41AK58BWMV5H73XDWB04CSP6J6SN9D385R6C, amount: u100000000, memo: none} {to: 'SP249YEVMSPDBDMBTMNMH6F2YR65C2NMW6GY9HASY, amount: u100000000, memo: none} {to: 'SP1EHWNBT8ZVQRV3FYNJ31K0YNYCHJ1YJ7YD9PXEC, amount: u100000000, memo: none} {to: 'SPX1ZFBG0NZCKCK9E8RCQ1TTS6VB6Z6FZ3QSV0F8, amount: u100000000, memo: none} {to: 'SPA8JJ85P333H1HVFEVKSCSATPQQQCRBJK1HBEWQ, amount: u100000000, memo: none} {to: 'SP1SH8XTQDQR0RZQQK42J9CYQH314WEZQ7B7KY1V4, amount: u100000000, memo: none} {to: 'SPQ9KRXEG0H5E9QB7YXE0Y9P63YF2NGWDTPZJPAM, amount: u100000000, memo: none} {to: 'SP2E3C3P91BA6RGKNEP3YFJCBRHYEX7Z2GPSC10N, amount: u100000000, memo: none} {to: 'SP9Q3V342917256S763E472JW1ZYQS5495A5YGAW, amount: u100000000, memo: none} {to: 'SP1PEM9BBXY278JPFYVMYK27AKC5Q2D6VB3E6YF16, amount: u100000000, memo: none} {to: 'SP3BMCJGD2T5R7SACG8E80KA5H22PEWDDNGKRQBC8, amount: u100000000, memo: none} {to: 'SPC9HKE653BBRDV58DKG22KYMA0F68KF2Z3QNFJX, amount: u100000000, memo: none} {to: 'SP2SF3C3VXKY5Z09RTB9PFCW2NWK9SX7V0F3RKEJS, amount: u100000000, memo: none} {to: 'SP1E16YG876M0YCWAGM9M1529YQ48TA6WZ7E6A8RK, amount: u100000000, memo: none} {to: 'SP1WPYDW9A4MXEY6JBDE5692M9E7GVNVP2YFQW3N6, amount: u100000000, memo: none} {to: 'SP1BGC6YNEFAQW97H6WPG011V63DA5YVJ0JT634HA, amount: u100000000, memo: none} {to: 'SP3EXF7YME3N118WBNKCGBJKT6MQHYK39KPJG856Q, amount: u100000000, memo: none} {to: 'SPT13AQ9ME4NK8H3CDDV7VQVTG7YZT4881C490Z, amount: u100000000, memo: none} {to: 'SP1X0EXF904MK7HPGTG9V84DZCKVABEXDC7NJWKHG, amount: u100000000, memo: none} {to: 'SP1QBCECMX8XTQARANDFA9AQYWNZSG8Z7FQ7ZRV5D, amount: u100000000, memo: none} {to: 'SP117B2NC7CT9EZNGQ6NZHR1FM1SDEP53HYG2PA6V, amount: u100000000, memo: none} {to: 'SP3CVB4AV8360BYZ8E4889ASYW54QBD4944R9KM2A, amount: u100000000, memo: none} {to: 'SP20RKMPR1JS92TWHQN0W2QTSR05JT4Y06ZQQHNDA, amount: u100000000, memo: none} {to: 'SP1F26ECJ3MHCFVM3ZAG0N6BMQS7KC1F6HZ4WXK8Q, amount: u100000000, memo: none} {to: 'SP3N1V9YJX9VCMPC67WBD8DDX7PSDBT8H2NGGP5Y0, amount: u100000000, memo: none} {to: 'SPEBJPSPQ72J8AZ2QNSQBXKDWWYSC4C1SF1KSN2Y, amount: u100000000, memo: none} {to: 'SP6MX96EMJ30MWA88KNS44AMH4TV4QH5N15K08GG, amount: u100000000, memo: none} {to: 'SP3HG5VDFDWHN46CEJ41FVZM99KBC5R2XQBH9093P, amount: u100000000, memo: none} {to: 'SP30NXF1BGD0MQQTQ94HGXE626KN5T0SW67N85MVG, amount: u100000000, memo: none} {to: 'SP26K5H46DPC0N2EATE05774RTR52KBJ1KKXCK7G1, amount: u100000000, memo: none} {to: 'SP1N9GP599S33SGM75RPQ1AMC9R1JS6NKNHV10SSJ, amount: u100000000, memo: none} {to: 'SP1BMDRG3DABYEDFKDHTWV09F7BHV0NTPX95QQ00V, amount: u100000000, memo: none} {to: 'SP35NY8QM65YMV933K1272GWFN9Q9HQXQV4W956X3, amount: u100000000, memo: none} {to: 'SP2AX15HR5AJSRFHZHPSF2PKT36H7DQD517Z01JH7, amount: u100000000, memo: none} {to: 'SP30WACKAW886RFEFP9FX2S79VWE3RW3SQWTYKHF8, amount: u100000000, memo: none} {to: 'SP2TWS7AM0Q2AEG80Q2CRQNKARPN195K8MHZAZV5Z, amount: u100000000, memo: none} {to: 'SP38YK15NG7DP5W1G66TTT7K9S8TCYM4S3RR8KQQA, amount: u100000000, memo: none} {to: 'SP10SGZAM8A7RHCPP5FAMD15E1D8RC36XYDAJTVVR, amount: u100000000, memo: none} {to: 'SP32HCRQAWZ055HN34NZ3YGHFX0BHQQ5JK78ZATEK, amount: u100000000, memo: none} {to: 'SP2E4D5CV2FA906B4N18SZMWXW1AQX7KF1Y7PHBG4, amount: u100000000, memo: none} {to: 'SP2KD7GXFRXQ4FCDGS5Q7GEFTF98K8B5S9ZP0BCWV, amount: u100000000, memo: none} {to: 'SP392PM6WRKA0X941V2JMXG4HXZ8B0MM7QEFFYD8M, amount: u100000000, memo: none} {to: 'SP2W115M1953A8M9HTNVZ4YC6BFMPXWZMGA36C96Q, amount: u100000000, memo: none} {to: 'SP20G35SD3NYE33GTCAXV96TJ12S3TWY8SE80HDAA, amount: u100000000, memo: none} {to: 'SPC0XVRSKJY4TV0Z8F7PEBN471Y9FTPF5AJRMWM1, amount: u100000000, memo: none} {to: 'SP3SB836V4J0PZTXA34G5SQE3RQ6PR7YQ7EG155H8, amount: u100000000, memo: none} {to: 'SP3GBWNHZ3FZ8CK3ZTZHYYKRXYJNHPC4ZHFZ50FEP, amount: u100000000, memo: none} {to: 'SP1Y1818PCM14YFA2ESZE0RB0HF2KXPKHWNEG7Q50, amount: u100000000, memo: none} {to: 'SP3MJBNJYYHKDQEP9R8FVWZNCRVT2VEBJG3FZ3E2Y, amount: u100000000, memo: none} {to: 'SP1JE6F65DT53ZM7J0KTAC3WVS4ZFY1CQPTEPWJP8, amount: u100000000, memo: none} {to: 'SP1JJVM64D494KAF3ECAW91V7PFRNZZHKSYC3FXWW, amount: u100000000, memo: none} {to: 'SP1AXJSRZQVTCTD31GASWX1NF2SC46T5FTH427N25, amount: u100000000, memo: none} {to: 'SP2Y9W07SYYBCMP9E41HSKDQATXKTB5YV7NCWZD0A, amount: u100000000, memo: none} {to: 'SP350MY1NKCG8KB70GNDEW4G5Y5YJDJE2DZ1M5V9M, amount: u100000000, memo: none} {to: 'SP2D1P36RZB6PF98G3HM9T064NHP7RV1XMNMCMQFR, amount: u100000000, memo: none} {to: 'SP1BMMXCKPTDWWP90FRHSACMG7CBAM1E98XJ55GPW, amount: u100000000, memo: none} {to: 'SP24P4CDHEMCZ64C9X84K15D3Z5EPJJWRBWJ1WSVC, amount: u100000000, memo: none} {to: 'SP3ZY2B0W4AV1NCQ9PNTEVRC1K6AMN4005HVACZ04, amount: u100000000, memo: none} {to: 'SP33PMHPXYM5X3EK3VWBJN2T758T3P5EN22JH2QVB, amount: u100000000, memo: none} {to: 'SP3Z89S0NAE0K0NWQPXTZ1B7QWSQHJVJRTAA9B7B5, amount: u100000000, memo: none} {to: 'SP1FXTKF5VY98M8S4EK7FN2GXR3PHZ1MGPFP4XJDF, amount: u100000000, memo: none} {to: 'SP35QCBKE91BNPT3HBTTYET895TNMGY77WPCWZRBG, amount: u100000000, memo: none} {to: 'SP2YBCM94RCD1KH9EZHB2VZNFP1ZCM9RJANYZAS9K, amount: u100000000, memo: none} {to: 'SP30Y00AEF59QFJVX7Z0FHEKSTYKFWG3G5P8PZ70Z, amount: u100000000, memo: none} {to: 'SP1F856B5SCHAVQT4BKQHPXWP047J5TPX6K5R441V, amount: u100000000, memo: none} {to: 'SP1XCYNWH3W192JZQRTSA3HA15R0EPR1GC7XHVA9B, amount: u100000000, memo: none} {to: 'SP12NC2FPEM5HXRM8AY17YWH9ZJJ8QK7GK35YWSXY, amount: u100000000, memo: none} {to: 'SP2MJ7GFDM2Y1C62E9YWN3KNA4X1WM1SFC8ZPPJZV, amount: u100000000, memo: none} {to: 'SP1RAJ4VS5M5B5H1GG45G4MMJN03VVVYWJZ4Z820J, amount: u100000000, memo: none} {to: 'SP312ZPYXYDPZX7GB9CSHMM3235FVDTB42C9A5Z4R, amount: u100000000, memo: none} {to: 'SP11HW933DPDXN5S0XCHWAKWN3FVT9GKKRTA16SBE, amount: u100000000, memo: none} {to: 'SP10E54RTNVG9VCF88FXVPV2CF6YJQ1P281SGGMND, amount: u100000000, memo: none} {to: 'SP3S3WWRXRD5F3M4K2MC99K96ECEEYPF3X9M73SGC, amount: u100000000, memo: none} {to: 'SP3NDXXC77HPJHJTZ5XBG3YSGJ9B275ZN6D40CJ56, amount: u100000000, memo: none} {to: 'SP21XAVQ11WZ2WPRB8JYKJ8T8Y7QE95FX4YGZCE7R, amount: u100000000, memo: none} {to: 'SP2317PDQBP0H65KX2NTG85BR8H89DJV08N3E9GAS, amount: u100000000, memo: none} {to: 'SP0C81F28B7QXSENQ5PSVNT05502QTXAC3GFBW4J, amount: u100000000, memo: none} {to: 'SPCSCS94NVD64Z2M5W33CRP0P19CTZ6C6W47HK63, amount: u100000000, memo: none} {to: 'SP39YA0AHXF3P7QNQDMP8QP0J4HPME25SRTR3MGRV, amount: u100000000, memo: none} {to: 'SP12Q710HTJG2JENYAKTH580PA3387GY33DR6NVYN, amount: u100000000, memo: none} {to: 'SP3JBGHCKDM15H6SVSJFA1H6761P1J5MY8NECK2FF, amount: u100000000, memo: none} {to: 'SP1VJ5BSGNGAB8N1YDD0C9R03Y26RZD2WAZ4D56A1, amount: u100000000, memo: none} {to: 'SP11NWXHHEAH187YKGTYSZV1FQDKE1G13BJAWZT1W, amount: u100000000, memo: none} {to: 'SP320HMDP9RF0ZBT95BYC3TA0ZZAAH26CQ6KBW6JP, amount: u100000000, memo: none} {to: 'SP3MBKW1DKYEFXCK1TDW6PJH81CJ2GFNM4TB87ASZ, amount: u100000000, memo: none} {to: 'SPPYQGF3YC9FP3RETJS7910X4E9M15DB1YDCYES0, amount: u100000000, memo: none} {to: 'SP3BSEKW2Y08DFTA5TNH2PZ0E4PWZE45PSAJDKAV6, amount: u100000000, memo: none} {to: 'SP2N2CH85MPKWBAE6NJK99P5PGWRNWFEHN6Y3BXHY, amount: u100000000, memo: none} {to: 'SP3WD36F5C0ZHQN8DT54MRDX24JG40N2EZZ9NRS39, amount: u100000000, memo: none} {to: 'SPJWFXPC55RW7E1JWA8DJVSME1GQY956YWFSY2Q7, amount: u100000000, memo: none} {to: 'SP2GV5W6F3FQPFA2NM93N214JYM54RSPZGBQJEX2V, amount: u100000000, memo: none} {to: 'SP3PF86M1YT9FK7XJV7M8BH70GBVKDXXBQ15GGGHK, amount: u100000000, memo: none} {to: 'SP3ANFN1K7PTKXWWRAMA9GGG585PRZMWTRWW3CN3N, amount: u100000000, memo: none} {to: 'SPG9S8Y9PA957NQ4T3EXEVZ3SVW9B2D7CGE0PKWE, amount: u100000000, memo: none} {to: 'SP3KM43R8AXPGGXF9XQ5AEA4TXNME8J8VR0FCN1GX, amount: u100000000, memo: none} {to: 'SP4HZ4H47ZPT3CVJGTVE6JJ84RWENM25A3J2782B, amount: u100000000, memo: none} {to: 'SP3WP8198ZCW3B043V8WTMTCZV6G366KC56YFYHRM, amount: u100000000, memo: none} {to: 'SP1WAKD40ZSHD1YV0KN27Z9YQ6JWSYKWMM0P72M5B, amount: u100000000, memo: none} {to: 'SP2A3WY2T7Q9Z257BCK2VKVSGP3660NH6MV0ATH6Y, amount: u100000000, memo: none} {to: 'SP2SWZ4PTCNADGVVXVGRXVVVVZA9X2VAVEJ70EZD7, amount: u100000000, memo: none} {to: 'SP31H6AZ3CZ1E7FRR68YMBK2FF79HFRC7VEME5R39, amount: u100000000, memo: none} {to: 'SP2V0469BCMZ2ZBAKGAXN8N9GXK5KDSVMRCN7HXHS, amount: u100000000, memo: none} {to: 'SP2F7H51W8521WVZHB0RXV0PMPXMT28YFMTDY0S32, amount: u100000000, memo: none} {to: 'SP122B63TZG0NY3C7EJDAXZDSCKNX9K2G68THMBEN, amount: u100000000, memo: none} {to: 'SPYPMS6853G9G1VF2HYSZFGVXMFA3Z3GAA22P316, amount: u100000000, memo: none} {to: 'SP2NEGR3WBX7415GRXS8E4BM5BNCZG6EJHMCNAS7Y, amount: u100000000, memo: none} {to: 'SP2M01Z6EHY0M7NJDM2ZV8JE40VBX4S5A3W1FBTWS, amount: u100000000, memo: none} {to: 'SP2XCPZ5Q3V7CKQGAV23Q72TA6XGN9QA41V82W89B, amount: u100000000, memo: none} {to: 'SP60K65017H130ZCT5J7VAENDMBST8JZWY3V2CDE, amount: u100000000, memo: none} {to: 'SP131A0DQFER65RBVP483AZQPRKVN9KX2KQW6HNBM, amount: u100000000, memo: none} {to: 'SPGHA82BCKH2TWFC4TEWYR7DJ0D9JQ10C92VDMG7, amount: u100000000, memo: none} {to: 'SP3J0HMB5RMC23TGAB9AH1JYZEJQ3MK83CQRKY0S0, amount: u100000000, memo: none} {to: 'SP2P8ZZDNRX2KHY8A08MEQXPJRTH1HQ9FG3Q69BWC, amount: u100000000, memo: none} {to: 'SP2C6E6DNFQJY5JG81MW32H7TNEDD3WYYH6VWXHBJ, amount: u100000000, memo: none} {to: 'SP1DE63EGHG8K2E30JX2XNDA5TVJ438MG1J4NAK5P, amount: u100000000, memo: none} {to: 'SP2DKKRH42MS3AS8RZHQYF848BRP87GZHAYTGPN7A, amount: u100000000, memo: none} {to: 'SP90942H584QT6SXT549336KEHZXEVF5FKEE7K50, amount: u100000000, memo: none} {to: 'SPV06DCNS2CFJ3QEFBP64EET7FNAM7E8T893K7VM, amount: u100000000, memo: none} {to: 'SP25DY12X1XKDBBKDMR5ED9BYPYCZEYZE3HQT32T3, amount: u100000000, memo: none} {to: 'SP3154T3VVKWNA4S52JEB52VAHK1ZFBGF1D57YBBJ, amount: u100000000, memo: none} {to: 'SPY9MY0PE91P8NAW1EKGC9MQ27A4MC5BEVPC01WW, amount: u100000000, memo: none} {to: 'SP9P9C9HQ2GR3PSFVXS0ZVERH71FKCX1B05FFFBR, amount: u100000000, memo: none} {to: 'SP2JB78Q3TJ2AT1EG9QS7Y66SAH81RH3HAW2FZVX5, amount: u100000000, memo: none} {to: 'SPC4B72R49TVG240JZJT2TG0YXAT5BRXJAE5B7XK, amount: u100000000, memo: none} {to: 'SP1XEVM23R9CRTZFNW3Q2RBR3GDT9KRC7EZ6D54NK, amount: u100000000, memo: none} {to: 'SP3SA1MBB4E90FH0JDX43ZXN49ANDJGBNZKKF130A, amount: u100000000, memo: none} {to: 'SP1CNPB1AWZNXG083Z3588A7SG0S96CKRKFNXKSR8, amount: u100000000, memo: none} {to: 'SP4AEBRA1C2PA83BG8283QB64ST673W387JGRPYK, amount: u100000000, memo: none} {to: 'SP2C75XQ6P03KPRBHFSDKW0H4MGN7HP5FX4WVDKX8, amount: u100000000, memo: none} {to: 'SP20RG335BRPYA5Z3RH7RTF8WRDQATZ1B0GQ9J1GJ, amount: u100000000, memo: none} {to: 'SP0AJVQB6CTR3HBN0YA50B2DDTX3EVJZNXX6YBPD, amount: u100000000, memo: none} {to: 'SP12W6NYX35VQSTT3JQ66MEGB0Y79J07G9MTJRGHH, amount: u100000000, memo: none} {to: 'SP1EN2VCNZS88E1C5RHTKCZQV7C0GM7GQZRX7BYG2, amount: u100000000, memo: none} {to: 'SP2FZRFSKDJ34965EDT5F3FR5JR0EMZBPWH62MMXW, amount: u100000000, memo: none} {to: 'SP3HCRMZ2S72KTGTEDPAP75JRSTBRMNKNR1HZE0Z, amount: u100000000, memo: none} {to: 'SP2KB6RPEZSJCA1FQQ494Y8QE3NQM4CPRNNWB2JDG, amount: u100000000, memo: none} {to: 'SP273RM7AV5JKA5VYGFDJS5QYW67WS70DDX4TEKHS, amount: u100000000, memo: none} {to: 'SP1FTZADJT2VX04ZC3JG3EAK8F908D8JF441AM036, amount: u100000000, memo: none} {to: 'SP31FZ9KVQ48Y666JGD88B09Y1BNKSJY6WQRNQEVY, amount: u100000000, memo: none} {to: 'SP24BTY3BAAD9VWBPKZXBQY78HRFC4JVXNASFP42P, amount: u100000000, memo: none} {to: 'SP9GPA893JSWSKH698RDVXDFKQQBS3ZVTPYM5ZAV, amount: u100000000, memo: none} {to: 'SP27QNSKA9VABF8KE7QZW8VVMZW31MQZX6MPMA332, amount: u100000000, memo: none} {to: 'SPFN1WMV2FZ92QJ3TX2NHFMF0HS01NVPEX7JV8EC, amount: u100000000, memo: none} {to: 'SP2M24J6QQ8CVXGP8HNHS4MXFA5KHKJGSFFRSQJCC, amount: u100000000, memo: none} {to: 'SP2M7AWHMG39DE5BRE0HZDTKESYFXBVVM1Z0XV3EM, amount: u100000000, memo: none} {to: 'SP2HP02FYMPY4ZQT9Z44ZDSE3DZCTM3TY47B253B7, amount: u100000000, memo: none} {to: 'SP1F7SA9XAF2PVYK4BH9EP93KV74138TZCAS5G12K, amount: u100000000, memo: none} {to: 'SPRBX7N89TWNZCN4BFB9K7Y18NWPVYZ37KMN16FH, amount: u100000000, memo: none} {to: 'SP1PSMCBAV2QHP0C3KAVF24TX1K0QH0FTA56RDQMK, amount: u100000000, memo: none} {to: 'SP3CFXHV9CT07H8VCTXKCAQ2NKYXB5C7CSBPJS88N, amount: u100000000, memo: none} {to: 'SP4NEEQPG52H897929NMQKFDWW321BAZTZ2T0Y64, amount: u100000000, memo: none} {to: 'SP26MF0PBCAENGNJVR45D9YN5832JHSZ64D8MWBX8, amount: u100000000, memo: none} {to: 'SP3F9A0FGSAXH5BV697WW915QZ7ZDMDA7SS8WHNZ6, amount: u100000000, memo: none} {to: 'SP35C34KXN7YGBFSMB32T6998ZPANX80DJMRKQZDC, amount: u100000000, memo: none} {to: 'SP13GK77N3YTH2EKZ1SE1B0WKGWN75BHAN1JWXTAW, amount: u100000000, memo: none}))
(begin
	
	(try! (send-stx 'SP1FQ3DQDR5N9HJX3XC5DNKFCG4DHH48EFJQV6QH0 u2000000))
)
