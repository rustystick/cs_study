## Exercise 1.20

```lisp
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
```
```lisp
> (gcd 206 40)
 (if (= 40 0) 
     206
     (gcd 40 (remainder 206 40)))

> (gcd 40 (remainder 206 40))
 (if (= (remainder 206 40) 0) 
     40 
     (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
*1

> (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
 (if (= (remainder 40 (remainder 206 40)) 0 )
     (remainder 206 40)
     (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
*2

>(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
  (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0))
      (remainder 40 (remainder 206 40))
  (gcb (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
* 4

> (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
  (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
  (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ( (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))))
*7
> (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
*4
2
```
total remainder count = 18

number of times for application evaluation = no. of iteration = 4

## Exercise 1.21

```lisp
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
    n)
    ((divides? test-divisor n)
    test-divisor)
    (else (find-divisor 
           n
           (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n) (* n n))
```
output takes considerably more amount of time // scales with sqrt(n)

```lisp
; prime test
(define (prime? n) (= (smallest-divisor n) n))

;timer 
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

; loop to 
(define max_count 3)

(define (find-prime start_num)
  (define (iter curr_num count max_count)
    ((cond 
       ((< count max_count)
        (if (timed-prime-test curr_num)
            (iter (if (even? curr_num) (+ curr_num 1) (+ curr_num 2)) (+ count 1) max_count)
            (iter (if (even? curr_num) (+ curr_num 1) (+ curr_num 2)) count max_count))))))
    (iter start_num 0 max_count))

```
Prime starting in 1,000,000 takes:
58ms
Prime starting in 10,000,000 takes:
98ms 

most likely due to interpreter's optimizations and the use of multicore?? 