(defvar workingdir "/Users/john/jmac/compositions/Earplay/workspace")
(defparameter *fund* 27.5)
(definst viola viola '(48 55 62 69) 27.5 '(5 7 11 16))

(defparameter starttime 60.0)
(defparameter endtime 240.0)

(defparameter start-pitch-fl 60.5)
(defparameter start-pitch-bcl 48.0)
(defparameter start-pitch-vla (ftom (* *fund* 10)))

(defparameter end-pitch-fl 67.0)
(defparameter end-pitch-bcl 66.0)
(defparameter end-pitch-vla (ftom (* *fund* 14)))

(defparameter articulation-num-periods-fl 1.5)
(defparameter articulation-num-periods-bcl 2.5)
(defparameter articulation-num-periods-vla 3.5)

(defparameter fl-beats (read-list-from-file "/Users/john/jmac/compositions/Earplay/workspace/flute_beats.txt"))
(defparameter bcl-beats (read-list-from-file "/Users/john/jmac/compositions/Earplay/workspace/bass_clarinet_beats.txt"))
(defparameter vla-beats (read-list-from-file "/Users/john/jmac/compositions/Earplay/workspace/viola_beats.txt"))
(defparameter virtual-beats (read-list-from-file "/Users/john/jmac/compositions/Earplay/workspace/computer_constant_beats.txt"))

(defparameter fl-1/8notes (read-list-from-file "/Users/john/jmac/compositions/Earplay/workspace/flute_subdivs_2.txt"))
(defparameter bcl-1/8notes (read-list-from-file "/Users/john/jmac/compositions/Earplay/workspace/bass_clarinet_subdivs_2.txt"))
(defparameter vla-1/8notes (read-list-from-file "/Users/john/jmac/compositions/Earplay/workspace/viola_subdivs_2.txt"))
(defparameter virtual-1/8notes (read-list-from-file "/Users/john/jmac/compositions/Earplay/workspace/computer_constant_subdivs_2.txt"))

;; this is a list of partials that will work without too much trouble on the viola
;; '(4 6 7 9)
;(defparameter vla-filtered-partials (sort (flatten (cons '(6 8 9 12 13) (mapcar #'(lambda (p n) (mapcar #'(lambda (pp) (* p pp)) (arithm-seq n :min 1))) (inst-partials viola) '(4 4 4 4)))) #'<))
(defparameter vla-filtered-partials (sort (flatten (cons '(9 13) (mapcar #'(lambda (p n) (mapcar #'(lambda (pp) (* p pp)) (arithm-seq n :min 1))) (inst-partials viola) '(4 4 4 4)))) #'<))

(defun fl (x startpitch endpitch)
  (+ (* (sin (* (/ (/ pi 2.0) (- endtime starttime)) (- x starttime))) (- endpitch startpitch)) startpitch))

(defun bcl (x startpitch endpitch)
  (+ (* (/ (- x starttime) (- endtime starttime)) (- endpitch startpitch)) startpitch))

(defun vla (x startpitch endpitch)
  (+ (* (+ (cos (+ (* (- x starttime) (/ (/ pi 2.0) (- endtime starttime))) pi)) 1.0) (- endpitch startpitch)) startpitch))

(defun f (func x a b phi startpitch endpitch)
  (+ (funcall func x startpitch endpitch) (* (sin (+ (* (/ (* 2.0 pi) a) (- x starttime)) phi)) b)))

(defun make-fn-for-inst (func a b phi startpitch endpitch)
  (lambda (x) (f func x a b phi startpitch endpitch)))

(defparameter flx (make-fn-for-inst #'fl 90 4.0 0 start-pitch-fl end-pitch-fl))
(defparameter bclx (make-fn-for-inst #'bcl 120 4.0 pi start-pitch-bcl end-pitch-bcl))
(defparameter vlax (make-fn-for-inst #'vla 60 4.0 0 start-pitch-vla end-pitch-vla))

(defun articulation-fn (x numperiods)
  (+ (* (/ (- x starttime) (- endtime starttime)) (- (+ 0.75 numperiods) 0.75)) 0.75))

(defun make-times (avg-num-events time &optional (starttime starttime) (endtime endtime))
  (cons starttime
	(mapcar #'(lambda (x) (+ x starttime))
		(poisson-proc-time-series avg-num-events time (- endtime starttime)))))

(defun get-pitches-for-times (fn times)
  (mapcar fn times))

(defun get-articulation-for-times (times numperiods)
  (mapcar #'(lambda (x)
	      (let ((articulation (articulation-fn x numperiods)))
		;; (/
		;;  (round
		;;   (*
		   (beta (scale (sin (* (* 2 pi) articulation)) -1.0 1.0 2.0 20.0)
			 (scale (sin (* (* 2 pi) articulation)) 1.0 -1.0 2.0 20.0))))
		   ;;5.0))
		 ;;5.0)))
	  times))

(defun plot-all-times-pitches (dat)
  (let ((fl (cdr (assoc 'fl dat)))
	(bcl (cdr (assoc 'bcl dat)))
	(vla (cdr (assoc 'vla dat))))
    (let ((times-fl (cdr (assoc 'times fl)))
	  (times-bcl (cdr (assoc 'times bcl)))
	  (times-vla (cdr (assoc 'times vla)))
	  (pitches-fl (mapcar #'(lambda (x) (round-to-decimal x 0.5)) (cdr (assoc 'pitches fl))))
	  (pitches-bcl (mapcar #'(lambda (x) (round-to-decimal x 0.5)) (cdr (assoc 'pitches bcl))))
	  (pitches-vla (mapcar #'(lambda (x) (ftom (* (round (/ (mtof x) *fund*)) *fund*))) (cdr (assoc 'pitches vla))))
	  (articulation-fl (mapcar #'(lambda (x) (round-to-decimal x 0.25)) (cdr (assoc 'articulation fl))))
	  (articulation-bcl (mapcar #'(lambda (x) (round-to-decimal x 0.25)) (cdr (assoc 'articulation bcl))))
	  (articulation-vla (mapcar #'(lambda (x) (round-to-decimal x 0.25)) (cdr (assoc 'articulation vla)))))
      (let ((delta-t-fl (mapcar #'(lambda (x1 x2) (- x2 x1)) (butlast times-fl) (rest times-fl)))
	    (delta-t-bcl (mapcar #'(lambda (x1 x2) (- x2 x1)) (butlast times-bcl) (rest times-bcl)))
	    (delta-t-vla (mapcar #'(lambda (x1 x2) (- x2 x1)) (butlast times-vla) (rest times-vla)))
	    (partials (get-all-partials (list viola)))
	    (plot-ymin 36)
	    (plot-ymax 72))
	(mapcar #'(lambda (delta)
		    (format t
			    "min = ~A, max = ~A, median = ~A"
			    (reduce #'min delta)
			    (reduce #'max delta)
			    (median (copy-list delta) #'<))
		    (print (sort (copy-list delta) #'<)) (terpri) (terpri))
		(list delta-t-fl delta-t-bcl delta-t-vla))
	(gp-command "set multiplot layout 2, 1")
	(gp-command "set key right bottom")
	(mapcar #'(lambda (p v) (gp-command (format nil "set ~A ~A" p v)))
		'("lmargin" "rmargin")
		'(10 10))
	(gp-command "set tmargin 5")
	(gp-command "set bmargin 5")
	;;(gp-new-window)
	(gp-command "set ytics nomirror tc rgb \"#000000\"")
	(gp-command "set y2tics nomirror tc rgb \"#000000\"")
	(gp-command "set xtics tc rgb \"#000000\"")
	(gp-command "set xtics 10")
	(gp-command (format nil "set yrange [~A:~A]" plot-ymin plot-ymax))
	(gp-command (format nil "set y2range [~A:~A]" plot-ymin plot-ymax))
	(gp-command (format nil "set ytics (~{~A~^,~})" (arithm-seq 72 :min 36 :step 1)))
	;;(gp-command (format nil "set y2range[~A:~A]" (/ (mtof 36) *fund*) (/ (mtof 72) *fund*)))
	(gp-command (format nil "set y2tics (~{~{\"~A\" ~A~}~^,~})" (interleave partials (mapcar #'(lambda (y) (ftom (* y *fund*))) partials))))
	;;(gp-command "set my2tics 2")
	;;(gp-command (format nil "set mytics (~{~A~^,~})" (arithm-seq 72 :min 36 :step 1)))
	;;(gp-command (print (format nil "set my2tics (~{~A~^,~})" (arithm-seq 20 :min 5))))
	(gp-command "set grid xtics ytics lt 0 lw 1 lc rgb \"#000000\"")
	;;(gp-command "set for [i=1:5] arrow from graph 0,graph i*dy to graph 1,graph i*dy nohead front ls 100")
	;;(mapcar #'(lambda (p) (gp-command (print (format nil "set arrow from graph ~A,graph ~A to graph ~A,graph ~A nohead front ls 100" starttime (ftom (* p *fund*)) endtime (ftom (* p *fund*)))))) partials)
	(let ((partials-midi (mapcar #'(lambda (p) (ftom (* p *fund*))) (arithm-seq 100 :min (reduce #'min partials)))))
	      ;;(max-pitch (reduce #'max (flatten (list pitches-fl pitches-bcl pitches-vla)))))
	  (let ((partials-to-plot (range-filter partials-midi (list (list 0 plot-ymax)))))
	    (format t "~A~%" partials-to-plot)
	    (mapcar #'(lambda (tag p)
			(gp-command (format nil
					    "set arrow ~A from ~A,~A to ~A,~A nohead lt 2 lw 1 lc rgb \"#FF00FF\""
					    tag
					    starttime
					    p;;(ftom (* p *fund*))
					    (+ 10 endtime)
					    p)));;(ftom (* p *fund*)))))
		    (arithm-seq (length partials-to-plot) :min 1)
		    partials-to-plot)))
	    ;; (mapcar #'(lambda (tag p)
	    ;; 		(gp-command (format nil
	    ;; 				    "set arrow ~A from ~A,~A to ~A,~A nohead lt 2 lw 1 lc rgb \"#FF00FF\""
	    ;; 				    tag
	    ;; 				    starttime
	    ;; 				    (ftom (* p *fund*))
	    ;; 				    (+ 20 endtime)
	    ;; 				    (ftom (* p *fund*)))))
	    ;; 	    (arithm-seq (+ (- (length partials) 1) 100) :min 100)
	    ;; 	    partials)))

	(let ((fl-pw (make-piecewise-coords times-fl pitches-fl))
	      (bcl-pw (make-piecewise-coords times-bcl pitches-bcl))
	      (vla-pw (make-piecewise-coords times-vla pitches-vla)))
	  (plot (car fl-pw) (cadr fl-pw) "with linespoints title \"fl\"" (car bcl-pw) (cadr bcl-pw) "with linespoints title \"bcl\"" (car vla-pw) (cadr vla-pw) "with linespoints title \"vla\""))
	;;(gp-new-window)
	(mapcar #'(lambda (x) (gp-command (format nil "set noarrow ~A" x))) (arithm-seq 15 :min 1))
	;;(mapcar #'(lambda (x) (gp-command (format nil "set noarrow ~A" x))) (arithm-seq (+ (- (length partials) 1) 100) :min 100))
        (gp-command "unset tics")
        ;;(gp-command "unset mxtics")
	(gp-command "unset grid")
	(gp-command "set xtics tc rgb \"#000000\"")
	(gp-command "set xtics 10")
	(gp-command "set yrange [0:1]")
	(gp-command "set ytics tc rgb \"#000000\"")
	(gp-command "set ytics (0,0.25,0.5,0.75,1)")
	(gp-command "set grid xtics ytics lt 0 lw 1 lc rgb \"#000000\"")
	(let ((fl-pw (make-piecewise-coords times-fl articulation-fl))
	      (bcl-pw (make-piecewise-coords times-bcl articulation-bcl))
	      (vla-pw (make-piecewise-coords times-vla articulation-vla)))
	  (plot (car fl-pw) (cadr fl-pw) "with linespoints title \"fl\"" (car bcl-pw) (cadr bcl-pw) "with linespoints title \"bcl\"" (car vla-pw) (cadr vla-pw) "with linespoints title \"vla\""))
	(gp-command "unset multiplot"))))
  dat)

(defun pprint-events (dat &key (subdivs '(3 4)) (timerange (list starttime endtime)) (print-dat nil))
  (let ((fl (cdr (assoc 'fl dat)))
	(bcl (cdr (assoc 'bcl dat)))
	(vla (cdr (assoc 'vla dat))))
    (let ((binned-times-fl (list-bin (cdr (assoc 'times fl)) timerange))
	  (binned-times-bcl (list-bin (cdr (assoc 'times bcl)) timerange))
	  (binned-times-vla (list-bin (cdr (assoc 'times vla)) timerange)))
      (let ((times-fl (cadr binned-times-fl))
	    (times-bcl (cadr binned-times-bcl))
	    (times-vla (cadr binned-times-vla))
	    (pitches-fl (subseq (cdr (assoc 'pitches fl))
				(length (car binned-times-fl))
				(+ (length (car binned-times-fl)) (length (cadr binned-times-fl)))))
	    (pitches-bcl (subseq (cdr (assoc 'pitches bcl))
				 (length (car binned-times-bcl))
				 (+ (length (car binned-times-bcl)) (length (cadr binned-times-bcl)))))
	    (pitches-vla (subseq (cdr (assoc 'pitches vla))
				 (length (car binned-times-vla))
				 (+ (length (car binned-times-vla)) (length (cadr binned-times-vla)))))
	    (articulation-fl (subseq (cdr (assoc 'articulation fl))
				     (length (car binned-times-fl))
				     (+ (length (car binned-times-fl)) (length (cadr binned-times-fl)))))
	    (articulation-bcl (subseq (cdr (assoc 'articulation bcl))
				      (length (car binned-times-bcl))
				      (+ (length (car binned-times-bcl)) (length (cadr binned-times-bcl)))))
	    (articulation-vla (subseq (cdr (assoc 'articulation vla))
				      (length (car binned-times-vla))
				      (+ (length (car binned-times-vla)) (length (cadr binned-times-vla)))))
	    (indexes-fl (subseq (arithm-seq (length (cdr (assoc 'times fl))) :min 1)
				       (length (car binned-times-fl))
				       (+ (length (car binned-times-fl)) (length (cadr binned-times-fl)))))
	    (indexes-bcl (subseq (arithm-seq (length (cdr (assoc 'times bcl))) :min 1)
				       (length (car binned-times-bcl))
				       (+ (length (car binned-times-bcl)) (length (cadr binned-times-bcl)))))
	    (indexes-vla (subseq (arithm-seq (length (cdr (assoc 'times vla))) :min 1)
				       (length (car binned-times-vla))
				       (+ (length (car binned-times-vla)) (length (cadr binned-times-vla))))))
	(let ((pitches-fl-1/4 (mapcar #'(lambda (x) (round-to-decimal x 0.5)) pitches-fl))
	      (pitches-bcl-1/4 (mapcar #'(lambda (x) (round-to-decimal x 0.5)) pitches-bcl))
	      (pitches-vla-partials (mapcar #'(lambda (x) (ftom (* (round (/ (mtof x) *fund*)) *fund*))) pitches-vla)))
	  (mapcar #'(lambda (inst indexes times pitches articulation)
		      (mapcar #'(lambda (idx time pitch articulation)
				  (let* ((tt (find-closest-time time inst workingdir subdivs))
					 (bar (+ 1 (floor (/ (third tt) 4.0))))
					 (beat (+ 1 (mod (third tt) 4))))
				    ;;(format t "~A(~A): ~A, ~A (~A\") ~A ~A~%" inst idx bar beat time pitch articulation)))
				    (format t "INSTRUMENT: ~A, EVENT: ~A~%" inst idx)
				    (format t "BAR: ~A, BEAT: ~A (TIME: ~A)~%" bar beat time)
				    (format t "TEMPO: ~A BPM (~A BPS)~%" (* 60.0 (/ (second tt) (fourth tt))) (/ (second tt) (fourth tt)))
				    (format t "MIDI: ~A, PARTIAL: ~A (FREQ: ~A)~%" pitch (/ (mtof pitch) *fund*) (mtof pitch))
				    (format t "ARTICULATION: ~A (~A)~%" (round-to-decimal articulation 0.25) articulation)
				    (terpri)))
			      indexes times pitches articulation))
		  '("flute" "bass_clarinet" "viola")
		  (list indexes-fl indexes-bcl indexes-vla)
		  (list times-fl times-bcl times-vla)
		  (list pitches-fl-1/4 pitches-bcl-1/4 pitches-vla-partials)
		  (list articulation-fl articulation-bcl articulation-vla))))))
  (when print-dat dat))

(defun make-dat-for-inst (avg-num-events time &optional (starttime starttime) (endtime endtime))
  (let ((times-fl (make-times avg-num-events time starttime endtime))
	(times-bcl (make-times avg-num-events time starttime endtime))
	(times-vla (make-times avg-num-events time starttime endtime)))
    (let ((pitches-fl (get-pitches-for-times flx times-fl))
	  (pitches-bcl (get-pitches-for-times bclx times-bcl))
	  (pitches-vla (get-pitches-for-times vlax times-vla))
	  ;; (pitches-fl (mapcar #'(lambda (x) (/ (round (* x 2.0)) 2.0)) (get-pitches-for-times flx times-fl)))
	  ;; (pitches-bcl (mapcar #'(lambda (x) (/ (round (* x 2.0)) 2.0)) (get-pitches-for-times bclx times-bcl)))
	  ;; (pitches-vla
	  ;;  (mapcar
	  ;;   #'(lambda (x)
	  ;; 	(let ((partials (get-all-partials (list viola))))
	  ;; 	  (ftom
	  ;; 	   (*
	  ;; 	    (round
	  ;; 	     (/
	  ;; 	      (mtof x)
	  ;; 	      *fund*))
	  ;; 	    *fund*))))
	  ;;   (get-pitches-for-times vlax times-vla)))
	  (articulation-fl (get-articulation-for-times times-fl articulation-num-periods-fl))
	  (articulation-bcl (get-articulation-for-times times-bcl articulation-num-periods-bcl))
	  (articulation-vla (get-articulation-for-times times-vla articulation-num-periods-vla)))
      (let ((dat (list (list 'fl (cons 'times times-fl) (cons 'pitches pitches-fl) (cons 'articulation articulation-fl)) (list 'bcl (cons 'times times-bcl) (cons 'pitches pitches-bcl) (cons 'articulation articulation-bcl)) (list 'vla (cons 'times times-vla) (cons 'pitches pitches-vla) (cons 'articulation articulation-vla)))))
	(plot-all-times-pitches dat)
	dat))))

(defun select-nth (n list predicate)
  "Select nth element in list, ordered by predicate, modifying list."
  (do ((pivot (pop list))
       (ln 0) (left '())
       (rn 0) (right '()))
      ((endp list)
       (cond
        ((< n ln) (select-nth n left predicate))
        ((eql n ln) pivot)
        ((< n (+ ln rn 1)) (select-nth (- n ln 1) right predicate))
        (t (error "n out of range."))))
    (if (funcall predicate (first list) pivot)
      (psetf list (cdr list)
             (cdr list) left
             left list
             ln (1+ ln))
      (psetf list (cdr list)
             (cdr list) right
             right list
             rn (1+ rn)))))
 
(defun median (list predicate)
  (select-nth (floor (length list) 2) list predicate))

(defun find-closest-time (time inst-name dir &optional (subdiv-list '(1 3 4 5)))
  (let* ((filenames (flatten
		     (mapcar (lambda (subdiv)
			       (if (= subdiv 1)
				   (format nil "~A/~A_beats.txt" dir inst-name)
				   (format nil "~A/~A_subdivs_~A.txt" dir inst-name subdiv)))
			     subdiv-list)))
	 (res (labels ((rec (filenames time-acc tempo-acc phase-acc)
			 (if (null filenames)
			     (list (reverse time-acc) (reverse tempo-acc) (reverse phase-acc))
			     (let* ((dat (deinterleave 3 (read-list-from-file (car filenames))))
				    (times (car dat))
				    (tempos (second dat))
				    (phases (third dat))
				    (idx (find-closest time times)))
			       (rec (cdr filenames)
				    (cons (nth idx times) time-acc)
				    (cons (nth idx tempos) tempo-acc)
				    (cons (nth idx phases) phase-acc))))))
		(rec filenames '() '() '()))))
    (labels ((rec (times tempos phases subdivs closest-time closest-tempo closest-phase closest-subdiv)
	       (if (null times)
		   (list closest-time closest-tempo closest-phase closest-subdiv)
		   (if (< (abs (- time (car times))) (abs (- time closest-time)))
		       (rec (cdr times) (cdr tempos) (cdr phases) (cdr subdivs) (car times) (car tempos) (car phases) (car subdivs))
		       (rec (cdr times) (cdr tempos) (cdr phases) (cdr subdivs) closest-time closest-tempo closest-phase closest-subdiv)))))
      (rec (car res) (second res) (third res) subdiv-list (caar res) (car (second res)) (car (third res)) (car subdiv-list)))))

(defun round-to-decimal (val decimal)
  (let ((div (/ 1.0 decimal)))
    (/ (round (* val div)) div)))

(defun midi-to-nearest-partial (note inst)
  (let ((partials (get-all-partials (list inst)))
	(partial (/ (mtof note) *fund*)))
    (nth (find-closest partial partials) partials)))

(defun make-chord-seq (dat)
  (let ((dat-fl (cdr (assoc 'fl dat)))
	(dat-bcl (cdr (assoc 'bcl dat)))
	(dat-vla (cdr (assoc 'vla dat))))
    (let ((times-fl (cdr (assoc 'times dat-fl)))
	  (times-bcl (cdr (assoc 'times dat-bcl)))
	  (times-vla (cdr (assoc 'times dat-vla)))
	  (pitches-fl (cdr (assoc 'pitches dat-fl)))
	  (pitches-bcl (cdr (assoc 'pitches dat-bcl)))
	  (pitches-vla (cdr (assoc 'pitches dat-vla))))
      (let ((times-all (remove-duplicates (sort (flatten (list times-fl times-bcl times-vla)) #'<))))
	(list
	 times-all
	 (mapcar #'(lambda (time)
		     (flet ((find-closest-floor (x xs)
			      (let ((idxs (reduce #'+ (mapcar #'(lambda (x1) (if (>= x x1) 1 0)) xs))))
				idxs)))
		       (let ((flv (nth (- (find-closest-floor time times-fl) 1) pitches-fl))
			     (bclv (nth (- (find-closest-floor time times-bcl) 1) pitches-bcl))
			     (vlav (nth (- (find-closest-floor time times-vla) 1) pitches-vla)))
		       (list
			(if (null flv) nil (round-to-decimal flv 0.5))
			(if (null bclv) nil (round-to-decimal bclv 0.5))
			(if (null vlav) nil(ftom (* (round (/ (mtof vlav) *fund*)) *fund*)))))))
		 times-all))))))

(defparameter sec2-starttime 235)
(defparameter sec2-endtime 570)

;;(defparameter sec2-pitchrange-fl '(60 88))
(defparameter sec2-pitchrange-fl '(55 83))
(defparameter sec2-pitchrange-bcl '(36 69))
(defparameter sec2-pitchrange-vla (list (ftom (* *fund* 5)) (ftom (* *fund* 24))))
(defparameter sec2-pitchrange-virtual (list (ftom (* *fund* 7)) (ftom (* *fund* 16))))

(defparameter sec2-points-fl (list sec2-starttime 258.333344 347.01514 450.44193 496.11111 570))
(defparameter sec2-points-bcl (list sec2-starttime 273.333344 337.903626 420.5934 488.333344 570))
(defparameter sec2-points-vla (list sec2-starttime 270 351.89694 445.581726 494.44446 570))

(defun sec2-make-times (&key (avg-num-events 10) (min-duration 15) (max-duration 120) (starttime sec2-starttime) (endtime sec2-endtime))
  (labels ((rec (counter)
	     (let ((times (mapcar #'(lambda (time) (+ starttime time))
				  (cons 0 (poisson-proc-time-series avg-num-events (- sec2-endtime sec2-starttime) (- sec2-endtime sec2-starttime))))))
	       (if (= (reduce #'* (mapcar #'(lambda (t1 t2)
					   (if (and (<= (- t2 t1) max-duration) (>= (- t2 t1) min-duration)) 1 0))
				       (butlast times) (rest times)))
		      0)
		   (if (< counter 1000)
		       (rec (1+ counter))
		       '())
		   times))))
	   (rec 0)))

(defun sec2-make-pitches (n pitchrange)
  (let* ((mn (car pitchrange))
	 (mx (cadr pitchrange))
	 (md (+ (/ (- mx mn) 2.0) mn)))
    (labels ((uniform (mn mx)
	       (+ (random (- mx mn)) mn))
	     (rec (lst)
	       (if (= (length lst) n)
		   (reverse lst)
		   (rec (cons (if (< (car lst) md)
				  (uniform md mx)
				  (uniform mn md))
			      lst)))))
      (rec (list (uniform mn mx))))))

(defun sec2-make-function (times pitches)
  (lambda (x)
    (reduce #'+
	    (mapcar #'(lambda (t1 t2 p1 p2)
			(if (and (>= x t1)
				 (<= x t2))
			    (+ (* (+ (* (cos (+ pi (* (* (- x t1) (/ 0.5 (- t2 t1))) (* 2 pi)))) 0.5) 0.5) (- p2 p1)) p1)
			    0))
	    (butlast times)
	    (rest times)
	    (butlast pitches)
	    (rest pitches)))))

(defun sec2-make-function-vla (partials probability-of-changing-pitch expt-fn random-state)
  (labels ((choose-random-partial (partials)
	     (nth (random (- (length partials) 1) random-state) partials)))
    (let ((last-partial (choose-random-partial partials))
	  (last-timeval 0)
	  (p probability-of-changing-pitch))
      (lambda (x)
	(if (and (< last-timeval (nth 2 sec2-points-vla))
		 (>= x (nth 2 sec2-points-vla)))
	    (progn (setf last-timeval x)
		   (setf last-partial (nth (random 2) '(10 11)))
		   (ftom (* *fund* last-partial)))
	    (progn
	      (setf last-timeval x)
	      (if (< (random 1.0 random-state) p)
		(ftom (* *fund*
			 (labels ((f ()
				    (let ((candidate (choose-random-partial partials)))
				      (if (and (not (= candidate last-partial))
					       (< (random 1.0 random-state) (/ 1.0 (expt (abs (- candidate last-partial)) (funcall expt-fn x)))))
					  (progn
					    (setf last-partial candidate)
					    last-partial)
					  (f)))))
			   (f))))
		(ftom (* *fund* last-partial)))))))))

(defun sec2-make-expt-function-vla (yvals &key (xvals sec2-points-vla))
  (let ((pwcoords (list xvals yvals)))
    (2dpf (car pwcoords)
	  (cadr pwcoords)
	  (lambda (x x1 x2 y1 y2)
	    (let ((xx (scale x x1 x2 0.0 1.0)))
	    (let ((m (/ (- y2 y1) (- 1.0 0.0))))
	      (let ((b (* -1 (- (* m 0.0) y1))))
		(let ((y (+ (* m (expt xx (if (> y1 y2) (/ 1.0 2.0) 2.0))) b)))
		  y))))))))
		;;(+ (* m x) b))))))))
    

(defun sec2-make-dat (avg-num-events vla-probability-of-changing-partial vla-expt-list)
  (let ((times-fl (sec2-make-times :avg-num-events avg-num-events))
	(times-bcl (sec2-make-times :avg-num-events avg-num-events))
	;;(times-vla (sec2-make-times :avg-num-events avg-num-events)))
	(times-virtual (sec2-make-times :avg-num-events avg-num-events)))
    (let ((pitches-fl (sec2-make-pitches (length times-fl) sec2-pitchrange-fl))
	  (pitches-bcl (sec2-make-pitches (length times-bcl) sec2-pitchrange-bcl))
	  ;;(pitches-vla (sec2-make-pitches (length times-vla) sec2-pitchrange-vla)))
	  (pitches-virtual (sec2-make-pitches (length times-virtual) sec2-pitchrange-virtual)))
      (list (list 'fl (list 'times times-fl) (list 'pitches pitches-fl))
	    (list 'bcl (list 'times times-bcl) (list 'pitches pitches-bcl))
	    (list 'vla
		  (list 'probability-of-changing-partial vla-probability-of-changing-partial)
		  (list 'expt-list vla-expt-list)
		  (list 'random-state (make-random-state t)))
	    (list 'virtual (list 'times times-virtual) (list 'pitches pitches-virtual))))))
;;(list 'vla (list 'times times-vla) (list 'pitches pitches-vla))))))


(defun sec2-plot-times-pitches (dat)
  (let ((fl (cdr (assoc 'fl dat)))
	(bcl (cdr (assoc 'bcl dat)))
	(vla (cdr (assoc 'vla dat)))
	(vir (print (cdr (assoc 'virtual dat))))
	(beats-fl (range-filter (car (deinterleave 3 fl-beats)) (list (list sec2-starttime sec2-endtime))))
	(beats-bcl (range-filter (car (deinterleave 3 bcl-beats)) (list (list sec2-starttime sec2-endtime))))
	(beats-vla (range-filter (car (deinterleave 3 vla-beats)) (list (list sec2-starttime sec2-endtime))))
	(beats-vir (range-filter (car (deinterleave 3 virtual-beats)) (list (list sec2-starttime sec2-endtime)))))
    (let ((times-fl (cadr (assoc 'times fl)))
	  (times-bcl (cadr (assoc 'times bcl)))
	  ;;(times-vla (cadr (assoc 'times vla)))
	  (times-vir (cadr (assoc 'times vir)))
	  (pitches-fl (cadr (assoc 'pitches fl)))
	  (pitches-bcl (cadr (assoc 'pitches bcl)))
	  ;;(pitches-vla (cadr (assoc 'pitches vla))))
	  (pitches-vir (cadr (assoc 'pitches vir)))
	  (random-state-vla (make-random-state (cadr (assoc 'random-state vla))))
	  (probability-of-changing-partial-vla (cadr (assoc 'probability-of-changing-partial vla)))
          (expt-list-vla (cadr (assoc 'expt-list vla))))
      (let ((fn-fl (sec2-make-function times-fl pitches-fl))
	    (fn-bcl (sec2-make-function times-bcl pitches-bcl))
	    (fn-vla (sec2-make-function-vla vla-filtered-partials probability-of-changing-partial-vla (sec2-make-expt-function-vla expt-list-vla) random-state-vla))
	    (fn-vir (sec2-make-function times-vir pitches-vir)))
	(gp-command "set multiplot layout 2, 1")
	(mapcar #'(lambda (p v) (gp-command (format nil "set ~A ~A" p v)))
		'("lmargin" "rmargin")
		'(10 10))
	(gp-command "set noarrow")
	;; (mapcar #'(lambda (beats fn)
	;; 	    (mapcar #'(lambda (time pitch) (gp-command (format nil "set arrow from ~A,0 to ~A,~A nohead lt 1.0" time time pitch)))
	;; 	beats
	;; 	(mapcar fn beats)))
	;; 	(list beats-fl beats-bcl beats-vla)
	;; 	(list fn-fl fn-bcl fn-vla))
	(gp-command "set key right top")
	(gp-command "set xtics 10")
	(gp-command (format nil "set xrange [~A:~A]" sec2-starttime sec2-endtime))
	(gp-command "set ytics font \",8\" nomirror tc rgb \"#000000\"")
	(gp-command (format nil "set ytics (~{~A~^,~})" (arithm-seq (ftom (* *fund* 128)) :min (car sec2-pitchrange-bcl) :step 1)))
	(let ((partials vla-filtered-partials))
	  (gp-command (format nil "set y2tics font \",8\" (~{~{\"~A\" ~A~}~^,~})" (interleave partials (mapcar #'(lambda (y) (ftom (* y *fund*))) partials)))))
	(gp-command (format nil "set yrange [~A:~A]" (- (car sec2-pitchrange-bcl) 1) (ftom (* *fund* 128))))
	(gp-command (format nil "set y2range [~A:~A]" (- (car sec2-pitchrange-bcl) 1) (ftom (* *fund* 128))))
	(gp-command "set grid xtics ytics lt 0 lc 0")
	(let ((pw-fl (make-piecewise-coords beats-fl
					    (mapcar #'(lambda (b) (round-to (funcall fn-fl b) 0.5)) beats-fl)))
	      (pw-bcl (make-piecewise-coords beats-bcl
					     (mapcar #'(lambda (b) (round-to (funcall fn-bcl b) 0.5)) beats-bcl)))
	      (pw-vla (make-piecewise-coords beats-vla
					     (mapcar #'(lambda (b)
							 (ftom
							  (* *fund*
							     (nth (find-closest
								   (round (/ (mtof (funcall fn-vla b))
									     *fund*))
								   vla-filtered-partials)
								  vla-filtered-partials))))
						     beats-vla)))
	      (pw-vir (make-piecewise-coords beats-vir
					     (mapcar #'(lambda (b) (round-to (funcall fn-vir b) 0.5)) beats-vir))))
	(plot
	 times-fl
	 (mapcar #'(lambda (p) (round-to p 0.5)) pitches-fl)
	 "notitle"
	 times-bcl
	 (mapcar #'(lambda (p) (round-to p 0.5)) pitches-bcl)
	 "notitle"
	 ;; times-vla
	 ;; (mapcar #'(lambda (p) (nth (find-closest p (get-all-partials-midi (list viola))) (get-all-partials-midi (list viola)))) pitches-vla)
	 ;; "notitle"
	 ;;beats-fl
	 ;;(mapcar #'(lambda (b) (round-to (funcall fn-fl b) 0.5)) beats-fl)
	 (print times-vir)
	 (print (mapcar #'(lambda (p) (round-to p 0.5)) pitches-vir))
	 "with points lt 4 notitle"
	 (car pw-fl)
	 (cadr pw-fl)
	 "with lines lt 1 title \"fl\""
	 ;;beats-bcl
	 ;;(mapcar #'(lambda (b) (round-to (funcall fn-bcl b) 0.5)) beats-bcl)
	 (car pw-bcl)
	 (cadr pw-bcl)
	 "with lines lt 2 title \"bcl\""
	 ;; beats-vla
	 ;; (mapcar #'(lambda (b)
	 ;; 	      (ftom
	 ;; 	       (* *fund*
	 ;; 		  (nth (find-closest
	 ;; 			(round (/ (mtof (funcall fn-vla b))
	 ;; 				  *fund*))
	 ;; 			vla-filtered-partials)
	 ;; 		       vla-filtered-partials))))
	 ;; 	 beats-vla)
	 (car pw-vla)
	 (cadr pw-vla)
	 "with lines lt 3 title \"vla\""
	 (car pw-vir)
	 (cadr pw-vir)
	 "with lines lt 4 title \"vir\""
	 (list sec2-starttime sec2-endtime)
	 (make-list 2 :initial-element (car sec2-pitchrange-fl))
	 "with lines lt 1 notitle"
	 (list sec2-starttime sec2-endtime)
	 (make-list 2 :initial-element (cadr sec2-pitchrange-fl))
	 "with lines lt 1 notitle"
	 (list sec2-starttime sec2-endtime)
	 (make-list 2 :initial-element (car sec2-pitchrange-bcl))
	 "with lines lt 2 notitle"
	 (list sec2-starttime sec2-endtime)
	 (make-list 2 :initial-element (cadr sec2-pitchrange-bcl))
	 "with lines lt 2 notitle"
	 (list sec2-starttime sec2-endtime)
	 (make-list 2 :initial-element (car sec2-pitchrange-vla))
	 "with lines lt 3 notitle"
	 (list sec2-starttime sec2-endtime)
	 (make-list 2 :initial-element (cadr sec2-pitchrange-vla))
	 "with lines lt 3 notitle"
	 (flatten (interleave sec2-points-fl sec2-points-fl))
	 (flatten (make-list (floor (/ (length sec2-points-fl) 2.0)) :initial-element (list (list (- (car sec2-pitchrange-bcl) 1) (ftom (* *fund* 128))) (list (ftom (* *fund* 128)) (- (car sec2-pitchrange-bcl) 1)))))
	 "with lines lc 1 lt 0 notitle"
	 (flatten (interleave sec2-points-bcl sec2-points-bcl))
	 (flatten (make-list (floor (/ (length sec2-points-fl) 2.0)) :initial-element (list (list (- (car sec2-pitchrange-bcl) 1) (ftom (* *fund* 128))) (list (ftom (* *fund* 128)) (- (car sec2-pitchrange-bcl) 1)))))
	 "with lines lc 2 lt 0 notitle"
	 (flatten (interleave sec2-points-vla sec2-points-vla))
	 (flatten (make-list (floor (/ (length sec2-points-fl) 2.0)) :initial-element (list (list (- (car sec2-pitchrange-bcl) 1) (ftom (* *fund* 128))) (list (ftom (* *fund* 128)) (- (car sec2-pitchrange-bcl) 1)))))
	 "with lines lc 3 lt 0 notitle")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; plot 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(let ((tempo-fl (mapcar #'(lambda (tt) (* tt 60)) (subseq (nth 1 (deinterleave 3 fl-beats)) (- (/ (length fl-beats) 3) (length beats-fl)))))
	      (tempo-bcl (mapcar #'(lambda (tt) (* tt 60)) (subseq (nth 1 (deinterleave 3 bcl-beats)) (- (/ (length bcl-beats) 3) (length beats-bcl)))))
	      (tempo-vla (mapcar #'(lambda (tt) (* tt 60)) (subseq (nth 1 (deinterleave 3 vla-beats)) (- (/ (length vla-beats) 3) (length beats-vla)))))
	     (tempo-vir (mapcar #'(lambda (tt) (* tt 60)) (subseq (nth 1 (deinterleave 3 virtual-beats)) (- (/ (length virtual-beats) 3) (length beats-vir))))))
	  (gp-command "unset tics")
	  (gp-command "unset grid")
	  (gp-command "set xtics 10")
	  (gp-command (format nil "set ytics font \",8\" (~{~A~^,~})" '(40 42 44 46 48 50 52 54 56 58 60 63 66 69 72 76 80 84 88 92 96 100 104 108 112 116 120 126 132 138 144 152 160 168 176 184 192 200 208)))
	  (gp-command "set yrange [40:220]")
	  (gp-command "set grid xtics ytics lt 0 lc 0")
	  (plot
	   beats-fl
	   tempo-fl
	   "with lines title \"fl\""
	   beats-bcl
	   tempo-bcl
	   "with lines title \"bcl\""
	   beats-vla
	   tempo-vla
	   "with lines title \"vla\""
	   beats-vir
	   tempo-vir
	   "with lines title \"vir\""
	   	 (flatten (interleave sec2-points-fl sec2-points-fl))
	 (flatten (make-list (floor (/ (length sec2-points-fl) 2.0)) :initial-element (list (list 0 220) (list 220 0))))
	 "with lines lc 1 lt 0 notitle"
	 (flatten (interleave sec2-points-bcl sec2-points-bcl))
	 (flatten (make-list (floor (/ (length sec2-points-bcl) 2.0)) :initial-element (list (list 0 220) (list 220 0))))
	 "with lines lc 2 lt 0 notitle"
	 (flatten (interleave sec2-points-vla sec2-points-vla))
	 (flatten (make-list (floor (/ (length sec2-points-vla) 2.0)) :initial-element (list (list 0 220) (list 220 0))))
	 "with lines lc 3 lt 0 notitle")))))
  (gp-command "unset multiplot")
  dat))

(defun sec2-make-chord-seq (dat)
  (let ((dat-fl (cdr (assoc 'fl dat)))
	(dat-bcl (cdr (assoc 'bcl dat)))
	(dat-vla (cdr (assoc 'vla dat)))
	(beats-fl (range-filter (car (deinterleave 3 fl-beats)) (list (list sec2-starttime sec2-endtime))))
	(beats-bcl (range-filter (car (deinterleave 3 bcl-beats)) (list (list sec2-starttime sec2-endtime))))
	(beats-vla (range-filter (car (deinterleave 3 vla-beats)) (list (list sec2-starttime sec2-endtime)))))
    (let ((times-fl (cadr (assoc 'times dat-fl)))
	  (times-bcl (cadr (assoc 'times dat-bcl)))
	  ;;(times-vla (cdr (assoc 'times dat-vla)))
	  (pitches-fl (cadr (assoc 'pitches dat-fl)))
	  (pitches-bcl (cadr (assoc 'pitches dat-bcl)))
	  ;;(pitches-vla (cdr (assoc 'pitches dat-vla))))
	  (random-state-vla (make-random-state (cadr (assoc 'random-state dat-vla))))
	  (probability-of-changing-partial-vla (cadr (assoc 'probability-of-changing-partial dat-vla)))
          (expt-list-vla (cadr (assoc 'expt-list dat-vla))))
      (let ((fn-fl (sec2-make-function times-fl pitches-fl))
	    (fn-bcl (sec2-make-function times-bcl pitches-bcl))
	    (fn-vla (sec2-make-function-vla vla-filtered-partials probability-of-changing-partial-vla (sec2-make-expt-function-vla expt-list-vla) random-state-vla)))
	(list
	 beats-fl
	 (mapcar fn-fl beats-fl)
	 beats-bcl
	 (mapcar fn-bcl beats-bcl)
	 beats-vla
	 (mapcar fn-vla beats-vla))))))

(defun sec2-pprint-events (dat &key (starttime sec2-starttime) (endtime sec2-endtime) (beatlists (list fl-beats bcl-beats vla-beats virtual-beats)))
  (let ((dat-fl (cdr (assoc 'fl dat)))
	(dat-bcl (cdr (assoc 'bcl dat)))
	(dat-vla (cdr (assoc 'vla dat)))
	(dat-vir (cdr (assoc 'virtual dat)))
	(fl-beats (nth 0 beatlists))
	(bcl-beats (nth 1 beatlists))
	(vla-beats (nth 2 beatlists))
	(virtual-beats (nth 3 beatlists)))
    (let ((beats-fl (range-filter (car (deinterleave 3 fl-beats)) (list (list starttime endtime))))
	  (beats-bcl (range-filter (car (deinterleave 3 bcl-beats)) (list (list starttime endtime))))
	  (beats-vla (range-filter (car (deinterleave 3 vla-beats)) (list (list starttime endtime))))
	  (beats-vir (range-filter (car (deinterleave 3 virtual-beats)) (list (list starttime endtime)))))
      (let ((tempos-fl (subseq (nth 1 (deinterleave 3 fl-beats))
			       (find-closest (car beats-fl) (car (deinterleave 3 fl-beats)))
			       (1+ (find-closest (car (last beats-fl)) (car (deinterleave 3 fl-beats))))))
	    (phases-fl (subseq (nth 2 (deinterleave 3 fl-beats))
			       (find-closest (car beats-fl) (car (deinterleave 3 fl-beats)))
			       (1+ (find-closest (car (last beats-fl)) (car (deinterleave 3 fl-beats))))))

	    (tempos-bcl (subseq (nth 1 (deinterleave 3 bcl-beats)) 
				(find-closest (car beats-bcl) (car (deinterleave 3 bcl-beats)))
				(1+ (find-closest (car (last beats-bcl)) (car (deinterleave 3 bcl-beats))))))
	    (phases-bcl (subseq (nth 2 (deinterleave 3 bcl-beats)) 
				(find-closest (car beats-bcl) (car (deinterleave 3 bcl-beats)))
				(1+ (find-closest (car (last beats-bcl)) (car (deinterleave 3 bcl-beats))))))

	    (tempos-vla (subseq (nth 1 (deinterleave 3 vla-beats)) 
				(find-closest (car beats-vla) (car (deinterleave 3 vla-beats)))
				(1+ (find-closest (car (last beats-vla)) (car (deinterleave 3 vla-beats))))))
	    (phases-vla (subseq (nth 2 (deinterleave 3 vla-beats))
				(find-closest (car beats-vla) (car (deinterleave 3 vla-beats)))
				(1+ (find-closest (car (last beats-vla)) (car (deinterleave 3 vla-beats))))))

	    (tempos-vir (subseq (nth 1 (deinterleave 3 virtual-beats))
				(find-closest (car beats-vir) (car (deinterleave 3 virtual-beats)))
				(1+ (find-closest (car (last beats-vir)) (car (deinterleave 3 virtual-beats))))))
	    (phases-vir (subseq (nth 2 (deinterleave 3 virtual-beats))
				(find-closest (car beats-vir) (car (deinterleave 3 virtual-beats)))
				(1+ (find-closest (car (last beats-vir)) (car (deinterleave 3 virtual-beats)))))))

	(let ((times-fl (cadr (assoc 'times dat-fl)))
	      (times-bcl (cadr (assoc 'times dat-bcl)))
	      ;;(times-vla (cdr (assoc 'times dat-vla)))
	      (times-vir (cadr (assoc 'times dat-vir)))
	      (pitches-fl (cadr (assoc 'pitches dat-fl)))
	      (pitches-bcl (cadr (assoc 'pitches dat-bcl)))
	      ;;(pitches-vla (cdr (assoc 'pitches dat-vla))))
	      (pitches-vir (cadr (assoc 'pitches dat-vir)))
	      (random-state-vla (make-random-state (cadr (assoc 'random-state dat-vla))))
	      (probability-of-changing-partial-vla (cadr (assoc 'probability-of-changing-partial dat-vla)))
	      (expt-list-vla (cadr (assoc 'expt-list dat-vla))))
	  (let ((pitches-vla (subseq (mapcar (sec2-make-function-vla vla-filtered-partials probability-of-changing-partial-vla (sec2-make-expt-function-vla expt-list-vla) random-state-vla) (range-filter (car (deinterleave 3 vla-beats)) (list (list sec2-starttime sec2-endtime))))
				     (find-closest (car beats-vla) (range-filter (car (deinterleave 3 vla-beats)) (list (list sec2-starttime sec2-endtime))))
				     (1+ (find-closest (car (last beats-vla )) (range-filter (car (deinterleave 3 vla-beats)) (list (list sec2-starttime sec2-endtime))))))))
				;;(find-closest (car beats-vla) beats-vla)
				;;(1+ (find-closest (car (last beats-vla)) beats-vla)
	  (let ((fn-fl (sec2-make-function times-fl pitches-fl))
		(fn-bcl (sec2-make-function times-bcl pitches-bcl))
		;;(fn-vla (sec2-make-function-vla vla-filtered-partials probability-of-changing-partial-vla (sec2-make-expt-function-vla expt-list-vla) random-state-vla))
		(fn-vla (lambda (x)
			  (nth (find-closest x beats-vla) pitches-vla)))
		(fn-vir (sec2-make-function times-vir pitches-vir)))
	    (mapcar #'(lambda (inst times tempos phases fn)
			(format t "**************************************************~%")
			(format t "~A~%" inst)
			(format t "**************************************************~%")
			(terpri)
			(mapcar #'(lambda (time tempo phase)
				    ;;(format t "INSTRUMENT: ~A~%" inst)
				    ;;(format t "BAR: ~A, BEAT: ~A, (TIME: ~A)~%" (+ 1 (floor (/ phase 4.0))) (+ 1 (mod phase 4)) time)
				    (let ((midipitch (funcall fn time))
					  (beat (+ 1 (mod (round-to phase 0.5) 4))))
				      (when (= beat 1)
					(terpri)
					(format t "BAR: ~A, TIME: ~A, TEMPO: ~A (~A)~%" (+ (round-to (/ phase 4.0) 0.5) 1) time tempo inst))
				      (cond ((eq inst 'vla)
					     (format t "BEAT ~A: MIDI: ~A, PARTIAL: ~A (FREQ: ~A)~%" beat midipitch (round (/ (mtof midipitch) *fund*)) (mtof midipitch)))
					    ((eq inst 'vir)
					     (format t "BEAT ~A: MIDI: ~A, CLOSEST PARTIAL: ~A (FREQ: ~A)~%" beat (round-to midipitch 0.5) (nth (find-closest (/ (mtof midipitch) *fund*) vla-filtered-partials) vla-filtered-partials) (mtof midipitch)))
					    (t
					     (format t "BEAT ~A: MIDI: ~A, PARTIAL: ~A (FREQ: ~A)~%" beat (round-to midipitch 0.5) (/ (mtof (round-to midipitch 0.5)) *fund*) (mtof midipitch))))))
				times tempos phases))
		    '(fl bcl vla vir)
		    (list beats-fl beats-bcl beats-vla beats-vir)
		    (list tempos-fl tempos-bcl tempos-vla tempos-vir)
		    (list phases-fl phases-bcl phases-vla phases-vir)
		    (list fn-fl fn-bcl fn-vla fn-vir))))))))
  nil)

(defun sec2-make-vla-partial-histo (dat)
  (let ((vla (cdr (assoc 'vla dat)))
	(beats-vla (range-filter (car (deinterleave 3 vla-beats)) (list (list sec2-starttime sec2-endtime)))))
    (let ((random-state-vla (make-random-state (cadr (assoc 'random-state vla))))
	  (probability-of-changing-partial-vla (cadr (assoc 'probability-of-changing-partial vla)))
          (expt-list-vla (cadr (assoc 'expt-list vla))))
      (let ((fn-vla (sec2-make-function-vla vla-filtered-partials probability-of-changing-partial-vla (sec2-make-expt-function-vla expt-list-vla) random-state-vla)))
	(let ((histo (make-list 120 :initial-element 0)))
	  (mapcar #'(lambda (time)
		      (let ((partial (round (/ (mtof (funcall fn-vla time)) *fund*))))
			(setf (nth partial histo) (1+ (nth partial histo)))))
		  beats-vla)
	  (mapcar #'(lambda (i p)
		      (format t "~A: ~A~%" i p))
		  (arithm-seq (- (length histo) 2) :min 1)
		  (cdr histo))
	  (gp-command "set xtics 1")
	  (gp-command "set xrange [0:55]")
	  (plot (arithm-seq (- (length histo) 2) :min 1) (cdr histo) "with boxes")))))
  nil)
    
	

(defun sec2-test ()
  (let* ((times (sec2-make-times))
	 (pitches (sec2-make-pitches (length times) sec2-pitchrange-fl))
	 (fn (sec2-make-function times pitches)))
    (let ((tt (arithm-seq sec2-endtime :min sec2-starttime :step 0.1)))
      (plot tt (mapcar #'(lambda (x) (funcall fn x)) tt) "with linespoints" times pitches ))
    (print times)
    (print pitches)))

(defun make-decel (n)
  (let ((mu-start 0.5)
	(mu-end 4.0)
	(n n))
    (let ((mu-fn (lambda (x) (+ (* (/ (- mu-end mu-start) n) x) mu-start))))
      (labels ((rec (acc)
      		 (if (>= (reduce #'+ acc) n)
      		     (reverse acc)
      		     (rec (cons (+ 1 (poisson (funcall mu-fn (reduce #'+ acc)))) acc)))))
	(rec '(1))))))
  

(defparameter *sec1-dat* '((FL
  (TIMES 60.0 66.92174189924373 70.79330429287936 72.88306157799052
   74.39343554367542 84.2407153515768 91.20410214530254 100.1112801494366
   102.51992783403027 119.37477639625604 141.7912611274965 143.11609365127305
   146.59725355751488 155.61454780389414 159.91431501988876 160.58289396671614
   166.75290293197486 167.51331580230163 172.58515321014391 175.763498985507
   176.9808120964558 179.89218887586082 186.00305570208667 186.9163206809206
   191.5589601123775 199.6074183525919 200.4506241193825 208.1824734278219
   213.9163526260557 215.1176612146683 225.06571240739876 231.66235611021804
   239.02190438155958 245.7300893994519)
  (PITCHES 60.5 62.750947218693625 63.84815102248575 64.36106357183453
   64.6906256967702 65.83527851897728 65.53214587754796 64.06789974947175
   63.54601240997034 60.345706227695594 62.58655688516862 62.96275992833196
   64.01639203321571 66.84382083864524 68.02893814884025 68.19415734628912
   69.39905642039727 69.50237716899832 69.90716380064282 69.90182251991376
   69.84747075255623 69.60516156272342 68.6420717059359 68.45441158116427
   67.3795298437763 65.33578826908825 65.13106394453067 63.56788790598827
   62.95687063250965 62.90256160104428 63.48998705328883 64.78376067027713
   66.72683960957362 68.54968015973817)
  (ARTICULATION 0.009162930178218514 0.03126832387088088 0.06040102218172806
   0.08409199467679862 0.19644983929598744 0.4336529494995932
   0.49130008347738646 0.760926178916685 0.7449530614302443 0.9812050455603937
   0.7465965551053301 0.6411868291721606 0.5814303650164899 0.2911864387462046
   0.2574035258233094 0.23002335820612801 0.12319299659274295
   0.10007432107730133 0.06543417569520742 0.0159060331094287
   0.02976255014436357 0.01565839315740188 0.07443842384908485
   0.05743080368505947 0.11150424300737237 0.24943224127738456
   0.30416844354733774 0.4705000868382397 0.5179496260099 0.7181052947402774
   0.7654423952950536 0.9371052518846757 0.9879833643758068
   0.9601873763948882))
 (BCL
  (TIMES 60.0 61.74686310879859 68.18940490190026 71.40786335218625
   78.28415071270737 93.4336559452249 97.55740354244702 111.16669210162625
   116.35794325343781 120.61816883905578 125.25214082503878 136.3594900395427
   141.99748436672917 143.63968729066312 148.06092577944688 153.80931123276667
   156.25012708459786 165.48148108478551 173.25741345614682 183.64374574315764
   190.23051545814303 193.14439527458478 194.78715017178894 196.129962320178
   202.496539923653 209.1855168108483 210.2080931046731 212.77934003673107
   213.34762167834975 229.55661253715732 241.44560090796728)
  (PITCHES 48.0 47.80933407400085 47.15583520143538 46.891090898202606
   46.557726039176956 47.40783752460004 48.06483974798861 51.33188272511681
   52.87761856687922 54.191263257871604 55.61140741441833 58.65837854639641
   59.85371593698905 60.144199620175414 60.78549372655616 61.301629896285
   61.412724670751274 61.30437854802557 60.708752767531955 59.605851488758155
   58.98138735919246 58.773727625638315 58.6819851214062 58.62227266402051
   58.55441324473147 58.922188533421135 59.02104674196025 59.32021488411357
   59.39605190795525 62.87578583296383 66.44703701860048)
  (ARTICULATION 0.024230798064711057 0.028249613236183396 0.1571746468810806
   0.19176864792012904 0.536464656931926 0.951949806841537 0.985894768544998
   0.6798252141707071 0.43243223259914854 0.19205022343797554
   0.10313333714790354 0.08807215188592407 0.26193391711491026
   0.18555958104359968 0.35549919857988455 0.6357912901742937
   0.6758282529825638 0.9546788808107656 0.8974932244498552 0.5823934201062444
   0.3250943169406428 0.22204166931440825 0.16379259473028354 0.084602509539408
   0.01838477336158211 0.05726108966559361 0.09633945303437147
   0.17522277071737496 0.1036073079440488 0.7844753482504675
   0.9828178554952799))
 (VLA
  (TIMES 60.0 65.92471356033928 76.81267765747356 79.52680267915107
   81.4340652692176 83.29389487661676 86.58959728941903 103.85923740980189
   122.03545592440656 126.32405527928731 127.46838601239283 142.76168974756737
   145.34912142559102 146.99591220965937 157.84428879592264 163.79235354375578
   164.66771283160352 171.07322729816093 180.20369543977796 181.83129523655734
   193.7661405269895 208.91772349874378 210.08684491077634 218.82238597222238
   219.39775112888455 222.31284973916803 227.4240064094249 229.48668829082752
   233.75532954889331 242.67592859303147)
  (PITCHES 60.86313713864835 63.19647634324348 64.85387175604124
   64.50642082549935 64.0906320879093 63.56685895158523 62.41762339196127
   57.31313128208873 62.542251743458365 64.27147431540459 64.66300237121584
   65.06734737492266 64.2775828957074 63.70041822401319 59.93212236014459
   59.125587888760506 59.13118500846025 60.173998443590335 63.869987328724655
   64.61908426073867 68.36792068123482 65.57990604295418 65.14849422227007
   62.42605833730985 62.315438311928034 61.950047216410255 62.17843667065718
   62.58802305526823 63.93770173834443 67.930552504029)
  (ARTICULATION 0.01519865689880368 0.17349717771196 0.710694548851316
   0.8049218673897516 0.9126675305048063 0.9898085413927026 0.9833306045294152
   0.23416862874245015 0.3793056575484666 0.5778083072481004 0.663178588205386
   0.8659749655835302 0.7452534250463005 0.6621549716920414 0.06843732818006495
   0.0080984082775087 0.05195068712201872 0.25726686086613826
   0.7855525789247674 0.7445215032477611 0.8597704668383703 0.12412433444356771
   0.1022543263969171 0.11490834219999663 0.11503126745497656
   0.18329235767001972 0.5519881881606682 0.5624289554742747 0.7981862444573898
   0.9770685951887328))))

(defparameter *sec2-dat* '((FL
  (TIMES
   (235 264.79868920688 303.4076142151872 360.832093208154 381.08586421070765
    454.0668395198104 514.1793747808808 626.5311521793495))
  (PITCHES
   (70 62.157208217030906 79.57862289742476 68.64092613017793 73.59642632007765
    55.45985137461708 80.64294334453612 58.98156522970058)))
 (BCL
  (TIMES
   (235 285.0492634565022 385.35589442295907 440.03709201921913
    520.4716833663344 550.1518220069593 585.2041063726318))
  (PITCHES
   (42 65.71993864507787 42.61917040918314 55.43616960331018 50.64834895730205
    66.56893335074389 47.64150800893098)))
 (VLA (PROBABILITY-OF-CHANGING-PARTIAL 0.5) (EXPT-LIST (3 3 4 4 2.0 2))
      (RANDOM-STATE
       #S(RANDOM-STATE :STATE #.(MAKE-ARRAY 627 :ELEMENT-TYPE
                                            '(UNSIGNED-BYTE 32)
                                            :INITIAL-CONTENTS
                                            '(0 2567483615 624 2147483648
                                              3382186240 1808798774 1349880383
                                              2511850861 2629837684 1189242108
                                              1817896193 76107465 3893391967
                                              1996582930 1820506222 3715715301
                                              3602381542 2124846778 2111830159
                                              1512993504 897398199 2643737628
                                              1058792916 3695081318 189159756
                                              3589826653 3426050940 1634851586
                                              808235558 486652029 4127942451
                                              4046474437 3779914835 3959312320
                                              1083978181 3382209111 3685922228
                                              1548517902 1578309656 3556935456
                                              1174786619 3430803566 1533143296
                                              726716659 1322639316 3593401922
                                              4157442371 1762024811 1965698671
                                              4041797575 3408662269 323190950
                                              3887367924 3052807384 639606122
                                              293211955 1131774460 8771407
                                              196713295 3075834428 1895805195
                                              2242426207 1517419357 1083608177
                                              1193593692 1297186895 1629325977
                                              3258836030 1519400437 2482894071
                                              1219619516 3465557916 3082102002
                                              2461934916 4289875346 3857895873
                                              2540578277 62399966 3720316076
                                              2241365908 3576896537 2445505183
                                              2495589402 1381946991 3381117868
                                              3231070521 2864116796 3141188869
                                              3595660919 696280637 3846017554
                                              902976024 2300524735 2367615108
                                              783159083 136433640 1559211620
                                              1219265748 2370921856 1629495208
                                              4145805947 835812842 405675762
                                              693674974 870002003 2423591973
                                              1211973620 1849222619 674293789
                                              858119022 3936992128 4207972270
                                              695797900 3731362323 1466937342
                                              1707312099 489222731 2300325821
                                              2678905205 2142868715 66660462
                                              3308268042 1514895939 1130265072
                                              3353856432 915294503 845148601
                                              377576709 4154257892 896566544
                                              2282941211 3862904383 4229076272
                                              4049570179 1886814347 3327010119
                                              1349944755 3169892635 2642112931
                                              219466701 2613466134 2640228758
                                              1426010542 812575940 888318268
                                              2368887747 3925433609 814318851
                                              2781395314 2502780389 2963223888
                                              1001613954 2807901842 1699858880
                                              636715757 3144410029 1161861547
                                              1708128827 3557495869 3534563300
                                              2997963984 3734988112 4116275146
                                              1570703143 670049413 2499884352
                                              2891942965 2411285725 227720361
                                              1878247187 3738427682 3819128875
                                              51224201 914451287 3763097941
                                              2100634003 600805622 2699657338
                                              810535713 499690169 53192473
                                              2309945919 4131418962 3365883417
                                              3626802704 1272966763 3974968594
                                              2793858437 716706568 2326941625
                                              484972806 4070697567 3849026303
                                              2978413999 3333462326 1441881310
                                              82580913 3278705290 3541182561
                                              2615303306 2460949589 589247512
                                              2274584636 4078645510 537935981
                                              4070514179 1613123227 3196460694
                                              2911756761 197376220 3361857873
                                              2269992988 1840718950 2720760863
                                              3479890570 183404016 968589178
                                              286766596 2710545172 628439748
                                              2873276657 1304652909 1242300333
                                              2676036269 612424591 1884848701
                                              167858451 628576241 4289060748
                                              4271098264 2610554276 3540946553
                                              1805590065 2166120053 2300129795
                                              4193658386 3377951813 4057505831
                                              933066804 3341142971 637453817
                                              2690022913 1949442064 2490863489
                                              214504950 1223816965 2839817579
                                              3732093890 2650941522 3393245176
                                              779276135 1932680468 94160148
                                              3186485291 2350921179 2095553559
                                              1595309408 1980883980 1430534372
                                              2516844276 2308808327 1313275084
                                              3996753540 2062083384 744574350
                                              2975690025 3482549415 713570686
                                              534266498 1970232176 295846273
                                              726713324 3405498849 3337013863
                                              2637999385 3314221324 1710297096
                                              343019366 1927434185 3762842334
                                              3906470134 3149841424 3379650755
                                              1428689628 846766790 1628501557
                                              2344451760 2639713780 64753193
                                              2993547185 2132091265 621667894
                                              4270455665 798068997 2559937668
                                              1566616217 500321001 1802281577
                                              623362680 526772252 859630031
                                              1780139162 3380520364 476793260
                                              2083865847 3388243181 2745638205
                                              2804475081 2555304784 3984251411
                                              4264868232 428074868 2226458191
                                              1062931256 3972014653 325935918
                                              1308575782 1255594534 1860581974
                                              1041692874 1624842296 3154061722
                                              1588557790 3931105646 810466841
                                              2084789806 67887403 1063465473
                                              2354235889 636177195 4153175452
                                              3833755180 2948585796 1307213902
                                              1384942578 187007034 4252545815
                                              2034624956 2033461663 2328172325
                                              3019073284 4055130509 1415684649
                                              4219231022 2860048455 1053693748
                                              3084280310 846396558 704529422
                                              3562116050 3878283973 3284455525
                                              4228675905 176373077 688025526
                                              603481272 673270020 1868329296
                                              3351670355 2807569291 1905882142
                                              1160331617 3563152426 3661641223
                                              3228673056 463768175 3725507879
                                              279712665 2877531499 3145809465
                                              760717246 670417621 1546237728
                                              2499169579 1817848622 1327759317
                                              1754903639 2985881597 2181953715
                                              3822962425 3917705617 1120489849
                                              3066144310 3084621299 2054133171
                                              177146231 2967430375 2368829162
                                              65576535 2473379143 364564390
                                              3108724151 3697492240 2352801935
                                              1457467033 1360528544 2366550839
                                              1891596964 250707492 2893693744
                                              3197694500 1498022556 931766997
                                              493000469 1582920097 1382345107
                                              2314166280 3760299349 2947625389
                                              3609828065 2197103744 394505865
                                              924702029 1376041907 164376574
                                              1768864050 4231163500 209228320
                                              3855142423 573710983 2777368511
                                              2890425093 2146306331 2864711679
                                              666128667 3214906678 3694691093
                                              375480166 3312908560 2321839359
                                              1671068814 2324708786 1739178613
                                              4140599369 4229440326 1618380251
                                              3212007468 1089599501 2304479599
                                              105799795 2872376608 2267294390
                                              4099835484 3514221027 2359686028
                                              251988409 4157934789 4114462197
                                              2432099292 2900829417 1938498800
                                              3852325975 3051107029 3467944099
                                              3046577605 3783820010 1734434621
                                              2944311362 2596140323 3307666631
                                              1711206876 2658659980 1670315095
                                              3687407570 1958554556 3213847440
                                              1926359982 1778106080 1872638119
                                              737324334 3947477564 3572680137
                                              3675296930 1546501330 2264265844
                                              3514467042 1812919659 1960846245
                                              2632661448 4248014402 630698815
                                              3794207454 499947523 480575172
                                              937434914 1785444698 2927063278
                                              3751540973 1242264786 4197804564
                                              856660236 378203315 506324102
                                              3657073066 1809028499 580326108
                                              3052877744 806996899 1072627199
                                              2607825810 1515344379 3076560165
                                              308670809 884927748 3894397946
                                              274338362 3227496294 1709398658
                                              1704019738 1085436771 4218974637
                                              4127429095 3021207279 4233960499
                                              3740001964 5805822 4104145450
                                              3496064152 570099275 4254555122
                                              4210979101 3702750876 289726968
                                              1658783301 1422657308 1790826353
                                              2690235177 1942583921 3822929581
                                              2092675523 746856144 3207328964
                                              1031164473 3652933969 3168115114
                                              1005112486 1143241544 3136490602
                                              1320449523 383344281 1152770144
                                              4071859306 1487199792 3308957361
                                              2469198739 3174833358 3052610635
                                              4196031664 1199292663 1642867290
                                              2074289196 514464744 1322628080
                                              2203982847 296532492 3800381373
                                              1172407832 2716755819 3974332159
                                              26504992 4229365528 2037312736
                                              127546057 167923839 3527376731
                                              2473999280 3517902782 2184425654
                                              1188904561 454898114 1587085544
                                              3657638166 1261083937 2145673607
                                              3316534553 4052084156 929704125
                                              811046079 2476474179 1061589384
                                              2903920485 795301361 1576592537
                                              838190525 2725674300 466534387
                                              3641163754 3723185661 639074609
                                              1413680250 153527629 143977525
                                              266315915 3776001310 1431494174
                                              97287893 2908440955 4253764766
                                              3242698365 1424776589 3782644343
                                              2041781559 3538256077 610692188
                                              4236736425 843995471 3339244658
                                              3609276363 2239769977 3765327954
                                              4267063103 1957199498 3519274003
                                              334114347 2652785172 2217883305
                                              4170536090 119806724 13035293
                                              872046668 2072679384 1910687619
                                              1246973177 1645940208 1634810626
                                              317502689 1460090136)))))
 (VIRTUAL
  (TIMES
   (235 335.8102789891608 442.0345019595353 530.5831150092126
    580.8524499826219))
  (PITCHES
   (62.65124390096639 55.58017388298538 65.55048026343712 60.70551489662072
    68.58945935497482)))))
