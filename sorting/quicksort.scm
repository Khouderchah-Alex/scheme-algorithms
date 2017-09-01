
;; vector-swap!
;; Swaps the ith and jth elements of a given vector A
(define (vector-swap! A i j)
  (let ((t (vector-ref A i)))
	(vector-set! A i (vector-ref A j))
	(vector-set! A j t)))

;; lomuto-partition
;; Performs the partition function attributed to Lomuto
(define (lomuto-partition A low high)
  (let ((pivot (vector-ref A high))
		(i (- low 1)))
	(letrec ((loop (lambda (j)
					 (if (>= j high)
						 (let* ((a (vector-ref A high))
							   (nextI (+ i 1))
							   (b (vector-ref A nextI)))
						   (when (< a b) (vector-swap! A high nextI))
						   nextI)

						 (let ((curr (vector-ref A j)))
						   (when (< curr pivot)
								 (set! i (+ i 1))
								 (vector-swap! A i j))
						   (loop (+ j 1)))))))
	  (loop low))))

;; quicksort
;; Sorts an array A with the quicksort algorithm
;;
;; Default usage is simply to call (quicksort A). Users can define their own
;; partitioning functions, however, and call (quicksort A partition-func) in
;; order for the custom partitioning function to be used.
;;
;; This function is in-place! Users who don't want their original vector to be
;; mutated should pass in a copy of the vector.
(define (quicksort A #!optional (partition lomuto-partition) (i 0) (j (- (vector-length A) 1)))
  (letrec ((loop (lambda (low high)
				   (if (>= low high) A
					   (let* ((k (partition A low high))
							 (leftLen (- k low))
							 (rightLen (- high k)))
						 (if (< leftLen rightLen)
							 (begin
							   (quicksort A partition low (- k 1))
							   (set! low (+ k 1)))
							 (begin
							   (quicksort A partition (+ k 1) high)
							   (set! high (- k 1))))
						 (loop low high))))))
	(loop i j)))

;; randomized-quicksort
;; Provides same interface as quicksort, but randomizes the given partitioning
;; function.
(define (randomized-quicksort A #!optional (partition lomuto-partition) (i 0) (j (- (vector-length A) 1)))
  (let ((randomized-partition (lambda (A low high)
								(let ((r (+ (random (- (+ high 1) low)) low)))
								  (vector-swap! A r high))
								(partition A low high))))
	(quicksort A randomized-partition i j)))
