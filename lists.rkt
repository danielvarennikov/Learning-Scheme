#lang racket
;list operations

;find the 'n'th element of the list
(define (get n input)
   (cond
   ((null? input) (display "illegal argument"))
   ((= n 0) (car input))
   (else (get (- n 1) (cdr input)))))

;find the length of the list
(define (length input)
  (cond
  ((null? input) 0)
  (else (+ 1 (length (cdr input))))))

;append two lists
(define (append list1 list2)
  (cond
  ((null? list1) list2)
  (else (append (cdr list1) (cons (car list1) list2)))))

;find if a list contains a certain element
(define (contains element theList)
  (cond
  ((null? theList) #f)
  ((eq? element (car theList)) #t)
  (else (contains element (cdr theList)))))

;check if one list is contained in another
(define (contained? list1 list2)
  (cond
  ((null? list1) #t)  
  ((contains (car list1) list2) (contained? (cdr list1) list2))
  (else #f)))

;checks if two lists are equal by their values
(define (equals? list1 list2)
  (cond
  ((and (contained? list1 list2) (contained? list2 list1)) #t)
  (else #f)))

