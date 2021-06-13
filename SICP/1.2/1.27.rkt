#lang sicp


(define (even? n) (= (modulo n 2) 0))

(define (square n) (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (carmichael? int) 
    (define (try n a) 
        (cond ((= a 1) #t)
        ()

    ))
)