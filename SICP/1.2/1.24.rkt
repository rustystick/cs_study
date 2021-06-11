

#lang sicp
(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond 
    ((> (square test-divisor) n)
     n)
    ((divides? test-divisor n)
     test-divisor)
    (else
     (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (square n) (* n n))

(define (prime? n) (= (smallest-divisor n) n))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (display n)
  (newline)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline)
  #t
  )

(define max_count 3)

(define (find-prime start_num)
  (define (iter curr_num count max_count)
    ((cond 
       ((< count max_count)
        (if (timed-prime-test curr_num)
            (iter (if (even? curr_num) (+ curr_num 1) (+ curr_num 2)) (+ count 1) max_count)
            (iter (if (even? curr_num) (+ curr_num 1) (+ curr_num 2)) count max_count))))))
    (iter start_num 0 max_count))