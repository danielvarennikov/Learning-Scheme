#lang racket
;some useful set functions

;find if a set contains a certain element
(define (contains? element theList)
  (cond
  ((null? theList) #f)
  ((eq? element (car theList)) #t)
  (else (contains? element (cdr theList)))))

;find if a set is contained in another set
(define (contained? set1 set2)
  (cond
  ((null? set1) #t)
  ((contains? (car set1) set2) (contained? (cdr set1) set2))
  (else #f)))

;check if a list is a set (contains no duplicates)
(define (set? input)
  (cond
  ((null? input) #t)
  ((contains? (car input) (cdr input)) #f)
  (else (set? (cdr input)))))

;union of two sets
(define (union set1 set2)
  (cond
  ((null? set1) set2)
  ((contains? (car set1) set2) (union (cdr set1) set2))
  (else (union (cdr set1) (cons (car set1) set2)))))

;instersection of two sets
(define (intersection set1 set2)
  (intersect set1 set2 (list )))

(define (intersect set1 set2 answer)
  (cond
  ((null? set1) answer)  
  ((contains? (car set1) set2) (intersect (cdr set1) set2 (cons (car set1) answer)))
  (else (intersect (cdr set1) set2 answer))))

