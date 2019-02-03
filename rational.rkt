#lang racket
;rational numbers using pairs(cons)

;create a rational number
(define (rational a b) (cons a b))

;top part
(define (numer x) (car x))
;bottom part
(define (denom x) (cdr x))

;print a rational number
(define (print_rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;define all the arithmethic operations with rational numbers:
;plus
(define (plus_rat a b)
  (rational (+ (* (numer a) (denom b)) (* (numer b) (denom a))) (* (denom a) (denom b))))

;minus
(define (minus_rat a b)
  (rational (- (* (numer a) (denom b)) (* (numer b) (denom a))) (* (denom a) (denom b))))

;multiply
(define (multiply_rat a b)
  (rational (* (numer a) (numer b)) (* (denom a) (denom b))))

;divide
(define (divide_rat a b)
  (rational (* (numer a) (denom b)) (* (numer b) (denom a))))

