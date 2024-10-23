;;;;;;;.;MM;;MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM;;
;;;;;;;;MM;;MMMMMMMMMMMMMM................MMMMMM....MMMMMMMM.....MMMMMMMMMMMM;..MMMMMMMMMMMMMMMMM;;
;;;;;;;.MM;;MiMMMMMMMMMMMM.;;iM..MMMMMMM;.MMMMMi;i...MMMMMMM.;.;..;;;;;;MMM;i;..;iMM;.;;;;;;iM.;..;;
;;;;;;;;MM.MiMMMMMMMMM.MMMi.;.M..Miii.;;i;MMMMi.;M..;;MMMMMMi;.M...;;;;MMM..M...;MMMMM..;;;;MM.M.;.;
;;...;;MMM.MMMMMMMiMMMMMMMMM;.M..MMMMMiiM;MMMM.;.MM...MMMMMMi;.MM...;;MMM..M;;.;MMMMMiM..;;;MM.M.;M;
;;.....MM;;MMMMMiMMiMMiMiMMM;.M..MMMMMMMMMMMMM.;MMMM..;MMMMMM;.MMM;..;MM.;M;M;.;iMMMMMMMM..;MM.i.;M;
;;.....MM;.MMMMMMMMMMMMMMMM;;.M..MMMi.;MMMMMMi;iMMMM...;MMMMM;.MMMM;..Mi;M;M.;..iMMMMMMMMM..MM.i;.M;
;;.....MM;.;iMMMMMMMMMMMMM;M;.M..;MMMM;MMMMMi;.;..;.M...MMMMi;.MMMMM....i..;i;..iMMMMMMMMMi;.iii;.M;
;;.;..;MM;;M.MM.iMMMMMMMMMMM..M..;;M;;;MMMMM.;M;M.;;.M..;MMMi;.MMMMMM;.M;.M;i;..MMMMMMMMMMiM.iii;.M;
;;..;;;iM;.;i.MM.MiiiMMMMMMM;.M..i;;;M;MMMMi;.;;;;;;;;;;;MMMMMM..;MMMi;.MMMMM.M...;i;.;...MMMi.i;;M;
;;.;;;;MM;;MMM.iMMiMMM.iMMMM;.M..Mi..M;MMMM..M;...........MMi;.MMMi.;iM.;Mi;.;..iM;MMM;MM..;Mi.M.;.;
;;.;;;;ii;;;MMMMiMMiMi.;iMMi;.M..MMMMMMMMMi;i;Mi....;;.M..;Mi;.;.MMi;;i;;Mi;.;.;MMi;;MM;.;;;Mi.M..;;
;;.;;;;MiM.MMMMMMiMMM.i;MMM.;.M..MMMMMMMMi;.M;MMMMMMi;;.;.;MM;.;.MMMi.i;MMi;.M.;;M.iMi..;.;;Mi.;.;;;
;;;MMMMM.M.MMMMMMMMMMM.;MMM.;.M..MMMMMMMM.;i;;MMMMMMM.;;i;..i;...;MMMMMMMMi;.M..MM.MM;;;;;;Miii;..;;
;;..MMMMiM.;M.MMMMMMMMMM;Mi.;.M..MMMMMMMi;i;.MMMMMMMMi;.M...MiM..;;MMMMMMM.iM;..;iM;;;;;;;;iM.M.;i;;
;;;.;;;Mii;;M.iMMMMMMMMM.M;.MM;;..MMMMi;.M;;;.MMMMMMMi.MMMMMMM;;M;MMMMM;MiiMMMMMMMMMMMMMMMMii.;..;;;
;;;;;MMMM.M.MM;.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMiM.;M;;;
;;;.MMMMM.M;;;i;.MMMMMMMii;MMM;..MMMMMMMM;MMMMMMMMMMMMMMMMMMMMMMMMM;MM;.MM;iMMM;.;;;;;;.Miiii..;;;;;
;;;;.MMMMM.M.M;i..MMMMMMMiiMMMM.i.M;MMMMMMMMMMMMMMMMMMMMMMMMMMM.M;MM;M;;;i;Mi;M.;;;;;;;MM.M.M.;M;;;;
;;;;;MMMMMiM;.MMM..iMMMMMMii;M;MMiMMMMMMMMMMMMMMMMMMM;MMMMMMMMM.MM;;MMM;.;.;.M.;;;;;;;MM.M.M;.M;;;;;

(define-private (trans (address principal) (amount uint))
    (contract-call? 'SP3SMQNVWRBVWC81SRJYFV4X1ZQ7AWWJFBQJMC724.fam transfer amount tx-sender address none)
)

(trans 'SP2A0VW071VE5QXZ9699FK29F0XXQ0B8AQ5BSC431 u625000000)
(trans 'SPGGAEQWA7Y9HRZY5T0XJCEYEZ28J6RKCCC1HP9M u625000000)
(trans 'SP2T5GKQ81YJHCWEFVG4390B5FR8CGBJFE6S0GM2M u625000000)
(trans 'SP15TQ8ZC38KT0DBE1Z359KH7R8SX2QWJ0GTDT91X u625000000)
(trans 'SP2DBAHGK0QA9QYJ74630285N1M0Z9F90HCJ6QVMD u625000000)
(trans 'SP2FV945F0818B99WSJWTNY4VXSED2W7V0GEMSHKQ u625000000)
(trans 'SP2T2YCP677B907YQC1PGJ4F5K5MTRT2QB073Z8GQ u625000000)
(trans 'SP3ANWJVVKYEH20BRCHZZDD45ZJGZM9Q1CKXKD9NF u625000000)
(trans 'SP12H47A1JH7B3XN7GWZ0X6DZ385N6K5QNC8K1A2T u625000000)
(trans 'SP2BXK29DV08ZFG86ZFT2JXPHC326A29BNTJ8PD5G u625000000)
(trans 'SPWRJ6AQRYR8E68GS8XP3TGM33FBA898E08PM1MD u625000000)
(trans 'SP10ECZKBTMVGV9Z41A9QQP80TQFZK2QRSV5BWNMX u625000000)
(trans 'SP2VG2XRJP2FH1AXK2B0B5NCDCSNW1WYC3PXN787J u625000000)
(trans 'SP12C2285NTBNZH38SAAPVBDCQMWT2J2SYKC1KDC3 u625000000)
(trans 'SP2T5GKQ81YJHCWEFVG4390B5FR8CGBJFE6S0GM2M u625000000)
(trans 'SP1QBW9E73D2HWW68YBXV9H58DS63WWWX2E8ZR2GX u625000000)