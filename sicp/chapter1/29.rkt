#lang racket/base
(require rackunit)

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (iter counter)
    (if (or (= counter n) (> counter n))
    0
    (+ (y counter) (iter (+ counter 2)))))

  (* (/ h 3) (+ (y 0) (* 4 (iter 1)) (* 2 (iter 2)) (y n))))

(define (cube x) (* x x x))

(define tolerance 0.0001)
(check-true (< (- (integral cube 0.0 1.0 1000) 0.25)) tolerance)
