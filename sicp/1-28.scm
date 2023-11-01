#lang racket/base
(define (square x) (* x x))

(define (remainder-square-checked x m)
  (if (and (not (or (= x 1)
                    (= x (- m 1))))
           (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))



;just check even because miller test used (n-1) that is even , more detail in https://wiki.hsoub.com/Algorithms/prime_numbers
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder-square-checked (square (expmod base (/ exp 2) m)) m) 1)
        (else
          (remainder (* base (expmod base (- exp 1) m))m))
        ))

(define (miller-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((miller-test n) 
         (fast-prime? n (- times 1)))
        (else #f)))


(fast-prime? 561 10)
