#lang sicp
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (add-2h a) (+ a h h))
  (* (/ h 3)
     (+ (f a)
        (* 4 (sum f (+ a h) add-2h b))
        (* 2 (sum f a add-2h b))
        (f b))))

(simpson cube 0 1.0 100)
(simpson cube 0 1.0 1000)
