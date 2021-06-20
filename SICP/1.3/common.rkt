#lang racket

(define (sum term a next b)
    (if (> a b) 
    0
    (+ (term a) 
        (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (even? n) (= 0 (remainder n 2)))

(define (inc n) (+ n 1))

; overriding prevs
(define (sum-iter term a next b)
  (define (iter a result)
    (if (= a b)
        result
        (iter (next a) (+ result (term (next a))))))
  (iter a (term a)))

(provide (all-defined-out))
