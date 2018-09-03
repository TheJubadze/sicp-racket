#lang racket/base
(require rackunit)

(define (pascal r el)
    (cond 
        ((or (= el 1) (= el r)) 1)
        ((and (> el 1) (< el r)) (+ (pascal (- r 1) (- el 1)) (pascal (- r 1) el)))
    )
)

(check-equal? (pascal 15 7) 3003)

