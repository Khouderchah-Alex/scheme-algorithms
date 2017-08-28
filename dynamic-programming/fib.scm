;; If you don't have this egg, simply run 'sudo chicken-install arrays'
(require-extension arrays)

;; fib
;; Return the nth fibonacci number
;;
;; This function not only uses dynamic programming, but the values from previous
;; executions are stored by using closures. Thus if one calls (fib 100), then the
;; calls to (fib n) where 0 <= n <= 100 will simply involve looking up the cached
;; value.
(define fib
  (let ([makefib (lambda (cache)
				   (letrec ([fib-rec (lambda (n)
						(if (< n (array-length cache)) (array-ref cache n)
							(begin
							  (array-add! (+ (array-last cache) (array-last (array-butlast cache))) cache)
							  (fib-rec n))))])
					 fib-rec))])
	(makefib (array 0 1))))
