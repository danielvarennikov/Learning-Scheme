#lang racket

;A GUI number guessing game





;;;;;;;;;;;;;;;;;IMPORTS AND CONSTANT;;;;;;;;;;;;;;;

;Import the GUI libraries
(require 2htdp/universe 2htdp/image)

;The structure that holds the number bounds
(struct interval (small big))

(define TEXT-SIZE 20)
(define WIDTH 600)
(define HEIGHT 600)
(define TEXT-X 20)
(define TEXT-UPPER-Y 10)
(define TEXT-LOWER-Y 500)
(define SIZE 72)

;The help text constants
(define HELP-TEXT 
  (text "UP arrow for larger numbers, DOWN arrow for smaller ones" 
        TEXT-SIZE 
        "black"))

(define HELP-TEXT2 
  (text "Press = when your number is guessed; q to quit." 
        TEXT-SIZE 
        "black"))

;The display color
(define COLOR "red")

;The background scene
;Place the images created by the HELP-TEXT on top of the empty scene
(define MT-SC 
  (place-image/align 
   HELP-TEXT TEXT-X TEXT-UPPER-Y "left" "top" 
   (place-image/align 
    HELP-TEXT2 TEXT-X TEXT-LOWER-Y "left" "bottom"
    (empty-scene WIDTH HEIGHT))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;;;;;;;;;;;;;;;;;;;;;;;;;;;The main function;;;;;;;;;;;;;;;;;;;;;;;;;
;Creates an interval structure with the #lower# and #upper# variables
;When a key is pressed, deal-with-guess function is invoked
;When the game finishes the render-last-scene function is invoked
(define (start lower upper) 
  (big-bang (interval lower upper)
  (on-key deal-with-guess) 
  (to-draw render)  
  (stop-when single? render-last-scene)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;All the possible key options
;Keys are represented as strings
(define (deal-with-guess w key) 
  (cond [(key=? key "up") (bigger w)] 
        [(key=? key "down") (smaller w)] 
        [(key=? key "q") (stop-with w)] 
        [(key=? key "=") (stop-with w)] 
        [else w]))

;Create a new struct with lower upper bound
(define (smaller w) 
  (interval (interval-small w) 
            (max (interval-small w) (sub1 (guess w)))))

;Create a new struct with higher lower bound
(define (bigger w) 
  (interval (min (interval-big w) (add1 (guess w))) 
            (interval-big w)))

;Get the middle of the bounds (The computers guess)
(define (guess w) 
  (quotient (+ (interval-small w) (interval-big w)) 2))


;Place the guessed number in the middle of the frame 
(define (render w)
  (overlay (text (number->string (guess w)) SIZE COLOR) MT-SC))

;Place an "End" word in the end of the game
(define (render-last-scene w)
  (overlay (text "End" SIZE COLOR) MT-SC))

;Cheks if the number is found
(define (single? w) 
  (= (interval-small w) (interval-big w)))