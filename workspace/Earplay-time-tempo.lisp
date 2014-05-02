(defvar mm '(40 42 44 46 48 50 52 54 56 58 60 63 66 69 72 78 80 84 88 92 96 100 104 108 112 116 120 126 132 138 144 152 160 168 176 184 192 200 208))

(defun plot-weights (xcoords ycoords)
  (let ((f (2dplf xcoords ycoords)))
    (plot mm (mapcar f mm))))

