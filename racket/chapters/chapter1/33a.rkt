#lang racket
(require rackunit)

(define (accumulate combiner null-value term a next b filter)
  (define (iter acc a)
    (if (> a b)
        acc
        (iter (if (filter a)
                  (combiner (term a) acc)
                  acc)
              (next a))))
  (iter null-value a))

(define (sq x) (* x x))
    
(define (smallest-div n) 
  (define (divides? a b) 
    (= 0 (remainder b a))) 
  (define (find-div n test) 
    (cond ((> (sq test) n) n) ((divides? test n) test) 
          (else (find-div n (+ test 1))))) 
  (find-div n 2))

(define (prime? n) (if (= n 1) false (= n (smallest-div n))))

(define (sumOfSquares a b)
  (accumulate
   +
   0
   sq
   a
   (lambda (x) (+ x 1))
   b
   prime?))

(check-equal? (sumOfSquares 1 100) 65796)

