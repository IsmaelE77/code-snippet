#lang racket/base
(define (square x) (* x x))
(define (runtime) (current-inexact-milliseconds))
(require racket/trace)



(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))


(define (carmichael-test n)
   (carmichael-iter n 2))


(define (carmichael-iter n a)
  (cond ((= a n) #t)
        ((= (expmod a n n) a) (carmichael-iter n (+ a 1)))
        (else #f)
        ))
                    
         
(carmichael-test 561)
(carmichael-test 1105)
(carmichael-test 1729)
(carmichael-test 2465)
(carmichael-test 2821)
(carmichael-test 6601)


