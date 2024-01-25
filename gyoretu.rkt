#lang racket

;; “ü—Í
(define input '("+-----+"
                "|1 3|"
                "|4  |"
                "|4 5|"
                "+-----+"))

(define (txt-to-matrix txt)
  (define coords '())
  (for ([row (in-range 1 (- (length txt) 1))])
    (let* ([line (list-ref txt row)]
            [values-string (substring line 1 (- (string-length line) 1))]
            [values-list (string-split values-string)]
            [x-string (first values-list)]
            [y-string (if (empty? (cdr values-list)) "" (second values-list))])
      (let ([x (if (string=? x-string "") 0 (string->number x-string))]
            [y (if (string=? y-string "") 0 (string->number y-string))])
        (set! coords (cons (list x y) coords)))))
  (reverse coords))

(displayln (txt-to-matrix input))
