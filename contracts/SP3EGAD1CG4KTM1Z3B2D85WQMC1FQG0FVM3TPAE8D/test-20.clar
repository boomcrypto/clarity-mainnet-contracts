;; constants
(define-constant ERR-NOT-AUTHORIZED u401)
(define-constant CONTRACT-OWNER tx-sender)

;;(define-data-var holders (string-ascii 256) "hi")


;;;;;;;;;;;;;;

(define-read-only (get-vault-by-id (vault-id uint))
  (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-vault-data-v1-1 get-vault-by-id vault-id)
)


(define-read-only (get-debt-for-vault (vault-id uint))
  (let ((vault (get-vault-by-id vault-id))) (ok (get debt vault)))
)

(print (get-vault-by-id u1806))
(print (get-vault-by-id u1807))
(print (get-vault-by-id u1808))
(print (get-vault-by-id u1809))
(print (get-vault-by-id u1810))
(print (get-vault-by-id u1811))
(print (get-vault-by-id u1812))
(print (get-vault-by-id u1813))
(print (get-vault-by-id u1814))
(print (get-vault-by-id u1815))
(print (get-vault-by-id u1816))
(print (get-vault-by-id u1817))
(print (get-vault-by-id u1818))
(print (get-vault-by-id u1819))
(print (get-vault-by-id u1820))
(print (get-vault-by-id u1821))
(print (get-vault-by-id u1822))
(print (get-vault-by-id u1823))
(print (get-vault-by-id u1824))
(print (get-vault-by-id u1825))
(print (get-vault-by-id u1826))
(print (get-vault-by-id u1827))
(print (get-vault-by-id u1828))
(print (get-vault-by-id u1829))
(print (get-vault-by-id u1830))
(print (get-vault-by-id u1831))
(print (get-vault-by-id u1832))
(print (get-vault-by-id u1833))
(print (get-vault-by-id u1834))
(print (get-vault-by-id u1835))
(print (get-vault-by-id u1836))
(print (get-vault-by-id u1837))
(print (get-vault-by-id u1838))
(print (get-vault-by-id u1839))
(print (get-vault-by-id u1840))
(print (get-vault-by-id u1841))
(print (get-vault-by-id u1842))
(print (get-vault-by-id u1843))
(print (get-vault-by-id u1844))
(print (get-vault-by-id u1845))
(print (get-vault-by-id u1846))
(print (get-vault-by-id u1847))
(print (get-vault-by-id u1848))
(print (get-vault-by-id u1849))
(print (get-vault-by-id u1850))
(print (get-vault-by-id u1851))
(print (get-vault-by-id u1852))
(print (get-vault-by-id u1853))
(print (get-vault-by-id u1854))
(print (get-vault-by-id u1855))
(print (get-vault-by-id u1856))
(print (get-vault-by-id u1857))
(print (get-vault-by-id u1858))
(print (get-vault-by-id u1859))
(print (get-vault-by-id u1860))
(print (get-vault-by-id u1861))
(print (get-vault-by-id u1862))
(print (get-vault-by-id u1863))
(print (get-vault-by-id u1864))
(print (get-vault-by-id u1865))
(print (get-vault-by-id u1866))
(print (get-vault-by-id u1867))
(print (get-vault-by-id u1868))
(print (get-vault-by-id u1869))
(print (get-vault-by-id u1870))
(print (get-vault-by-id u1871))
(print (get-vault-by-id u1872))
(print (get-vault-by-id u1873))
(print (get-vault-by-id u1874))
(print (get-vault-by-id u1875))
(print (get-vault-by-id u1876))
(print (get-vault-by-id u1877))
(print (get-vault-by-id u1878))
(print (get-vault-by-id u1879))
(print (get-vault-by-id u1880))
(print (get-vault-by-id u1881))
(print (get-vault-by-id u1882))
(print (get-vault-by-id u1883))
(print (get-vault-by-id u1884))
(print (get-vault-by-id u1885))
(print (get-vault-by-id u1886))
(print (get-vault-by-id u1887))
(print (get-vault-by-id u1888))
(print (get-vault-by-id u1889))
(print (get-vault-by-id u1890))
(print (get-vault-by-id u1891))
(print (get-vault-by-id u1892))
(print (get-vault-by-id u1893))
(print (get-vault-by-id u1894))
(print (get-vault-by-id u1895))
(print (get-vault-by-id u1896))
(print (get-vault-by-id u1897))
(print (get-vault-by-id u1898))
(print (get-vault-by-id u1899))
(print (get-vault-by-id u1900))