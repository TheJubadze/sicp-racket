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

(define (gcd a b) (if (= b 0) a (gcd b (remainder a b))))

(define (inc x) (+ x 1))

(define (prodOfPos b)
  (accumulate
   *
   1
   identity
   1
   inc
   b
   (lambda (x) (and (> x 0) (= (gcd x b) 1)))))

;;Assertion (from solutions)
(define (relative-prime? m n) (= (gcd m n) 1)) 
  
(define (product-of-relative-primes n) 
  (define (filter x) 
    (relative-prime? x n)) 
  (accumulate * 1 identity 1 inc n filter)) 
;;=========================

(check-equal? (prodOfPos 10) (product-of-relative-primes 10))
(check-equal? (prodOfPos 100) (product-of-relative-primes 100))

