(define-data-var v int 0)
(define-private (s (i int)) (var-get v))
(define-private (t (i int)) (begin (map s (list 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)) (ok i)))
(define-private (u (i int)) (begin (map t (list 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)) (ok i)))
(define-public (apply (id (list 200 int))) (begin (map u id) (ok true)))