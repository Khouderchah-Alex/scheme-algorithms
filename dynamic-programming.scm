
;; rod-cutting
;; Given a rod of length N, return the optimal cutting (i.e. the cutting that makes the most money).
;;
;; @param prices - vector of at least N+1 elements containing the prices of rods lengths 0 - N
;; @param N      - size of given rod (problem size)
;; @return       - '(P L), where P is the amount of money,
;;                  and L is a list containing the rod lengths after cutting
(define (rod-cutting prices N)
  (letrec ((r (make-vector (+ N 1) (cons 0 '())))
		 (find-curr-max (lambda (i j currMax)
						  (if (> i j) currMax
							  (let* ((curr-r (vector-ref r (- j i)))
									 (curr (cons (+ (vector-ref prices i) (car curr-r)) (cons i (cdr curr-r)))))
								(if (> (car curr) (car currMax))
									(find-curr-max (+ i 1) j curr)
									(find-curr-max (+ i 1) j currMax))))))
		 (find-max (lambda (i)
					 (if (> i N) (let ((a (vector-ref r N))) (cons (car a) (list (cdr a))))
						 (begin
						   (vector-set! r i (find-curr-max 1 i (cons 0 N)))
						   (find-max (+ i 1)))))))
	(find-max 1)))
