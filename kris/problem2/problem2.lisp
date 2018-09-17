(defvar *fib* (make-hash-table)
  "Stores as the key the index of the fibonacci number, the value is the actual fibonacci number"
  )

(setf (gethash 0 *fib*) 1)
(setf (gethash 1 *fib*) 1)

 (defmacro aif (test-form then-form &optional else-form)
   `(let ((it ,test-form))
          (if it ,then-form ,else-form)))

(defun fib (index)
  (aif (gethash index *fib*)
       it
       (setf (gethash index *fib*) (+ (fib (1- index))
				      (fib (- index 2))))))

(defun sum-even-fib (max-value)
  (loop for i from 0
     for f = (fib i)
     if (evenp f)
     sum f
     until (> f max-value)))

(assert (eql (sum-even-fib 4000000) 4613732))
