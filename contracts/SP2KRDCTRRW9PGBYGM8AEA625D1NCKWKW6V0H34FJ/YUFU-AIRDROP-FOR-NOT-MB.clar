
(define-private (send-stx (recipient principal) (amount uint))
	(begin
		(try! (stx-transfer? amount tx-sender (as-contract recipient)))
		(ok true)
	)
)
(contract-call? 'SP2KRDCTRRW9PGBYGM8AEA625D1NCKWKW6V0H34FJ.hoichiokinamitsukiyomimishim send-many (list {to: 'SP2TT71CXBRDDYP2P8XMVKRFYKRGSMBWCZ6W6FDGT, amount: u1000000000, memo: none} {to: 'SP3HR73SX8APQ0AB0HVHR53C2079E5XVKCMB1G5ZR, amount: u1000000000, memo: none} {to: 'SP31DKT9GNEGPA1CQ5NE8DVG897SVEY6EZV6PF6VM, amount: u1000000000, memo: none} {to: 'SP3RKAG981NRS72BJSVD4QRTAZX1B8N6D5DGDHBEX, amount: u1000000000, memo: none} {to: 'SP1Y56F45C8JXAF6TQ0PT9A06ARWMFH9V9DNMJNCP, amount: u1000000000, memo: none} {to: 'SP36ZZ7YKA9MK3227HH7MGBEBBX8N5H8H295VJAQN, amount: u1000000000, memo: none} {to: 'SPNQ7M03FT1KC4HSNDXY6J77YZ3S5XVSRK83VZ5Q, amount: u1000000000, memo: none} {to: 'SPDCC08CFQNYMGC7C1H3STQETKQE60JYREP32DQ6, amount: u1000000000, memo: none} {to: 'SP33ZC43F4F8CVARAQ119EK3SW99ZJF1C6SMQ2P4F, amount: u1000000000, memo: none} {to: 'SP3731FXN86HFJ5SH525315DD37AA9NV5TBZ2ZKWX, amount: u1000000000, memo: none} {to: 'SP34455SJ4NJ7MCKV7CN64JJTVDP3VZPMVT54BH57, amount: u1000000000, memo: none} {to: 'SP2YK52FM3P75MMJ7BF665Y1N1MNJPZ0JSPX291E5, amount: u1000000000, memo: none} {to: 'SP10QP19CR55D5Z39PVN6KP6WSZ12JNSRV6WYCHFM, amount: u1000000000, memo: none} {to: 'SP14ZPY4HG8YTS648XHNN8G7EQXX56C6D2SK8NGKM, amount: u1000000000, memo: none} {to: 'SPV00QHST52GD7D0SEWV3R5N04RD4Q1PMA3TE2MP, amount: u1000000000, memo: none} {to: 'SP27CPX604STV1WKB0HY1X01Y36XVCENSMZKBVC1F, amount: u1000000000, memo: none} {to: 'SP25ECKAYJAADR76HKZHM3XTACGGBTQQH6DM713FW, amount: u1000000000, memo: none} {to: 'SP1K1A1PMGW2ZJCNF46NWZWHG8TS1D23EGH1KNK60, amount: u1000000000, memo: none} {to: 'SP1N7EGJF5QRETBA0XPSKQVW8BFY0CRR7121E5KT0, amount: u1000000000, memo: none} {to: 'SP2Y7SWJSBSFRVJKB1RZC5GC89CJ626H28CYC8D0J, amount: u1000000000, memo: none} {to: 'SP3X2EQH5TM04PF5R7Q0T5P0MBD7D7PTS0NAZN3WN, amount: u1000000000, memo: none} {to: 'SP2TTVRSPJX5QXMAPRXJAYFWGEZ5PSS6A19G5KFES, amount: u1000000000, memo: none} {to: 'SPMGAZ3GGTQ9K89Q9055R1N8J3HHXE9SPPXH32BR, amount: u1000000000, memo: none} {to: 'SP23ZD85YA64HZMXMWFNS1FHPXKF4CC9X2QNVY0MM, amount: u1000000000, memo: none} {to: 'SP2D0MTEWXVSKWJDMA02XMRQHVE0TEV4XYMJ906T9, amount: u1000000000, memo: none} {to: 'SP32AEEF6WW5Y0NMJ1S8SBSZDAY8R5J32NBZFPKKZ, amount: u1000000000, memo: none} {to: 'SP1A6FV9C7QPVET7Z6X26QPYYEVN10PB1R0EZ6W3T, amount: u1000000000, memo: none} {to: 'SP2R0T61X06QHGQ67SNTF6M533QB21FBYWY4JFG1B, amount: u1000000000, memo: none} {to: 'SP1X4TJFTCAEKVBTTD54KRX5PQZTAGAYK3SAT11RM, amount: u1000000000, memo: none} {to: 'SP2A526ZANMKC4C42KG5TMPZDYKYHWM2DKMRDSRMA, amount: u1000000000, memo: none} {to: 'SP1N0V74AZFEPN96X8J2CXEHEKTRGWTJB6SQG6ECN, amount: u1000000000, memo: none} {to: 'SP2ABNX65BSKVM00ZQZ7K174DFV18CXVGGEMP7Y6X, amount: u1000000000, memo: none} {to: 'SP1BZXABNDK1KNRADQ2EZFW8Z0V5GZCP6P2NF64QW, amount: u1000000000, memo: none} {to: 'SP2BMZVJXG2QK31BBZVGBSQ1RFG6FK9VSSA9Z25G4, amount: u1000000000, memo: none} {to: 'SP3HADD2JCFQXTX4WAVQMA53BYVAMTJ1FGDQPEXZC, amount: u1000000000, memo: none} {to: 'SPCGBQY37XJK557CFQBG20Q7SHZQYZ14F6JG0VEM, amount: u1000000000, memo: none} {to: 'SP11NQ023VQJCVBREYG75EDZ9CZHZWCEKDXDG0JA3, amount: u1000000000, memo: none} {to: 'SP2SKMAR9WMD9DBJHC4XTQXPZCDNV1258PSJTRGTV, amount: u1000000000, memo: none} {to: 'SP3KYNBCYJV50F0JZ9JWJW7D5D9CJ4JBFMMR99PG4, amount: u1000000000, memo: none} {to: 'SPDAXAPSFTKVXRN9G2BZKRA4GVNWMXZ2SS1JE5CV, amount: u1000000000, memo: none} {to: 'SP1H45JS07GWQWMT57JE20X17AQCNVYAS7NHW2HVR, amount: u1000000000, memo: none} {to: 'SPH5EGVRXQAN9DN2H88WHNRST4DVY8GM8GDD68A0, amount: u1000000000, memo: none} {to: 'SP1MBC8R3SM3XTV88CWDDTH9DECYQBHS5Y8A0T25A, amount: u1000000000, memo: none} {to: 'SPCHFHJ3RT4K54RP4QEESFH2FFEB580XPRDFHFSN, amount: u1000000000, memo: none} {to: 'SP3K5B7F2AMN2HTB1PK2B7VD1DNDETTT4JPBMJWEB, amount: u1000000000, memo: none} {to: 'SP3SDZ9WKEDX6WT8BKMY80SM37VD6QKGQH9GP5CD, amount: u1000000000, memo: none} {to: 'SP1V4BWKPD559WP67GWCV8VR0VRKJ7ESS8WHKYEJP, amount: u1000000000, memo: none} {to: 'SP1TJGR2Q7FVZ4QDHJK8ZDRBE8C7FYDNS1K0DZ6CT, amount: u1000000000, memo: none} {to: 'SPNTV728XNNR3KRZFD2FAFBR2DVPA39BB2GRPTVX, amount: u1000000000, memo: none} {to: 'SP3TA40KJ1DGB5Y231PHFCECWQGK1313J5KM4671M, amount: u1000000000, memo: none} {to: 'SP3043XD086ZCFD6GVVZ8G2V0QZ22GKX955K4Q1AK, amount: u1000000000, memo: none} {to: 'SP3TF26QFS3YMYHC9N3ZZTZQKCM4AFYMVW1WMFRTT, amount: u1000000000, memo: none} {to: 'SP36YBVZ03EA8Z5RY3FWBJPVYREVPREN17MMF2EVG, amount: u1000000000, memo: none} {to: 'SP15T6499MBF43736SKRR0B0HQKBW01SW9YWCY6GP, amount: u1000000000, memo: none} {to: 'SP7SHEREY1MWFRGB2WB3QQMBP4HJ9AJ8Q9ZB1YJM, amount: u1000000000, memo: none} {to: 'SPYA5FKFTABP5QMF6S5T1FHET7B8VNG21N9AVVAJ, amount: u1000000000, memo: none} {to: 'SP20R5VMS52WNK4RG52J2Y66DCBJZFBCZM98Y2K2D, amount: u1000000000, memo: none} {to: 'SP38HC88TF5PXNJ265PES6NC7GXK7WRTV4YFE420D, amount: u1000000000, memo: none} {to: 'SP2RK06984GDNAQYTAH65EEVM2MZCSW2NVDMBAV22, amount: u1000000000, memo: none} {to: 'SP2H6KSPZ8B9MTC8PESHCA14J4AA16ZN706Y95WPE, amount: u1000000000, memo: none} {to: 'SP2DA8BD4X7G376RGM71Q4JDP5AB5GM1Y8EFAS8W6, amount: u1000000000, memo: none} {to: 'SP38JSVJXJ6DY55TA7RWCPGHN98TZ0T8DD7JVGETA, amount: u1000000000, memo: none} {to: 'SP28QY2NN3KEN5CPVFATA2K6ZXN4A7SM3JC9G897, amount: u1000000000, memo: none} {to: 'SP426EVNEX3G16NXS4PGVTA5F6NS3W7KBKVNG8GZ, amount: u1000000000, memo: none} {to: 'SP3W8W0N282M29Q4EN7454SQ3SFMTZAB38X1CXS46, amount: u1000000000, memo: none} {to: 'SP1CAB22T3V9D6T0FD80HQX1100RNJY4QQQBFCJ49, amount: u1000000000, memo: none} {to: 'SP33R2366DTF8V2A3RXQ22NFVFR9T2SS05R90R2MN, amount: u1000000000, memo: none} {to: 'SP1ZKS01KDBP1WZT07T6XPZN8EK82SD0GSH76PJM7, amount: u1000000000, memo: none} {to: 'SPEMB0KQRD7PWKY2W2J2Y1Y6Q9YBJ702DWQADE7V, amount: u1000000000, memo: none} {to: 'SP2212NSS0AA83VCXR9HH1CX1BQ1HAKDQ9FHHFCPH, amount: u1000000000, memo: none} {to: 'SP1779T6BNQ853MTF39HHJAR5E7WVJQZEBGZ2B9VB, amount: u1000000000, memo: none} {to: 'SP3188CJTN5YDY77KPT90AJJKHJKDSSMZ5T1PFF4D, amount: u1000000000, memo: none} {to: 'SP36K82BK7E2AQPG2Z0ECK5AWN2RRVZ70TX8W3DFX, amount: u1000000000, memo: none} {to: 'SP1RNRFW2XBHD320RKYA0FT8ZVBZSYRW1TMR15VWS, amount: u1000000000, memo: none} {to: 'SP6Y9FQ6HE0HZ4G5XVT9PG0XZJJM2WWN0SXCY8YV, amount: u1000000000, memo: none} {to: 'SP2ESNXDBVVES8KFYVSPAHGG589NRPVKKGAK5GW26, amount: u1000000000, memo: none} {to: 'SP2RS0YJZ2QH5VYXQ91X06B9QYR90BNGJETWP0V69, amount: u1000000000, memo: none} {to: 'SP1RRDH96VN1PYNN65QKW7GFY4S36PXTX95VQ2FCJ, amount: u1000000000, memo: none} {to: 'SP14FA3K1R8Z3FEAM14V6YA0ADH0BMNDETWS0PFQE, amount: u1000000000, memo: none} {to: 'SP3Z8GN0DZWH0S4T13HMK8JMFFQPMREBTTSYYK5D4, amount: u1000000000, memo: none} {to: 'SP14VRR0HD9Q269FX2K309SPFZ09TTCKY8F9Y7Q8G, amount: u1000000000, memo: none} {to: 'SP1EA5AMAG5YRJYAT1YV88HWTRB263PQ1ZK35AFH6, amount: u1000000000, memo: none} {to: 'SP2Q7A2E08G2XD5YPVGTWHAB4TXPNE1CWB2M2JTS, amount: u1000000000, memo: none} {to: 'SP2JN8DJ2MS5K5QESFTQWSTDP79QYYYH2YSZDYVA9, amount: u1000000000, memo: none} {to: 'SP1N8B98NEXFZKSK1HY9KMVCS5XX2EPTDX6C1DAW0, amount: u1000000000, memo: none} {to: 'SP23S4KHTBQADHS6Q0EQVHTC7Q9YRGBSD0F3X6QY, amount: u1000000000, memo: none} {to: 'SPR244T6NRM369NTQ9GCYYG3AQV703FG9EKC4XJW, amount: u1000000000, memo: none} {to: 'SPN3AV2KQ8HYFHGKC34SGVSS9TNMJXG56GXRSR70, amount: u1000000000, memo: none} {to: 'SP27N4NGQ3RMK5PZCWTYRDJZ2ED66EASKMB3X2RFP, amount: u1000000000, memo: none} {to: 'SP19SM9Z06A40WBEQZTN9MA5N2TB64HXHY8Y3ANT4, amount: u1000000000, memo: none} {to: 'SPBE32727GDH6MQCTSBDY3CVXKTK3ER7A2GBMDP3, amount: u1000000000, memo: none} {to: 'SP2RCMGCCXG0J006F4M9HJWTWEZ2SWCP6WS433CWS, amount: u1000000000, memo: none} {to: 'SP3MBRYGA9D8EAVYTTTVR28NM0MGW4CBP4E18ZEVP, amount: u1000000000, memo: none} {to: 'SP35A70EAFQSWDH7033CN3Z5QZ30K8VVRMZQMR8JG, amount: u1000000000, memo: none} {to: 'SP2JCF3ME5QC779DQ2X1CM9S62VNJF44GC23MKQXK, amount: u1000000000, memo: none} {to: 'SP3F1M73YX0TA9Q5AKGA06TEB3MQE5WRC6CZ891PA, amount: u1000000000, memo: none} {to: 'SP14M3FJP2S6CJXVVV3NDW10W5JBKFPR7BR6HE2Y4, amount: u1000000000, memo: none} {to: 'SP23DYBKECF0DHP8P7P2KYVZFHM768KXP8JCKCYRR, amount: u1000000000, memo: none} {to: 'SP8GR756E064NXDJ7TVJ40MSQQHP5D9YKGSTKJQM, amount: u1000000000, memo: none} {to: 'SP376EWHFFQ58XA67BR0EBDSX8PXJ48ZWMGC6K7YQ, amount: u1000000000, memo: none} {to: 'SP31JVAVCVFPJWX5HRCJ7DS7R7ZPG498XCCXXEZJF, amount: u1000000000, memo: none} {to: 'SP3N56EKWSNN2SQ0WJ8MJGXPFSE9TRGCVSTSFG50J, amount: u1000000000, memo: none} {to: 'SP2CT6DTYVCXA1PDT8BD72YR2ATHK2A5PVC5MDDF6, amount: u1000000000, memo: none} {to: 'SP18N1FFE60W13NBC1SX16W5KGR5QJNTFFX87YCPY, amount: u1000000000, memo: none} {to: 'SP2ZNESKVAN6P9WYNXY0TCNMPFSKCMP0XP82ZE3BW, amount: u1000000000, memo: none} {to: 'SP8RJY4E8TAAWHXHEVSA57FEVWDHEZ6X7R4V8QAS, amount: u1000000000, memo: none} {to: 'SP1Z80QY12ZHKVV59KR72SJ6ZPJA2833VKW53JHD5, amount: u1000000000, memo: none} {to: 'SP3NEWV1EPV1Y9KKSGDSC63CFE5ASA9QHAHWGTPS6, amount: u1000000000, memo: none} {to: 'SP2H9S76Q2QRNCGVS1VXG0DJ310WXR2ZYMQX2TZBH, amount: u1000000000, memo: none} {to: 'SP1386044X5N01AJAGN50NGKE87K4Q72P7DHVXF3F, amount: u1000000000, memo: none} {to: 'SP1YK1VXJXD2RWTZ6M8TNB99KQZX0EXJ9RJ591E15, amount: u1000000000, memo: none} {to: 'SP27WZRNZVDBZVH6S97YQJNB4BMPKWHKS5QY41QQB, amount: u1000000000, memo: none} {to: 'SP3YBT0WN9A2NDVZ5RY3KS1E4VSG34QJCE2B30DCQ, amount: u1000000000, memo: none} {to: 'SPFNK7H2SX0QZFZ73R0E4YVY0AN4Z9GMCGEHKYNA, amount: u1000000000, memo: none} {to: 'SP8TBMNAAT7BSH55PMRD1KXCEW7VRMGM5C17RKFE, amount: u1000000000, memo: none} {to: 'SP3BK1NNSWN719Z6KDW05RBGVS940YCN6X84STYPR, amount: u1000000000, memo: none} {to: 'SP2H8AQMX2QEJZ96NNVJ6AB9QKHJRWW7RXBT1J6ZE, amount: u1000000000, memo: none} {to: 'SP324T8N3ED0P7QRMD5XT1MDQVGPWK0X7NSZ1GTPD, amount: u1000000000, memo: none} {to: 'SP16PHRA6EYY8HBVQJ3N587N7S550HJ2G51H0XA3T, amount: u1000000000, memo: none} {to: 'SPFRWD7JFHQRCPBRV4FJW3AK94SM0SWV609SYTVS, amount: u1000000000, memo: none} {to: 'SP27GY3M2KQ5NDBY22EG0KYDAGZFFD8A769BB8XSE, amount: u1000000000, memo: none} {to: 'SP3PMEXHXAR3YA2Z0TYK91RBPRDJGH6T7R96KK4DA, amount: u1000000000, memo: none} {to: 'SP2VSNARK8SZVTGY99H9X1AGYZJ7JDKCAJ5S7FBZ7, amount: u1000000000, memo: none} {to: 'SPN9YGHV82AMGGG116NE3QYRZ573M3JJE4CVCGTY, amount: u1000000000, memo: none} {to: 'SP3WDK81HYBFCFFFASD73SMHGV846W46VEFVBYYB2, amount: u1000000000, memo: none} {to: 'SP1MBYHW0DMH9DCW90WRCP1VRW4WA36P9T71S4M89, amount: u1000000000, memo: none} {to: 'SP1HDNT0Q0A6W5WH70XF112E0B1GDGFMWN4E7HQEG, amount: u1000000000, memo: none} {to: 'SP2HF5D9FKA393DCCPCZANZPD4K2FSDBBSSDN2440, amount: u1000000000, memo: none} {to: 'SP2PHGTC4DQYVX32JHFZT7WJED070MDXTR5JY3F74, amount: u1000000000, memo: none} {to: 'SP2TQK0W6C315R19VEJ144BPDCP12T496MYKQ991A, amount: u1000000000, memo: none} {to: 'SP2WC112DEJR44WVAX5A2WZ21VCTTVMY000AJKKYT, amount: u1000000000, memo: none} {to: 'SP2KKRNB5NDD68F7XGQNFD5HRPJXG8PQ5ZRMBNWHE, amount: u1000000000, memo: none} {to: 'SP3M3F5781QR8PMESKPTR1SPN031RTFR782QPG186, amount: u1000000000, memo: none} {to: 'SP7G47424441N1WCJFDFYMT9XWC0XRHD8KMS2T7R, amount: u1000000000, memo: none} {to: 'SP2QH33DWDM3JNT3FVTMA6Y6YX6S58M6QETNS2D36, amount: u1000000000, memo: none} {to: 'SPC108HG46YD67MTWK4NBN3FK28TK4KZXVPARZQN, amount: u1000000000, memo: none} {to: 'SP390ATGDGQFHE5YEWKXHCGQVXNAQP25JAXXZMWSC, amount: u1000000000, memo: none} {to: 'SP27T4FF5ATTCN3HDY1QTD2PKNJSP1ACCCEGTW8S1, amount: u1000000000, memo: none} {to: 'SP30AF1XADY530B2MTQRNP1NFDE22A4X51QZ056KV, amount: u1000000000, memo: none} {to: 'SP60EC74B4J7E894CXCSCRHXX0EKSX6P0BSWN1R7, amount: u1000000000, memo: none} {to: 'SP1093PXJD0BB7KK6SPJB3TPQDRPE0VVK7PWY1FGR, amount: u1000000000, memo: none} {to: 'SP33V8QFCFF18VFYAKHN8NPS998683P1N510RAD7W, amount: u1000000000, memo: none} {to: 'SP2F8HYKRM4S3QKTK4FZTJ18TY0MSXD6RXBG0A69Q, amount: u1000000000, memo: none} {to: 'SP18W9NPMBEBKWRJA5RNRJKGKW1FHQQ8BF9RXVEGN, amount: u1000000000, memo: none} {to: 'SPT63MAP8EZ7CKN1TF236VB4J70EF81ZBFZ9TC2S, amount: u1000000000, memo: none} {to: 'SP2VEP75T5X58TDMTBSVH86RH95XFNKAHHJRQSG9A, amount: u1000000000, memo: none} {to: 'SP2F96E13TN1S10HJZRC87B7V2887DFSAHC04S051, amount: u1000000000, memo: none} {to: 'SP3EPW3MA2D9TAR5JAZGBS1SBHN1VJXP7TQ68TBZ, amount: u1000000000, memo: none} {to: 'SP32Z3S3C4N1GZSE3V4HHGM2ZT2B3J2K0W7M50EVP, amount: u1000000000, memo: none} {to: 'SP3M6D6M2BS7FNEFV111ZF6WQYATNJZ89Q7MXSPAE, amount: u1000000000, memo: none} {to: 'SP119JG3J5PNVZ3C2T3A3E228G5S3C28HNTN42SSV, amount: u1000000000, memo: none} {to: 'SP3XYXX4N50GPPAZ8YE1C9XX5YF3B8BJBQAA9FVTT, amount: u1000000000, memo: none} {to: 'SP8528V4JW94TE4FPTHZ1GXV7B5FC31Q020CFQGF, amount: u1000000000, memo: none} {to: 'SP2Q1SZSETS27AZ9FE0BH6C6B7MVC25E4N6C2VE7D, amount: u1000000000, memo: none} {to: 'SP1JRVS9D9N9ST2RT1T13ZCKWP0MEW2V3NCR8EG83, amount: u1000000000, memo: none} {to: 'SP31A0B5K60KHWM3S3JD0B47TG3R43PT1KRV7V53B, amount: u1000000000, memo: none} {to: 'SP34BD9Y4F4VVJSVJSET42CWKW6K0A81D1YBC0NVH, amount: u1000000000, memo: none} {to: 'SP2PDKAXY1B17AD16A3GAFJSRR6TCZKCPK6MEJVSE, amount: u1000000000, memo: none} {to: 'SP295QANJTGHJJ9TSHJ4WH28Z52VDKWDW68VT8KAH, amount: u1000000000, memo: none} {to: 'SP1ER2HAPJP7Y856V1CQ4J458RR6NPPVM0N5RM13V, amount: u1000000000, memo: none} {to: 'SPPS62EMZN19FX1E4Z9CCMBH9YAP4H9TZ2M83SDF, amount: u1000000000, memo: none} {to: 'SP2N2XAZDKGRK5E2ARKT96D6971W7FEPK1SM6KNJ1, amount: u1000000000, memo: none} {to: 'SPS60VRZHTHFKB8R9P6ZM1W2CPBR1NCDQ10WD5ST, amount: u1000000000, memo: none} {to: 'SP2G6SEFFJ3JT6SCBTM1NVP0YP9TY761P00NY1TW6, amount: u1000000000, memo: none} {to: 'SP2BPZHCBK2YD3T76QCJ0V9RWPJ0HE2WJYMBE31EF, amount: u1000000000, memo: none} {to: 'SP2T04RQY3SP5V24233ABVX9G5CV14NMSB1ZF83NQ, amount: u1000000000, memo: none} {to: 'SP3Z1GKAWK8GZ91Y9JP1S7TSD3ZCE3Q1GZNB5W525, amount: u1000000000, memo: none} {to: 'SPE9YSAYHT5JYAJ963ABNEBB5R4MVTXSFPDW53X9, amount: u1000000000, memo: none} {to: 'SP1VKEVK39KZTA7T95XTYX3ACXBSDBDQC3HECH4QA, amount: u1000000000, memo: none} {to: 'SP3BD5PE5RNQG8S76A4T2PS8RVG3T9A29BFYG8JFT, amount: u1000000000, memo: none} {to: 'SP31R72B1YG883PCBTJ552ASE4T8J45QBC72TM453, amount: u1000000000, memo: none} {to: 'SP3BF8B35TTF4362EJG7JZ4YAEXZNQ8RD20NW6GEX, amount: u1000000000, memo: none} {to: 'SP1JGAW4KJS31AEQFGVB2Z4M7Y95NNRA8GBMMN515, amount: u1000000000, memo: none} {to: 'SP12FXX43RDKMHD2BNQTT6XYQX4AMEEG52XT36N9S, amount: u1000000000, memo: none} {to: 'SP185345QBXH57YKKSX0Z3ZS6MBD2Q9517JRQ9FR4, amount: u1000000000, memo: none} {to: 'SP3PTD1S3SQEPEB9KRFQZMT51QXYM1T27ZY7F3RQB, amount: u1000000000, memo: none} {to: 'SP2G0A96K24B7NF2ZRZHPDDSNPNVRYHA78E119H6R, amount: u1000000000, memo: none} {to: 'SP2T9E1MHVY7K2FBZSVQRM069B9B267EKQVCRKHRA, amount: u1000000000, memo: none} {to: 'SP3K6KY0GYGPATJDY4RKX0FNE8TQWHCXJBQ2NZWVG, amount: u1000000000, memo: none} {to: 'SP1DBYAW24WNVTXQG6R26B5PX5RF3822FJFERGN7D, amount: u1000000000, memo: none} {to: 'SPSSBCHRPNEKJ2DV5YAZMPRKDHDS657Q8XYK6QYK, amount: u1000000000, memo: none} {to: 'SP13KWBHG40T4M9DT7CTPAN3NMSZ1VHPQD9C02ZNN, amount: u1000000000, memo: none} {to: 'SP3DXM8JG7CTBMTQR2KF4BH9FVFHQTQ6S6ET02ZFB, amount: u1000000000, memo: none} {to: 'SP3PE1NYNHHRR9XDYGYQWR1NK5R33PX42E688EB2D, amount: u1000000000, memo: none} {to: 'SP2HY3ZNRF1ZA202KQKW7C59M24QR0NZ2NXWSBBP3, amount: u1000000000, memo: none} {to: 'SP3HWNS8SWN1GPVBWGSSYC9JREEFKGJZ2R87JGYN, amount: u1000000000, memo: none} {to: 'SP2648YY25CS8SRZ7EX1KP1Z16DHJ0PXBXZ0QF0X7, amount: u1000000000, memo: none} {to: 'SPCEZV5JBZRPG8PKYYVBFE3ECQB3V7D504F0G674, amount: u1000000000, memo: none} {to: 'SP3SGNY56Z1XYZNFQHHZ89BTCX5DW6KFNPB0DK4QA, amount: u1000000000, memo: none} {to: 'SP124K8WX1C8WG9J0XHXCZRPTG7R1PE58EZ17X06W, amount: u1000000000, memo: none} {to: 'SPQVG91FWDN2KZ6V8DTSKYCXC5FEZFDZSQC8ZNM1, amount: u1000000000, memo: none} {to: 'SP1GFTSR8DNFNEG4F4D7WZ1Z29444TYCK2BFMJHBB, amount: u1000000000, memo: none} {to: 'SP1DHYFDG7NETAF9DXTRKA62ZJ8RGR2X69PP4764B, amount: u1000000000, memo: none} {to: 'SP32ECPX97EZ412K1CMVAS29MJBVQ8FSA45PDB7PS, amount: u1000000000, memo: none} {to: 'SP296Y0AC0ZY58BBZMC6JJPFJH2A0DWBRNW7VFV8X, amount: u1000000000, memo: none} {to: 'SP11P09BQ2BQ4XP3B9A1XBK3RQZFAQ187TASB3ZWH, amount: u1000000000, memo: none} {to: 'SP1K1B8243JPQGSGAPT0SDDW01VWF2D6YBC8M1CRH, amount: u1000000000, memo: none} {to: 'SP36KY8Q0X14W3Z67DSJ0DCFNFF09HSQWZCT6RDXM, amount: u1000000000, memo: none} {to: 'SP2KZ24AM4X9HGTG8314MS4VSY1CVAFH0G1KBZZ1D, amount: u1000000000, memo: none} {to: 'SP30A5QYGBG69PQT7Y2CVW9SAX3VTWA3QY5DST080, amount: u1000000000, memo: none}))
(contract-call? 'SP2KRDCTRRW9PGBYGM8AEA625D1NCKWKW6V0H34FJ.hoichiokinamitsukiyomimishim send-many (list {to: 'SP34J7HP28X0XA1V6NX3VR3H6AF0ATTZ6PCHFSK37, amount: u1000000000, memo: none} {to: 'SPZX8XFDF2VH7XGY5SHTMTM82PNGTZJHD5J5F8SC, amount: u1000000000, memo: none} {to: 'SP297DGZEWRRCZPS26XCM6V7M7YRN2NP8BT6JM4M0, amount: u1000000000, memo: none} {to: 'SPMH8TX6ZB5RNJC4CHR1K65T2A63NRK17VK717B0, amount: u1000000000, memo: none} {to: 'SP3EFSN0M1NMKNTCZ0H88HW43S16HEAJPTZWS45XB, amount: u1000000000, memo: none} {to: 'SP2M5FHTR9H905E7FV7NQCR0E2918V3H9NAFS5YZP, amount: u1000000000, memo: none} {to: 'SP102TXYKPNKJYDFY3HWY2EYT59N9N91N228VW6A4, amount: u1000000000, memo: none} {to: 'SPBMQ6ZS8RJ4R7GWZEVFBKB6JPXNWEQWCMJMRARW, amount: u1000000000, memo: none} {to: 'SP2YT55JGXDRM1XRBAKJ1H9HRY21G4XZERTJ6K6WC, amount: u1000000000, memo: none} {to: 'SP2STNCT59TDVXKBEWYTS94JAX474VNB5W3FYV1QK, amount: u1000000000, memo: none} {to: 'SP1EJZFQ4M933ZCNBCFSPD7RK72455HY63QFRZ97P, amount: u1000000000, memo: none} {to: 'SM277800GAZJKQWN3AEYB4KBPTTBASD355JPHQ9DT, amount: u1000000000, memo: none} {to: 'SP72WTDT0RZ4MCEKNZV9TKEVXPMS4W88C1ATJRHD, amount: u1000000000, memo: none} {to: 'SPR6K4VQ0JQN677W4GGCN5JTPN7XF7YTP7WKAJXH, amount: u1000000000, memo: none} {to: 'SPRB7VF7K48BB0CJXE7Y1AHG8EK0H6WX9CYPM9EE, amount: u1000000000, memo: none} {to: 'SPBPAAT0J5R9ZKMEVCY765CJFMT0DNY1KMCR77FF, amount: u1000000000, memo: none} {to: 'SP1GK9A2A74M8ND1RNE96WX9M15W2FH5NS7BQMZQQ, amount: u1000000000, memo: none} {to: 'SPEDXKKEBES7V74SSKE8QX4N4FETRJ26ECEKBBPF, amount: u1000000000, memo: none} {to: 'SP1WZVCZQ15M6BS5PACHF2RXCG565PX2DM27TGGNN, amount: u1000000000, memo: none} {to: 'SP2DS8FB67D24FHTBCKSC24E5G6J3J35CEA48AKBF, amount: u1000000000, memo: none} {to: 'SP1E751EJJSDR62WB3WK6QJVR5M9RFBV3SHH453PY, amount: u1000000000, memo: none} {to: 'SP82C2PMNWPK0SHVJWDV13R56QD6NKGAHJ5N3N47, amount: u1000000000, memo: none} {to: 'SP88VYYXB6WHM1NRPNJBP9ZMB4TPVJWNCAY3R1X8, amount: u1000000000, memo: none} {to: 'SP3MRG8MT1A7QGFVXGZ3Q1WR9MESCQBDYYHYPCW5G, amount: u1000000000, memo: none} {to: 'SP25YAMNGV59YZ2CHD03ZAVQJSKKY9G2YJ2A2TTYW, amount: u1000000000, memo: none} {to: 'SP3QZ9VDXBC7KXC7CSTT97TE201JNH189JFGH6YD7, amount: u1000000000, memo: none} {to: 'SP22EE8V6G6D83G2ZFDZ4MG1EQN9YAH1WBEG766CR, amount: u1000000000, memo: none} {to: 'SP2Z5K29X2TD3JCDK07PY1FKN0SPCCBDTPEQNXFJM, amount: u1000000000, memo: none} {to: 'SP1KC8SY7KD6G55WVVC24GE4PH5NRNHSZK45ND0CH, amount: u1000000000, memo: none} {to: 'SP15CSY9NV81N81Z7GS52J3E43PA5DBFX55R4XWQ5, amount: u1000000000, memo: none} {to: 'SPR8F0DTM4R1VXR6C0GRR7CGWK7BZP8VVHM5ACT1, amount: u1000000000, memo: none} {to: 'SP22136GVJTGCSZX4FR18KBJ2YH29DZPJJXXDAENM, amount: u1000000000, memo: none} {to: 'SP370ED0V35GGNBVBXGN3T98DTDNSQJ3H1941RTTF, amount: u1000000000, memo: none} {to: 'SP1RMPVPKMFAR7D0A2KJA776X7SH6FJ43JZ44VS1Y, amount: u1000000000, memo: none} {to: 'SP3SF0PSD7KYVJQPKKRBYJFF7NENGFHZSBVHM3B27, amount: u1000000000, memo: none} {to: 'SP2G7R3PSY9NNV8MZ09X65DFB6YT4H138VG60XGPW, amount: u1000000000, memo: none} {to: 'SP39RJC954YQ530JQ2SESKG5PSJRJSG9Q7ES1MYZ2, amount: u1000000000, memo: none} {to: 'SP25X0G24FDCTFB83MJT9NE8188RXTP1C7PWGVSXT, amount: u1000000000, memo: none} {to: 'SP2NTXWC72CQRBA1DD5JDAH4T8D5Y673AXDPWXZQA, amount: u1000000000, memo: none} {to: 'SPX9AVXYA6JW4DK6DNW3XJZECR74MBPGB5X4PSF5, amount: u1000000000, memo: none} {to: 'SPY5MEW1FZHX3EQGEVTVRJS5ARJRKSFMZ0PH4ZCY, amount: u1000000000, memo: none} {to: 'SP2MM7X6KJSFMHFY75D61Z68V5VPBP4F1HTGKX56N, amount: u1000000000, memo: none} {to: 'SP1HRWQ1NB3QP80AWCSNFP7HV7MC9T0D85MTFXJRW, amount: u1000000000, memo: none} {to: 'SP2FSM29506QZYKJMFGNTAF2V6Q58K2Y61DDT7Y0F, amount: u1000000000, memo: none} {to: 'SP1S8WENCQGPSRHWX08GAPXA6VB0EMH157SKGMCKM, amount: u1000000000, memo: none} {to: 'SP2T1QF8EHK7N54ZC6Q07S65X38XFDKBZ780K512Z, amount: u1000000000, memo: none} {to: 'SP3WFZMNXB3GPCPJNYH8FTWEB4KBKPTCZGAHB16S8, amount: u1000000000, memo: none} {to: 'SP2G3KJD2QJD169TYWE589KDBBZPEVBPX2BZXFTHN, amount: u1000000000, memo: none} {to: 'SPAW8HGGTMQR4K1PK7TQ7MT1F70XBY60MJFEDXEF, amount: u1000000000, memo: none} {to: 'SP2M7K3YM8813404G1R7AXV106CPWH0Z5ZA80JVAV, amount: u1000000000, memo: none} {to: 'SP39TAEWH0DYMK8DZ00D61DMA4D4N544HVGQHVJR7, amount: u1000000000, memo: none} {to: 'SP3EHXKH36BKE33ZY1VVER4A35ZQD9Z552XQ38AFS, amount: u1000000000, memo: none} {to: 'SPR51QGAQ1QKCZ8YBJFHKVMTS6Z858BV20QY0819, amount: u1000000000, memo: none} {to: 'SPZQ21VBBBB5XVXHXD8AQSF51D8H3BMQDX1S4DJ0, amount: u1000000000, memo: none} {to: 'SP1KVWVB0W4SGT37KJVT6HPRMJAFQDHSK4FX6ENYP, amount: u1000000000, memo: none} {to: 'SP1GQKBVX6TTP1NRGB5FZXBG9CTJ011N5H7HH19V6, amount: u1000000000, memo: none} {to: 'SP2TZVZKHYAFKWSH6XS83YZ66P6QJXGXJBTP7EGFK, amount: u1000000000, memo: none} {to: 'SP296EVP3WWSN5DZK4ECVHNZ2AVJ9MWPBKR8BWB5R, amount: u1000000000, memo: none} {to: 'SP255M5D0S3JZBY6XF2R8C5V1ZQA5FXQM6Q1A7EZ5, amount: u1000000000, memo: none} {to: 'SP2RBRMJK15RYRPXYPR20BS370X7G2G2VXPX8MXGW, amount: u1000000000, memo: none} {to: 'SP2NAQ3MDASD9EANBHAZQ83XEFBF2GH8XAQZCANJV, amount: u1000000000, memo: none} {to: 'SP3JYTEYFKCY12WTY7TNRCQ392D1WF0YTPV71P0EM, amount: u1000000000, memo: none} {to: 'SP2QV18K6HB5NBE2RWHKH1HY2A3HKJ4NVW7KYN2SY, amount: u1000000000, memo: none} {to: 'SP197GMEG6WGBRDTCTGGWMRA1G77E65TRXWYKGCT7, amount: u1000000000, memo: none} {to: 'SP16GTCRTTVS1N3V822DJPCJ9W470VET16HSVV36E, amount: u1000000000, memo: none} {to: 'SP9MANP57C4QHVMNHR9HEAX6D5BAA4JN9KC8N4J8, amount: u1000000000, memo: none} {to: 'SP2BZQ48MADDN62X044NNJCNXF5BA33C3BFQ3TZJW, amount: u1000000000, memo: none} {to: 'SP2ADZTN3BQQZ83KDBJPRK8XN191E5RXEZJKP42FQ, amount: u1000000000, memo: none} {to: 'SPDQ60EWVFKXP7JB1XQ0WCE294GFRS50XQ0AYRSG, amount: u1000000000, memo: none} {to: 'SPPQ99FXEVZ2M4X2FGQZ3Z9JYXF25MPE303NEGT2, amount: u1000000000, memo: none} {to: 'SP1D9RSJ6M14EBQTD2HJSCG363DSE3VQVJ73V6K0H, amount: u1000000000, memo: none} {to: 'SP2DV6ZV3QBQPXWN7NNZ4EJZWXXWWBYF4PG72TN28, amount: u1000000000, memo: none} {to: 'SP1JRGSKN76086C4MXCPZRB9C9ZHKKYJ0FZNKX749, amount: u1000000000, memo: none} {to: 'SP1CSFTZ6B4XPK89QGB592EE505CACT5HJV3YY6QA, amount: u1000000000, memo: none} {to: 'SP3NXCB6WJTHDT4ZSWYW5Q8GDYC29FZAVM94TAA1V, amount: u1000000000, memo: none} {to: 'SP1RBMZ0PKJ0VY6C31CZ3KKT2E62ZAEQWZJZ8139Z, amount: u1000000000, memo: none} {to: 'SPXGDPXZP0DJ0P8TQNQ6J97Y9S83DDN0VYE0JWGR, amount: u1000000000, memo: none} {to: 'SP2KD44XNHAXEPY4WXDQDCM596DNM68N29EGWJJ52, amount: u1000000000, memo: none} {to: 'SP1MES8GV834HB09CWG6B38YCRZX7EPE26Q8P9Z79, amount: u1000000000, memo: none} {to: 'SP2M1KV3AHT55YZ7VMRN2JS9HJVTVSW8RCAT4B326, amount: u1000000000, memo: none} {to: 'SP3G1ZDM92SK8HH6TXQN5AEYTT30XWX9VTY25KBMN, amount: u1000000000, memo: none} {to: 'SP3CDVZNAWQ0N438YT6MVCWGZP7A775PM92M34W5D, amount: u1000000000, memo: none} {to: 'SP3ACJ0SP3B9ME1A7CD8HZAZ43GZNSWDYM92Y3RK1, amount: u1000000000, memo: none} {to: 'SP25SF2MPZZS8Q20QA3VTYJXTHAHCRNM5MSZYDNB0, amount: u1000000000, memo: none} {to: 'SP32QTYYGG6SWTP198FST4SPM85J0A3JPNB9S2BEA, amount: u1000000000, memo: none} {to: 'SP2AEY9QJD5MGDEEYYTNYBVVS7S97W2S0302HQ7S1, amount: u1000000000, memo: none} {to: 'SP1DR9311DH5CD8XATFDTSBCTK4TXZYP027J4AH20, amount: u1000000000, memo: none} {to: 'SP2FZ154ESZ8NB34RZ3RS147GD6DSEYNE8DQD0XDM, amount: u1000000000, memo: none} {to: 'SP1FZKAJ5V0QSV19RB5T2DG1PJQ6R6MKSB5ZJF5A5, amount: u1000000000, memo: none} {to: 'SP3ZAQJM5CVTCHVTR5C217BZRPBB3P2APW59ZHG2G, amount: u1000000000, memo: none} {to: 'SPE2X9X6VRYX2872PWQV7RGTXM3YH9B80TQ8NZBJ, amount: u1000000000, memo: none}))
(begin
	
	(try! (send-stx 'SP1FQ3DQDR5N9HJX3XC5DNKFCG4DHH48EFJQV6QH0 u2000000))
)
