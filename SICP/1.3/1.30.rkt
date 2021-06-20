#lang racket

(require "./common.rkt")


(define (sum-iter term a next b)
  (define (iter a result)
    (if (= a b)
        result
        (iter (next a) (+ result (term (next a))))))
  (iter a (term a)))