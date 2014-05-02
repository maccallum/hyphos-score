(defvar *earplay-path* "/Users/john/git/jmac/compositions/Earplay/workspace")

(defun write-approx-list (target-list target-basename inst-list subdiv-list n bw &optional (print-nvisits 0))
  "same as write-approx except it takes a list for the target instead of a file name."
  (let ((inst-subdiv-pairs (flatten1
			    (mapcar #'(lambda (inst)
					(mapcar #'(lambda (subdiv)
						    (list inst subdiv))
						subdiv-list))
				    inst-list))))
    (let ((target-dat target-list) ;; just rename--this is old code
	  (dat (mapcar #'(lambda (p)
			   (car (deinterleave 3 (read-list-from-file (concatenate 'string
									     (princ-to-string (car p))
									     "_subdivs_"
									     (princ-to-string (cadr p))
									     ".txt")))))
		       inst-subdiv-pairs)))
      (let ((approx (multiple-value-list (approximate-list n bw target-dat dat print-nvisits))))
	
	(with-open-file (ostream (concatenate 'string target-basename "_approx.txt") :direction :output :if-exists :supersede)
	  (mapcar #'(lambda (a i)
		      (format ostream "~a ~a ~a " a (car (nth (car i) inst-subdiv-pairs)) (cadr (nth (car i) inst-subdiv-pairs))))
		  (car approx)
		  (cadr approx))))))
  nil)

(defun write-approx (target-filename target-basename inst-list subdiv-list n bw &optional (target-stride 1) (print-nvisits 0))
  "target-filename: name of file containing data to be approximated.

   target-basename: target-filename without the extension.  will be used to generate the output filename.

   inst-list: list of instrument names.

   subdiv-list: a list of integers representing the subdivision to be used.  

   n: number of iterations.

   bw: bandwidth.

   target-stride: set to 3 if list is time/tempo/phase, or set to 1 if only a list of times

   Example:

   (write-approx \"virtual2_subdivs_2.txt\" \"virtual2_subdivs_2\" '(\"violin1\" \"violin2\" \"viola\" \"cello\") '(3 4 5) 1000 .06)"
  (write-approx-list (car (deinterleave target-stride (read-list-from-file target-filename)))
		     target-basename inst-list subdiv-list n bw print-nvisits))


(defun make-ascending-rwalk (start-time duration avg-num-points start-pitch min-pitch max-pitch)
  (let ((x (mapcar #'(lambda (x) (+ x start-time)) (poisson-proc-time-series avg-num-points duration duration))))
    (let ((y (mapcar #'(lambda (a) (+ min-pitch (random (- max-pitch min-pitch)))) (make-list (length x) :initial-element 1))))
      (plot (cons 0 x) (cons start-pitch (sort y '<)) "with linespoints")
      (let ((coords (make-piecewise-coords x y)))
	(2dplf (car coords) (cadr coords))))))

(defun make-nice-phase (start end tempo-bps)
  (let ((tempo-spb (/ 1. tempo-bps)))
    (let ((npulses (/ (- end start) tempo-spb)))
      (+ (* (round npulses) tempo-spb) start))))

(defun make-nice-phase-from-end (start end tempo-bps)
  (let ((tempo-spb (/ 1. tempo-bps)))
    (let ((npulses (/ (- end start) tempo-spb)))
      (- end (* (round npulses) tempo-spb)))))

(defun adjust-times (st1 st2 et tempo-bps)
	   (let ((st2 (make-nice-phase st1 st2 tempo-bps)))
	     (let ((et (make-nice-phase st2 et tempo-bps)))
	   (list st2 et))))
