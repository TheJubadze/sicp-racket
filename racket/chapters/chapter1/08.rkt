#lang racket/base
(require rackunit)
(define (abs x) 
  (if(< x 0) (- x) x)
)

(define (square x) (* x x))

(define (avg x y) (/ (+ (/ x  (square y)) (* y 2)) 3.0))

(define (iter x y) 
  (if (< (abs (- (avg x y) y)) 0.00000000000000000000000000001)
    y
    (iter x (avg x y)))
)

(define (scube x) (iter x 1.0))

(check-equal? (scube -27) -3.0)
(check-equal? (scube 27) 3.0)
(check-equal? (scube 64) 4.0)
(check-equal? (scube 8) 2.0)
