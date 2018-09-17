(defun is-multiple-of (value divisor)
  (eql (mod value divisor) 0))

(defun foo (max)
  (loop for x from 1 below max
     if (or (is-multiple-of x 3)
	    (is-multiple-of x 5))
     sum x))


