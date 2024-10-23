
(define-private (send-stx (recipient principal) (amount uint))
	(begin
		(try! (stx-transfer? amount tx-sender (as-contract recipient)))
		(ok true)
	)
)
(contract-call? 'SP8CFZ1ZQM71Y1E17G9SWFP1D0RNE1KSPKZ306ZC.wen send-many (list {to: 'SP1N4EXSR8DP5GRN2XCWZEW9PR32JHNRYW7MVPNTA, amount: u12500000000, memo: none} {to: 'SP35RNJEAJFXZWFYAT9PHFBCQMEK7B0X2YS9EMP5C, amount: u12500000000, memo: none} {to: 'SPDAXAPSFTKVXRN9G2BZKRA4GVNWMXZ2SS1JE5CV, amount: u12500000000, memo: none} {to: 'SP301D8E6XYWA05DX8F8HSD73NT2XB376R47G0STV, amount: u12500000000, memo: none} {to: 'SP15D0QK0DP774NVQQZNX7KV9PMJQFAQM37CJHX1X, amount: u12500000000, memo: none} {to: 'SP3CEM5Y6P273YX74ME1D70AN6HJPQTA1HCK1HEBW, amount: u12500000000, memo: none} {to: 'SPNS3VRDFJGZWYCZWC5Q4BWFQHESF2JZCZ50EFQX, amount: u12500000000, memo: none} {to: 'SP1AF4ZWMK655WHB2CGAXZVR75EVHD2SV3863Q0CB, amount: u12500000000, memo: none} {to: 'SPC6WE6W9S7Y1S4XVPENC5G9C4SZQWH9TVTBJEHZ, amount: u12500000000, memo: none} {to: 'SP32T6M9782MN5HH7CDBRS3KYSB1RCSRK73J1V5BF, amount: u12500000000, memo: none} {to: 'SP2Z1GBP0RD8NZ2596V37KM80CJCQ80SH1YTERERY, amount: u12500000000, memo: none} {to: 'SP14ZPY4HG8YTS648XHNN8G7EQXX56C6D2SK8NGKM, amount: u12500000000, memo: none} {to: 'SP297DGZEWRRCZPS26XCM6V7M7YRN2NP8BT6JM4M0, amount: u12500000000, memo: none} {to: 'SP31V8TJ64D3SWXNPV6QDMMXDAG1YRVVTTTBHJSZ2, amount: u12500000000, memo: none} {to: 'SPNF6V2Z7SZ6NXSPQK3R5SSR3BKCBWQ6E029VZG5, amount: u12500000000, memo: none} {to: 'SP2MS7TNWWGTSHFP24CPFX8G3BWTD66M3T88N2TPF, amount: u12500000000, memo: none} {to: 'SP2X1KDQ32KNW9MN0V5KZXD4KYTW0HKWTJV36XS2G, amount: u12500000000, memo: none} {to: 'SP1WMYWS4Z1SE8JP7T1XWFBWDF7RCVT5YKEPV9C0J, amount: u12500000000, memo: none} {to: 'SP20ED669KT0BYH69HPDKP7TWHQ34KXA00DGB2S1E, amount: u12500000000, memo: none} {to: 'SP277VXTHQ3E283BGBPFC148T2TH5ZRXA9HR1TJ30, amount: u12500000000, memo: none} {to: 'SP1QVQHBQ94TDR69TB407DQYFZWZW9NX59A09TXHH, amount: u12500000000, memo: none} {to: 'SP1386044X5N01AJAGN50NGKE87K4Q72P7DHVXF3F, amount: u12500000000, memo: none} {to: 'SP3YD36DG6F2JM2TXZR8GVAGTFX4Z0ZVA73QB1J8E, amount: u12500000000, memo: none} {to: 'SP2KEZ7NVHK63VAP4M5V2V3T46ME67XXRG5XXTP77, amount: u12500000000, memo: none} {to: 'SP1WZXCCC35P4B95QJFN4BN6Y7MA9XR58W77BRQ29, amount: u12500000000, memo: none} {to: 'SP2JF2SWRRYAQKZ9A130RW02EWHEH78YNTWBACXD4, amount: u12500000000, memo: none} {to: 'SP2BPZHCBK2YD3T76QCJ0V9RWPJ0HE2WJYMBE31EF, amount: u12500000000, memo: none} {to: 'SP1QZPX9AV99W0GQA9BN3H2KJSD562V03GSV7S2P8, amount: u12500000000, memo: none} {to: 'SPAP55A8B5XDA508X3CY396THVR7ATSCPC9TAH0Z, amount: u12500000000, memo: none} {to: 'SPYWVB7F5QB4GTKBESVJJSEQMZ2WJM1CXJR05B6J, amount: u12500000000, memo: none} {to: 'SP3Y2WWB569PE5KZDZRS702WQRJ94HEBK72BSF6QR, amount: u12500000000, memo: none} {to: 'SP2M7K3YM8813404G1R7AXV106CPWH0Z5ZA80JVAV, amount: u12500000000, memo: none} {to: 'SP3PMEXHXAR3YA2Z0TYK91RBPRDJGH6T7R96KK4DA, amount: u12500000000, memo: none} {to: 'SP2YK52FM3P75MMJ7BF665Y1N1MNJPZ0JSPX291E5, amount: u12500000000, memo: none} {to: 'SP2C1QGPCE4SDWCVVKZW196DZSV04CE5J5944VK18, amount: u12500000000, memo: none} {to: 'SP2KW7JS1S4F4FQD869JCCKS2QC8NZJWBPFFMW6R4, amount: u12500000000, memo: none} {to: 'SP99B9SNEY20XZ5PDCR30VC520QPWCEAAVHHEC2W, amount: u12500000000, memo: none} {to: 'SP38JGANYK8HVK3S62PNYDP25CR66NDKGRMQ38BQH, amount: u12500000000, memo: none} {to: 'SP30T2HN8MBDQA6Z9837EF9WQ8TD6TG075H09S9J, amount: u12500000000, memo: none} {to: 'SP3Z0KSKF9D9HX9ZJFPKPDJTHV025MEMYHZX89D3V, amount: u12500000000, memo: none} {to: 'SPNTPY0PH313D1EEJTR1VQRBRMR4DJHXBVV5M1YS, amount: u12500000000, memo: none} {to: 'SP19X1QMRZ49WN6B53GCEFW61C1VQA5TYH14PJ3C6, amount: u12500000000, memo: none} {to: 'SP36EBATCRANQ4E7T21V8JNK581Y6NZ41S0DMFSZH, amount: u12500000000, memo: none} {to: 'SP1CHSCCKTEJSNB6Y9V0TGT9DW3D4DWKDR8PY4H1F, amount: u12500000000, memo: none} {to: 'SP16S6ERS7A02GPK9RP6ZXH7E4SWJ4QJYWHC7JB89, amount: u12500000000, memo: none} {to: 'SP3ZTW0J4FZHDVVH8RV3FCYW535FRQN495GV904EQ, amount: u12500000000, memo: none} {to: 'SP38Q18Y8TYM2A1JYSC8G1WQ7ZZEA663W17BCYPWM, amount: u12500000000, memo: none} {to: 'SP1BH2Z0383B7P3XX4JT57XYT53X04XDQAJERHKBX, amount: u12500000000, memo: none} {to: 'SP1QYKBDGVD4D8G3VDQ0F4XC5YQS7QGKTSQJNDVEW, amount: u12500000000, memo: none} {to: 'SP1ZY2ZXY9QR5CNEGDPNZHC88T781ARC9VT6S7HS3, amount: u12500000000, memo: none} {to: 'SP11F09DT5HFYN7Z5HG15QXW0CMD40T2XJYY0G5AB, amount: u12500000000, memo: none} {to: 'SP1YV42S1JTNZK1ZZ9JDW4KFQX3QERHRNBW9PPAE4, amount: u12500000000, memo: none} {to: 'SP36V8CEAZ7RWC31VFFQWJ1Y6H802GXRJ0YCC24XY, amount: u12500000000, memo: none} {to: 'SPPRT2ADFK46YGEST4D243ZS2F8YV4Z19XNMQP5X, amount: u12500000000, memo: none} {to: 'SP378KNG10J0BBEE8Q07ZNZ0RTFK3H2K6RRVBEBPG, amount: u12500000000, memo: none} {to: 'SP150WAXJ4RWQ1KN34C0EQ08AJSQTYZF7KAS0WCM2, amount: u12500000000, memo: none} {to: 'SP29X26NFGW78W6DZ05XR0VPFA8HSZ87YX4FMNPWG, amount: u12500000000, memo: none} {to: 'SP33QFM4MV7H3821T6REDCB5DN485JKVXNT3ET62F, amount: u12500000000, memo: none} {to: 'SP1XKTDK7PYQDG2RJ3X3XDW7JEFKYBVWNKH4M9DG2, amount: u12500000000, memo: none} {to: 'SP36N76Z6613HXY1AMRPWTZ7PVMBD54R7F3A2M0FS, amount: u12500000000, memo: none} {to: 'SP16FYQANYC25XRVM3HP2323YAAV5HKRE5X7W2HF9, amount: u12500000000, memo: none} {to: 'SPG2BNVMHJHXEV9TMV01B51KGH4X63HKM6RYP4WH, amount: u12500000000, memo: none} {to: 'SP3C7Y6C7CQT0K6BKJCYBGJ301BP8G43SKE8616J6, amount: u12500000000, memo: none} {to: 'SP2HB09J0H03H428EV2CTVFRBMACPTKY29G7WHMD9, amount: u12500000000, memo: none} {to: 'SP15NQJMSVCASV1XG3N6W3DY874HQXMHSWDGTY62F, amount: u12500000000, memo: none} {to: 'SPQRH49JM9YA39R21KHN49M5S947ETH2QFAW3F02, amount: u12500000000, memo: none} {to: 'SP3YBV24R4702ZEV9288NN2DW1DB5C4HNAZWR2TKN, amount: u12500000000, memo: none} {to: 'SP1JC4S54YG0FQ71FJ8BC1BM8JWR3968ZHVKRVXBK, amount: u12500000000, memo: none} {to: 'SP2CQTA4FDFGZ1570DSEAMGHXNPKVM9JQ8J1KSJ9P, amount: u12500000000, memo: none} {to: 'SP4AXG2PV951KPTTDWCA7W7853G8WP8AQRBCPQQP, amount: u12500000000, memo: none} {to: 'SP2H5T8NWPEFY1GG7NSHBYF7Q8JM80SGC7T7T2TX2, amount: u12500000000, memo: none} {to: 'SP39TQ0M9X1V88H5Z2D4W2WYSWAK1667VPPSJSY09, amount: u12500000000, memo: none} {to: 'SP4RS50PSTEWD4MEZD5N3ZD3M473F4WHKRWARC5H, amount: u12500000000, memo: none} {to: 'SP3T6RR4YRVKKRZVESV2WY9JWH9WWVZ9PY8GPS83M, amount: u12500000000, memo: none} {to: 'SP3WVE6KSWR0TDFXP82SACJSFPMG57GMXVJ9ZS8GX, amount: u12500000000, memo: none} {to: 'SP2RBMAXDG42ZETKCG5Z5T13EB4H6WX11MB6VFG95, amount: u12500000000, memo: none} {to: 'SP96GPNDCFC6Q4E4FX336KS1NVARWSWGZNN52FG1, amount: u12500000000, memo: none} {to: 'SP26M2WRP0F96AS5BPVVXGVHSC1A4648Q2BFM2TJW, amount: u12500000000, memo: none} {to: 'SP2ND1R3REA4D7ATN0ZFCDX79AMQZV7NMC9D0Q7XQ, amount: u12500000000, memo: none} {to: 'SP1PDQC5KFEAQSX7BQ2TE59JZQM7N5WCFRK6ZMZFP, amount: u12500000000, memo: none} {to: 'SP1BNRS2PKZQFXNC20T71QGVWBB3GTGVHF7HRJ1FX, amount: u12500000000, memo: none} {to: 'SP6H57TBE7XG6QVVQ81HQK9C2BH0DPFNEVKVPVND, amount: u12500000000, memo: none} {to: 'SP22JQRHFN2DFE15ANN47P6FM40SF8B3K2JJTC6JZ, amount: u12500000000, memo: none} {to: 'SP4ET2B66EGAEQNK6FYTK9G0J88AR0CA2B9D0VSP, amount: u12500000000, memo: none} {to: 'SPPCYHPK5ZAGDF78NWACJZ29TPYWKC49KZ494TBB, amount: u12500000000, memo: none} {to: 'SPBYMHECQ712VYWQMPG8T185V701VG1NEAYC3TK9, amount: u12500000000, memo: none} {to: 'SP1PKK6KJPM826D0X6AMCJ63KEH2M456M4T22WAPQ, amount: u12500000000, memo: none} {to: 'SP3E3TESJAWK52ZS0NZWRPZEEE3E1GNHB6JAGR167, amount: u12500000000, memo: none} {to: 'SP1HWC9R4PD6RR2N399FZS79K3GXNAHT8FRN3NA7J, amount: u12500000000, memo: none} {to: 'SP2QEXJTPMKT7A1W5P0Z7N7XEBZ2XKTHH85V8XMFX, amount: u12500000000, memo: none} {to: 'SP1R63EE1K6F6FPP2EQHB4J51RMN7Z5FFSW5EB3P1, amount: u12500000000, memo: none} {to: 'SP25SZVYJQAPDZM5Z5P47K1GSWEZ90AXFJ2KMZJZG, amount: u12500000000, memo: none} {to: 'SP1PA9M9303Q6J6MKJPWNR2PRHNWHVTQ3BZE5ERQP, amount: u12500000000, memo: none} {to: 'SP313MRFF9AK07W9P1WETX32ZTH3V9MQ6VVM8BF62, amount: u12500000000, memo: none} {to: 'SP317NXKERZERMQQ7ZC8ZWHJ6C9M33GQP3GK2QSQX, amount: u12500000000, memo: none} {to: 'SP3N1A9DQ5GATH4Z81HBZ13GYM6J3HHEP7N90XMZG, amount: u12500000000, memo: none} {to: 'SP1MES8GV834HB09CWG6B38YCRZX7EPE26Q8P9Z79, amount: u12500000000, memo: none} {to: 'SP1PKK6KJPM826D0X6AMCJ63KEH2M456M4T22WAPQ, amount: u12500000000, memo: none} {to: 'SP2BAPW5YCZMYZ37X6BQY4YXSG6AY3PYMB1PSBK4F, amount: u12500000000, memo: none} {to: 'SP25SZVYJQAPDZM5Z5P47K1GSWEZ90AXFJ2KMZJZG, amount: u12500000000, memo: none} {to: 'SP39TQ0M9X1V88H5Z2D4W2WYSWAK1667VPPSJSY09, amount: u12500000000, memo: none} {to: 'SP3B720SJ18XT3DYEJX4V68BQYQ454CK41HXKGH2Q, amount: u12500000000, memo: none} {to: 'SP29GKPK9TPFQTPH7KKCTTTH6S8PWK1JGF393FDWK, amount: u12500000000, memo: none} {to: 'SP19EKY4ZZ93M32DQT1YZWYKBYXDQJQY59B4AMP9C, amount: u12500000000, memo: none} {to: 'SP3QKAQS3J0YS3ZAZPSZM5ZSZZRYRYV72N6A9ZPZT, amount: u12500000000, memo: none} {to: 'SP1MEWJPW7H2VCGV9P1H7SC2N2ZQ1GNHSQW24PXKW, amount: u12500000000, memo: none} {to: 'SP2KAM4A6W2F7NNSA8W21WABP0QW5WANZ4QK67RNR, amount: u12500000000, memo: none} {to: 'SP1EB43XFBA21W45BHAV977Y6A3PZVENBSCR8QPDG, amount: u12500000000, memo: none} {to: 'SPJTFCPJX0KKVQTAJSB85TVMYGFNSA488D7XY8ZF, amount: u12500000000, memo: none} {to: 'SP2XNHZTGFWJ73W2NW6PJ2MJ53WY7X5Y7QE9PB4Z, amount: u12500000000, memo: none} {to: 'SP2WHSFV0K0Q38XP1JJNAEBP2K02VREBJ7EFYNMCT, amount: u12500000000, memo: none} {to: 'SPH7YCZ512SVCNWWR9C0H6K6JJKG6XSZ6J5YHS6S, amount: u12500000000, memo: none} {to: 'SP3G5AH22FQC5TX8N7GYMZRBVXZ4198402ZWE6FG8, amount: u12500000000, memo: none} {to: 'SP1FA9SHWCYDVPKEVSTY7CX21CWCJ7S8FS4K3YQMZ, amount: u12500000000, memo: none} {to: 'SP1RB1V65A1PAAXYT8PVFFFC6T1FN9E8RQX7HMDKC, amount: u12500000000, memo: none} {to: 'SP3AA8Q1P0BC9CXGM3WVMFB0JB36BW5WVFVJY0D1D, amount: u12500000000, memo: none} {to: 'SP29D5V6H8A51R36GWAS2SD20906647DKQHM8FHJC, amount: u12500000000, memo: none} {to: 'SPBFGRR3FVZZEZ9XZYVJ7AA0MDX81P2SV4HVYJMS, amount: u12500000000, memo: none} {to: 'SPF8MJ3GJHT6GTJ9JMZWTVJQ0AKNNHXJZ7AXTVT6, amount: u12500000000, memo: none} {to: 'SP2ZKT3C5R76512ACSA1C0R1HJ21ASG8ZESPCT3ZC, amount: u12500000000, memo: none} {to: 'SPJ9FHJ3HR6GQKVSJCZMVYZWK52W3MDWSK71YJAD, amount: u12500000000, memo: none} {to: 'SP326H2T31PKEBR5VDPDG0FCHCGCBKFCN61Y5V8Z0, amount: u12500000000, memo: none} {to: 'SP7SHEREY1MWFRGB2WB3QQMBP4HJ9AJ8Q9ZB1YJM, amount: u12500000000, memo: none} {to: 'SP15D2ZFYSV1T4YYPY3NYN75JCRZQWWA4MN22TDR9, amount: u12500000000, memo: none} {to: 'SP2MC6PBPNPSEHA6G87DDMN6WX3HGMTANXZBYKCNF, amount: u12500000000, memo: none} {to: 'SP16VAAGEE7XE3DFZZSFDW7T5SCJR1N0WY3CVQ00B, amount: u12500000000, memo: none} {to: 'SP82JBHR7F1CVKZQC52Q1FYG9KA83VV9W1N1RWGE, amount: u12500000000, memo: none} {to: 'SP2E4JE5BXQ6XVG86D2BBKSK3N9W49TEMY12CAATF, amount: u12500000000, memo: none} {to: 'SP15FTEZ0G7XGPQ0MPH2C0AE90BAEZKX793PS2NFK, amount: u12500000000, memo: none} {to: 'SP7K1NBHYXQ2DTYE9F5SZQ5JRE8NAPV0W7EYEZGH, amount: u12500000000, memo: none} {to: 'SPHNEPXY2N25RTB6BMJGJXAH0XSHV55GZB2FC69D, amount: u12500000000, memo: none} {to: 'SPJ7TZ501KZYV8RWHM8R6EWQ54404RNJYBD5KRE5, amount: u12500000000, memo: none} {to: 'SP1ZT0FNMR7CS7BYQYY7S7P3AEB7NK09HDEMT2J1H, amount: u12500000000, memo: none} {to: 'SP179861AW0QS9FGYNHMDKCH5HSDYHVYYHE445BPC, amount: u12500000000, memo: none} {to: 'SP2Y4BKW6JABFQ7XBA82JGGY4Z1HWRBQPHQ59TTE3, amount: u12500000000, memo: none} {to: 'SP1Z0EX70835WYS4P73P9XYWJBDXZMTJY4FJWANCQ, amount: u12500000000, memo: none} {to: 'SPBE32727GDH6MQCTSBDY3CVXKTK3ER7A2GBMDP3, amount: u12500000000, memo: none} {to: 'SPJEXDXRS44QP0HWT5YKKQ27VJXZCB9GGFT59PTW, amount: u12500000000, memo: none} {to: 'SP1DQVR86M61FQV5E374YBGRFY89Z1EE6JD49VDAC, amount: u12500000000, memo: none} {to: 'SP1BA03ZEJXMJSB8ACT79KEPTC5ZJSEF3F5SN6W6E, amount: u12500000000, memo: none} {to: 'SP3HTS2MYBAKRQ6KQ62JVWMF8H6A27THY6E3NRB1F, amount: u12500000000, memo: none} {to: 'SP3ES75PG3TGRYFKYK0V3JJ8A6XBB62K4C5NW3HN7, amount: u12500000000, memo: none} {to: 'SP2Z5K29X2TD3JCDK07PY1FKN0SPCCBDTPEQNXFJM, amount: u12500000000, memo: none} {to: 'SP3V7QRMWVXDZJNGCTMZRTJ041B5VJYHV4FC857FE, amount: u12500000000, memo: none} {to: 'SP1ZZPWV2H32M5D902TW7MNAPXKX2RBQ6NZDX9TYC, amount: u12500000000, memo: none} {to: 'SP1DHRX362SD1GY43DSYEVFCTHRC4SC2VZSYZ4NV, amount: u12500000000, memo: none} {to: 'SP2CBVSXAY08R2WVFJMYAXKH8A6VSHJWYFFJ3V00G, amount: u12500000000, memo: none} {to: 'SP25MAMV1RKAVCY6HZSNX8V3VDMDPNNDEVNKSMDJ7, amount: u12500000000, memo: none} {to: 'SP366A9HWTJ334B9ZG5VVHD90JEZDWMSY33AHMZFN, amount: u12500000000, memo: none} {to: 'SP24ANEK96Y51TT99FBCG3PZKMESBQ5G4YZXK1T5K, amount: u12500000000, memo: none} {to: 'SP2ET4QB19HENSWM7VZTJQAK0PD06V274TYNX2D7H, amount: u12500000000, memo: none} {to: 'SP3463ATW83ANJX18EK6GPB9DAPVJAPPEWWCZZKNH, amount: u12500000000, memo: none} {to: 'SPTBAXKRKT7EXTZ6QRZFG1145M0BZ0TTX3HJZTFW, amount: u12500000000, memo: none} {to: 'SP1J5734PEXN6KKRJ9MGSN7RAPP46C7JHMR3FYM3W, amount: u12500000000, memo: none} {to: 'SP2X7J2XK5V4ENWTBCA1CTP0Q5Y3TJPYPRWT0TZCH, amount: u12500000000, memo: none} {to: 'SP10D6S36BBZY8GZ573QFZGDP6Y6MX4NPWZ8DZAAM, amount: u12500000000, memo: none} {to: 'SP2QY7SJBR0413ZH066WNA0MW4KGESRXGPCV9S4BS, amount: u12500000000, memo: none} {to: 'SP3ZKMF76KM5EEG1GZAVZCMCT819C757HP46HRCV6, amount: u12500000000, memo: none} {to: 'SP3VGE0G9JWGQ24H7S9MNW0QEZ2492ZF6J9GMZTAZ, amount: u12500000000, memo: none} {to: 'SP2PPBNAGADERARB92N1CDG0258467FJDPQN2WQ8B, amount: u12500000000, memo: none} {to: 'SP3F0G1QZ7SGHFFB29XA7F6WQPJ15Z8XRWMJXAE22, amount: u12500000000, memo: none} {to: 'SP3TXWAVDYPBR401CR4G3HPYEACANJBNF8MKN6E0Q, amount: u12500000000, memo: none} {to: 'SP33M3XH4PGDY58CF660ET941M6K475FXK9JW4CFN, amount: u12500000000, memo: none} {to: 'SPVV95A807JQE61KNJ0ZB7NW3DV6SWT8WZR6RASE, amount: u12500000000, memo: none} {to: 'SP1BJ92GRZMF2GRQY011E907SHXG921V7GS313S6Q, amount: u12500000000, memo: none} {to: 'SP22NSERZ4XMQ02K3E328T4GNZ54SRHWSY7XKE80R, amount: u12500000000, memo: none} {to: 'SP2G3KJD2QJD169TYWE589KDBBZPEVBPX2BZXFTHN, amount: u12500000000, memo: none} {to: 'SPMKE56AZMYGK6RH3M79T02MKDGFDJHXY0YDACYX, amount: u12500000000, memo: none} {to: 'SP22RRVNX0PEYQAWZXRWZADN8HABTWYV1NV4X3B88, amount: u12500000000, memo: none} {to: 'SP3PRQ6M2PS99704AV9H6Q02QG55PK8VTEKHHYXKH, amount: u12500000000, memo: none} {to: 'SPWXC1XQRT2NN4BM0XETNGEZ67VAWC2WSNP3CNTE, amount: u12500000000, memo: none} {to: 'SP2CYW85YW03WX0XMSFGMJ3HZQ30X8NKFA6TXVNRX, amount: u12500000000, memo: none} {to: 'SM277800GAZJKQWN3AEYB4KBPTTBASD355JPHQ9DT, amount: u12500000000, memo: none} {to: 'SP103X5H2AFB15718WPTXH86D0BW99REWTJ6PM7EQ, amount: u12500000000, memo: none} {to: 'SP2212NSS0AA83VCXR9HH1CX1BQ1HAKDQ9FHHFCPH, amount: u12500000000, memo: none} {to: 'SP3VEFZBABT3S73PBT6ZM8QBP8GAR74A7XQYAMA0, amount: u12500000000, memo: none} {to: 'SP96DY3S1EKPJW4SXBCZ31QKJSPDH9AHS2M2VP7A, amount: u12500000000, memo: none} {to: 'SP2ZYJDRMP2GJ46GK63M2R88AVWY9PXV5KEPDGN0C, amount: u12500000000, memo: none} {to: 'SPQQV2QN22NAT45PREHH73T5RHF9HZJS7MC3EWCE, amount: u12500000000, memo: none} {to: 'SP1HAQ4NW6HH98PMJP55CY0FXCT3XWZ95KY0Y731R, amount: u12500000000, memo: none} {to: 'SP28NCDY6V4T7NJBMYGTJ55NHMXMC0GG806JW1ZTB, amount: u12500000000, memo: none} {to: 'SP23HGJ5K22520FW3CXFFBTCTF2BY40WGYWGRX4DT, amount: u12500000000, memo: none} {to: 'SP3TNXCP4FACMGEH7MV7NM0XE0C3ENNDPQDEYQYZ3, amount: u12500000000, memo: none} {to: 'SP1Q9FNT1EJEGDBS98JYNCW4WCDEK8YNBCVFZQN7X, amount: u12500000000, memo: none} {to: 'SP372RK3G7A7WNYH52AEYQ63B1XPRVPNYWCGHXFX6, amount: u12500000000, memo: none} {to: 'SP3VMAHTFVN9ED5FB073MK1B8MGNCZW5VCEHFFD7C, amount: u12500000000, memo: none} {to: 'SP2NPENP9MCGV8MHNKRYMVEA6Q962XRXHPH68Z1ZK, amount: u12500000000, memo: none} {to: 'SPYC0V97SFXDXVH74RE3S1PRMT9HCNH3H4CJ6SKD, amount: u12500000000, memo: none} {to: 'SP3A7R70XCE047NAP0WEMJDKS7CS41K3J5KZ7RC66, amount: u12500000000, memo: none} {to: 'SP1SCBHVNA0R36S1WFJCEGGQE4VHA6Q14JHZSN7VR, amount: u12500000000, memo: none} {to: 'SPKWQVKT90AXSPYNJS0E6PTGW3H1RG22110AKJ3Z, amount: u12500000000, memo: none} {to: 'SP2AECGV9DQFTMX2AJ1QW9WCQGYB9DVNN0AHYWGV6, amount: u12500000000, memo: none} {to: 'SPGSD6E3DWMRX7YDHFDDY4MMM41QASSTB18879C, amount: u12500000000, memo: none} {to: 'SP3VPS936T7G8SEHNW6FY4P1XWEAMQEPWCPD82WWZ, amount: u12500000000, memo: none} {to: 'SPX6795ZXMZ3W5J8WTZSSVK3GWYJ15S21XBJK61B, amount: u12500000000, memo: none} {to: 'SP3EBNHSGK3WPYGNP3C5KNN54V6H24BJ1H8BVPQ15, amount: u12500000000, memo: none} {to: 'SPA9PWT1GNJW447DZ1XN7565S05MC7JD7JNC2A83, amount: u12500000000, memo: none} {to: 'SPX3GBMDX1J19Y08RP3B6Y4ZDNSFCT5EWB5H9A7Q, amount: u12500000000, memo: none} {to: 'SP1HB2611C6896NYYA30PEWGXDJ4F7CW1QDCPB8TF, amount: u12500000000, memo: none} {to: 'SP1VVWMVY7YCM5Y5DJKJNDYX4PVKJD6FQ2K1VJ6JB, amount: u12500000000, memo: none}))
(contract-call? 'SP8CFZ1ZQM71Y1E17G9SWFP1D0RNE1KSPKZ306ZC.wen send-many (list {to: 'SP1BS33ES5PWDG7J5HD70GEXD163Z6C55S22YXG62, amount: u12500000000, memo: none} {to: 'SP1VGKZHKH930GT2B9XZQNJ97578BGK1EAP6K3CMS, amount: u12500000000, memo: none} {to: 'SPV15EH4M30RAK8Q3H0RMSC5X2174J1N51G873W4, amount: u12500000000, memo: none} {to: 'SP1C8XPXJHCR6W7Y86Y2Q64WPH2YE171A773QHD46, amount: u12500000000, memo: none} {to: 'SP1VV2SETM2PRH1PSJGJRHQNFFECNH7S05DBMWACH, amount: u12500000000, memo: none} {to: 'SP1M875WGC20AX8041W28G1KJMGW89DQRJA5K1XPR, amount: u12500000000, memo: none} {to: 'SPSSBCHRPNEKJ2DV5YAZMPRKDHDS657Q8XYK6QYK, amount: u12500000000, memo: none} {to: 'SP1ASRP257FF220G7ZMJ8A7V0E41DVPHKKXA74142, amount: u12500000000, memo: none} {to: 'SP4Y6QWTFJHSH7J7818TRZR3Y9SCXYVGZWA2E5Z2, amount: u12500000000, memo: none} {to: 'SP1W5RKNJFFGF8Y2C7XYNJ34SWNCENWW0C0K3X301, amount: u12500000000, memo: none} {to: 'SP3D61PG92NCKPVHJ111AR6H2HK4KGV3HPD93CJES, amount: u12500000000, memo: none} {to: 'SP5W88Y324AKEPZZJB89YKCGFKZRS5H4W8XBZ1K4, amount: u12500000000, memo: none} {to: 'SPR6K4VQ0JQN677W4GGCN5JTPN7XF7YTP7WKAJXH, amount: u12500000000, memo: none} {to: 'SP33CVZ36FMWB5MG4YB9SB56NG8GRC5BWK8PH6Q5B, amount: u12500000000, memo: none} {to: 'SP3ZB38Y6Y02ET1TBSXGV98DWZ4MVY66PPPP6EP9E, amount: u12500000000, memo: none} {to: 'SP1XM1VK1P5Z7TSJ4SM5JX6796Q4P4AJ8QSA90M5R, amount: u12500000000, memo: none} {to: 'SP1WH4NSZCE7Y5FENZC7E2BH7TDCSKKR0KCPZNQJ4, amount: u12500000000, memo: none} {to: 'SP2AF5Q591EPVDVSB9MYGGHBZZSGNSZCFNKQ3BJ75, amount: u12500000000, memo: none} {to: 'SPEJPGA20F341F0QT8M8AFA37F80KFRZXPDZ76ZN, amount: u12500000000, memo: none} {to: 'SP2V4FR0V4AQAWJ8K42K2MYWBEBHABQEAG4AHSJNR, amount: u12500000000, memo: none} {to: 'SP3CZCF7H1AFSX1AZX2R0BHPEAMP8QX9NHC8KRNR6, amount: u12500000000, memo: none} {to: 'SP35ZPRFSCA52PW0P9N52D2AWP9QWTFH8RFM23G44, amount: u12500000000, memo: none} {to: 'SPKK28E18CZR4GS9T52FSNXDP2KRF49YS733CSRV, amount: u12500000000, memo: none} {to: 'SP2YCSRQ0X3N0MRNJD0NBNB70RAKSATGKBYSVT502, amount: u12500000000, memo: none} {to: 'SP3BK84YKXCHSSXV1PGJVEKJMH9XW6JSXF1PKVYRQ, amount: u12500000000, memo: none} {to: 'SP30CBSDMXV0KB141PFQQG4ZHEAQH8TTXS4VVK767, amount: u12500000000, memo: none} {to: 'SP1NWJBKVDA8QS0CP2DZ1DVX6EQX3Z6F2BTC912AK, amount: u12500000000, memo: none} {to: 'SP2TQQCMTRC9RWQC9YZSYXNKK1FMAEMB2B7KJ2J39, amount: u12500000000, memo: none} {to: 'SP2KVK3PF8Y02AN0XTXJ3745TKX95ZWXESWT5QJ77, amount: u12500000000, memo: none} {to: 'SP24A7BW1E0XBMHSWH74XEQT7G5QPTBS9EDXNN52X, amount: u12500000000, memo: none} {to: 'SP3J653NYKC6H5WJ4HZHDMG1DVA1NRHS2QXTJ5EJ9, amount: u12500000000, memo: none} {to: 'SP2ATW7HFCHJ63X9YNX4KTTKCN3B55X1H9DRBQ75D, amount: u12500000000, memo: none} {to: 'SP3HK5PWWTVYMW047GEPHWRB946EB514AT09KJERS, amount: u12500000000, memo: none} {to: 'SP2SWJNBEEGGZREWE57N8DGMKBWM97DWWGER88N8X, amount: u12500000000, memo: none} {to: 'SP3MAPJHY1B2QVZWZTJTHY9MZNB76VZ1K7G1CZ5JS, amount: u12500000000, memo: none} {to: 'SPS1XG4VH0JQJSTDVT7B8DW6GCMHDY5PSM6HVDEY, amount: u12500000000, memo: none} {to: 'SP6FJ9B6QG2AECJZ1K1FZ3ZZ43G2J5NEY46XVC1S, amount: u12500000000, memo: none} {to: 'SPZ1Y088H852HG9483GJFNH0AW5T47ZAS84C5RVE, amount: u12500000000, memo: none} {to: 'SP196CMNNFA89TY7S1GMSPNEWK00ZWGF7FJ0780A1, amount: u12500000000, memo: none} {to: 'SP3QT4VEJJ6YT79DZK6WWV72THYZD6JXGJDDA9FNJ, amount: u12500000000, memo: none} {to: 'SP346VCSDHQXJRCSWF1HA7NQ1FPBTJ4GZJGNE1CED, amount: u12500000000, memo: none} {to: 'SP2T5JH78ND1M4TA8N4KQPHWFGGPPQA5SG4PWHVS6, amount: u12500000000, memo: none} {to: 'SPHVZG0WZ5W6CC0T7CB51G8FGRCJEVJ0E2KN2RX8, amount: u12500000000, memo: none} {to: 'SP4FHQ36T1GPFDDBPTTQBR3A3QK0WAA1G6111P55, amount: u12500000000, memo: none} {to: 'SP3B5VK6R4BC1ZX9TY4T66T4JCPAXTZ4R6H2EBBS2, amount: u12500000000, memo: none} {to: 'SP1EA3A4127W1PDV08GVFNSCSMPZ30RWYKR3AXZ7J, amount: u12500000000, memo: none} {to: 'SP1P5G32ZAYG3RJEFT9HNNFQG7F130892JT05TZR0, amount: u12500000000, memo: none} {to: 'SP34WV0JQS0AYWSRK5W31VXTC5169QJNVNBBB4X2P, amount: u12500000000, memo: none} {to: 'SP2XPZZQTER4936FS9ZE5JF4J4DFZD2XHADWE0FWN, amount: u12500000000, memo: none} {to: 'SPF0V8KWBS70F0WDKTMY65B3G591NN52PTHHN51D, amount: u12500000000, memo: none} {to: 'SP34F2WP5XKDMKKJGQA7REM17CM3YKQYHEJD5J7WN, amount: u12500000000, memo: none} {to: 'SP1M3A17B2PWK34XAEK987B450SNGZ92VC5TW6Y92, amount: u12500000000, memo: none} {to: 'SP35DEX98Q7AGQBWN7RF7PHCN3VYN4PZ5GTB29RZT, amount: u12500000000, memo: none} {to: 'SP2A784BDM6EZ3W34CM79E7CSC6PRST8QE4SKG2ZZ, amount: u12500000000, memo: none} {to: 'SP3V8DSTESZ0Q0BN5635XGEER2AJZ3SKE932ZWG4D, amount: u12500000000, memo: none} {to: 'SP2XZJ9JP80MRN9HBBA2MA8CHA9HS8QEBT9SCTDV6, amount: u12500000000, memo: none} {to: 'SP1HRS5JCC39XEW80XG5XQYSA1RRP4F0B0WPBBRCJ, amount: u12500000000, memo: none} {to: 'SP3KM8VBRTCPR8HY97AKSG3EWCH1NYCP1SHZ5T854, amount: u12500000000, memo: none} {to: 'SPSN6K776CXQBFSVM74W4SAR8W7HCQD6844FA4XC, amount: u12500000000, memo: none} {to: 'SP1P0836QMC78VBFW9YDDR8V56CWBDAXS7K1XF5CX, amount: u12500000000, memo: none} {to: 'SP10042DAKCG4FV61VP9Q9C8K9BD12MR5HXC3CCTJ, amount: u12500000000, memo: none} {to: 'SP1W7BT5HM7SSB4C86NYS80D2FQAEJ3883WT0P84K, amount: u12500000000, memo: none} {to: 'SP32AM867EGF5NWN53HSDES6F292D4GRWGXHTFNGB, amount: u12500000000, memo: none} {to: 'SP1W41YWWPEZT66Z59X82A320NNX723D4B14RTY3G, amount: u12500000000, memo: none} {to: 'SP1190NPTE6XGMZ4FC1KP81ATK8XQTXHMFM4V07FZ, amount: u12500000000, memo: none} {to: 'SP3Y3A6APVP7GV64HMY6FYEG1NW84ENWNR2D251JG, amount: u12500000000, memo: none} {to: 'SP1NEAEVY2E1MF1MDKB0K2RZ7K9W1NWCGST83PKAA, amount: u12500000000, memo: none} {to: 'SP1XR74AM893SBRFZ4R2DTPDTX862387FQZ9KW9PC, amount: u12500000000, memo: none} {to: 'SP1WZTTW42PCKJ8CNA1RNDPDDRFVXZ5DTGMTSGC9K, amount: u12500000000, memo: none} {to: 'SPF9Y6YXKHXJMF5N8BW6GD5M7TJNGTGY4CXF2CDX, amount: u12500000000, memo: none} {to: 'SP1RFN0SAJAPCPGY37YHHDZB8YH1RH8DP4ZVHMFR6, amount: u12500000000, memo: none} {to: 'SP3VY9AVD2WW8GNWTJT58J77MZPR5XTF8459Z7GVE, amount: u12500000000, memo: none} {to: 'SP2Z4NG9BJN2XT83QNJHVMDGYSE01FT7KFC5CGVGS, amount: u12500000000, memo: none} {to: 'SP3V47ZVPRWP8EB3276VBJX2EMEXN1BH9QW4VS148, amount: u12500000000, memo: none} {to: 'SP1VKEVK39KZTA7T95XTYX3ACXBSDBDQC3HECH4QA, amount: u12500000000, memo: none} {to: 'SP9Q235SJGBQTWNHZASNQZV092B7QYJFR9R12R5G, amount: u12500000000, memo: none} {to: 'SP1VWC2HD9ZR6B6DP5NJYWDGGW5DG2WR1V4NXFMEE, amount: u12500000000, memo: none} {to: 'SP3EA2G6NRABCGGEHR3G7GF8DB48G2WWPY5BSVPEJ, amount: u12500000000, memo: none} {to: 'SP30XJMGFT27H2X6E6NNQ26HN8TAGBC2WPSW4BT4J, amount: u12500000000, memo: none} {to: 'SPPTKVGP1HG5ZN33HJAH7T35T7A4SWZGESQPA4VP, amount: u12500000000, memo: none} {to: 'SP2SBT6D37033NTT0X5347YZYZ45MQTPFZR3G45V0, amount: u12500000000, memo: none} {to: 'SP3MPZCA11ZZKWD7DYTN0NAJAY73H4AXRKBFVGB1C, amount: u12500000000, memo: none} {to: 'SP1YVCXRHFWGR78EC14TFH1M0PK1V5MFDQFVA7STK, amount: u12500000000, memo: none} {to: 'SP1311761KH21MH5C44S3TM37697X79QP30AMZBVF, amount: u12500000000, memo: none} {to: 'SP2ZKRTDQRXRH8Y41KCKDGRKEGDXDRAH9X5EVNAN1, amount: u12500000000, memo: none} {to: 'SP2WMT25X0XGMARDJF00VSY8BZ3Y1TD81XJYPR974, amount: u12500000000, memo: none} {to: 'SPP5KZXDTQKQ9E3QEDYCF4H7A1WSXSBCPZ9J4WRH, amount: u12500000000, memo: none} {to: 'SPSQ4W56BY5XKZR8YJMXYP1CKJ64TT4CQ04GFQT8, amount: u12500000000, memo: none} {to: 'SP1EVD9TSSG5VD1H3PYPTWQ3SPPCCZT1KZV3BY5TB, amount: u12500000000, memo: none} {to: 'SP21E7JRF50Y7EBFBDKW95E4NEVZTAGSPMT6CTA93, amount: u12500000000, memo: none} {to: 'SP138Q08PC1FDH032BZHNPFEBDT8MVB3E6CMVYNP3, amount: u12500000000, memo: none} {to: 'SP3ZGH32VKMJCJ2KJTY46E8FCKA4MFYDXCQ8PFX2P, amount: u12500000000, memo: none} {to: 'SP1CQX35RB65R2FH6450VGMA9D6G1NEXT1RXQ3K5Q, amount: u12500000000, memo: none} {to: 'SP33C1JRK3R2BS7K8B09GJNH2AKZRT055ZPC5SXK9, amount: u12500000000, memo: none} {to: 'SP10MXAVB1ZZCHZKW2496ZQAEGTWAP4HDVDPGYQAH, amount: u12500000000, memo: none} {to: 'SP2N1F7TZFNTCP406BPHHNWK1CBWZDCY11SZWVF2Z, amount: u12500000000, memo: none} {to: 'SP3NA3D7DGW80JDYJX3KN0V8HA3Z8D9NNY5F5VEDB, amount: u12500000000, memo: none} {to: 'SP21RQ7QNCS2N7Z60KR006GPBPHR48EGAM9HTKCJN, amount: u12500000000, memo: none} {to: 'SP3SQGT0D1TQY2BWJDB2Q4MRQDTNG120CQBBVEX9Y, amount: u12500000000, memo: none} {to: 'SP1983ND6D0FW963N5H4BZA4N82JKR6PM3SNMTZ1H, amount: u12500000000, memo: none} {to: 'SPWHYV7VJ4KBZSGR14PDYM2ABQAEEWRR4HD8SHGV, amount: u12500000000, memo: none} {to: 'SP3HZSR2Q1257BQBAEWZRTN8FAAPSNBHP8X7ZSKJX, amount: u12500000000, memo: none} {to: 'SP377JJ50B6CEY608G8EHHPDS7CFNQ01JTW65KG6T, amount: u12500000000, memo: none} {to: 'SPGY9E5CZTY5TBAEZR02EPAZ2P0M0KAWQH670NMY, amount: u12500000000, memo: none} {to: 'SPMQH01AH5YEBGHD1RH3NC8G0PTDG4FMSYMR6FKV, amount: u12500000000, memo: none} {to: 'SP3B9AZB9A0Y7YFX9F2Q6BF5NXBCKKND0YST1CGNZ, amount: u12500000000, memo: none} {to: 'SP1BACYG9JAZSDRZYH6726QMQZAAQHW3JXWZKRS0A, amount: u12500000000, memo: none} {to: 'SP3RPKCYN57DMKKKZWPB91VQ79GS1FEYB0G5NCCSK, amount: u12500000000, memo: none} {to: 'SP1QHHEJFEBR2ET5XBQWQF9XXCA8BT1PFR1Q4H9GW, amount: u12500000000, memo: none} {to: 'SP31HHZ9RPWCBQFW96HHF7YQ5GH338D57QFD1MDA, amount: u12500000000, memo: none} {to: 'SP2PS2EHM127MCQZYK1YD98GB0BW5NT31SXN2P403, amount: u12500000000, memo: none} {to: 'SP38VZRVGQPRN6PWGXJPA713RMC0VBXFBABF6Q5ZG, amount: u12500000000, memo: none} {to: 'SP3NE167KRHCYDFDYY4GMAFKSEC8SPQ60RN25YJCE, amount: u12500000000, memo: none} {to: 'SPNTP2T2H8XKNKSJDM2F0EMFNESTXJH97QMW5XR0, amount: u12500000000, memo: none} {to: 'SP2QJSMAC5N3YH3KQGXR5JAV0BM3KD8NN1XV06JQ, amount: u12500000000, memo: none} {to: 'SPP3RW4W8J5FPRDGKN6RKGAFXQZNA0JXYMMWV0YK, amount: u12500000000, memo: none} {to: 'SPD74AAS8X674M2YZFFTKHYVE9NC1TJAD76HJ1YG, amount: u12500000000, memo: none} {to: 'SPEZ2Z9RBEQRW405N40V603V3NKY6RK6X6A9WJ5P, amount: u12500000000, memo: none} {to: 'SPSER0Z6CXAKJKXNMDK9SDVEW0A0GX247FY99J5F, amount: u12500000000, memo: none} {to: 'SP28YHBJHZ3N3QWSXG5EJ3BRV1S1JR88B7PRGH4GG, amount: u12500000000, memo: none} {to: 'SPGNRR2GG22EKH62N8DCW58YB4D1PVK8TP0KQTHD, amount: u12500000000, memo: none} {to: 'SP2FSAMBZRHN4NF06AMQMHBFNPJK8C1YT6YFYB97Z, amount: u12500000000, memo: none} {to: 'SP3HJD5BSVCYPH0RE3ZCHMZZXYQEHXWEE11F92SNR, amount: u12500000000, memo: none} {to: 'SP1FH9NS9Y5XKG3KV75770EC3JYPRPAQ4SV7RS7AS, amount: u12500000000, memo: none} {to: 'SP23CH0F6KRKFQYFS69FVYZQEFWY8SEKR4JYTFQNN, amount: u12500000000, memo: none} {to: 'SP18J2GE97M39B26FWKKJCQ78FE4Y2E2B2X4HNBTW, amount: u12500000000, memo: none} {to: 'SP1RW61FA0HRRMS1RCJV3VFA6NFS8AAT7AMH2KEQN, amount: u12500000000, memo: none} {to: 'SP2ZZP6ZNXZ7GNK6G6N9Z9PNW1VJH3PZXBZP7RF3H, amount: u12500000000, memo: none} {to: 'SP1C714XS2J1ENZ7RSWK22YD02T1HZK7AV920GSN1, amount: u12500000000, memo: none} {to: 'SP1WYN2DRQP6Q1EC4R3GP8PDDERWD7S9TZ1EM5MTK, amount: u12500000000, memo: none} {to: 'SPPTGPWRZ1BWZ9J94DKBRQQHK6ABD5H5JW3X1CYN, amount: u12500000000, memo: none} {to: 'SPX8YE9YX10YXX7BZE5AAD5B80GGBVA1FFQW86KX, amount: u12500000000, memo: none} {to: 'SP15P56F24FAY09RVRM98J0NDCW2P3JTDWWK8RQ1J, amount: u12500000000, memo: none} {to: 'SP1DFS6N6F0E70NXWS35H3HE9BQXPVZ91ZZGJ39YA, amount: u12500000000, memo: none} {to: 'SP1JT44RAW632C35SNVVN3J11G42T6E5P239ZC9DQ, amount: u12500000000, memo: none} {to: 'SP2CZ9HX6A854XJ2W8BE7V52EYCB5VRRQ8KXC6YVW, amount: u12500000000, memo: none} {to: 'SP2YWBH131VSX9CCKBTMD9VNPS3M8S7YQW6CJP754, amount: u12500000000, memo: none} {to: 'SP2KYMS336TPM834KENM17SMHHPXK89DMZ727SJE2, amount: u12500000000, memo: none} {to: 'SPJJHGPQGTV4GHN7EGAFK2XWV7GGD99TQN99Y3TH, amount: u12500000000, memo: none} {to: 'SP2R94VHGCDS773MGQZMGQ4V2RVDGMK12WM7482KD, amount: u12500000000, memo: none} {to: 'SP3W8BDPV9M5DYMECD9PK4EV01KSQF5GV0RGWKTRG, amount: u12500000000, memo: none} {to: 'SP3B93RAWESWW8M5ZP8P71SXNMJEG6T4DZG1HQ1BK, amount: u12500000000, memo: none} {to: 'SPR49MY8PTF7Q41KG6H30V35Y97S2NSFNK5G39NA, amount: u12500000000, memo: none} {to: 'SPABN0BVGZM3M2YZB96ZMVCE7MDCXS82M7VXB99Z, amount: u12500000000, memo: none} {to: 'SP2RMA2DRR0TV88VQ4E58C2GHPS21DH0VR57J07MW, amount: u12500000000, memo: none} {to: 'SP17B8SXJ32XQE58QTRSDS6YQXD9TN8R2PSBMB3FS, amount: u12500000000, memo: none} {to: 'SP3TGNC92B8NKE7KASF8G3MJBZB37PNKE3FH9WZBT, amount: u12500000000, memo: none} {to: 'SP3W915EAQCWWVRDNNV2Q8QM2PSNMC2YZ9423B18X, amount: u12500000000, memo: none} {to: 'SP2805MS371CDZGX08G6343V2KKTJXWV4W9B9BBVK, amount: u12500000000, memo: none} {to: 'SP5TK1148EQN4DRX26V84PJR0A9MJ7VS2JPGX2KK, amount: u12500000000, memo: none} {to: 'SPYDVC8V6V5PJG9PNWYJVNDN2KYB6WEBRVY6EB15, amount: u12500000000, memo: none} {to: 'SP223CSEFS71VM06337KCFMRK6G9F2SRVGXS54YTG, amount: u12500000000, memo: none} {to: 'SP3GEMNBPZ57V6H77KA1ERKJWZEQ3HBJ1EZYRJJKN, amount: u12500000000, memo: none} {to: 'SP2Y6E2N3PWZZFRQ5PPMPT2E6ZGTXAEQG2GF385A9, amount: u12500000000, memo: none} {to: 'SP3HEJ9WZAE82ZHHS43Z3DTB1QYV5AFD1S3YDEJ21, amount: u12500000000, memo: none} {to: 'SP04J03CQGXPMQQ57XR1M154SE8A9EQP2CHJWAED, amount: u12500000000, memo: none} {to: 'SP3TWKN82463N9E7XP3XB9ZQH95AMV1D7K4PBB00M, amount: u12500000000, memo: none} {to: 'SP3RNDPX6X3MNZMS3NV28AF6TXVFXDXCAJTTX78GG, amount: u12500000000, memo: none} {to: 'SP30HWTG0SYY7Y8CVQ2K9HSZHRDJ87ZNP4C54FNFT, amount: u12500000000, memo: none} {to: 'SP2CQAFN7HCV0F760PYHADRB5M7EQ4CWTJ53VHVG3, amount: u12500000000, memo: none} {to: 'SP2S3K00J75V56JHHRCWF3BN42ZJA92SAPMW4KFBR, amount: u12500000000, memo: none} {to: 'SPCRCFRZKWQJMFXEMVFEJSBD8PHSY9DE5H945TMN, amount: u12500000000, memo: none} {to: 'SP3NCNM6TWBZXV7P6AV299NB8F0FD85GQ3G0AG2BS, amount: u12500000000, memo: none} {to: 'SP3C58RQG6C79JY0W8MVTBBH71P8TRP8CVX113MK3, amount: u12500000000, memo: none} {to: 'SP2XMCX1AST1PM21CWDHW5YBSSKXG0TXAB45JCS6, amount: u12500000000, memo: none} {to: 'SP303Y7C8WVTE9TJDNC1876QFN2JVKA0TZ8Q8MHGW, amount: u12500000000, memo: none} {to: 'SP1FY6EQNMMF3RTYGJ8AWE4DSZCTJKMRNXH6BMT6F, amount: u12500000000, memo: none} {to: 'SP3AMEZ4BSZANBST5HHZJ1DPTTHZJAEQHH5QCTPAX, amount: u12500000000, memo: none} {to: 'SP1XMT07KNFQN2E0SB6FBD8X9Z423DJ4RJ9RAMQC3, amount: u12500000000, memo: none} {to: 'SP1R69TZ1YWH3D234MT38CW73Y3A8ESV88CKWQH0A, amount: u12500000000, memo: none} {to: 'SP1S8FSN7JXDJ9B2MEQDG60B3WWHYW01TVM8WRTHP, amount: u12500000000, memo: none} {to: 'SPP4CG0SS2S5BHPPP4SJ6215J0SQBEJV2E5THYHY, amount: u12500000000, memo: none} {to: 'SP1CDBQENNM68BWABB03CECKD6CS1MWJAMXFQDJXW, amount: u12500000000, memo: none} {to: 'SP3JJ3D9XM149M26VV2PMXG3RQAKDN4MX73GDJ5A1, amount: u12500000000, memo: none} {to: 'SP1RQCF0VH0DRJC41ZWJ5C8WN07ZNKMX8FHK8AA18, amount: u12500000000, memo: none} {to: 'SPRVE398N4MY14ZGAETQVH75JFEQ6SZ6Y2GMM65Y, amount: u12500000000, memo: none} {to: 'SP3VQ7DGTHMX8CQNRN07F8VM02PEW52EJNMXCC681, amount: u12500000000, memo: none} {to: 'SP2QMS7S1BEKJ8PCNC0K2K53Y7K227EY2G711TBTQ, amount: u12500000000, memo: none} {to: 'SP01WHRN0MP1PFMBQTBJ53N9P2N38XMT0653G7WH, amount: u12500000000, memo: none} {to: 'SP33G069XPAYV5Z5QJDGNY1EJAT4DK2MFW6BZ86ES, amount: u12500000000, memo: none} {to: 'SP3X352WTK1ZFR8R04WM4SXQ6PGTSH3S4C2B0CZQW, amount: u12500000000, memo: none} {to: 'SP2X0ZDCEWYMPEG0GFF08MYB9QFCSNJ397ZRVCF5S, amount: u12500000000, memo: none} {to: 'SP3841J71KW7PE3CK00YD436TT555CC9J14J6BPBS, amount: u12500000000, memo: none} {to: 'SP114GWM0E20SDCQYHTWJBH5KZ956GYTJG15ND3J8, amount: u12500000000, memo: none} {to: 'SP39DT4Z4XXZR5CTR0ZF1SX2A754B4K34832FNCDY, amount: u12500000000, memo: none} {to: 'SP34D89NFG8BJHE51ET115W0WZQ0Q3SR9WP8HSC3S, amount: u12500000000, memo: none} {to: 'SP3KYNN4PKYPS0WH2NSHNR6GFDBMGHADGPQ082EDB, amount: u12500000000, memo: none} {to: 'SP0A0XPM7H0ND867XJARBRSH5N6K6KWDY3QC3VPM, amount: u12500000000, memo: none} {to: 'SP26DZJPTPAA5XJGCD6X0VT7MF5DS8KN9H264B1W2, amount: u12500000000, memo: none} {to: 'SP183FRC20GC2QRK3PZTGESZ9K55TCR0FK1MGJ4WT, amount: u12500000000, memo: none} {to: 'SP2BWEQA5B8P0TXBP3AR00Z8QDKDPBPGSV6BP8KB7, amount: u12500000000, memo: none} {to: 'SP3PDACM0SZGF7TJYG2074XVJDSZST8TC755T2JT, amount: u12500000000, memo: none} {to: 'SP3WZFZRTXDEXXD2JVREK1F234K6ZWC9EQYCPRFKG, amount: u12500000000, memo: none} {to: 'SP13HK6JT7HP1ZNKYFAMNQQVA4Y4MMGP90ZNWGQEV, amount: u12500000000, memo: none} {to: 'SP1GJ5AQ9MR1CX02GGTRFT7YF33GY7GGZ4WC70S0E, amount: u12500000000, memo: none} {to: 'SP16W706V69YKTNF781D8GCBAMJWJYYJH29YV3H51, amount: u12500000000, memo: none} {to: 'SPMYPC7NJBMT7KPGW9NE3THSG9HVKSQ5SH5696PX, amount: u12500000000, memo: none} {to: 'SP3XZ46GYZYH2BRB1X9QZTXW94AND90374TC1C39Z, amount: u12500000000, memo: none} {to: 'SP34D7QGKBX4EYWR99KHY45EFFGH5DFGPNCPDAMNW, amount: u12500000000, memo: none} {to: 'SP1WY75E0WWY6DKCNNWJCYFW9XKED61DHGQC1CE4F, amount: u12500000000, memo: none}))
(contract-call? 'SP8CFZ1ZQM71Y1E17G9SWFP1D0RNE1KSPKZ306ZC.wen send-many (list {to: 'SPK3Y8DJTTHZMAZC021XNTV8TGTGG84CWMPV54GW, amount: u12500000000, memo: none} {to: 'SP91KPX73W94M6SCBFXC24HA0C3QAEQVBAMPBCTT, amount: u12500000000, memo: none}))
(begin
	
	(try! (send-stx 'SP1FQ3DQDR5N9HJX3XC5DNKFCG4DHH48EFJQV6QH0 u2000000))
)
