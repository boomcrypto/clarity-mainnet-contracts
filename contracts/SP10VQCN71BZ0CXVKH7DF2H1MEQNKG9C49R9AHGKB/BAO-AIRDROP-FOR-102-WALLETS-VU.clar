
(define-private (send-stx (recipient principal) (amount uint))
	(begin
		(try! (stx-transfer? amount tx-sender (as-contract recipient)))
		(ok true)
	)
)
(contract-call? 'SP10VQCN71BZ0CXVKH7DF2H1MEQNKG9C49R9AHGKB.bao-stxcity send-many (list {to: 'SP3J1D8WCKJW5QCKTMHJKZBTKG93TRVMCT1N39DVP, amount: u8888000000, memo: none} {to: 'SP1NGMS9Z48PRXFAG2MKBSP0PWERF07C0KV9SPJ66, amount: u8888000000, memo: none} {to: 'SP3CPP71K21BKT8952BN0FFZQDEDKQ3BMB9M9J8X4, amount: u8888000000, memo: none} {to: 'SPZV5RJN5XTJHA76E0VHEFB0WPEH7E11NZZ4CGBK, amount: u8888000000, memo: none} {to: 'SP3TRVBX53CN78AS8C3HNTM3GPNDHGA34F9M7MAH2, amount: u8888000000, memo: none} {to: 'SP4NG1XVRQYPV9P98EEJ0F9ATGA0KA49HDAKHZ7E, amount: u8888000000, memo: none} {to: 'SPZ1FCZE93DE0C55H7ZES2M60WKH634A6WSY7ZF1, amount: u8888000000, memo: none} {to: 'SP1V3V156YJE4QFX5XXY7X7C4GHM1N57252WHZQZS, amount: u8888000000, memo: none} {to: 'SPQGNC4W3VFAD2A8TXZJY8GT8A1JRQ3PK2XCP831, amount: u8888000000, memo: none} {to: 'SPBKJPJPNQ6VX1DQPTWZCSCXF2G701WMVDYRD03W, amount: u8888000000, memo: none} {to: 'SPCRDMAJ0RJYPQ3BMNN9VV01BFSCG1SQ1WJZB558, amount: u8888000000, memo: none} {to: 'SP260CCFM72WB0TTJRZ0EKTZ7CJ95V3FMT8B0EBPP, amount: u8888000000, memo: none} {to: 'SP7QQ9DV0DMV7YW4HR713MKBWADVA0BFC2J65PJT, amount: u8888000000, memo: none} {to: 'SP22DYJ0RFETDAE4E7QDNTYRSRXBCWZD7TX3ZKHWP, amount: u8888000000, memo: none} {to: 'SP3RY185H0R8TNX4PGRYFZ07AV001N23N1FJX9MEE, amount: u8888000000, memo: none} {to: 'SP1CE3NQXDKCJ2KEFFGCVFA5C196S9F0RRX93HY87, amount: u8888000000, memo: none} {to: 'SP2N3KC4CR7CC0JP592S9RBA9GHVVD30WRA5GXE8G, amount: u8888000000, memo: none} {to: 'SP1BV9EM4PP85A8C82X5TSK5AADR7B00FS9E6DVFK, amount: u8888000000, memo: none} {to: 'SPY5GX22C4JX289QK7MA799D0PRGW7BMHFAVAPFB, amount: u8888000000, memo: none} {to: 'SP2JWXVBMB0DW53KC1PJ80VC7T6N2ZQDBGCDJDMNR, amount: u8888000000, memo: none} {to: 'SP08NR67Z2GAS6ZQHCGH5BZFTC2360QSDPM1WQYJ, amount: u8888000000, memo: none} {to: 'SPSEBFRZZEZSHGRKRR1Z55RX5AWHER3CYM0H9BMW, amount: u8888000000, memo: none} {to: 'SP331R3MQE82TBWV5R4WGZAD6FRDBN6S5ZN635CG2, amount: u8888000000, memo: none} {to: 'SP249H1JFV31H5ZXP4AAQ137HPCQSQ5D37WMQJ4T5, amount: u8888000000, memo: none} {to: 'SP70S68PQ3FZ5N8ERJVXQQXWBWNTSCMFZWWFZXNR, amount: u8888000000, memo: none} {to: 'SP2QDMH88MEZ8FFAYHW4B0BTXJRTHX8XBD54FE7HJ, amount: u8888000000, memo: none} {to: 'SP3K22XKPT9WJFCE957J94J6XXVZHP7747YNPDTFD, amount: u8888000000, memo: none} {to: 'SP1JX2RYKPR0G7H81SQHZQ187H50RR6QSM8GX839X, amount: u8888000000, memo: none} {to: 'SP34S80102KYXHC0C5VC3GDPDVY3WFG1G5G507Y0K, amount: u8888000000, memo: none} {to: 'SP3T23YN6MBF44YNV910FD8JNMN1NZYGKG3MMZ73X, amount: u8888000000, memo: none} {to: 'SP1J5W1FN3P80XV1YK14BKC6A912WWFGJSW9M92HA, amount: u8888000000, memo: none} {to: 'SP1P6KJTYZA76NDFQEXM4MT6JG4M4M3396MKTBDMF, amount: u8888000000, memo: none} {to: 'SP38GBVK5HEJ0MBH4CRJ9HQEW86HX0H9AP1HZ3SVZ, amount: u8888000000, memo: none} {to: 'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M, amount: u8888000000, memo: none} {to: 'SP2J9XB6CNJX9C36D5SY4J85SA0P1MQX7R5VFKZZX, amount: u8888000000, memo: none} {to: 'SP1W4WC3DGZ2YYKNAZNJ80F621R11FAPZGGA4Y2QH, amount: u8888000000, memo: none} {to: 'SP176ZMV706NZGDDX8VSQRGMB7QN33BBDVZ6BMNHD, amount: u8888000000, memo: none} {to: 'SP2EMZSA1CQQCGJEQ9JSDBWBV0NFDJ59EH5P9E56V, amount: u8888000000, memo: none} {to: 'SP2V0G568F20Q1XCRT43XX8Q32V2DPMMYFHHBD8PP, amount: u8888000000, memo: none} {to: 'SP162D87CY84QVVCMJKNKGHC7GGXFGA0TAR9D0XJW, amount: u8888000000, memo: none} {to: 'SPZRAE52H2NC2MDBEV8W99RFVPK8Q9BW8H88XV9N, amount: u8888000000, memo: none} {to: 'SP36WJG2PAMD5MR280C9K6ZE1WJ47N8GEQV2ZK0NY, amount: u8888000000, memo: none} {to: 'SPJSCH3DDEJ8GQPGYZBHSB4F3HX5Q222CG89PSAB, amount: u8888000000, memo: none} {to: 'SP364J7EDJXRE1FPDZDABP9M58HPY4G88BFCP2HD0, amount: u8888000000, memo: none} {to: 'SPMS4E9RQ4GCGG68R6D15PKV01TYNCBPYZG1ZMFE, amount: u8888000000, memo: none} {to: 'SP1FMDMN64AWP58MT9TAH4TH28JTC3B86TJZ0PYK7, amount: u8888000000, memo: none} {to: 'SP3JC3EKSBWF35EAJN5FXAMRHMG0XAV6TPQYJME1T, amount: u8888000000, memo: none} {to: 'SPZ5DJGRVZHXEEEYYGWEX84KQB8P69GC715ZRNW1, amount: u8888000000, memo: none} {to: 'SP2KZ24AM4X9HGTG8314MS4VSY1CVAFH0G1KBZZ1D, amount: u8888000000, memo: none} {to: 'SP2NS999PSDK4XS4K0YK4GFK1E547SQM6V5PWWK2C, amount: u8888000000, memo: none} {to: 'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS, amount: u8888000000, memo: none} {to: 'SP3XFSS6D2FPECBVVT9Z0VD2ZNBB2MV9FR8JCD7EN, amount: u8888000000, memo: none} {to: 'SP1PHAGEQ5RWM8G84DFGMRPENKQGFC4QJ9YWXAYKF, amount: u8888000000, memo: none} {to: 'SP2HJVJQS0TRBTQ1WAWWN9H9W2HKGDZ7H5EZCEAQC, amount: u8888000000, memo: none} {to: 'SP32AEEF6WW5Y0NMJ1S8SBSZDAY8R5J32NBZFPKKZ, amount: u8888000000, memo: none} {to: 'SP1QZT85MFT8HBAG3XEK7K6QY4GGP3MSG5C3H9PQ1, amount: u8888000000, memo: none} {to: 'SP3RW6BW9F5STYG2K8XS5EP5PM33E0DNQT4XEG864, amount: u8888000000, memo: none} {to: 'SP3N4AJFZZYC4BK99H53XP8KDGXFGQ2PRSQP2HGT6, amount: u8888000000, memo: none} {to: 'SP2F0DP9Z3KSS0DABDBJN0DA0SHMCVWHXPVTH3PJJ, amount: u8888000000, memo: none} {to: 'SP3VCX5NFQ8VCHFS9M6N40ZJNVTRT4HZ62WFH5C4Q, amount: u8888000000, memo: none} {to: 'SP1ZCYG0D3HCK2F7SY8VH9ZREB0JWCBSAPFNS8V5Z, amount: u8888000000, memo: none} {to: 'SP3NWMS3RRFFP4EQS0D10MH2V7AYDVXZ7J3RF0Q3V, amount: u8888000000, memo: none} {to: 'SP31DYVRQFT2HDPRVQGFJT7GD1TT4TRRS56YSJJ8E, amount: u8888000000, memo: none} {to: 'SP2HHG4QS72P7RGV10GXYPPKQXGRA01MXWJYPSJ15, amount: u8888000000, memo: none} {to: 'SP3CK642B6119EVC6CT550PW5EZZ1AJW661ZMQTYD, amount: u8888000000, memo: none} {to: 'SP2VDCH5WNBGAF8K0W36YM6NQ4RPWZT2MYBX157MN, amount: u8888000000, memo: none} {to: 'SP1RWWPH1DMKVHK22ZHC008T5RARCZMM4GCBA78TX, amount: u8888000000, memo: none} {to: 'SP2H3TTG3MQK9CEF59S7VQ86H4FX9CH596ZXSE2EK, amount: u8888000000, memo: none} {to: 'SP306CJJZJTMH8ET5MRZBXP66ZW3DX71EJTF71FBM, amount: u8888000000, memo: none} {to: 'SP2Q5WHA9NAGWQV500HSV93SEG8PJDNC6FAH88EP4, amount: u8888000000, memo: none} {to: 'SPQE3J7XMMK0DN0BWJZHGE6B05VDYQRXRMDV734D, amount: u8888000000, memo: none} {to: 'SP1KE61KVRMKSCZ48WHM5J2DQVXQRK7KESHFAB9AZ, amount: u8888000000, memo: none} {to: 'SPNNXMY01SNT92EEK9DRRG2QW1FA256MCNBPPSRX, amount: u8888000000, memo: none} {to: 'SP1FKNDXR7XQQF001C45V0BCMTDXF90RHNNQ5HAYH, amount: u8888000000, memo: none} {to: 'SP9CMJ7S8XR25H6ZKAJXT4M7KSPQ1B8PPVSYJRTC, amount: u8888000000, memo: none} {to: 'SP2HY55JTX8P6EXY9JSRKK407MQKZ9MB9VF9X5W6R, amount: u8888000000, memo: none} {to: 'SP6TD7G6FKW2AG824H3CFBFNSWZCP7Y13PSDAC71, amount: u8888000000, memo: none} {to: 'SP3SAE7WCT0MVXCAGEFM3EDJY1E3TC4X7G1JAM8GE, amount: u8888000000, memo: none} {to: 'SP27PC6WHZK21TAXG0MZJRY9MKTAJXBMXC5ZKMBBF, amount: u8888000000, memo: none} {to: 'SP36XZDY557Y1CQ6H5DZ1NGZP1Y943RBTY0KBWAKG, amount: u8888000000, memo: none} {to: 'SP35DJDPDNCYRPMTDW10YCQFA29HWXK2S3W5FKFA7, amount: u8888000000, memo: none} {to: 'SPWM8112FRQ15JRSA4W3QNWNPPHP21XZKT4PQBM6, amount: u8888000000, memo: none} {to: 'SP2R3CHRAP1HE4M64X1NZXHZT41JG3XGNHJW4HX2W, amount: u8888000000, memo: none} {to: 'SP2KPNYCHW7HYA76TD0PSBQ7NKGEC54T3NBRSWFHV, amount: u8888000000, memo: none} {to: 'SP1ARWZD4G0SZPADBFQ5DVSK93B6QKQ6DHK9G452P, amount: u8888000000, memo: none} {to: 'SP2VG7S0R4Z8PYNYCAQ04HCBX1MH75VT11VXCWQ6G, amount: u8888000000, memo: none} {to: 'SPHFAXDZVFHMY8YR3P9J7ZCV6N89SBET203ZAY25, amount: u8888000000, memo: none} {to: 'SPWKDKPZ3QDPQGDADWJ3EWPAP14CB1N1HDQ897W5, amount: u8888000000, memo: none} {to: 'SP8N846PR1492HB2A08R5G96RYNKWRHDJDTBM227, amount: u8888000000, memo: none} {to: 'SPWEAVXBZ9JTB9CVZR3VN29P748P7GECVE5DHECZ, amount: u8888000000, memo: none} {to: 'SPJNDWV14Y3TBJ0P6FBF2ME7D2HCNC55WWCH0W2G, amount: u8888000000, memo: none} {to: 'SP3N7Y3K01Y24G9JC1XXA13RQXXCY721WAVBMMD38, amount: u8888000000, memo: none} {to: 'SP3W71ZJ7BAS6ZXJ3VZA08JF56D2GJ241WWPZFERW, amount: u8888000000, memo: none} {to: 'SP1X11HKCJ46PT9GSRS1PRYA53NB1VZ5P2B7KGASE, amount: u8888000000, memo: none} {to: 'SPMGBGCFE9T5FMR1Z34GDSKDA9SSVT65Q19N4P1D, amount: u8888000000, memo: none} {to: 'SP3THN394AGQ6NA5JSMAF3NSJ2G74A12RN8JXCVA5, amount: u8888000000, memo: none} {to: 'SP29N16Y4GQNB9B59XZ1E69M5R6EXC6RFWVRCDNVH, amount: u8888000000, memo: none} {to: 'SPJSG8FNM651DH0C7FY65MMY1SM1XQPR3EBKBQP0, amount: u8888000000, memo: none} {to: 'SP2KYP13520BR3CN0JAGRJGHEF0EATAVT4580WF3G, amount: u8888000000, memo: none} {to: 'SPQNJ28CTBN4BX7SGZBKVAP8FRBXX759TEXQQCB2, amount: u8888000000, memo: none} {to: 'SPEVA4314XA8MXHQ558DJ41Z2ZJZ8G2ZK61SY9R0, amount: u8888000000, memo: none} {to: 'SP1F0D3QDFM3NCMMM8JN8RXHP8296T5VT7SE149QG, amount: u8888000000, memo: none}))
(begin
	
	(try! (send-stx 'SP1FQ3DQDR5N9HJX3XC5DNKFCG4DHH48EFJQV6QH0 u1000000))
)
