# scheme-algorithms
A collection of algorithms implemented in scheme (developed and tested with <a href="https://www.call-cc.org/">CHICKEN Scheme</a>). Created mainly just to not get rusty with algorithmic thinking and with Lisp programming.

#### Currently implemented algorithms
* Dynamic Programming
  * fib
       ```scheme
       ;; Usage example
       $ (fib 1000)
       4.34665576869374e+208
       ```
  * rod-cutting
       ```scheme
       ;; Usage example
       $ (rod-cutting #(0 1 5 8 9 10 17 17 20 24) 9)
       (25 (3 6))
       ```
