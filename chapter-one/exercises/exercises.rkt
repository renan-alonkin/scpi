#lang racket
; Exercise 1.1
(define a 3)
(define b (+ a 1))
a
b

(+ a b (* a b))
(= a b)

(if (and (> a b)(< b (* a b)))
    b
    a)

(cond ((= a 4) 6)
    ((= b 4)(+ 6 7 a))
    (else 25))

(+ 2 (if (> b a) b a))

(* (cond ((> b a) a)
        ((< a b) b)
        (else -1))
    (+ a 1))    

; Exercise 1.2
(/
    (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
    (* (- 6 2) (- 2 7))
)

; Exercise 1.3
(define (sum-of-two-squares a b)
    (+ (* a a) (* b b)))

(define (sum-sqr-of-biggest-two x y z)
    (cond
        [(or 
            (and (>= x y) (>= y z)) 
            (and (>= y x) (>= x z))
        ) (sum-of-two-squares x y)]
        [(or 
            (and (>= y z) (>= z x)) 
            (and (>= z y) (>= y x))
        ) (sum-of-two-squares y z)]
        [(or 
            (and (>= z x) (>= x y)) 
            (and (>= x z) (>= z y))
        ) (sum-of-two-squares z x)]))

(sum-sqr-of-biggest-two 1 2 3)
(sum-sqr-of-biggest-two 10 1 9)
(sum-sqr-of-biggest-two -1 -3 0)

; Exercise 1.4

(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

(a-plus-abs-b 2 3)

; Exercise 1.6

(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
    (else else-clause)
    )
)

(define (square x)
    (* x x))

(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
    )
)

(define (sqrt x)
    (sqrt-iter 1.0 x))

(sqrt 4)