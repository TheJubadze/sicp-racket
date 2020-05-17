#lang racket/base
(require rackunit)
(define (f n) (
  if (< n 3) 
    n 
    (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))
)

(define (fi n) 
  (define (iter acc1 acc2 acc3 x)
    (if (= x 0) 
      acc3
      (iter (+ acc1 (* 2 acc2) (* 3 acc3)) acc1 acc2 (- x 1))
    )
  )

  (if (< n 3) 
    n 
    (iter 2 1 0 n)
  )
)

(check-equal? (fi 7) 142)

