
(define-private (send-stx (recipient principal) (amount uint))
	(begin
		(try! (stx-transfer? amount tx-sender (as-contract recipient)))
		(ok true)
	)
)
(contract-call? 'SP308FR1T8908G7QP5XNXGVTMH32650A9H8GM5V07.dog-go-to-the-moon-on-stx-stxcity send-many (list {to: 'SPAZ6HV2WG7CDSHSQGVDV8Q6D7FPSJ00H5BDZAG0, amount: u149998000000, memo: none} {to: 'SPNMMG0PN9FZ97DHP93JQBGJ0XAVR976DZDRTYME, amount: u149998000000, memo: none} {to: 'SP2BA539M78G7GP2N39VEQBD8YN3K9MRPR62BQ610, amount: u149998000000, memo: none} {to: 'SP1XFW2RK5EG9A6DE101NRVRZ284GJT7VH03GB4CQ, amount: u149998000000, memo: none} {to: 'SP3EMZ5XM95XZRVFWB5M8JH3VRMMPJ8661WTT1M3T, amount: u149998000000, memo: none} {to: 'SP27JCJ18FBWQX9H7HWG4K6DQETRR9KYNG621FP1J, amount: u149998000000, memo: none} {to: 'SP1VEHWR3SVWZWN24YQTHS3CVSMWEHK39CBM6Z3F5, amount: u149998000000, memo: none} {to: 'SP2YWAQVWEJJ60ZQSKW9R3FWCXD41F0MY186524PY, amount: u149998000000, memo: none} {to: 'SP20QS4PBRFWRQFHVKQHBR3C8TETC6H89QMXBQB8M, amount: u149998000000, memo: none} {to: 'SP14YJ2XTPGK7MAGFFEFQEAQNY4MSZQAX76TRY35V, amount: u149998000000, memo: none} {to: 'SP26QMFEDRBGVNMANH5XJ7KX0NG9QDP2KAJVBGZD0, amount: u149998000000, memo: none} {to: 'SP14EFAF85KE7G42GR9SVEGWXT8XW2VDP3QTPBTKY, amount: u149998000000, memo: none} {to: 'SP1VEHWR3SVWZWN24YQTHS3CVSMWEHK39CBM6Z3F5, amount: u149998000000, memo: none} {to: 'SP2ZM0FFZGQ64SX8G287QJEPH2KYF0EZRDJ15PSYC, amount: u149998000000, memo: none} {to: 'SPNMMG0PN9FZ97DHP93JQBGJ0XAVR976DZDRTYME, amount: u149998000000, memo: none} {to: 'SP2QVKZ2GWP97TW4RNCT8TN65JRJPVAKERHYSS13E, amount: u149998000000, memo: none} {to: 'SP1P8QCWK05T41RCH6B6J8SNWVCAJBRJJDQ9ZJ95Z, amount: u149998000000, memo: none} {to: 'SP2Q1AZMQDWH3M8DHJHVE1FC261QJ6Z9RC9ET9HGH, amount: u149998000000, memo: none} {to: 'SP3T5F1AJV3ADPX386BF2WZSC38ZD4KA9QM6J54PN, amount: u149998000000, memo: none} {to: 'SP3MYBF6D6AT4MHCCY9RJKQDNRAZN18FC8SJVTNMG, amount: u149998000000, memo: none} {to: 'SP1ARC8PTHHY7C9P076ZHH5MM6WDWA0XP2EXKVZJE, amount: u149998000000, memo: none} {to: 'SP2MJYMCZE87ZEFNBR6J8891RR9BZQ19ZY3GPBD2X, amount: u149998000000, memo: none} {to: 'SP29B7PXYA3Z5TE4E0C99Q9AD816DNP4XNBMZ7328, amount: u149998000000, memo: none} {to: 'SP3T5F1AJV3ADPX386BF2WZSC38ZD4KA9QM6J54PN, amount: u149998000000, memo: none} {to: 'SP1G6E64JY84C766QBCEBFXBYGGFKRYEZ54DPYPMF, amount: u149998000000, memo: none} {to: 'SPQTK7NJDSM3EK6PD0B2GTGRF96HCCT9V1G0YRD1, amount: u149998000000, memo: none} {to: 'SP3C730EGZBZYVEE03D4K2PRKVVAPQDVB49RFVVMZ, amount: u149998000000, memo: none} {to: 'SP29EADBWFKWK76345DVY6TGCH8BN7N6SC96PB4K7, amount: u149998000000, memo: none} {to: 'SP29B7PXYA3Z5TE4E0C99Q9AD816DNP4XNBMZ7328, amount: u149998000000, memo: none} {to: 'SP3T3W1AYBEYEAK86K382XZ9SS6923E0A6HCW782T, amount: u149998000000, memo: none} {to: 'SP210PZWR4AQS4BS7D8JJ907BTRZFWX25F664R0K8, amount: u149998000000, memo: none} {to: 'SP3T3W1AYBEYEAK86K382XZ9SS6923E0A6HCW782T, amount: u149998000000, memo: none} {to: 'SP21Y6EK4RF8AEYK4SB8SC0Z472ZMARPNH86J16PK, amount: u149998000000, memo: none} {to: 'SP2BKBZDH2E5GMGSERKP51WMZPZRCN34H9F50AVBN, amount: u149998000000, memo: none} {to: 'SP16P1ZHCSEK872B2HBDG3EAGZNNMWVP55NK63A6V, amount: u149998000000, memo: none} {to: 'SPMZ9SJRMNEY4DPJBCXCVP0CDN93KETB289FD5GM, amount: u149998000000, memo: none} {to: 'SP1Q34DK4X5K6SZ08TB363SVFMEE7N2JW8SB3Y6YS, amount: u149998000000, memo: none} {to: 'SP1EGSTD67HEJ9BWH3QF0V19CQRBMAB2PV5SHTAZT, amount: u149998000000, memo: none} {to: 'SP33C1JSA11NXQWC66AHSTD0EW5DH0PRF0WV6WKA, amount: u149998000000, memo: none} {to: 'SP33C1JSA11NXQWC66AHSTD0EW5DH0PRF0WV6WKA, amount: u149998000000, memo: none} {to: 'SP2EVGVE604AX4P9MKRNNMCDHBMNA5AQDRVQ3BKGC, amount: u149998000000, memo: none} {to: 'SPRHYBPJAQVJY1DRWN1TB2A1XVMA02BJQZDMC82K, amount: u149998000000, memo: none} {to: 'SP6C9KQWPFFGH5YWNKKZ4V9SRT53H51VR0SW2BXQ, amount: u149998000000, memo: none} {to: 'SPM4E6AG5NJYFYNA8YHPDA6T9N4CHDRCF19F8ES9, amount: u149998000000, memo: none} {to: 'SPPB155Z73HHGF2EDE1FPZDEM0NY65PTMQK17W75, amount: u149998000000, memo: none} {to: 'SP1Q0NHC9RDH0MK77ST0ENESSFMY8MCY0BWW8SVE2, amount: u149998000000, memo: none} {to: 'SPEWFN57HKXKFXS9DQ6QT16KTV4RTGW9MDVMXRBJ, amount: u149998000000, memo: none} {to: 'SPZXXPFSGQAMQS01GT0PE6AD8AP4776KKV9JQ9PW, amount: u149998000000, memo: none} {to: 'SP36JBSQDFQ4VT0J3KVSQ67CXRC1PRD6GPBX3WVD7, amount: u149998000000, memo: none} {to: 'SP2WJWGJ74RFCXRS4PYXRBMZZFY622AVK3AZFMWMD, amount: u149998000000, memo: none} {to: 'SP19R0G4EMG6N14SKEMQ5E8VAKXBHHFVVB2162G8J, amount: u149998000000, memo: none} {to: 'SP36TC5WG6EKKYG5QHNMTF6SG29MFGCEHS2BSY7RS, amount: u149998000000, memo: none} {to: 'SP130NYQS8VHKYBCV34H7WGZXN5MJ9792MMWWX24R, amount: u149998000000, memo: none} {to: 'SP3151657BJMN72ZY56MN8CMCCBH4CTPH3S6C2G8R, amount: u149998000000, memo: none} {to: 'SP1BAE87ZPNMYTX5NQ2XNJF5Y6DQ4V70GDE2ZQB4F, amount: u149998000000, memo: none} {to: 'SP1ET4XND4YPMTFG7KFZ4XZ4FWQ38MTTKRBYXTYVW, amount: u149998000000, memo: none} {to: 'SP1W8M4AJJPS8ETCYNT3GPMVTHA6ZJ4K9HTVN03G7, amount: u149998000000, memo: none} {to: 'SPQ7FX3DM3WEZSP1RMZE1TBK67DHA5TAXKQMMND3, amount: u149998000000, memo: none} {to: 'SPNC2PDJG1SXA8ABKEH583Q46N73PBKJDQ7NN8FY, amount: u149998000000, memo: none} {to: 'SP3YS96DAJ71KR5AX9DNZ5TV5MRJNR7TF91JGRAAD, amount: u149998000000, memo: none} {to: 'SPV23A00HS4HZ0BMK0E41BQKEEMJSN8NHHD5D3DK, amount: u149998000000, memo: none} {to: 'SP3CY8BWC3GDFM9M49EQ1B7TF4Q374PAV833RSYCS, amount: u149998000000, memo: none} {to: 'SP2T2YCP677B907YQC1PGJ4F5K5MTRT2QB073Z8GQ, amount: u149998000000, memo: none} {to: 'SP3A645628FK20NRTZNR9FWVFSJDN9ZJ32M2FJF2P, amount: u149998000000, memo: none} {to: 'SP1D006XNFGJRRGQM7G408E3VGZEX0TY8T806E2B, amount: u149998000000, memo: none} {to: 'SP2DQH1MJHH9WYMN5NSTVCKA21CVPHC7GH11JVKTR, amount: u149998000000, memo: none} {to: 'SPDCZQ0SMQ7WW18AKSZ85ZX0CF7NHPH2MA4Q7JNF, amount: u149998000000, memo: none} {to: 'SP116DJF1FX1FECKE61Q3Q2ANXM5K4J4M5XAA9F2B, amount: u149998000000, memo: none} {to: 'SP2R9PBDHRT04YQ2XD9Q8HFYS19MC9S95Z2HYN010, amount: u149998000000, memo: none} {to: 'SP12H47A1JH7B3XN7GWZ0X6DZ385N6K5QNC8K1A2T, amount: u149998000000, memo: none} {to: 'SP2664YJ6Z7AWGKSGYG3MSDCCR3ZZREX3JH14TCCE, amount: u149998000000, memo: none}))
(begin
	
	(try! (send-stx 'SP1FQ3DQDR5N9HJX3XC5DNKFCG4DHH48EFJQV6QH0 u1000000))
)
