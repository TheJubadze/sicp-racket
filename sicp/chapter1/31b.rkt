#lang racket
(require rackunit)

(define (product f b)
  (define (iter a)
    (if (> a b)
        1
        (* (f a) (iter (+ a 1)))))
  (iter 1))

(define (factorial x) (product identity x))
(define (approxPi x)
  (define (getNum x)
    (if (odd? x)
        (/ (+ x 1) (+ x 2))
        (/ (+ x 2) (+ x 1))))
  (* (product getNum x) 4.0))

(define tolerance 0.01)
(check-true (< (- (approxPi 5000) 3.14)) tolerance)
