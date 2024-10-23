(define-public (check-many-1)
  (ok {
    a: (check-many-a (var-get address-list-1)),
    b: (check-many-b (var-get address-list-1)),
    c: (check-many-c (var-get address-list-1)),
    d: (check-many-d (var-get address-list-1)) 
  }))

(define-public (check-many-2)
  (ok {
    a: (check-many-a (var-get address-list-2)),
    b: (check-many-b (var-get address-list-2)),
    c: (check-many-c (var-get address-list-2)),
    d: (check-many-d (var-get address-list-2)) 
  }))

(define-public (check-many-3)
  (ok {
    a: (check-many-a (var-get address-list-3)),
    b: (check-many-b (var-get address-list-3)),
    c: (check-many-c (var-get address-list-3)),
    d: (check-many-d (var-get address-list-3)) 
  }))

(define-public (check-many-4)
  (ok {
    a: (check-many-a (var-get address-list-4)),
    b: (check-many-b (var-get address-list-4)),
    c: (check-many-c (var-get address-list-4)),
    d: (check-many-d (var-get address-list-4)) 
  }))

(define-read-only (check-many-a (address (list 100 principal)))
  (fold check-err (map check-scs-user-lp address) (ok u0))
)

(define-read-only (check-many-b (address (list 100 principal)))
  (fold check-err (map check-wcs-user-lp address) (ok u0))
)

(define-read-only (check-many-c (address (list 100 principal)))
  (fold check-err (map check-scs-lands-lp address) (ok u0))
)

(define-read-only (check-many-d (address (list 100 principal)))
  (fold check-err (map check-wcs-lands-lp address) (ok u0))
)

(define-private (check-err (result (response uint uint)) (prior (response uint uint)))
  (match prior ok-value result err-value (err err-value))
)

(define-private (check-scs-user-lp (address principal))
  (contract-call? 'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS.lp-recovery-calculator scs-user-lp-checker address u166688)
)

(define-private (check-wcs-user-lp (address principal))
  (contract-call? 'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS.lp-recovery-calculator wcs-user-lp-checker address u166688)
)

(define-private (check-scs-lands-lp (address principal))
  (contract-call? 'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS.lp-recovery-calculator scs-lands-lp-checker address u166688)
)

(define-private (check-wcs-lands-lp (address principal))
  (contract-call? 'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS.lp-recovery-calculator wcs-lands-lp-checker address u166688)
)

(define-data-var address-list-1 (list 100 principal) (list
  'SP1B46TPZD8Y3ETHGZYJAPHD9GHJK81K08WRB127X
  'SP32RXJSH9DX4JGMBSZG0RQS09RG2MHBCGK4H8A7D
  'SPXYRKWDFKBZN3GTS3W9A1MQ0PFTFAHZGGV9V1MJ
  'SP331EEC51MP39K4FDVQDNESD42JJSVFCGAAGAAV7
  'SP3353JJ07CNXTY5QXFVJ3JR5KQ899XN2FSDHP8MX
  'SPATGXN716EY3B7KYHVJ9PPEAJ314Q2JGNR43MSW
  'SP0BBYYTYXSXP1VXPS7BVJYM25549N1S7R3KN1VM
  'SP3VMAHTFVN9ED5FB073MK1B8MGNCZW5VCEHFFD7C
  'SP2B7GRYD0C634HWXNBKDJ0VH2C6CK2QNXBMEJ1MF
  'SP1Q32FAXFD7BP1B2GNNZ455P71NPG5AJ50BJ1417
  'SP3K0EE25S57TK269WJDYX9ZBEY763RFBX47TA69W
  'SP2GXZZWBP8C5EDGMWHTHGVAFDBTZW1A3BV03BRXK
  'SP1MSEDHYPWWS46VDC8JSKM7AMRB22J240Y91N67Q
  'SP1MCJ7D698A74P7B5S737140PGEFZQ68NHNEQB88
  'SP1RDVQHYK1DGF3WR2BM83BCCKPWDS2M8FX11WDWP
  'SPBT63C249S15209E3J3FYKCV0CWRW2QXGFVWBJY
  'SP315JZQXB7GA1TAR49GXRMBDRWSFNG4YY2MZEZNY
  'SP30VABWSHZHXFC81XW77F8NAZ1YCDMCE6CZVXP70
  'SP3B8W1S6YE0Y46VSSF1MFEVCATPN9HHQ9VPVSBD8
  'SP2XPZZQTER4936FS9ZE5JF4J4DFZD2XHADWE0FWN
  'SP1KD2BS98HCAEZQB3A4AXNS2KNAFTXF2CTJBQWF6
  'SP149EKCCAZ8CGTDXS7ZPCZCQC3PPBTAPCP3RPC3A
  'SP150WAXJ4RWQ1KN34C0EQ08AJSQTYZF7KAS0WCM2
  'SP3RG2YR6E79BEJZPFYKWW42HM4YTNNKW95CNZRJX
  'SPJZZG5VWKD2KQZV8VP9RXQVBAFTP2N84ZP7MZAD
  'SPCK2ZM9Z7J9DQT5TXA1KSAYDMRP97ZWTNVZRVZX
  'SP3M5HQJH19J6AKFME7N5BN3NWBXQGBVXKXS5WPRF
  'SPMFGP1WFF8E70EPCJGRGBDZBSM2Z43X4KJM3N48
  'SP32728WFVK74FQXC0BD48QD6BNW5A3MJ8HB5YADR
  'SP5TN2MP8EW41ECDDS9R10AZJAACV5RFBVP6PR6X
  'SP7TEF3PAXCQHZF4N5PT68GWQ5PGWR6VDNWQ5CYK
  'SP3ETETH2V1EFVJGY6KBARK3MQGCXYRKWKYND0FG5
  'SP27HS6M8BAWSQFAAADM5C2SHMZJD3NCCT3BQYZ63
  'SP1VBVQFESV6T0WW4J8KSD8C00HRK18RSFEP0SCVW
  'SP10TNNH965N8HGMBPEQWMT3E3RWHRHQ10H927J1V
  'SP1NQT9PMVBWHZHSM13RD6CYF86G4YA99JR5Q1NM5
  'SP1PEMSG53W3MBGARH6364ZC7RJ5S601JP48816J4
  'SPFZFNMPVQTC1NCVM44TYEMTTZ1J5TF80M6X941K
  'SP3QFQCFZTATAW6ASNGJ0SKP30R7Y7CWGMPTRP1QZ
  'SP254FNJQR707WM5W4ZWEXJF2401GCZD3AN5FGPZ5
  'SPP3HM2E4JXGT26G1QRWQ2YTR5WT040S5NKXZYFC
  'SPF35MAC1GKZTKRCAFG1GZCKZ2JTR9VYDCJE69XP
  'SP2ZKT3C5R76512ACSA1C0R1HJ21ASG8ZESPCT3ZC
  'SP3DPCAWT3Q1P9DSYHD266JEDS077H79SNRB16NES
  'SP3ZRRPPW4PXA8M7D69XEC6VSDDAYQCBABGP7WHA7
  'SP1AQDVJF18XEFVXMWTRAW9TQ0N2DCN0178FKW03R
  'SP18ZDF3BE3GB5RV9QMJ8989R2GRXXTTVW7HNNAJC
  'SP2JBR1RTAM3XWZM8027E5BN39M61R9ES7BMZPH2W
  'SP2EJSKCAD26AKPNYBQACSX9AY2JX6V27D3F9BW56
  'SP1XF1JCS0BJFNX3Q7XHVPNVQR8XCBPCTFB1AXQDD
  'SP2GK22KB7KYMWWFY1CP4TJJA9RYAD3R2HW2JF2CX
  'SP2H6HVZK6X3Z8F4PKF284AZJR6FH4H9J4W6KVV8T
  'SP296K1JB7V6E2S8WHYHBAE4MVR0PFCATQXYVYVJ8
  'SP177JV93RYPWWTX5F0MK9NVQ3YTXB4YQZGBPP6H4
  'SP11F09DT5HFYN7Z5HG15QXW0CMD40T2XJYY0G5AB
  'SPBNZD0NMBJVRYJZ3SJ4MTRSZ3FEMGGTV2YM5MFV
  'SP19ABGPHMYDK6PA9D9NE0FCCG8NF0TYEM74MVQQ8
  'SP5HMBACVCBHDE0H96M11NCG6TKF7WVWSRRHK6WB
  'SP1BJP3FJ9R20R9C5ZD0Y28XH1ZKPZZPCS9K9S3DR
  'SP3B93RAWESWW8M5ZP8P71SXNMJEG6T4DZG1HQ1BK
  'SP6E3TDTM71N47SWYXE12WEVWGM84MCX93ES3K85
  'SP3JCECP81AVXA0884Q6063D7ZX5WEC0FK2J7VACY
  'SP3QJ0MM9G8M3DSF5NEX7CEJ99NFDQ81WG17T7RMC
  'SP3SHZEJ4581B954G7GTXVXBGNPZN3FTX9MZRZ08P
  'SP3JGTGX86B3E36776SXGEHGCHCFQ51P9MX9G7078
  'SPKZT8CFR5DNTKDR2BCWQA9WR32GP3GT0CPV8V24
  'SP3WAAYXPC6WZNEC7SHGR36D32RJPZVXRR1BG0QSY
  'SP3AFSKPE2BQ84WXEZ03PQ2E18B02A8ZZWK6190KW
  'SPK3EG816V3DC1RW8HVEQJ814XA3MFT8YC2AXGB5
  'SP1VXD4PH4HJVFC2FBJ6MRHYYSMETYQEF4BGV396P
  'SP2VG7S0R4Z8PYNYCAQ04HCBX1MH75VT11VXCWQ6G
  'SPZ3KG5031TP6JBWY2C085H508F44HH4DG0BZ6RF
  'SP2Z753RJCCFBQPM392PNEYK06WGK2Q42T9Y3M7H3
  'SP2TCFBF793T3PZPMCKQ3478ZS9JR0GMN5WRKX94Z
  'SP2G9AFSSMAK1S8PSCQTX19M40ENWFV4HZDDT7TYH
  'SP1PH0715GQ09RT366EE916Y35QRMYNBSDZYQAE9M
  'SP2F4MC8E5YHVB1GF1S9MQ5B5HPKZW1DSV5VS7K0J
  'SP1G18KGVMP2RF5S2387DBC4VRZGK2T9ETMMVT7BB
  'SP3CZQRTGFQH5RVSD3JVJ489C2HHXS5YAKJT979AZ
  'SP45RYP4W83SMSCG5C7MZCM1EFVRJY4K6D0E05Z6
  'SP3RW6BW9F5STYG2K8XS5EP5PM33E0DNQT4XEG864
  'SP2CA51YWC7J3TCA7G76T6HNRJWD8011412CRYMA6
  'SP1HY3TT2M11KMY98F71A667MQ3PCHGFPAZDA5CAB
  'SP38XSJ91XTY6ARN2W58AKKPBJAJ0AM02W1QJ497F
  'SP1FQNG7YRAH5M7GV79T5415YS347XV1FRWVDG0BF
  'SP2F0DP9Z3KSS0DABDBJN0DA0SHMCVWHXPVTH3PJJ
  'SP1DQ2WG13J97V56CNWNN3D699HZKSPFYV8243C8P
  'SPJT3WWPT4Q925GDE9BBZRC5MNZ3SMP8G7VMJSNS
  'SP2ZEXVR2YQDJ8K3CVK7KZSXPCHD88GC2JYRRGGB5
  'SPJVT9CTR2HVE03VGME9VPG3XBAWYB03TAANKJSH
  'SP3G100Z5B0Y8MM73P1T5G6D9XZFNAJ7YJMAQM25S
  'SP2DK16DZD7SHESEGWR1QAQPHKS12QMH54GXSB7TN
  'SP3F4RJ3311GCH3BSP0MH2QXHHQTBV42F4PQQ4S6M
  'SP1TXNDK4CH2SB794Z390G7P28WZ0S7JY9VWAAWBK
  'SP1BA3RE79Z541676KJNSYPD437N9ABJMZ314AH95
  'SP1EMXT9RET8W5TXQ325BG3TJ6X15NXV5GKEGVQE6
  'SP3T89RVT0S1Q1JTG4ZDQVMCQYXX1C22RC5AY4WEC
  'SPV4FM42FBDT84WYPYF52D9B2SRX9H26JNXZDGDE
  'SP311APMPND8FXK61HDXRATDKBT8CFMHC5PY6MYJ3
  'SP3VZMXTZ58W2N1MEXXTYDRY2PS61X9XW1AS8WQVR
))

(define-data-var address-list-2 (list 100 principal) (list
  'SP2T6JNZ7XGAPG505T590GYJ1A05Z1KXC800DHFTX
  'SP12XN3YC82FDZ2HQ9ZWHNSWY6ZNVYCA6AKDQYSY0
  'SP3P997G5WKDX9C02E1BH337FQ6QQ4EH6V73KTZKJ
  'SP37W6CK0YZ1KJXGFM57Z7VY48T6VFKCQYKQ929NP
  'SP3G94QD0Q60Z4TZJP00CXS66KC4R6MMXVJ5A7C6F
  'SP225EHYV4NCTW172KCZKDN9M5VTAFC2EVT55DCMH
  'SP3346NXMA8NTBB88RTH69RMWX36R6PKNEK5KD679
  'SP1C7TKHTBV3KBM835MD2N9MZGTYZ44C305DP469R
  'SP38QBKWK4BK5NHJSR6V6TGS4GZJTMFEZ23132V3F
  'SP31PJZ7TZVPWFQRWYST7WNCGMH35VRTGYRXPQV3
  'SPXKWKB59EHFHDF258J0GRPBAMYP8GBZT3GKXKPQ
  'SPXW8BXG2S88SX7C1CJ3BVFEGR51SFGRF8DMYC93
  'SP2P4XX8HRA792EQ5DZN0R6PK906F0AETQ18B1XDD
  'SP2G6SEFFJ3JT6SCBTM1NVP0YP9TY761P00NY1TW6
  'SP3JC3EKSBWF35EAJN5FXAMRHMG0XAV6TPQYJME1T
  'SP3CTD9QK4J1MKT34X6QDS3YXNM3B52MPVAJJ2APR
  'SPF0V8KWBS70F0WDKTMY65B3G591NN52PTHHN51D
  'SP4JNHJB6B953T1S2GZTNYGJ3PZAHG12NFZY8GPF
  'SP3K650KFSY5Y2559C56TKZNSBZ2MKVDF0PCAYE78
  'SP15ZW2BT5E4BSM8SBJJ2P95NAAPRNT3YZ23KMY56
  'SP37AN9PHYMHPC0VJ4N7MZNXQDCFYVGYGFYFCNVC9
  'SP39R72YMPZ96DGY9XSCE5DDASXEQBJYYDDZ416WM
  'SPWRJ6AQRYR8E68GS8XP3TGM33FBA898E08PM1MD
  'SP2RJA607NFS766M67VK2TRRTSNBFWMM1N8AH1RSC
  'SP1WCJ02AAPKMXPK81KFKGJ7MJDET11FPQG1RHB0S
  'SPHZW8N7EMXHY7N72JNE2EE1TD4Z1FZ8GENAHYFS
  'SP39KXNAFF2WZTX83MJZ5SBX9N9FB2AZ6K6VZH6H4
  'SPKWTZHVSF4XXSBSHSZQ5YA14AA48SA4S68K68GP
  'SPQ6H4WJN7N9T2APMA8FMHGPQ2TV9QRJHPQ35D79
  'SP1NR008WKYEQ5XGX55764N4TKVGE2R94D8NRHVKB
  'SP3P1PASTZ83V7TTRBEJQ347H5EWTTXB25QF1EJF
  'SP271PVR9R7FY3T4SNZ769MFB7HS4CGBVDN61VSPE
  'SP2N7VSJ2DT9NY438G3VDWYFP3WWBKYN46GQPHH6T
  'SP1NPDHF9CQ8B9Q045CCQS1MR9M9SGJ5TT6WFFCD2
  'SP3M3Y5W82QV4S05CNMWXGKZER5YEVSRD7JXVWBBZ
  'SP1CFY6YY050699F8WKGEC5N0WSVRG6MGET8XRZR1
  'SPZ45AXF1CH6JB16WM17TCA2BZRGPM3V71FDN2B0
  'SP1HXSCXR4GCNMVFFPTFGP3S9431XJJCT36Q026XP
  'SP2P1M67TC07M7TREVNKZZAEN27F3SDKXEX07F3KA
  'SP21NJX3GHFX58FKYDADV0ZPQFWCQX0ECNJ3CMV75
  'SP3SZQBYK1KFQHQEJGJJHNMVTFDF5QVFR2A7Q4WTK
  'SP23WYJ669X7464XTCKWEXJ69ZSMQYK0R5W4G135Q
  'SP23JYESZ0MKSKBF66FKS67SJQWT7X73Z3FBTXHA7
  'SPVBMP748C9BHJ5Z9TYNF7VYSRFD3YJQ9K1W4A7T
  'SP1VMBFAQXQX27Z1FG9B4D0SKN1R35B7SX01MSW9Q
  'SP3YEEZRKS7DJZ2VYQBE5YWCAY79BA0H3Q0VNEF7R
  'SP3FFJBHM5BFCMWRE4N6PSA4GAEBSV7R8SS8G39Y1
  'SPB3ZHE1394C8N1PNVZ1MHG82XBY3T62HR8PG0J3
  'SP3CTQ2865FXMJPMP1P734YW2EXPF40TK0W8EKVXP
  'SPXVNGNQMRYPQBWQX2KG64MB97B22EMZMZTCSPAC
  'SP377T7D9PJH5H547R8RKW0NE82M3FZB1BN3BRPQJ
  'SP37QV9AH79MWKNQD2C546CS68VHNZY6722RKJNE1
  'SP9MKT9MWBXQ16DHG9K3KRSA9GA47SW8HG33ZB7M
  'SP1SVZWA94E0T78T7EQA2Z7PSZ0JT6SDJTBHKW995
  'SP3Y2QKQ8WDXVV9PK9B3YB8GFXVB8QKRK0GVEEA6V
  'SP1M1055ZR1DZMFSBAJ29Q1QZ0A13J0AYPAYTKVKV
  'SP2N718HM783CA5W6DH1V3B1DSPNE1YWT9CNHT9S0
  'SP1MB1D1F0W33G590ZW3FR3TA6K27N7W6EQ8X86VY
  'SP3M2PRJ2X85FV6360KMG1WTBKJAC6C3V77FJG3CM
  'SP1JBMAKQ8YH0B36PM799394NENGV1X7FSA6C42E0
  'SP1ECSZKFGFF5RTKW43HX9ZZ6NAN8RBZSPNQR4X3B
  'SP22M4WY88KDTXG3TJTW9MQQRC38BGFCNYJKF07F4
  'SP2E4JE5BXQ6XVG86D2BBKSK3N9W49TEMY12CAATF
  'SP1B9BZKBH8NPDC380NWN15J6807MB3SM6AE7DDZZ
  'SP92NJ6Z9K7K7VNG3TZWNK3QMZCC6KES2D80HS9F
  'SP1X9WS1VTYBV9MR0YR0X8934C9575K1X3Q6YSTH9
  'SP3FYQYV42AV9E1NFTS85FJTAZY0VP97K6N2S8Z3V
  'SP1TT3TCC5KS2DN8H462H944FK4RK0CYHEG4BJZ9C
  'SP1QSMPQJK184K2SHBG3DZH9BF5A2FVPQ4ZANC79V
  'SP326RTVBRZ11QPSKAR8BDJBK7HD3S4Q3Y7WKD7RB
  'SP2QM1TJYGQNPQ6QS6C6VQ7GRDXE168JE94P5KWPR
  'SP2470N2A31DGDHX541MK2FKJSRHSCW907S5KKYTR
  'SP3XAAH44RSASXE0E3HBRX42TBMP6B0FGF74Z8EPM
  'SP3KAJC6X2X15C11J85C9HMBCF11D9GM43VKFM41V
  'SP1BZV0K3B01MEQEDHC0D2NZC1QGBXWSPXWD5P9Q9
  'SPYWQFRAQPSD5K6H5D8K3TV47D6SJZPGC4F7YHSB
  'SP05XMHBC4CY56M29A4CHF4VRJM1JHQHBY8YXAKE
  'SP1R48QY0W8YGTVBGRMMMSZ643B6PNB1VKR8AEAYC
  'SPCSM62SD3V2YG83ZAGXZ2YZ315WEEQHN14YQYT4
  'SP2NTRBRRTDR05RH42W4VE2VDSWY2RJBFA2NMC2R0
  'SP3E8D7G15Z90BZYPEXDHPHFS51C5V2HTTQHD0RAZ
  'SP31A0B5K60KHWM3S3JD0B47TG3R43PT1KRV7V53B
  'SP2D5XWZTJP2A0C0HA0JE6RFNR2YSZQYBGVG9FFB
  'SP3SZR11RT4R5KN6R7FBY2DXCY8Y2GKHC1PXV5DRV
  'SP259S8XT60W4F80MMJBM0JRFGB5GTJ1F9KHP74AA
  'SP1YA6F9B9F3TJP1QJDGAME5JTRHDF7PG8NRMR2WJ
  'SPRC7ANP4ZT12F0HVE0PZDGDZ4A1DY6WSPK2RH0T
  'SP1ND0CRTD7R5VQA090PM44JD2NZJ31ZN3P5DKVJ2
  'SP2Q20G8M0W0XRVG7YG1PXTGWXADSWMK8T6AK2M0F
  'SPWAKCDHKWTXCZGBFXA56QY71Z5REC3HWVY6P5SD
  'SP31G0N0BV86DMAHX1V6S3ETTFNX7HXJC9TT790V4
  'SP1ARWZD4G0SZPADBFQ5DVSK93B6QKQ6DHK9G452P
  'SP3CZ2TCE28SCQWTKCS6MGP43ZZG4TWKG8704H1T4
  'SP2XNHZTGFWJ73W2NW6PJ2MJ53WY7X5Y7QE9PB4Z
  'SP17W459944DRA4FSRE1DYTHTVZ6620WS8F24NXR9
  'SP4G1JEM66G4MCFVEFK84ZE99QXRP330NYEN1BQD
  'SP19SM9Z06A40WBEQZTN9MA5N2TB64HXHY8Y3ANT4
  'SP3XXJEVPV26SR4DKVG3V892CPR1SV8PYM34X7VNN
  'SPX1W9YGRC36RKZ6404TT0B8F7479EKXBHRHNMQZ
  'SP375TB0ZSDDKW6X9YYSJHPENK191BNP9V2CSE9CR
))

(define-data-var address-list-3 (list 100 principal) (list
  'SP1B91MKXWMBQP50YWCNR08XZKBJJVSJRHB72SBX
  'SP1A5M0ZRSNQMF8BNPQPM8WWC5PJ6HJ4GEKFP8W4M
  'SP1KGW54TNSVNE19ANQ12YQ5W0RKRHN5C80MJEJE7
  'SPVFWM4P55JQ5HH26BCSF66JHFDH236PFF4VZ7N6
  'SPTM84ADKSGAYW76YZ0ZA3638XR4H9112YVQFS9Q
  'SP1D8W6HRN833VDFM111X3KAPNW370WYEQ4WPKMF4
  'SP2TBWGE3WRKPFBY5BWSQAYB25CXWM6A8DJQN98YT
  'SP1MAVN1K5D9JJDVFK6RMJABE6NAV4K67G2SG34ZN
  'SP1CP6JGSVSZKTEN51W4N6MBBVHNDE3Z0YV3X5B91
  'SP238X3JD22HJBMWR8E7CKTF4JCBQ73BG9YS1DBH8
  'SP2X87ZY2P08PD0065AKYFHMY5KQNAXAK4FW4D7SV
  'SP1TS6MC7DTJ538F6F4F6ZB2K376DT1GTTY552FCW
  'SPSW96TCWXXNYQDJ0B0PT0RA9FPSYA0TP0YH2039
  'SP1WP873E96MAC5DR39FJDZFCDDFGWXMNPHJBS34
  'SP1WD08W1N5EWG3BQJF0PTQT6G63WV4ZYBX8B2GQY
  'SP1T7QT0MZZ318GW7HJ91JNTQG5BX438PNH7B5Y1J
  'SP57AJJ5SFYYEP57X0TJQY9SNZEYTGK78DWT75BM
  'SP34TYBJDES68230NTAFEFEJGKMD322VYNXAS95V2
  'SP9GKT397E454TR6ZAGQDTKMEBZ12H9A0FKZS70N
  'SP1B989PBPB08XPZQJ57HYS7N1D7DC6XS9A1XCNCN
  'SP3M3KNP94KX6C0X98DYE6FGDVRP610YSY7S7MVZ1
  'SP345FTTDC4VT580K18ER0MP5PR1ZRP5C3Q0KYA1P
  'SP2XFXSRANE85W2TEEXBPMA16QZC0TTJ7BG7SP6CD
  'SP22NMA8APQ8PNHZGS2B5JWTHFQWXJRXAP6ZVM93S
  'SP1P882HWHCTBKEPPEDZ1MY2CPKF1JJT2XMFNT289
  'SP39B6B1XK3G4BD6YKPSVAGJ3TRVX6HFXGWKSDTFE
  'SP1RQ3D1EYMWJSE9YSR9BS6WRAG9PW3WJY52NJGDT
  'SPF1BYDQV7EYZRQMCRPZC6DXMWSXM9C8HGJ2F0E6
  'SP1131XRHKJ3DBYY8D4FZ32Z07GWYPT7A3Q7CSV7C
  'SP3HSQHWSY99QMMDY66Z3BV6Q8JV6YSCTKXSZ3SSD
  'SP3GD7BHVYMFNQY9BM018AD8ZBEKEDW1E72WEQ13M
  'SP3M69BX3YPWVBYVBWDWAP3FQ16H1GDR7TK8KQV18
  'SP2H46BBK7B0ZS1TPHQZ0AQWBYM57HCBQQVKA46KX
  'SP2SSHDSGHHEQN1A7Z0RP0YJ6QECE8TGQTYN594PM
  'SP3273YEPG4QZWX0ENQ98FBT1N2Y06XW820STP7NN
  'SP23JFNQRHWNXK40R9ZSS4NK8T2GCHSEGCKEJX3NM
  'SP3BFYSESJBD3MM777XA3MYEV7Z5JG12W1BKG8YS9
  'SP6DE5C6WE71DEZK5W6V9GQTWR0V72D2Y0FB1PBG
  'SP15W9F3KC39ZHXS6Q3HA4J3VMXSVDWF4DSND7GAK
  'SPE68951PZPW5ADRH23BAQ5E0P0HXM8XTH2AHGKB
  'SP1XMB776WRC4DE0HCMREX70WRFYPVV2QJN9EKB77
  'SP1BHAGZVDWMZJ7W3MMP9E7856Y781VSX5N3VW304
  'SPZQTCBRA7AXGYT023PPJCC7QXFEZQ7ERWR6QAE5
  'SP3HEE9R7S2VGX0K9DBE3R5J62071TZS9PA5F8A0Q
  'SPJRGA1G185EN16V3SH5HA38GQ5C2HMHJSNA91DP
  'SP29902VVK134BEFGP0F3QT7W2H5CFY2BVWAKSN7E
  'SP1ENZEXECPPMRCCMQASTVF4A4X3Z7YJJ7SK2YXNE
  'SP163YBWJDFVSN5M6W8QFD9WNJWFCFXWNEJCAVBP
  'SP12HM3T9DBXRWRNSWX26F7JQ3E4VFNQYEDB4E2ND
  'SP2D50SF62HR4PRZQC8HG9B3AKPVQA92FYKS3ZEN3
  'SP2346RHMJ7MDN627FHE7KBTHKFT7XS67FJVYDJCV
  'SPBACG14GX4FDT4A0S8N6B2G07BEWQCEPXJNSDE1
  'SP2REHQPEX28EVKPC0BTKXAG8ZFAYCD8CEQN9PY35
  'SP37T58KZ5M8WD7A94M8EREJ3V92KDXTCGC16B8JX
  'SPWC45P8JQP1VG9NDNPJ6ZXPVZ4XXGK06GXR5XN3
  'SP2A0VW071VE5QXZ9699FK29F0XXQ0B8AQ5BSC431
  'SP50TQC68XK76R4T3BH18G2K4W14R8B56Z5RKXRF
  'SP2J6Y09JMFWWZCT4VJX0BA5W7A9HZP5EX96Y6VZY
  'SP2N1F7TZFNTCP406BPHHNWK1CBWZDCY11SZWVF2Z
  'SPZXA00TSDHGST961P6XM4DR0KV1MVW5AHYX5WCX
  'SP30X2RD0QND9TKK0N2D8ZMGE3HBKB66R6ZQKEFG5
  'SP3KREX02VK2J07GE35EE52ZD5VDHZ87HQC31R4NN
  'SP2EC3HNZZ8V7J9FC52VMRX3TQ3ASAY57K0FPAMEN
  'SP70S68PQ3FZ5N8ERJVXQQXWBWNTSCMFZWWFZXNR
  'SP3WPN9AJFS3NJA0K5BGBCZGE6ABHMFNS4WWP8K1F
  'SP3AVEFXPX9RZFM8SRR9DRXPQST100VQMSTHHP7XX
  'SPK584GENK57CEDJ2BRH56EXPMNM8G7NDDGC67WK
  'SP213BYCHYJ8BE7MQFT8GYNGMXK3QXCCRWH1AKGY2
  'SPGFJHJ5MYKQXXSEN9W61Y624FY5EJ02NHC5NK93
  'SP2GC2558G0WGGDDAWPTJ4B8YXJXZB2T43RWA15MD
  'SP3MVY88243088Y5P58F6XF46DP99K1H3TV64PXYR
  'SP2MESTB5RP9A2MS1HNFRCEZCNBYGZQ0G8B7FWTSN
  'SP1C5Z3C4GV84425QE2S58PPVWD8JJCXBP5ZYC888
  'SP3BXCQNRPZ2GZ0B85Y29ZA3VMHGCKAZSE9Y36Z25
  'SP20ED669KT0BYH69HPDKP7TWHQ34KXA00DGB2S1E
  'SP2P336EM6HGAX7NQJGR0A4W7KP11BNY25YDSTA6W
  'SPVHDS7GANMDVE3EJH4D2YDBJB0JCD55CK2T0RAW
  'SPJAQCTEYWP0Z11KAP2RYWQZWFTWDEFRCDFRF0T0
  'SP2M035JP83SEJ2QEMZMWVT05E6KJS5RV86MGCZ9F
  'SPAK80DC1ZER5809B2724CRJJBBG2JHZDFV98BSP
  'SP2SX9P0W8K674ARSMKHXQQKZB7P7Q188N3AGGSAH
  'SP2P9CZGEQ5QBNMKNTQZ46JSJCKDC9QNN5H6PCH7Q
  'SP24HZKSS04ARRJ3W548R2ZDAP573891Z3N5NAR0S
  'SPEXAF3YRNCR01Z4DFZ567Z0FB4RKPHM88DMKJSQ
  'SP3F02J5A6XJEXAPS6S42V4KRGMFKRS17DPYX6NJX
  'SP12TMQCYNGEXJY12HRJF25H8T3RTJE1KR3MT2MT9
  'SP1SGVJZNK1D9THF2668AMPK7Z5VQNZ1V639JNP1W
  'SPBMZ50PP79S60TPCC85V9A5A743KKH0ASFT6D7M
  'SP2HJVJQS0TRBTQ1WAWWN9H9W2HKGDZ7H5EZCEAQC
  'SP3A8BVQXF2GS1B0TTMP7KR75BX9RDWZ0P80XZW2M
  'SP32KKJJFFPRFEEY6TCMDJTV3PM5P30QF2J0GWXWC
  'SP3D6RNTTVN0KT2Q9BTK98A90KK2KP5M40MEERKZH
  'SP3APWBTVR2ARPQZHD2Q1VTD19VVN7BGF5ZFNAT1X
  'SP14YCEAVBVSBQRE07NZERNVRNMDKW9EFTDHWNHXY
  'SPR6K4VQ0JQN677W4GGCN5JTPN7XF7YTP7WKAJXH
  'SP2XBRCMNEZKDT5G2CVB8EXE4K9WZGJVB374XHSMX
  'SP1E1C6HHEZSGX6D8FT56VEMNXRXEF6G77971ARF9
  'SP1NQ0WG5PTB7M2N3PNNPG5XFD7N14VXKHZ9NQP08
  'SP33DNHJ2P3XCB5R5JF0TCA6R8ATG7NJCV3D4R5T2
))

  
(define-data-var address-list-4 (list 100 principal) (list
  'SP2ZNGJ85ENDY6QRHQ5P2D4FXKGZWCKTB2T0Z55KS
))