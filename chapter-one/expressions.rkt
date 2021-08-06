#lang racket
(+ 137 349)
(- 1000 334)
(* 5 99)
(/ 10 5)
(+ 2.7 10)
; it an accomodate procerures that may take 
; an arbitrary number of arguments
(+ 21 35 12 7)
(* 25 4 12)
;nested operators
(+ (* 3 5) (- 10 6))
(+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6))
(+ 
    (* 3 
        (+ (* 2 4) (+ 3 5))
    ) 
    (+ (- 10 7) 6)
)