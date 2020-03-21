#lang racket

;A number guessing game
;Start the game by entering (start #lower_bound# #higher_bound#)
;Think of a number between #lower_bound# and #higher_bound#
;Each turn the computer will guess a number using the binary search mechanism
;If the number you thought of is higher type (bigger)
;If the number you thought of is lower type (smaller)

;Variable declarations
(define lower 0)
(define upper 0)

;The starting function
;Gets #lower_bound# and #higher_bound#
;Call (guess)
(define (start n m)
  (set! lower (min n m))
  (set! upper (max n m))
  (guess))

;The engine function
(define (guess)
  (quotient (+ lower upper) 2))

;Compute the average number -1
;Assign it to upper
;Call (guess) again
(define (smaller)
  (set! upper (max lower (sub1 (guess))))
  (guess))

;Compute the average number +1
;Assign it to lower
;Call (guess) again
(define (bigger) 
  (set! lower (min upper (add1 (guess))))
  (guess))