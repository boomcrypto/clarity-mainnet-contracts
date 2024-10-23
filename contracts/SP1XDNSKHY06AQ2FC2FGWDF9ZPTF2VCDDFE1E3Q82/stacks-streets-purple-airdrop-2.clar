(define-private (airdrop-purple (id uint) (recipient principal))
    (begin
        (try! (contract-call? 'SP1XDNSKHY06AQ2FC2FGWDF9ZPTF2VCDDFE1E3Q82.stacks-streets-purple claim))
        (try! (contract-call? 'SP1XDNSKHY06AQ2FC2FGWDF9ZPTF2VCDDFE1E3Q82.stacks-streets-purple transfer id tx-sender recipient))
        (ok true)
    )
)

(airdrop-purple u800 'SP1PSTA73FRSRK0KZAWBCM9KRXHVE3RY255E3VZ3N)
(airdrop-purple u801 'SP3K0R9VYW9M6W6KH7TRR1C9P9GZ6KYCEQ0N4CKV2)
(airdrop-purple u802 'SP2P61YTEYQJFY93VQ05WPMGZWPZ49DBAK12G45P7)
(airdrop-purple u803 'SP3ENAG8BCZWE9V8KZRRFB167J13G31YPP893V86P)
(airdrop-purple u804 'SPHR6AQM483RCN6RQZA82B21FWA2SDXXHBA9K99S)
(airdrop-purple u805 'SP1HWQZYMGSS457QFT9ZSTF8ERSF85J6RVCTF9VNV)
(airdrop-purple u806 'SP1V6B4ZR0GYZW3QJDH8FN80J5QFWGZD67BQNJ9TK)
(airdrop-purple u807 'SP2NASZZG35X4MN3BHB7XETABMV4BYYATJQ3T6VF3)
(airdrop-purple u808 'SP3S701XZZ0Y8NGRS0DQQDC2W2RWEJZ6FMXXBYRJ9)
(airdrop-purple u809 'SP2CWKGNX1E1XT4F7W56KQZGMZ3MNQWHGDPGVA00G)
(airdrop-purple u810 'SP1B91GFYNYWG1AH2V0RPVE0FRAK1ZXPQNR7JXD3Z)
(airdrop-purple u811 'SP3T1M18J3VX038KSYPP5G450WVWWG9F9G6GAZA4Q)
(airdrop-purple u812 'SP3TAQCT0KQ1TC9E6XJ33J26XPG1DGSPS61M61H9G)
(airdrop-purple u813 'SP20E0RC1NWFVD6A2QC8Z4CTWK7X5FKFCB6M6P6W4)
(airdrop-purple u814 'SP2GCY336SKSPC62HR4CNFKCHNRHEYYSCSF567AWK)
(airdrop-purple u815 'SP1V28XNZ3WQ4CTSJV1KZ5BTGCY8DVX7WQ7JDJHEJ)
(airdrop-purple u816 'SP3YHVAR9CP9QD2D2HNJ5RH7NT5GXE2X4GXNX4YPX)
(airdrop-purple u817 'SP2YHQQXYD4N36MAEKC1AZ38BBQB3DQ9JKR5CSVPP)
(airdrop-purple u818 'SP211HBRWHK00ENTGVYS1ZB8VXDDHZN5GKBN3E2J6)
(airdrop-purple u819 'SP3W1EY9XBBCP2RG1J6A42WJNP4FAK4D8SVT4AB5V)
(airdrop-purple u820 'SP2T395ZMA7X6N3JQ5VRKCME0D4DZQVM84M8AAKT1)
(airdrop-purple u821 'SP33K2SBGZMXC6H2CEV95GRKT9W4HGJ601TZWBF49)
(airdrop-purple u822 'SP1KD2BS98HCAEZQB3A4AXNS2KNAFTXF2CTJBQWF6)
(airdrop-purple u823 'SP357CWMN96FPVKKBVDZSBAXKXXEZCM476Q3WF1KT)
(airdrop-purple u824 'SP234NYXB20YQBVXANCXFAETTN214VHHGZ3AVTCED)
(airdrop-purple u825 'SP4DECYJ7TF1RKBEZHBXNH2HHWYZD05AV0EF10XR)
(airdrop-purple u826 'SP1WY797HNM6FV6PA2N4CQ594B150FXYAJTK9Z69H)
(airdrop-purple u827 'SP1FARHKYYEEDY9ZDXJ1Z26ADSA2MCDQ4PES1VXJH)
(airdrop-purple u828 'SP198PWYC5RCV34H0PN68P9ZKEN1FJ76YPXRK55QX)
(airdrop-purple u829 'SP16YT2WWWS8MY3JXM3YVRW6TW1MG8DN22Z3HQRCQ)
(airdrop-purple u830 'SP28XCW4CPMYSYC5CPB6JGSMD7FWTS4CZPKDT0E7K)
(airdrop-purple u831 'SP27MZBX3CZT2YTH7RDK2F07TJEC6908D2SKKECST)
(airdrop-purple u832 'SP37C5HG6VYTMPBDNQA3RB1M5AWP8T4J8Z212GK6Z)
(airdrop-purple u833 'SP2Z7EPPAQGCVSTSKG13DT6YRN8X21HVD83Y5YH1N)
(airdrop-purple u834 'SP1D23WK7FC0KWTZ3N2NXVYFKB2EKEQN96W7448M5)
(airdrop-purple u835 'SP234B77ASFG4XZ7ZXH76Q9GQ15VVBZHXRWCNDTCW)
(airdrop-purple u836 'SP22ZJRC926622B5PZCP0PCJ3Z913VRH27AAEFCJF)
(airdrop-purple u837 'SP3P6M3FXWPYAKGJ0CK7PCGAB516Z0ERM8D3E1XED)
(airdrop-purple u838 'SP38NQK6SY5T9J0V28AVV9NDGJ2DYXCYQ4F5Y8MPQ)
(airdrop-purple u839 'SP1PC6WXVD09CFE57MHZNK8YTE75P24EWFNRWY43Y)
(airdrop-purple u840 'SP3SC4SYN1Q26XET641SNNDYBW3GQ9M90PDC9373K)
(airdrop-purple u841 'SP1362DHKF2DQY2KR07XSZ0EEYH8P9YW9Y3KE79MQ)