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

## Exercise 1.22 (also see [1.22.rkt](1.22.rkt))

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
Prime starting in 1,000,000,000 takes:
1063ms
Prime starting in 10,000,000,000 takes:
3301ms
diff = 3.105x
roughly sqrt(10) = 3.16
matches expectation

## Exercise [1.23](1.23.rkt)

difference

```lisp

(define (smallest-divisor n) (find-divisor n 2))

(define (next test-divisor) (if (= test-divisor 2) 3 (+ test-divisor 2)))

(define (find-divisor n test-divisor)
  (cond 
    ((> (square test-divisor) n)
     n)
    ((divides? test-divisor n)
     test-divisor)
    (else
     (find-divisor n (next test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))

(define (square n) (* n n))

```

Prev Algo for 1000000000000000000:
25143772
Current Algo for 1000000000000000000:
14438864

57% of the time
ideally 2x improvement since we are checking for only half of the number
most likely due to extra procedure call adding some time  

## Exercise [1.24](1.24.rkt)
(switched pc)
cannot test solution for 1.24 with larger numbers than ~1,000,000,000 since that'll be greater than the input size for random number generator  

|Solution | 1,000 | 1,000,000,000|
|----|----|----|
|1.22|39|2379|
|1.24|36|49|

yes the end result is roughly matching expectation since even though we increased input size to 1,000,000 times, the time it took is only 1.36x which would be ~log(n)

## Exercise [1.25](1.25.rkt)

skipping for now


## Exercise [1.26](1.26.rkt)

Since scheme uses application order exercution; the eplicit multiplication requires the exp to be calculated twice before the multiplication is evaluated vs with square where the parameter is evaluated and then the multiplication is evauated.  

The original growth was O(log(n)) -> with the multiplication doubling its work it becomes O(log(2^n)) -> O(nlog(2))  -> O(n)

## Exerise [1.27](1.27.rkt)

