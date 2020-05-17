#lang racket/base
(require rackunit)
(define (fast-expt b n) 
    (define (iter a in) 
     (if (<= in 0) 
       a
       (iter (* a b) (- in 1))
     )
    )
    (iter 1 n)
 )
   
 (check-equal? (fast-expt 2 10) 1024)
 (check-equal? (fast-expt 2 11) 2048)
