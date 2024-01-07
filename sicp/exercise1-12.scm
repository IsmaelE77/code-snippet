#lang sicp

(define (pascal x) (pascal-row x 1))

(define (pascal-row row i)
  (if (> i row)
      '()
      (begin
        (row-elements i 1)
        (newline)
        (pascal-row row (+ i 1)))))

(define (row-elements row i)
  (if (> i row)
      '()
      (begin
        (display (element row i))
        (display "  ")
        (row-elements row (+ i 1)))))

(define (element row x)
  (cond ((or (= x 1) (= x row)) 1)
        ((or (< x 1) (> x row)) 0) 
        (else 
         (+ (element (- row 1) (- x 1 )) (element (- row 1) x)))))

(pascal 15)