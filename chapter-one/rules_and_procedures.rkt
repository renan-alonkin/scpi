#lang racket

; 1. Evaluate the subexpressions of the combination
; 2. Apply the procedure that is the value of the leftmost
; subexpression(the operator) to the arguments that are the 
; values of the other subexpressios (the operands)

(* (+ (* 4 6))
    (+ 3 5 7))

; Procedures

(define (square x) (* x x))

; The general form of a procedure is:
; (define (<name> <formal parameters>) <body>)

(square 21)
(square (+ 2 5))
(square (square 3))

(define (sum-of-squares x y)
    (+ (square x) (square y)))

(sum-of-squares 3 4)

(define (f a)
    (sum-of-squares (+ a 1) (* a 2)))

(f 5)

; Conditionals or case analysis
(define (abs x)
    (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(abs -4)
(abs 0)
(abs 4)

(define (abs-with-else x)
    (cond ((< x 0) (- x))
        (else x)))

(abs-with-else -4)
(abs-with-else 0)
(abs-with-else 4)

; Predicate consequent alternative approach
(define (abs-alternative x)
    (if (< x 0)
        (- x)
        x))


(abs-alternative -4)
(abs-alternative 0)
(abs-alternative 4)

; Compound predicates
(and (> x 5) (< x 10))

(define (>= x y)
    (or (> x y) (= x y)))

; Alternatively:
; (define (>= x y)
;     (not (< x y)))