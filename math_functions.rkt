#lang racket
;Some useful mathematical functions

;x>=y
(define (>= x y)
  (cond
    ((or (= (- x y) 0) (> (- x y) 0)) #t)
    (else #f)))

;x<=y
(define (<= x y)
  (cond
    ((or (= (- x y) 0) (< (- x y) 0)) #t)
    (else #f)))

;x!
(define (factorial x)
  (cond
    ((= x 0) 1)
    ((= x 1) x)
    (else (* x (factorial (- x 1))))))

;x^y
(define (^ x y)
  (cond
   ((= y 0) 1)
   ((= y 1) x)
   (else (* x (^ x (- y 1))))))

;e
(define (e) (taylorE 0))
;find 'e' using its polinomial representation
(define (taylorE k)
  (cond
    ((>= k 100) 0)
    (else (+ (/ 1 (factorial k)) (taylorE (+ k 1))))))

;pi
(define (pi) 3.141592653589793238462643)

;cos(x)
(define (cos x) (taylorCos 0 x))
;find cos(x) using its polinomial representation
(define (taylorCos k x)
  (cond
    ((>= k 10) 0)
    (else (+ (/ (* (^ -1 k) (^ x (* 2 k))) (factorial (* 2 k)))  (taylorCos (+ k 1) x)))))

;sin(x)
(define (sin x) (taylorSin 0 x))
;find sin(x) using its polinomial representation
(define (taylorSin k x)
  (cond
    ((>= k 10) 0)
    (else (+ (/ (* (^ -1 k) (^ x (+(* 2 k) 1))) (factorial (+ (* 2 k) 1)))  (taylorSin (+ k 1) x)))))

;|x|
(define (abs x)
  (cond
    ((> x 0) x)
    ((< x 0) (- x))
    ((= x 0) 0)))

;average of x and y
(define (average x y) (/ (+ x y) 2))

;x^2
(define (square x) (* x x))

;root(x)
(define (root x) (findRoot 1 x))
;find root(x)
(define (findRoot temp number)
  (cond
    ((<= (abs (- number (square temp))) 0.1) temp)
    (else (findRoot (average (/ number temp) temp) number))))