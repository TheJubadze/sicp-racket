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

(define (factOdd x)
  (accumulate
   *
   1
   identity
   1
   (lambda (x) (+ x 1))
   x
   (lambda (x) (not (= (remainder x 2) 0)))))

(check-equal? (factOdd 9) 945)

