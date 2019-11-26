#lang racket
(define (pow x n)
  (if (= n 1) x
      (* x (pow x (- n 1))))
  )

(define (cubic a b c)
  ((lambda (x)
     (+
      (pow x 3)
      (* a (pow x 2))
      (* b x)
      c))
   )
  )
