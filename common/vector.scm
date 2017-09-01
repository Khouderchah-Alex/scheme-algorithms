
;; vector-swap!
;; Swaps the ith and jth elements of a given vector A
(define (vector-swap! A i j)
  (let ((t (vector-ref A i)))
	(vector-set! A i (vector-ref A j))
	(vector-set! A j t)))

;; random-vector
;; Creates a vector of n elements that are randomly generated.
;; The elements will all be in [-maxAbs, maxAbs].
(define (random-vector n #!optional (maxAbs 9999))
  (let ((vec (make-vector n)))
	(letrec ((loop (lambda (i)
					 (if (>= i n) vec
						 (let ((r (* (- (* 2 (random 2)) 1) (random (+ maxAbs 1)))))
						   (vector-set! vec i r)
						   (loop (+ i 1)))))))
	  (loop 0))))
