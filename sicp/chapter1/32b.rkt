#lang racket
(require rackunit)

(define (accumulate combiner null-value term a next b)
  (define (iter a)
    (if (> a b)
        null-value
        (combiner (term a) (iter (next a)))))
  (iter a))

(define (fact x) (accumulate * 1 identity 1 (lambda (x) (+ x 1)) x))

(define (pi x)
  (define (getNum x)
    (if (odd? x)
        (/ (+ x 1) (+ x 2))
        (/ (+ x 2) (+ x 1))))
  (* (accumulate * 1 getNum 1 (lambda (x) (+ x 1)) x) 4.0))

(define tolerance 0.01)
(check-true (< (- (pi 5000) 3.14)) tolerance)
