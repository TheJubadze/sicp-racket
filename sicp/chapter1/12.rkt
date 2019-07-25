#lang racket/base
(require rackunit)

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (pascal r el)
  (cond 
    ((or (= el 1) (= el r)) 1)
    ((and (> el 1) (< el r))
     (+ (pascal (- r 1) (- el 1)) (pascal (- r 1) el)))))

(check-equal? (f 1) 1)
(check-equal? (f 2) 2)
(check-equal? (f 3) 4)
(check-equal? (f 4) 11)
(check-equal? (f 5) 25)
(check-equal? (f 6) 59)
(check-equal? (f 7) 142)

(check-equal? (pascal 1 1) 1)
(check-equal? (pascal 2 2) 1)
(check-equal? (pascal 3 2) 2)
(check-equal? (pascal 4 2) 3)
(check-equal? (pascal 5 2) 4)
(check-equal? (pascal 5 3) 6)
(check-equal? (pascal 15 7) 3003)

