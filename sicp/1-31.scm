#lang sicp

;(define (product term a next b)
;  (if (> a b)
;      1
;      (* (term a)
;         (product term (next a) next b))))

(define (product term a next b)
  (define (iter a res)
    (if (> a b)
        res
        (iter (next a) (* res (term a)))))
  (iter a 1))
        

(define (factorial x)
  (define (identity a) a)
  (define (next a) (+ a 1))
  (product identity 1 next x))

(define (square x) (* x x))

(define (pie n)
   (define (pi-term n) 
   (if (even? n) 
       (/ (+ n 2) (+ n 1)) 
       (/ (+ n 1) (+ n 2))))
  (define (add-2 x) (+ 2 x))
  (* (product pi-term 1 inc n) 4))

(pie 6)