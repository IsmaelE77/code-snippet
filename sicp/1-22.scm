#lang racket/base
(define (runtime) (current-inexact-milliseconds))

(define (square x) (* x x))

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

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time) n)
      #f))

(define (report-prime elapsed-time n)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start-range n)
  (if (even? start-range)
      (search-for-primes (+ 1 start-range) n)
      (if (= n 0)
          (display "\n")
          (if (timed-prime-test start-range)
          (search-for-primes (+ 2 start-range) (- n 1))
          (search-for-primes (+ 2 start-range) n))
           )))


(display "primes larger than 1000")
(search-for-primes 1000 3)
(newline)
(display "primes larger than 10,000")
(search-for-primes 10000 3)
(newline)
(display "primes larger than 100,000")
(search-for-primes 100000 3)
(newline)
(display "primes larger than 1,000,000")
(search-for-primes 1000000 3)

