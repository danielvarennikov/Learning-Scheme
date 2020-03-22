#lang racket

;A UFO landing animation
;Coordinate (0,0) is the top left corner of the screen

;Import GUI libraries
(require 2htdp/universe 2htdp/image)

;Our frame coordinates
(define WIDTH 600)
(define HEIGHT 600)

;When we reach the end of the frame stop the animation
(define (landed current-state) 
  (>= current-state 585))

;UFO image
(define IMAGE-of-UFO ...)

;Increment #current-state# by 3
(define (add-3-to-state current-state) 
  (+ current-state 3))

;Create an empty panel with coordinates WIDTH*HEIGHT
;Draw a UFO at: (WIDTH/2,current-state)
(define (draw-a-ufo-onto-an-empty-scene current-state) 
  (place-image IMAGE-of-UFO (/ WIDTH 2) current-state 
               (empty-scene WIDTH HEIGHT)))

;The engine
;Every clock tick add 3 to the height of the UFO and draw it
(big-bang 0
      (on-tick add-3-to-state)
      (to-draw draw-a-ufo-onto-an-empty-scene)
      (stop-when landed))

