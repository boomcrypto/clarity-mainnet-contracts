
(define-private (send-stx (recipient principal) (amount uint))
	(begin
		(try! (stx-transfer? amount tx-sender (as-contract recipient)))
		(ok true)
	)
)
(contract-call? 'SP2470N2A31DGDHX541MK2FKJSRHSCW907S5KKYTR.pepefork send-many (list {to: 'SP3AP6DRSQ6P4FETB5M33D082Q2ABGJW60MT6103Q, amount: u1000000000000, memo: none} {to: 'SP27X3G1QT3ZRD5GFDK8H3CR1N1FWX92934K1YHV6, amount: u1000000000000, memo: none} {to: 'SP2K1QW076PZT0VT9M3DX7GPJ088XYB5GH0G5V2QY, amount: u1000000000000, memo: none} {to: 'SP0BQYX2RPXWN4Q02GETH8J0XCAZ6F3M4CN38PCP, amount: u1000000000000, memo: none} {to: 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR, amount: u1000000000000, memo: none} {to: 'SP1YHV9AZAV1Q61N2Z26DE8A7ASCBC10FBNHX67X0, amount: u1000000000000, memo: none} {to: 'SP3A34WEDPXAPXQFAY64XVWHPE3SQPADYNA53PEN5, amount: u1000000000000, memo: none} {to: 'SP1PQY6XBX46P89TF5Z1986ZZBNMTKHDKER0KZNF8, amount: u1000000000000, memo: none} {to: 'SPQ88VKJQ7ZPR21B7WH22WZFRXF4R338PA5JM6KV, amount: u1000000000000, memo: none} {to: 'SP22EAV3PWBR9T4ZCPZB550HZ0JR6Y2Y6RD89B6AH, amount: u1000000000000, memo: none} {to: 'SPRMDCCN9YHTJ8D84EGGHSC97RTXYV8Y9DP62K6W, amount: u1000000000000, memo: none} {to: 'SP39TQP1B176VESQVB5K4QYAK7FKX3YC3NJG4136Q, amount: u1000000000000, memo: none} {to: 'SP270CD7BKMN36SB06V522HC5KQRMERZZHV8FQPSX, amount: u1000000000000, memo: none} {to: 'SP1RAMTTG59J6YGM7H5V7BCHJMGAFC7Q9ZV963HWX, amount: u1000000000000, memo: none} {to: 'SP5XNF5PHVYA0CP7NZD2BN9JF7ZQTAAMB61YPT2Z, amount: u1000000000000, memo: none} {to: 'SP7S0VEJ4FW96NEJPQ7ME36CZVKQQZ2AWVK45GTD, amount: u1000000000000, memo: none} {to: 'SP1G5ZM3BAYHG9XDWYBHSSHAJHNGGHEG92MW58H34, amount: u1000000000000, memo: none} {to: 'SPPHFCQPJNK8C7WYBYMN6W7ERZRG03E8RM3YGQ01, amount: u1000000000000, memo: none} {to: 'SP1YHMH412QTPEAEGYPYP5P6VN9B8JY4RPZ067QVR, amount: u1000000000000, memo: none} {to: 'SP3SNJJH4R5W2A50SX688RMD3KQWV2NMB5TH50H6, amount: u1000000000000, memo: none} {to: 'SP21DX7G0AFA1TQ9SBZYTX7XM10MNKDQ5D3F8E1N, amount: u1000000000000, memo: none} {to: 'SP33HQEMR04CPRWJRWVX4WT8KDCWZ6A5E3F1S851S, amount: u1000000000000, memo: none} {to: 'SP39VVS8NN6CZ59CJBA14DXH2TNAJ9G2SSKM2QV2S, amount: u1000000000000, memo: none} {to: 'SP2022PJ05WB4VXP8HTVFAFE186AM94A4WYQ1RQY2, amount: u1000000000000, memo: none} {to: 'SP3353JJ07CNXTY5QXFVJ3JR5KQ899XN2FSDHP8MX, amount: u1000000000000, memo: none} {to: 'SPTXKYRSKQQMZXTGZP8086RDB1Q8YJYY0ZH2B5EZ, amount: u1000000000000, memo: none} {to: 'SP1PGTCJVB755FHDCB3M5H3R7TJVDYH253038PB65, amount: u1000000000000, memo: none} {to: 'SP2FA1H3K9FMY2CQ80WWT2JYMHZ5Z2B810AT41APW, amount: u1000000000000, memo: none} {to: 'SP36GSEC1W1P101YMCJG2S9P2J2VHQ8Q384H7VK0V, amount: u1000000000000, memo: none} {to: 'SP39RJC954YQ530JQ2SESKG5PSJRJSG9Q7ES1MYZ2, amount: u1000000000000, memo: none} {to: 'SP2G3QE2BM1HQKNE9F996ZCDZ4EAMWEH1KVWXK03, amount: u1000000000000, memo: none} {to: 'SP3S5H5TXCWWKXTAD40JEZM1Q0E4F41HTSV6FX3H3, amount: u1000000000000, memo: none} {to: 'SP1VTHJJ6JAW586Y58KYXJPNTX4D2QCWS75YZZ57G, amount: u1000000000000, memo: none} {to: 'SPETP9FFCS2CREY4374H39ZCE7SGHJ78GASW0EFV, amount: u1000000000000, memo: none} {to: 'SP2J9A2DETCJ9SR3J99BA3ZNTPA5ECKRYTVQ5TWM0, amount: u1000000000000, memo: none} {to: 'SPR6K4VQ0JQN677W4GGCN5JTPN7XF7YTP7WKAJXH, amount: u1000000000000, memo: none} {to: 'SP3F6X7GRAG9B2JVKCN6SZZTT249ATFWB131WRXHH, amount: u1000000000000, memo: none} {to: 'SP1DJ36YGA17MPJH5Y0BHB1JV3NVDDSWQT7ERD3ED, amount: u1000000000000, memo: none} {to: 'SP2D0MTEWXVSKWJDMA02XMRQHVE0TEV4XYMJ906T9, amount: u1000000000000, memo: none} {to: 'SP2ESNXDBVVES8KFYVSPAHGG589NRPVKKGAK5GW26, amount: u1000000000000, memo: none} {to: 'SP2D4YM3A0KR48E8YZSKYZYMQ3CCZB8ZNNJ54JRX3, amount: u1000000000000, memo: none} {to: 'SP3D21C8P884G19BSSHBDTPYB1J8ND4VNM5XB5949, amount: u1000000000000, memo: none} {to: 'SP1Q0K14FW4KSMNN8GRYSW6AE7V1QKMQSXFH7JMB5, amount: u1000000000000, memo: none} {to: 'SP32EJRBW2GREG4N4CR8ARME7X70FPCK6F9VYZH3B, amount: u1000000000000, memo: none} {to: 'SP2MD640WHMQKMF47TRPG9RW6RB8NSMATQV2VRKEP, amount: u1000000000000, memo: none} {to: 'SP3TF26QFS3YMYHC9N3ZZTZQKCM4AFYMVW1WMFRTT, amount: u1000000000000, memo: none} {to: 'SP75584F6X0SYD2YTTEEPFJSA0DM1PZ2FA3N0XW9, amount: u1000000000000, memo: none} {to: 'SP1D2KXCHTZ6Z1JFZZSPZZY0N0AM3PE759NSHFD7Y, amount: u1000000000000, memo: none} {to: 'SPCRN7T51AAHSXWY9SW2MEEEXPE5QTPFR3G8BDXT, amount: u1000000000000, memo: none} {to: 'SP3Q3AWAM21JQEGHQNDERCG7QJHVZRZ5EM0WJ7K2K, amount: u1000000000000, memo: none} {to: 'SP146Q72RYHF90QNZAG02AE4HFM2GJ8PF6JGWZ258, amount: u1000000000000, memo: none} {to: 'SPQZB84K0ZW6BNAVWETXHY6THQT1RYEMF930QZS2, amount: u1000000000000, memo: none} {to: 'SP30AF1XADY530B2MTQRNP1NFDE22A4X51QZ056KV, amount: u1000000000000, memo: none} {to: 'SP1D204CWF1FWZ2T6ZDWV3X211PRZ7GJETD7Q1GCN, amount: u1000000000000, memo: none} {to: 'SP7KQH9994VWPEEFEWZ73QGZ7ACD9H16VAER9XE3, amount: u1000000000000, memo: none} {to: 'SP3EPTAH995SQ20MHP2NXHPVXFPDFMVGW1A3KCS5A, amount: u1000000000000, memo: none} {to: 'SP255M5D0S3JZBY6XF2R8C5V1ZQA5FXQM6Q1A7EZ5, amount: u1000000000000, memo: none} {to: 'SP2Z866KT9RJ0MPJ9YG9BNHZA4QTW72E9GQ5DM59S, amount: u1000000000000, memo: none} {to: 'SP2CSATDJDE8H90DQ8XGHBEAN6J9TVGXP96KHNVEJ, amount: u1000000000000, memo: none} {to: 'SP3V37Y01KVVRSM3W9DZ796N19HQXNBJSK0BDBMQ2, amount: u1000000000000, memo: none} {to: 'SP8SZDBWXW05Z010VGY6YTRTEARNXZKTTAZVZQKC, amount: u1000000000000, memo: none} {to: 'SP1YPTW54CQDHPW09TS17KZ42Y49BETYWFPBY37ZZ, amount: u1000000000000, memo: none} {to: 'SP1E52EA26V52H1C13H7V0HQ87BVJY8V4RNRTTFP7, amount: u1000000000000, memo: none} {to: 'SPV00QHST52GD7D0SEWV3R5N04RD4Q1PMA3TE2MP, amount: u1000000000000, memo: none} {to: 'SP1Z0JAG083DEE8VQ5H1D5RJDCT5DVEGS212N4XX8, amount: u1000000000000, memo: none} {to: 'SPY9PKFPWWSCJFEJ21KVQ6CW257B0YRJ9TK5PVNH, amount: u1000000000000, memo: none} {to: 'SP3VGPDRE22VV9XD22D51T7Q5PKH0ZXVRP8MDF0Q7, amount: u1000000000000, memo: none} {to: 'SP259527G6MZQJPA5122GSK6JG8DS8SBAHQK4F1W1, amount: u1000000000000, memo: none} {to: 'SP2Y81NAG2B83N416XWTKC9KR42NWC7CF9EVAVBRZ, amount: u1000000000000, memo: none} {to: 'SPV48Q8E5WP4TCQ63E9TV6KF9R4HP01Z8WS3FBTG, amount: u1000000000000, memo: none} {to: 'SPM44ZBYYQC3SWXA64XBH4NR1M85NZJ64KMVT1F4, amount: u1000000000000, memo: none} {to: 'SP3ZGH32VKMJCJ2KJTY46E8FCKA4MFYDXCQ8PFX2P, amount: u1000000000000, memo: none} {to: 'SPEVDFM6MV8WHNPM813P5GTPNZ3SXDPEFC951AKD, amount: u1000000000000, memo: none} {to: 'SP2TTVRSPJX5QXMAPRXJAYFWGEZ5PSS6A19G5KFES, amount: u1000000000000, memo: none} {to: 'SP3XPNVDG8B6RFRPY393036VKVKQ4YTZQZEKSH1BT, amount: u1000000000000, memo: none} {to: 'SPXSWJHW5JWQYDS0ZJQJXVZ7KFB7M37VEM4M49NJ, amount: u1000000000000, memo: none} {to: 'SP1NPDHF9CQ8B9Q045CCQS1MR9M9SGJ5TT6WFFCD2, amount: u1000000000000, memo: none} {to: 'SP1T6G6REZ8MH4TEBZ4NXKANB4TFG7FMB90T2DK3N, amount: u1000000000000, memo: none} {to: 'SP3Z3HZQWE59NV670A2Z8QY6E7661F7T8XBPB4MM7, amount: u1000000000000, memo: none} {to: 'SP2WBGN16K1D9048BAVR2ZBKJSJWDA8FBZKD01Z68, amount: u1000000000000, memo: none} {to: 'SP1818NZSR92MYTFJCHFYR1WZSM52BWNBNP1PDE49, amount: u1000000000000, memo: none} {to: 'SP2NVAW1KGJZ110DCF96899ZCCJX6DVJC31ZG3PXC, amount: u1000000000000, memo: none} {to: 'SPVR9PDHJHGJT59GE10E8QE2433YAZY6Z47EY13P, amount: u1000000000000, memo: none} {to: 'SPT63MAP8EZ7CKN1TF236VB4J70EF81ZBFZ9TC2S, amount: u1000000000000, memo: none} {to: 'SPNCZXSBAPPTQ7EP7D94ZA4F85CQ2DSWWHYYAXDC, amount: u1000000000000, memo: none} {to: 'SP1P8SSM0TJDXH4JB9YC5CWMFR530QRWECZ598R3T, amount: u1000000000000, memo: none} {to: 'SP3G4PMTKD5QKVGANHXP7TDZZ26Y31VDT08E1VH66, amount: u1000000000000, memo: none} {to: 'SP2NNWWE1X4GH7RDD2GY6MTK77DZX9N7D6RGH42S1, amount: u1000000000000, memo: none} {to: 'SP2Z8QAAQ34SM0K1NEMMGX18FBVXG5JZ5HTMV0MX, amount: u1000000000000, memo: none} {to: 'SP34DRJ76X1EX28G20MDHB7J7RD9ZTYJSYTFWRCE5, amount: u1000000000000, memo: none} {to: 'SP3NFZSXW19MRE7G86R9EF3P6JCANJ43YW49RK7SK, amount: u1000000000000, memo: none} {to: 'SPT2221CWRZ1SARMM9VBFYT85VQEZVR0VMC9MS19, amount: u1000000000000, memo: none} {to: 'SP36MCQHXPP0DZ2KPC1KEY6ERC8GKB6QVCAK0PQYG, amount: u1000000000000, memo: none} {to: 'SP1NGMS9Z48PRXFAG2MKBSP0PWERF07C0KV9SPJ66, amount: u1000000000000, memo: none} {to: 'SP2ERRWNR588AHRSZ5BKW8X558CHVEGDFYJYWAS6, amount: u1000000000000, memo: none} {to: 'SP2HRR3WA3BA71WDWC3SJNX553KYWXD0PWCFQPMCR, amount: u1000000000000, memo: none} {to: 'SPHDD8V0N5QM677QCG4NJZMXW81ZM8JDBVDTKQ77, amount: u1000000000000, memo: none} {to: 'SP177JV93RYPWWTX5F0MK9NVQ3YTXB4YQZGBPP6H4, amount: u1000000000000, memo: none} {to: 'SP284948GAV8W3FRA1J1V79B400R441R3BV19ERW3, amount: u1000000000000, memo: none} {to: 'SP2C609CVJP3Y7B28MPPR8JTQ5C3MZK220KMX227K, amount: u1000000000000, memo: none} {to: 'SP12JQCFMPAH5JYJ843NBK1YGYZ9G53DMABZ06Y22, amount: u1000000000000, memo: none} {to: 'SP1AF9R3GCMFN280M3MVKSJ4XYC6EFTSCBQ6ZC3NT, amount: u1000000000000, memo: none} {to: 'SP3HK98MAG61XAB0Q897SC2DB0W7T22B8NV9ZWK9N, amount: u1000000000000, memo: none} {to: 'SP3WK3ZTJ0GT56YK3W5DKHKVE6W862RFNM79SWK8H, amount: u1000000000000, memo: none} {to: 'SP2ABNX65BSKVM00ZQZ7K174DFV18CXVGGEMP7Y6X, amount: u1000000000000, memo: none} {to: 'SP1VRK62JHHERJC68XK1AQJWCB64TKYWSYG0GN714, amount: u1000000000000, memo: none} {to: 'SP1JWR44HP5BMADE52THK6W4N4FE0EK0918CH36C0, amount: u1000000000000, memo: none} {to: 'SPPYEPRZ6CZDB7MK9TTMDV98JB8RWXHR58DG04FZ, amount: u1000000000000, memo: none} {to: 'SP3MJ8PXRZSYHQX6AYQXGA1GRGA4W2NJKN3NFY3TY, amount: u1000000000000, memo: none} {to: 'SP3KBQKWQXAH2S86EZZ48TDQM1WTSK7PNV5JMZDA, amount: u1000000000000, memo: none} {to: 'SPX0YVRCJFEM9H209T9XEPM65H0AB1RS0PKKB0WY, amount: u1000000000000, memo: none} {to: 'SP1NQ0WG5PTB7M2N3PNNPG5XFD7N14VXKHZ9NQP08, amount: u1000000000000, memo: none} {to: 'SP3SKH6YB515J76KVDHDHBTE2GQ4CV6QJHC5GJKRF, amount: u1000000000000, memo: none} {to: 'SPSN6K776CXQBFSVM74W4SAR8W7HCQD6844FA4XC, amount: u1000000000000, memo: none} {to: 'SPZJYYG43RGD4R4RYPAN2FW2S7QNYCDMBATS8AQ9, amount: u1000000000000, memo: none} {to: 'SP13KWBHG40T4M9DT7CTPAN3NMSZ1VHPQD9C02ZNN, amount: u1000000000000, memo: none} {to: 'SP15PACQ139N2QYG75P8T9YTDSD4PS05DY83DS38Z, amount: u1000000000000, memo: none} {to: 'SP1AMQVCQPXJJXT1KJAJ4GHKVAS0HWZ5QFT7ZD20S, amount: u1000000000000, memo: none} {to: 'SP2416R73WPXQ7R4FZ0ESPA9YVWZ81SYFPN5R9ACK, amount: u1000000000000, memo: none} {to: 'SP2KAM4A6W2F7NNSA8W21WABP0QW5WANZ4QK67RNR, amount: u1000000000000, memo: none} {to: 'SP150WAXJ4RWQ1KN34C0EQ08AJSQTYZF7KAS0WCM2, amount: u1000000000000, memo: none} {to: 'SP2EZSPAFB11E18ZEA4BC39F34SGJYGBQHG5PYMSV, amount: u1000000000000, memo: none} {to: 'SP1WE6VQKVKYG5YW65WAQJMY29VGS36T51SPMA86D, amount: u1000000000000, memo: none} {to: 'SP1H63ZD200RZ7EMWR063QVHPYQ1T52XYNGSB5QNB, amount: u1000000000000, memo: none} {to: 'SP2QYSBD4GBDS1BMQNXMEQZXCB49K4QC64BDN7Z8N, amount: u1000000000000, memo: none} {to: 'SP3SQJFZMR65FJ1GRNT5KPCBE16DZBRJKJPRRD7X1, amount: u1000000000000, memo: none} {to: 'SPAA5YZ8NFWSKS8VFRC16N3AW92KZBTQHD64JQ17, amount: u1000000000000, memo: none} {to: 'SP1RV3E4VY136ZKKC38SJMY8ZTTC4R9ZX1ZGW6NJ2, amount: u1000000000000, memo: none} {to: 'SP3F0G1QZ7SGHFFB29XA7F6WQPJ15Z8XRWMJXAE22, amount: u1000000000000, memo: none} {to: 'SP31PJZ7TZVPWFQRWYST7WNCGMH35VRTGYRXPQV3, amount: u1000000000000, memo: none} {to: 'SP266QAPVM1W37P7XCM7T4MJMYG1CGWK53C793TSC, amount: u1000000000000, memo: none} {to: 'SP1103W7C2F60B1ADD6KDE9XJGP16YBNWY7ET63W8, amount: u1000000000000, memo: none} {to: 'SP13A1XES88T1VBVZ99YY9JB1NCADTJ3TR3T2EJN7, amount: u1000000000000, memo: none} {to: 'SP17M8VDZ7HS08QHX9F3DTGW6TGWZHCF7DSST1TYW, amount: u1000000000000, memo: none} {to: 'SP1J85A1ZK6S7E5ABNYBA5F9H8P49BH7C7VGY7WJH, amount: u1000000000000, memo: none} {to: 'SP1RF48CZESEQSWTDQ2NEGX3NNVXKBQ9SDMXR2PZ8, amount: u1000000000000, memo: none} {to: 'SP1RVVZ6ASEK9NGMJRYJZ5W3TNTK6HCGSK3TDYNJM, amount: u1000000000000, memo: none} {to: 'SP1X2BE9518Q7AC69G7AM3FMP8F51PA0HKSFXQSHP, amount: u1000000000000, memo: none} {to: 'SP1XH78Z62C6ZB5DJ2X7NB2K4E5RVC2AV1KBV22MN, amount: u1000000000000, memo: none} {to: 'SP1Y7CZMK5EPXPCGTGWAW7BYPHKRWZ810CFKY51TD, amount: u1000000000000, memo: none} {to: 'SP255NCNXMFQS2B6R0Q44C238TRM9WYMQ5A2HCEXP, amount: u1000000000000, memo: none} {to: 'SP2BTMRZDQF4DG426H4C755Y326XN4K2WK9QBQXDS, amount: u1000000000000, memo: none} {to: 'SP2M75H525KRHC4RK2Q4KWETNMF6ET78J3TS565E8, amount: u1000000000000, memo: none} {to: 'SP2ZMR2PV9PXZJYFGD9XTFK17EV5J5BRVS0GK98QX, amount: u1000000000000, memo: none} {to: 'SP2ZVMJPEXP83G3VCVVR5NDH3NRNW77FKZ1S4VYHH, amount: u1000000000000, memo: none} {to: 'SP37AYEP259ER30DWN0DQSWZ69CTRSECVWSDKJPW9, amount: u1000000000000, memo: none} {to: 'SP37WYJM5JHY0BCZ1DM32YZMBJWQ1RY5SG1VT5C4E, amount: u1000000000000, memo: none} {to: 'SP3A82Y231J9MPW4G8YX4M7EBXQC4HKMJFHHF5DQ7, amount: u1000000000000, memo: none} {to: 'SP3CPMGQNXZ3645PF168TRN3NKB1NY4QE39E4ZA3T, amount: u1000000000000, memo: none} {to: 'SPFF53AA1P84VC4QYGYJVG015YH8T6CXESTWTMRH, amount: u1000000000000, memo: none} {to: 'SPK42JR8Q2VNVBC8SAM1M2BQ5SEZC0JPZ295Z62Z, amount: u1000000000000, memo: none} {to: 'SPQRJEBEVBY8K90QQ42JX71YFVX8Y6YGQ09RXJS9, amount: u1000000000000, memo: none} {to: 'SPRHCQH9DZPXKGQDMAB4CXT65722JCD1BTT6MRKC, amount: u1000000000000, memo: none} {to: 'SPVYSWPFMPA26JZNYDG0JWMZWPGXSGF328C91R3V, amount: u1000000000000, memo: none} {to: 'SP2TY9X86C054TVPW2B0098NPVC9VCVJ7GQ83DGQN, amount: u1000000000000, memo: none} {to: 'SP2H1DVNCG7P15N2J2TAZ9NY00TFN6JRX9B95PB14, amount: u1000000000000, memo: none} {to: 'SP2PHGTC4DQYVX32JHFZT7WJED070MDXTR5JY3F74, amount: u1000000000000, memo: none} {to: 'SP24F8K9GZWY1PRX75ZZPZ0SXEM8VBS9BA5P988M2, amount: u1000000000000, memo: none} {to: 'SP2VEP75T5X58TDMTBSVH86RH95XFNKAHHJRQSG9A, amount: u1000000000000, memo: none} {to: 'SP3RHH6MRYNMDRWVVEZ0AW20CY6ACX9H90XMK8DZA, amount: u1000000000000, memo: none} {to: 'SP172QQY5W9WPA4YF9YBD9VETDKCN09Z05MJ7KXCV, amount: u1000000000000, memo: none} {to: 'SP3PDWEB65GV4N4W1W0ERD4Q047M10TF72ZBRSPMN, amount: u1000000000000, memo: none} {to: 'SP2BC85N6MZ18G6W81TF5M520WWSMC4YAB3QQV3HV, amount: u1000000000000, memo: none} {to: 'SPX7Z21BD3HR8VXQE6NS38KX6PY7V184KDVVYMZW, amount: u1000000000000, memo: none} {to: 'SP16CRECT5YVJ1WEEWGABXH730VQG87PNC2YHF1GK, amount: u1000000000000, memo: none} {to: 'SP2FY8MV3EZVRTG2Q9J1KMMRVKC86DQ00BGGCQJXQ, amount: u1000000000000, memo: none} {to: 'SP173DQFFPYT5Y4EP5XAFW6A2GV23QXM2T9M264XW, amount: u1000000000000, memo: none} {to: 'SP2YXR5VK3HQ3KY7P4VE5HSNNJ19ER34JQN3K3HH1, amount: u1000000000000, memo: none} {to: 'SP3G5MSRX1RRJDJTHP3T8H6A8NEHMJB90XH31G3FK, amount: u1000000000000, memo: none} {to: 'SP388K5MSDMTDMPH6STW0Z0AYSHQZX0TFCNAJBVT6, amount: u1000000000000, memo: none} {to: 'SPQJNX9CA6HQ3ZR9ERWNNDVNYX8Z777HHXRB3BNG, amount: u1000000000000, memo: none} {to: 'SP14EC92TSDM00CYS2KWKXYCK8XHAWGDDM9K758GX, amount: u1000000000000, memo: none} {to: 'SP1C9VHDNE5CJAN7FN45ERZWP5X9AST6A3M7JNC6G, amount: u1000000000000, memo: none} {to: 'SP8TD93CRXJ5GW9470B8TVSR7JK321VQCWK339EA, amount: u1000000000000, memo: none} {to: 'SP3H9VBZRVFH3MGSWWJCCNFEGNQS3DDCYQFQEFBBF, amount: u1000000000000, memo: none} {to: 'SP2C72R5ZP035N7F6EC72P4AM314H8EJNB2R3B70J, amount: u1000000000000, memo: none} {to: 'SP2PG4G9YF2ACHNA9FPD3A5MDTJ69XTDR1X8JJRZ4, amount: u1000000000000, memo: none} {to: 'SP1QT394J2R0R73Z8840NRXYE3H1NJRAHN5B3DYQQ, amount: u1000000000000, memo: none} {to: 'SP23DYBKECF0DHP8P7P2KYVZFHM768KXP8JCKCYRR, amount: u1000000000000, memo: none} {to: 'SP3QA0E24HECDRJY6PD1VA3CHHQAKFGN1A3MHPZDW, amount: u1000000000000, memo: none} {to: 'SP2CDETWV2QWHEC745ESFKQAWWT7WDVP8JFSJZNG0, amount: u1000000000000, memo: none} {to: 'SP2RGCKFNB5RSRY0QA3FQTS14W7ZMJQCPHSDA0618, amount: u1000000000000, memo: none} {to: 'SPDCC08CFQNYMGC7C1H3STQETKQE60JYREP32DQ6, amount: u1000000000000, memo: none} {to: 'SP1X003BW2N72V7WWWTM5KZVY06PRAH4CMQH4EY4X, amount: u1000000000000, memo: none} {to: 'SP2YYG5F3GKC2RWCQGFMSRAKS2BY5RCNZZMKV7BWD, amount: u1000000000000, memo: none} {to: 'SP3EYGY11CQFJ14GCJPC098VT6RMP6Q24534YBD7X, amount: u1000000000000, memo: none} {to: 'SP3XY2AW8VC3TA9VCC1JAX76JY31G0XFPZ6CMBNSR, amount: u1000000000000, memo: none} {to: 'SP1308WCZA8S00B8XT6774A61CFT20BNZCAHNM3H6, amount: u1000000000000, memo: none} {to: 'SP2AY8N3GZ1ZEF2VG5K4RME428HGFDH57MTGZ763V, amount: u1000000000000, memo: none} {to: 'SP34455SJ4NJ7MCKV7CN64JJTVDP3VZPMVT54BH57, amount: u1000000000000, memo: none} {to: 'SP2RWZXCC6MPWQ7MWKV3RKT72B5GD9HYWX320VZXF, amount: u1000000000000, memo: none} {to: 'SP2TF32NGET4BGX3S41YFC8JDT7T35ESD817G2XXB, amount: u1000000000000, memo: none} {to: 'SP1TFDEEE5JTY9VZYWDP1STWNTNXNQCED4ZAPN9D6, amount: u1000000000000, memo: none} {to: 'SP1ST9NA85RZQX2D3P5VEXDKE9WXDZRGKHB88A5CF, amount: u1000000000000, memo: none} {to: 'SP78064ZF3TDWDNX3AZ293DW0QJ6EX3TJVWENYPA, amount: u1000000000000, memo: none} {to: 'SPQPCXAAGGWH7N2AD8QGNRR4HFJPGW3NR7YA7YGZ, amount: u1000000000000, memo: none} {to: 'SP2D2EVXMT0EG03NTXKKEAP4X1DV7AR429690X7T6, amount: u1000000000000, memo: none} {to: 'SP3ZTW0J4FZHDVVH8RV3FCYW535FRQN495GV904EQ, amount: u1000000000000, memo: none} {to: 'SP37XZWB0DWXNKMT0172HHMWCK35VBBEK19DN2YYT, amount: u1000000000000, memo: none} {to: 'SPBSQFQ92BTHJBHFQ08N23D536X8MTFV3HJX9AAY, amount: u1000000000000, memo: none}))
(contract-call? 'SP2470N2A31DGDHX541MK2FKJSRHSCW907S5KKYTR.pepefork send-many (list {to: 'SPAEQBN2QWRZ8XV3G3ZW2HB8NZNPNE2CWQ092BX6, amount: u1000000000000, memo: none} {to: 'SPQ5GWZ5VWHT3EZ3VG2S7RFBFVEXD2Z4K9A721J7, amount: u1000000000000, memo: none} {to: 'SP3RWK1ZC3K03VP140TZTFBXBZ7KJCS4ATSG54H5F, amount: u1000000000000, memo: none} {to: 'SPMQAMQP7SD25HRENNHHRK38PY5M2AE6SWVZVY56, amount: u1000000000000, memo: none} {to: 'SP1MMDE7KYTA92TNN4B6D4XP895FNBXYFEHGXM8KF, amount: u1000000000000, memo: none} {to: 'SPZSGGQTG1SCFB59TTA4MC0R5P91W3DD8Z8PK83D, amount: u1000000000000, memo: none} {to: 'SP3GZ1W0DS5HMS5A6NMAYS61SZJ93TT7CF1CVF1EJ, amount: u1000000000000, memo: none} {to: 'SP125ZXAFYQM1G6VADFMQ0F920HE2C8JESQ4S4RJK, amount: u1000000000000, memo: none} {to: 'SP110MDCB25ZK3ZF35ZFDN39XP0FB5BKB3A54WJER, amount: u1000000000000, memo: none} {to: 'SP2F96E13TN1S10HJZRC87B7V2887DFSAHC04S051, amount: u1000000000000, memo: none} {to: 'SPHKNB2BHPZZJZAQND4ND16P9N5WRK4JCXDEBNEW, amount: u1000000000000, memo: none} {to: 'SPMY4W1ATY68Y51T9W3FM12CQRVKFC3FM6XX7ZR8, amount: u1000000000000, memo: none} {to: 'SP352KKZSQ3CB546EYB765P5P1HTGF7BGW7GGHV6J, amount: u1000000000000, memo: none} {to: 'SP7SHEREY1MWFRGB2WB3QQMBP4HJ9AJ8Q9ZB1YJM, amount: u1000000000000, memo: none} {to: 'SP3098GDKQE8ZDT6Y68GVV0Q9T7BNN8BYGZ2YEE7W, amount: u1000000000000, memo: none} {to: 'SP1XHTW5KW50WHPQ34Q9B48ZJ4TER32F157Z2H7TC, amount: u1000000000000, memo: none} {to: 'SP0194E00ZDH74PFA1J6444W1320WQ3XFQX14DM7, amount: u1000000000000, memo: none} {to: 'SP39QYDCS647Q0CZCHFRN9P2WFNY2PQBSAZVZ1JG0, amount: u1000000000000, memo: none} {to: 'SP3Z8GN0DZWH0S4T13HMK8JMFFQPMREBTTSYYK5D4, amount: u1000000000000, memo: none} {to: 'SP2RDM00SVCS68RZMRD5HX41RKTSN2XDAT5NN9JT1, amount: u1000000000000, memo: none} {to: 'SP35ZPRFSCA52PW0P9N52D2AWP9QWTFH8RFM23G44, amount: u1000000000000, memo: none} {to: 'SP319FKZDZ6EKA172FRC2V5FH9HDH5QPF9BCXRZXA, amount: u1000000000000, memo: none} {to: 'SP2N9H4SYTKKA0JJWRPB1YSZGDM4AK00PYRGAFXZA, amount: u1000000000000, memo: none} {to: 'SP38Y2CKXCQSAR1R7AMNYZD0GTDGD7S7V4GC5F2PX, amount: u1000000000000, memo: none} {to: 'SP2SWGRNR8R9TS13WCB41AM6D8JE5QWWXPSN2MEGD, amount: u1000000000000, memo: none} {to: 'SP3JYDVCKKTF40K6H3M5S2N7SX5QKNK07RRZ220M, amount: u1000000000000, memo: none} {to: 'SP15W9F3KC39ZHXS6Q3HA4J3VMXSVDWF4DSND7GAK, amount: u1000000000000, memo: none} {to: 'SP1HWD53NXP7Z48RME4QW2FZWW31XS6PFT40RFWKD, amount: u1000000000000, memo: none} {to: 'SP3JCNJGBXHJHHP6NYN3KTX8T2VBQM5GZED0FTP34, amount: u1000000000000, memo: none} {to: 'SPZ7YBW5J8Z43T6VKR4JSY4GV222RM5QXETBWA6Z, amount: u1000000000000, memo: none} {to: 'SP3ZN9DCJQKYXCMRJ767KPAZ1AVB3QZ1BBXC0D78Q, amount: u1000000000000, memo: none} {to: 'SP20FSVYH1HZJ6Y2R7KP7V4ZM48W2E9CDBBTJQF1Q, amount: u1000000000000, memo: none} {to: 'SP1NQSRDQE96HHG0D94YE3V36767QXXN9Q28HXCKJ, amount: u1000000000000, memo: none} {to: 'SPM06WJZPKE37MJWWGA6Z9SPVFDQW3WK3SGWGNSK, amount: u1000000000000, memo: none} {to: 'SP26XPN05SCG1Z8V5S1HXYTKZN7E8E4AZ13D4AFX6, amount: u1000000000000, memo: none} {to: 'SP2Z1WVYGECD7JY0SA9HKR10RDJBBQW9YGDK3PQ4P, amount: u1000000000000, memo: none} {to: 'SP1JBMAKQ8YH0B36PM799394NENGV1X7FSA6C42E0, amount: u1000000000000, memo: none} {to: 'SPBQ1FFAHDRZDDBXSFFBWJAJJ1SY91F4H2REK8WT, amount: u1000000000000, memo: none} {to: 'SP18FEGNAJPHMB1ZCDDRYJ92GCQW4DWWSZ72ZXHZ1, amount: u1000000000000, memo: none} {to: 'SP2EA3Q3BWP2XPB9FM41CC3RA1CY7MBVVEFGN36MX, amount: u1000000000000, memo: none} {to: 'SP1452QHZCTQNGK9AV8XH1NJBCYPW769N5SMFQ5BX, amount: u1000000000000, memo: none} {to: 'SP1QZ9SA1RJ1NQB5YEW3R78M8YVXBZNCA5TT1M2W1, amount: u1000000000000, memo: none} {to: 'SP390ATGDGQFHE5YEWKXHCGQVXNAQP25JAXXZMWSC, amount: u1000000000000, memo: none} {to: 'SPMBKGG134KK9Z8HKR0SMQEZJ0CRK2BJEN8VRY4Y, amount: u1000000000000, memo: none} {to: 'SP1C1HNXKT4Z37W8KR2JGGNDK99SR46AT7K05TD87, amount: u1000000000000, memo: none} {to: 'SP292V4NVXFG3NKMFKJFPZCN3SMY5HT9NY392Z8QA, amount: u1000000000000, memo: none} {to: 'SPZXFYJ5BHBBFA8VGDZFBZAWE5N9P1C676RVFM4W, amount: u1000000000000, memo: none} {to: 'SP1A5JT5K8ZA6AR6RDQ9VDTZ3A00Y83NASQN5KGZP, amount: u1000000000000, memo: none} {to: 'SP32F8Y3A4PP8GEJGMJ539TFX10TGFPZZA35FJKNK, amount: u1000000000000, memo: none} {to: 'SP2A526ZANMKC4C42KG5TMPZDYKYHWM2DKMRDSRMA, amount: u1000000000000, memo: none} {to: 'SP37FFFCKYG03HGS4DTRE2CGPP1RWMNN8R18M6K83, amount: u1000000000000, memo: none} {to: 'SP2ZH7DGE3W3KE6EYT065T484EA45GDBKVSN6B4HB, amount: u1000000000000, memo: none} {to: 'SP38RF024Z9PXFBATW4HQNJ7Y0GS44GSRCEX8PX3F, amount: u1000000000000, memo: none} {to: 'SPSSBCHRPNEKJ2DV5YAZMPRKDHDS657Q8XYK6QYK, amount: u1000000000000, memo: none} {to: 'SP2F5AY2922EDXKTFKVK9A659KM0VHFZT88ED46TN, amount: u1000000000000, memo: none} {to: 'SPBKBQB25WATMHJAJSEZ9MHG4A6QEHFT5H04JHTN, amount: u1000000000000, memo: none} {to: 'SP2C2EGS52E16KA6SJFZGQDD9KZXPVAAS5PXFR39X, amount: u1000000000000, memo: none} {to: 'SPE21KYHH2S8S41E5Z47M8Y0KGC699H1JV297APA, amount: u1000000000000, memo: none} {to: 'SP3GT29VT7J9HGN1TNN9950FMZ0FV6RAMKJHN10TG, amount: u1000000000000, memo: none} {to: 'SPVDVFYV3M4A1X58RKFXXJ0WT46AE6F2G8E65H8M, amount: u1000000000000, memo: none} {to: 'SP11G9YASR08GCAT235X98NQ6TSMFHSW2CRA6E4CF, amount: u1000000000000, memo: none} {to: 'SP2YER0QBSPTXNYSH86RPP5Z9FH780169ET2WTQNJ, amount: u1000000000000, memo: none} {to: 'SP084ZRFM9E5TX0HRGG8G7EBYP5FCV2V6D9S439C, amount: u1000000000000, memo: none} {to: 'SP2JGMY4A3Z7HQCMQF8704PK371F3HAPC1VVWSNKJ, amount: u1000000000000, memo: none} {to: 'SP2R8G14CWZ4HTQMFK53K9CS8XTP8JZDCGABFK4BF, amount: u1000000000000, memo: none} {to: 'SP2Y7SWJSBSFRVJKB1RZC5GC89CJ626H28CYC8D0J, amount: u1000000000000, memo: none} {to: 'SP360M58ENA5S5F679E15CC9SK5CK5T0J5J4Q2HWC, amount: u1000000000000, memo: none} {to: 'SP3GFRJD80DJMVR3YD689EK0XEG2Y9H7R7HDYBW6B, amount: u1000000000000, memo: none} {to: 'SP3NW356AMK4DX2YP717TQ1B8ZCWX53JBW0F6C0DB, amount: u1000000000000, memo: none} {to: 'SP3Z457N8Q8M8JYQCJAH33JEG8QGA6D5RW9G8VWJ8, amount: u1000000000000, memo: none} {to: 'SP237K5YW2RSQS5D0CCJ8ADSKVZPM5E62G59KXA9T, amount: u1000000000000, memo: none} {to: 'SP88VYYXB6WHM1NRPNJBP9ZMB4TPVJWNCAY3R1X8, amount: u1000000000000, memo: none} {to: 'SP2ACSH4G2M9JXWXQ49MYYM0K8XAWA1X3Z6Z709XW, amount: u1000000000000, memo: none} {to: 'SP1W06D34ET69H1TNYEDZZ5363A5JGY67XM9NPR57, amount: u1000000000000, memo: none} {to: 'SPXGGEV4RQ9VNDP5EJZF1S46JE7ECX5T18VM081K, amount: u1000000000000, memo: none} {to: 'SP3RDSQA76CY3CY9792ASY4V0SSC9CK0G763M3W1D, amount: u1000000000000, memo: none} {to: 'SP103X5H2AFB15718WPTXH86D0BW99REWTJ6PM7EQ, amount: u1000000000000, memo: none} {to: 'SP2R3VHCJF89D71AGB3FQMTHX57ZFDP0MJR7TJ1VP, amount: u1000000000000, memo: none} {to: 'SP2NGP3P1QZMWREA41Q6G78ETWCX6SEM7ST2VJD6R, amount: u1000000000000, memo: none} {to: 'SP3WQYFQ47HCTPBZTQ39TYXRPRJ34Z6M1TFCRDVDN, amount: u1000000000000, memo: none} {to: 'SP20C6C9H6YMG5AW6SRK2KN14V9FV6JQ7FR4K3H8Q, amount: u1000000000000, memo: none} {to: 'SP3SJCRT95S1P5DDQ8ZYW2CKXHF0Y3JBP5JG08BQV, amount: u1000000000000, memo: none} {to: 'SPWPA033H45XV50G5EAN8TVKXD6EH26HF5NFME77, amount: u1000000000000, memo: none} {to: 'SP38W27CWFSYSK3HKZK62BAEZV4019ZQV185X2ZKW, amount: u1000000000000, memo: none} {to: 'SP152VE0GRFTJQGTP385JV1PTARWCHPFHKDZYCY5, amount: u1000000000000, memo: none} {to: 'SP2H6KSPZ8B9MTC8PESHCA14J4AA16ZN706Y95WPE, amount: u1000000000000, memo: none} {to: 'SP24B77W7NZ924CVA4W9YYPV5Y6WRJRMY5Q8H8QXA, amount: u1000000000000, memo: none} {to: 'SP2Z8YZ7F4PNQ8ZX1PA96KC2DMBBS9GGD2CPM8JZ4, amount: u1000000000000, memo: none} {to: 'SP1Z6PGT6A38E8W6SHJF03JFC2BMRR8X3VQHBX8S8, amount: u1000000000000, memo: none} {to: 'SP23A1FJTDSBVJC56R2M8MZCABXMJVZ39R6DFK3DA, amount: u1000000000000, memo: none} {to: 'SP1QH5P4JZM6REXYTE2HJWGWRYXJSKAMWRRDYCVXJ, amount: u1000000000000, memo: none} {to: 'SP1H8B8Y0VTQCYP4A3RP3JKR0E02MSXZ5GV6356SF, amount: u1000000000000, memo: none} {to: 'SP3WGHEQEXD8HSNKPAAEH97W4XQPB9TZ0P7TVDGZZ, amount: u1000000000000, memo: none} {to: 'SP3VJEQE7QHZ2Z5G8K60PG2T23CW4RSY5PC9RMN4R, amount: u1000000000000, memo: none} {to: 'SP30CPSYXSFF6RSDB85ZHX91BA8SDXAVNYQE4DAXT, amount: u1000000000000, memo: none} {to: 'SP1NK10H0W90A69FN1P87YNGK0ZAPB65DZD8XH6PX, amount: u1000000000000, memo: none} {to: 'SPGSDWYMSA6FTYPMV542D19FTZ73A7WPYXKF1QWE, amount: u1000000000000, memo: none} {to: 'SP5ZW78EAJDHT9GY4MAJJAQVTV0FN0HMMB5SSVMP, amount: u1000000000000, memo: none} {to: 'SP1PQW8BE6EB2ZA831SRPZMEXCE6RGCYHCB1MMXRW, amount: u1000000000000, memo: none} {to: 'SP14KZA7FJ8G7DS2DHC38YY8XD7J5RA0R7ZJFZYZM, amount: u1000000000000, memo: none} {to: 'SP3AVYZXVHKZ59ECHTMVRGSP0Z2VVR0MQHYPS023M, amount: u1000000000000, memo: none} {to: 'SPS1WJG6TK3XRKYNQP01HWD9NXJK5KPP6XY7JN75, amount: u1000000000000, memo: none} {to: 'SP3P2Q74EQWSWYN5EJ2M1AHFY6TR74C76TE6Q0Y9P, amount: u1000000000000, memo: none} {to: 'SP1REMGXNAXSN6V8HREZKWSXX3KD8K9GWMP2EBQPH, amount: u1000000000000, memo: none} {to: 'SPXVJV807GEHG53436T3R1H72DCYHZK5YRPQHA41, amount: u1000000000000, memo: none} {to: 'SP86ZF6R6RA65QDC574V7JY2KB76V4M1GYBKA04S, amount: u1000000000000, memo: none} {to: 'SP3X2EQH5TM04PF5R7Q0T5P0MBD7D7PTS0NAZN3WN, amount: u1000000000000, memo: none} {to: 'SP1XTG7WM9VTKPS9NCX26D9QAB7VB60TPK9Z9CK6S, amount: u1000000000000, memo: none} {to: 'SP23SXTPYTG2FSKWDVT9STBNSQVNAQNQ1HSMQXJRG, amount: u1000000000000, memo: none} {to: 'SP1ZAYQG7D89VKCE0HMST402X06KCDBDC4DPW6WTD, amount: u1000000000000, memo: none} {to: 'SP2BPZHCBK2YD3T76QCJ0V9RWPJ0HE2WJYMBE31EF, amount: u1000000000000, memo: none} {to: 'SPFFH36C7REYVJBBYS7GRNZYDYT40247F7GW07E7, amount: u1000000000000, memo: none} {to: 'SP29MDQXF7QDDTA8QTFC35SKF6SJVPCX1K00SS32M, amount: u1000000000000, memo: none} {to: 'SPSNKAFA8RFADVYH31T7B0RVSGV95M6ARCJHKQ2J, amount: u1000000000000, memo: none} {to: 'SP17SYYX86G75EBGR291T16DE8E5XGSA15Z25D8K5, amount: u1000000000000, memo: none} {to: 'SP1EJZFQ4M933ZCNBCFSPD7RK72455HY63QFRZ97P, amount: u1000000000000, memo: none} {to: 'SPZBR3JHKX1E4FD5PPF9JGVFJET97CMSD1NZ95C5, amount: u1000000000000, memo: none} {to: 'SP2NR2XZN56GT2PM5XQ4QJQC5JJ5Z2YTYPJV7CJAX, amount: u1000000000000, memo: none} {to: 'SP2YZQC2JZCVSE3GPDY6KNCY9PRSASC382RQKQ2PM, amount: u1000000000000, memo: none} {to: 'SPC39CGC7AZDZMTR4AQ7HSQ0ZTWFJYXRRDB9QGWD, amount: u1000000000000, memo: none} {to: 'SP1SYSKX2DEBRCR1BB6A6KF02TR17880XA1ESW82Y, amount: u1000000000000, memo: none} {to: 'SPBYDYDRMRNG8ADJFS7812FB41GRRYWD26XP53QH, amount: u1000000000000, memo: none} {to: 'SP295QANJTGHJJ9TSHJ4WH28Z52VDKWDW68VT8KAH, amount: u1000000000000, memo: none} {to: 'SP2S7Y7BMX7Y73FHV3SV9W1EE63EQ98BE95PZ4C4E, amount: u1000000000000, memo: none} {to: 'SP2R5GMZFVGV0Z9AB4FJJKA4R6HQ4PWZNPRN69KVQ, amount: u1000000000000, memo: none} {to: 'SP2M7HW7T3WK072KSYQAFXWGJW504V1GB0S8FSFP0, amount: u1000000000000, memo: none} {to: 'SP240D4CTKWQZYC1HSXWD53ANFHFTB74QQDXVAA9D, amount: u1000000000000, memo: none} {to: 'SP1FRV07JWJCK8EJ37GM5SP92C9FXR5AND211HQC3, amount: u1000000000000, memo: none} {to: 'SP1SVBEGVVVHHJWEWSN3WVDJGTGNEN26M3A0H82VY, amount: u1000000000000, memo: none} {to: 'SP14QE9RZVAMTJ1CS0NKYDGXDGQ7MSM9Z2GXST3QM, amount: u1000000000000, memo: none} {to: 'SP2FZMQBEG8MKC85M5XCG9DYX80XZ95RSRM0BB15F, amount: u1000000000000, memo: none} {to: 'SP2G8J9XFKMPG838EQRGM00AXN107Z9GZ5M06F622, amount: u1000000000000, memo: none} {to: 'SP3T7AK2MVX1C3VB7YSV0H48HZRMV0B0QHJAB4N50, amount: u1000000000000, memo: none} {to: 'SPC0EYFPV6Y7PBX9FJ4JZ1NE5BPQ6SH7HVSYQVP4, amount: u1000000000000, memo: none} {to: 'SP26VYV7EPF8G9XD8YXVPA4RDMZVEMPCZN1TX40BH, amount: u1000000000000, memo: none} {to: 'SP3DW6Z9TZT6YYA2E8Q3BGXMMYESNQHAWCA3T2G4Y, amount: u1000000000000, memo: none} {to: 'SP1BZXABNDK1KNRADQ2EZFW8Z0V5GZCP6P2NF64QW, amount: u1000000000000, memo: none} {to: 'SP28T3SNY86D5AW62JJVP0TQR1H7TBZMP8R6B65RA, amount: u1000000000000, memo: none} {to: 'SP2B4C1QSRC4EY7PSEHK19S1YQ9QMRK7QJFYCKBYK, amount: u1000000000000, memo: none} {to: 'SP1S2Q2VHATDDB2745GMWCB7VXQ4S8H3G4FG6A2CW, amount: u1000000000000, memo: none} {to: 'SP2XM713A01HTWY93ST8K7D0HZYGBAFATW9YRYXHB, amount: u1000000000000, memo: none} {to: 'SP2884YHX62KC1YQFWTDDE45S4JXA222HHS0K75S, amount: u1000000000000, memo: none} {to: 'SPFF6TZK4Y9YZ1Y9K0K6ZDNX1HWQ8MYPMFZAY6N0, amount: u1000000000000, memo: none} {to: 'SP2RS0YJZ2QH5VYXQ91X06B9QYR90BNGJETWP0V69, amount: u1000000000000, memo: none} {to: 'SPCZEB3D1BC52SHGFW584KXN6M0SX0D16PGGK75E, amount: u1000000000000, memo: none} {to: 'SP392W61Q7WZ947RGWYZRHDPT7C3JS5FJMFRMX5MA, amount: u1000000000000, memo: none}))
(begin
	
	(try! (send-stx 'SP1FQ3DQDR5N9HJX3XC5DNKFCG4DHH48EFJQV6QH0 u2000000))
)
