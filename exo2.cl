(defun list-paire (l)
    (mapcar #'(lambda (x) (list x x)) l))