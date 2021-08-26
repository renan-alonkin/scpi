# Exercises 1.1
> What is the results printed by the interpreter in response to each expression?

``` racket
10
>>> 10
```

``` racket
(+ 5 3 4)
>>> 12
```

``` racket
(- 9 1)
>>> 8
```

``` racket
(/ 6 2)
>>> 3
```

``` racket
(/ 6 2)
>>> 3
```

``` racket
(+ (*2 4) (-4 6))
>>> 10
```

``` racket
(define a 3)
>>> creates the variable a
```

``` racket
(define a 3)
>>> creates the variable a with value 3
```

``` racket
(define b (+ a 1))
>>> creates the variable b with value 4
```

``` racket
(+ a b (* a b))
>>> 19
```

``` racket
(= a b)
>>> #f
```

``` racket
(if (and (> a b)(< b (* a b)))
    b
    a)
>>> 3
```

``` racket
(cond ((= a 4) 6)
    ((= b 4)(+ 6 7 a))
    (else 25))
>>> 16
```

``` racket
(cond ((= a 4) 6)
    ((= b 4)(+ 6 7 a))
    (else 25))
>>> 16
```

``` racket
(+ 2 (if (> b a) b a))
>>> 6
```

``` racket
(* (cond ((> b a) a)
        ((< a b) b)
        (else -1))
    (+ a 1))    

>>> 12
```

# Exercise 1.4
Observe that our model of evaluation allows for combinations whose operators are compund expressions. Use this observation to descrive the behavior of the following procedure: 

``` racket
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))
```

It will create a procedure that takes 2 values. It will verify if b is bigger than 0, if it is, it will take + (plus) as the operation, if it is not, it will take the - (minus) as the operation. 

For example, if the value of a is 1 and b is 3, it will do 1 + 3
But, if the value of a is 1 and the value of b is -3, it will do 1 - (-3)

TLDR: based on the if condition, it will decide what operator will be applied.

# Exercise 1.5

Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation.

He defines the following two functions:

``` racket
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))
```
Then he evaluates the expression

``` racket
(test 0 (p))
```
What behavior will Ben observe with an interpreter that uses applicative-order evaluation?

What behavior will he observe with an interpreter that uses normal-order evaluation?

## Answer: 

Applicative-order: 
it will evaluate the arguments (in this case 0 and (p)) and then apply. It will cause a loop, because the body of (p) is himself, so it will be calling himself infinitely: 
``` 
(test 0 (p)) -> REPLACES (p) for it's body -> (test 0 (p)) 
```

Normal-order:
In the normal order, it will expand first, and then reduce (try to solve). It will only apply the value of something WHEN IT IS NEEDED, so, it will expand and then replace it's values. 

0 - STARTS WITH
```
(test 0 (p))
```

1 - EXPANDS (in this case, test)
```
(if (= 0 0)
    0
    (p)
)
```
2 - Solving (= 0 0) returns #t
```
(if #t
    0
    (p)
)
```

Now, the condition already has a value, in this case `true`, so it will return 0.