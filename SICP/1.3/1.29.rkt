#lang racket

(require "./common.rkt")

(define (integral-simp f a b n) 
    (define even_n (if (even? n) 
                    n
                    (+ 1 n)))
    (define h (/ (- b a) even_n))

    (define (term k) (
        * (f (+ a (* k h)))
        (if (or (= k 0)
                (= k even_n))
            1
            (if (even? k) 2 4))
    ))

    (* (/ h 3) (sum term 0 inc even_n))
    
)
