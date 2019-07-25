#lang racket/base
(require rackunit)

(define (sum-of-squares-of-top-two a b c)
  (define (sqrt a)
    (define tolerance 0.00001)
    (define (abs x) (if (< x 0) (- x) x))
    (define (iter guess)
      (define newGuess (/ (+ guess (/ a guess)) 2))
      (if (< (abs (- guess newGuess)) tolerance)
          newGuess
          (iter newGuess)))
    (iter 1.0))

  (define (sq x) (* x x))
  
  (if (> a b)
      (if (< b c)
          (+ (sq a) (sq c))
          (+ (sq a) (sq b)))
      (if (> a c)
          (+ (sq b) (sq a))
          (+ (sq b) (sq c)))))

(check-equal? (sum-of-squares-of-top-two 1 2 3) 13)
(check-equal? (sum-of-squares-of-top-two 3 4 2) 25)
(check-equal? (sum-of-squares-of-top-two 5 3 4) 41)
