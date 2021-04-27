### Exercise 1.1.  

#### Below is a sequence of expressions. What is the result printed by the interpreter in response to each expression? Assume that the sequence is to be evaluated in the order in which it is presented.
```
10                                  //10
(+ 5 3 4)                           //12
(- 9 1)                             //8
(/ 6 2)                             //3
(+ (* 2 4) (- 4 6))                 //6
(define a 3)                        //value a (3)
(define b (+ a 1))                  //value b (4)
(+ a b (* a b))                     //19
(= a b)                             //false
(if (and (> b a) (< b (* a b)))     //4
    b
    a)
(cond ((= a 4) 6)                   //16
      ((= b 4) (+ 6 7 a))
      (else 25))
(+ 2 (if (> b a) b a))              //6
(* (cond ((> a b) a)                //16
         ((< a b) b)
         (else -1))
   (+ a 1))
```

### Exercise 1.2.  
#### Translate the following expression into prefix form
![stuff](https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/ch1-Z-G-3.gif)
```
(/ (+ 5 4 (- 2 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7))
```

### Exercise 1.3.  
#### Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
```
(define (square x) (* x x))
(define (gtr x y) (if (> x y) x y))
(define (squaresum x y) (+ (square x) (square y)))
(define (largersquare x y z) (squaresum (gtr x y) (gtr x z)))
```