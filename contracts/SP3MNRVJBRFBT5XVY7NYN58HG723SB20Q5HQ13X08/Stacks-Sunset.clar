(define-private (airdrop (id uint) (recipient principal))
    (begin
        (try! (contract-call? 'SP3MNRVJBRFBT5XVY7NYN58HG723SB20Q5HQ13X08.stacks-sunset claim))
        (try! (contract-call? 'SP3MNRVJBRFBT5XVY7NYN58HG723SB20Q5HQ13X08.stacks-sunset transfer id tx-sender recipient))
        (ok true)
    )
)

(airdrop u132 'SP27CFVZD59PV5NCKP83GWYR9ZJHMFTAEY0ZKHVGC)
(airdrop u133 'SP1697EFBW8FY52GFF1ETR7P7JH76T6M7ZQ2TR7FB)
(airdrop u134 'SP35HWRWVDA0WZF8XXMHVHXR3V9W727GY1E6XWFFX)
(airdrop u135 'SP30XER64D5C82776MFTD1TWPK0TW1MM1Q6RGCGE2)
(airdrop u136 'SP35NZ79098SAARHWRBEEARZSP67EGEZ2P7NF16Q2)
(airdrop u137 'SP3MYZ2T7JA4GYBYMSZ4ZJYEYTZ69JDD0M7W4BQ8V)
(airdrop u138 'SP97DHK27ZR0V8EG7FHARQTTZ2MWC5CK24C0Z8VH)
(airdrop u139 'SP2ZBTZAB34KR5RMNGZPWBVTCQZE4GJTZ186DPQ4)
(airdrop u140 'SP2YPZ62F5NRNWMJ5FM3T63WPJGRVVRBK2FSBNCBD)
(airdrop u141 'SP1GSH69J8R9MFWFB4MXPAF4KBHAR8AQ053BXCX81)
(airdrop u142 'SP2WTMSS20TP00QTW6DJ6DFQV1JP9V016BW565W61)
(airdrop u143 'SP28JP1FEVX7G3YFDJ59GKKQTZEVQQ49YDM0FDFK4)
(airdrop u144 'SP2N7TFCVHFQ7JE68JQ3961ZRWZGZE5XECFJK32N6)
(airdrop u145 'SP2KH39JNRZPBH3C0SGZJJHHAQEDA54SSSCQF8YW6)
(airdrop u146 'SP19GA0VBJBJWSVQRRBJ1SR35A3MR2SNM9Z6RN7W0)
(airdrop u147 'SPJ804FNXNK9AJZKSWV0HYNW7BTYX1MKMV592FVR)
(airdrop u148 'SPEJ9ZW0XYQHX2549BE2AEWTN9J51NW82FEAJC5V)
(airdrop u149 'SP2CR2DTTMMQS1BAB1E6A6PYWVNSHDAGRZ91RATZN)
(airdrop u150 'SP1CHWS7TDP36PPVWV8E4Q8QV7S8SZPYYWW9N0ZW8)
(airdrop u151 'SP4SFX7G58N196BZD588K44J2EKSA4TJ4WXGX45X)
(airdrop u152 'SP3HAW9SRDPN1F711XVYBQFFTHC88XB9BCQ1QPYRQ)
(airdrop u153 'SP2VKMPCJ5S1CCNFF78JY4G443XW7A0XBK1PHJ90R)
(airdrop u154 'SP1JJS4TZ4PX8CVEPQKXCQZN1GBA4TCQHNNKGB3WX)
(airdrop u155 'SP1HGF8SDK5NH9079ESM4B8AP15T40E154MWWQ2Q1)
(airdrop u156 'SPSER0Z6CXAKJKXNMDK9SDVEW0A0GX247FY99J5F)
(airdrop u157 'SP9WV66S8Y0BT09V35BGTZX770HN1FN30TC93B6M)
(airdrop u158 'SP3HE5HJP8JYSJN9S29KSSV34WHYT4YPZNF49J87V)
(airdrop u159 'SP1JHNQWYMCGV1X253PZAY4Y9N6ZGC4S592W6KX9T)
(airdrop u160 'SP3KXV3J6MRHAH4H89MDS390X1KS0GQN4DWQ5RFVB)
(airdrop u161 'SP6CG22E967ZVT6920M8ZREGEZE19E6DJR2QB9Z9)
(airdrop u162 'SP2CW7DNCNH6Q6V8C7S1X87M0NZ72E2MCMX6DPMY5)
(airdrop u163 'SPMB9FZ4J99Q8G7H4G36BX878MEPXCEBPR7E0Z6Z)
(airdrop u164 'SP2JW00T2NEE2R2NM6BD1MQHCTWH3MJK1C0ZBEDTJ)
(airdrop u165 'SP1RJC76DDEGTXEA21MNVDAV40Y4HW845C9J46RJS)
(airdrop u166 'SP1PBETK1GFBCKD79XKJ4HKCRQSD3QZM7BAMNP95Z)
(airdrop u167 'SP3QBNS08TQYS0GA6M5GPVMWNGCF53HQ7R13JVV77)
(airdrop u168 'SP1T5RXTHK80QBRJDJTRTX65AXAF0GHGFYAX0V12F)
(airdrop u169 'SP20HZR44TYTXJSNXYKYMMX4WGKCWTSE0N0JSJQDT)
(airdrop u170 'SPEH21DTN67ECXDRXG858XHBZMEBEBFE2FV79DEG)
(airdrop u171 'SP2XNPP7RQT4Q776BTQJP04RXZZTW06PRF4A0AA27)
(airdrop u172 'SPEJPGA20F341F0QT8M8AFA37F80KFRZXPDZ76ZN)
(airdrop u173 'SPGN1MV1HR1ECZYYQENGWFS57QEF0PCR2B05EJFD)
(airdrop u174 'SP3S2NPEZPHZNZNVE3JSRF8WKEB6YGVKASQG615Y6)
(airdrop u175 'SP3ERV4C3HE8K9SDEA82QXP1Z1J2218C3673CVHAK)
(airdrop u176 'SPACCQ8K3ZKXNAHTH14VEAFWY9E7BDP72DCNCZWP)
(airdrop u177 'SP2KW3RBM4X0H3SWBQAAXJ7G0G6FM2MWQMVDHSMV3)
(airdrop u178 'SP28XY0BD20WE84MX7D121MW9VZSBRTQPCERSYD9Q)
(airdrop u179 'SP1T5Q45P74BD1YX55X45Q5727TZFQF005KWMSBQ6)
(airdrop u180 'SP3G6FJZKYH7EGSTF4RWHF7CDE7EHNBAT32MMASZ5)
(airdrop u181 'SPNZ7YH2XGCHRWVG1E9SSH295Y8EGEFX4D50FQ8S)
(airdrop u182 'SP35MEYYBHSFCFXY296YGP7NAT6Y4XBJW2VETR8AV)
(airdrop u183 'SP26J9FM581KPWFB65YAV3WXQRBZZ51NJ36Z9508A)
(airdrop u184 'SP3ZKC10F6YJGKVT0P5VCSE1CKCJMAP1BFQN6NQ0M)
(airdrop u185 'SPA37W9MH35R59WK4XKGS82B7VQM9VERM4Q2F9BA)
(airdrop u186 'SP2FAFHWZAB8MRKDRDACVQSZVQ4BVF7K6DBCDBR2P)
(airdrop u187 'SP1A7V1J7HD9H99H0XCVGSGW3KJECSH5RQT1GYN0F)
(airdrop u188 'SP3H7FH0V2EDE3PRR600N4HZ9YZ3T6RNRJZNXM3KJ)
(airdrop u189 'SP31JJ58QAQGVFGCKXZ6QPV3XWATQNCNSJQC3BNWZ)
(airdrop u190 'SPTPZCYAYT808GW381T60J4HH2TMM3Z63DQQ3DGX)
(airdrop u191 'SPF3THQMHCJW3JNV1MQF5C3RM7XJJE3Q9RQXESGA)
(airdrop u192 'SPVWA1QEA4XGWEN0YCV31HCC92Y025XXY4C7F6YQ)
(airdrop u193 'SP2MA07XZ816092VH2FYP3TNM3ECBY4Q2QMX3TWND)
(airdrop u194 'SP3A8AVK2R7KKQ5E8Q1REHNS7WSNPZR3PGVVREAQS)
(airdrop u195 'SP10XK7F9BCVS8853HQT01HARD1NJ8K8V5KEBR2QS)
(airdrop u196 'SP16H5R1ZDFJQ7FE3ZYZKGFD8QTGPAGVEYWQXJMS5)
(airdrop u197 'SP31HB1WAEZ4T0KCVS9F5CD2Q5X4K8CCY09S5HEJJ)
(airdrop u198 'SP2E4JE5BXQ6XVG86D2BBKSK3N9W49TEMY12CAATF)
(airdrop u199 'SP10G4Z9BHWYMDYFEWNBGNB49ZM9ZWK1HFDVVK419)
(airdrop u200 'SP250T71VBB3HR5GDY4D0K3JXPF46YMTZJ1AJAJ1T)
(airdrop u201 'SPMEYB2NMKGHRV7FD279JHTPATP5WRBK2TD0KC3P)
(airdrop u202 'SP16C7B7B6ZPXCTT5MHSG00WB0JG0R87YH12PDV6T)
(airdrop u203 'SP39TED65CSN3WS1K1SPMDNXV4VZ8Y4KXBPZK4HW)
(airdrop u204 'SP7V77KWZ6S1E4Y2HB5Z82JJHPVZ4C7MWJYDGDSY)
(airdrop u205 'SP20BG6DH4NEVAADQX5FMWQMGPYWMVKVAM4VA9P1P)
(airdrop u206 'SP317ERC604C6NSX1WACVMKCHTS8N86BHABZWJG7W)
(airdrop u207 'SPP28QCMZ51GVN9933VFH9TXKQ3XCT4WE5A07533)
(airdrop u208 'SP39AC2S7R786P4Z0GNC84Q2QSQ35DQGX50EDDFVR)
(airdrop u209 'SP2ZXDBYT1RSP98ZZXXRDGKX3TMXCCCGERNBD5YMY)
(airdrop u210 'SPYD3CHEBSJAAZ6V9RX1Q6QYSYNFFPTHX9RPF2GH)
(airdrop u211 'SP2SSHDSGHHEQN1A7Z0RP0YJ6QECE8TGQTYN594PM)
(airdrop u212 'SP23JFNQRHWNXK40R9ZSS4NK8T2GCHSEGCKEJX3NM)
(airdrop u213 'SP1BKF56Z4YZKBZEMDCW3V824VBPZHGR27BSQC0C3)
(airdrop u214 'SP3GC5NKQQ6N30H9TMDNPWCQ2JWNRDF9MAYSWFG2S)
(airdrop u215 'SP1DPNP3RRD6JG1557SP6JMX68W5BV6R2Z74BQEXV)
(airdrop u216 'SP1X524DYD5G1SRP5NPVW5EWFRTAY8DEEJGK490FN)
(airdrop u217 'SP4TTJT90ZKZP5NVVFNYB8NPD4JDA0QWHQFTK5V0)
(airdrop u218 'SP3X6AVP6MR0DK7EMAW0XT2KF5FEXWKF27CQWVGKT)
(airdrop u219 'SP3C1BEY1E0C4RMEZ30VYWXV5JK8F89A5AH33BY1Y)
(airdrop u221 'SPVCJJPSESD1Z677N4PD2NDGDJKZB1SDN0DP2Q9S)
(airdrop u222 'SP26S1RM13VP3FAFK0BEM4MXJ611JT1AQZZ89A1CK)
(airdrop u223 'SPX9AVXYA6JW4DK6DNW3XJZECR74MBPGB5X4PSF5)
(airdrop u224 'SP119JG3J5PNVZ3C2T3A3E228G5S3C28HNTN42SSV)
(airdrop u225 'SP2EAJ6Y0STA70HBJF4V2DVRHEZZ50RXYHB2HP73K)
(airdrop u226 'SP1MES8GV834HB09CWG6B38YCRZX7EPE26Q8P9Z79)
(airdrop u227 'SPXGA1M0XE3DD84VFF4KDYNZ8WS3W7079Z6PVBQX)
(airdrop u228 'SP3SZ0YY1PNVD15TS3TY6GPKFG80Z77G1MDWSV0TW)
(airdrop u229 'SP3A9VWDMGN2CJT90917R6RG17M24KSHTKG25YSEE)
(airdrop u230 'SP2B2VSVPZPNWG7P1ZM4B0J2G1FSWJAZ6NWCKY5X1)
(airdrop u231 'SPQ2HN9TYF8ZYY9D3G45NGYA9GHA6QZHQ8AXF5QM)