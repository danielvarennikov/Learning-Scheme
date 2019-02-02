#lang racket
;find the n'th number in the fibonaci sequence

;using tree recursion
(define (fibTree n)
  (cond
  ((or (= n 0) (= n 1)) 1)
      (else (+ (fibTree (- n 1)) (fibTree (- n 2))))))

;using iterative recursion
(define (fibIter n)
  (fibCount 1 0 n))

(define (fibCount a b counter)
  (cond
    ((= counter 0) a)
    (else (fibCount (+ a b) a (- counter 1)))))

