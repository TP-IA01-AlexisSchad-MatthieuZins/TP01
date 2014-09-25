;; 1)
(defun reverseA (a b c)
    (list c b a))


;; 2)
(defun reverseB (n)
    (cond 
        ((= (length n) 1) 
            n)
        ((= (length n) 2)
            (list (first (last n)) (first n)))
        ((= (length n) 3)
            (list (first (last (rest n))) (first (rest n)) (first n)))))

;; 3) itératif
;;#

;; 3) récursif
(defun reverseC (l)
    (when l
        (append (reverseC (cdr l)) (list (car l)))))


;; 4) itératif
(defun double (l)
    (let ((a (list ()))) ; Pourquoi ça ne fonctionne pas (let ((a '(nil)))
        (dolist (x l (cdr a))
            (if (atom x) 
                (nconc a (list x x))
                (nconc a (list x))
            )
        )
    )
)

;; 4) récursif
(defun double (l)
    (when l
        (if (atom (car l)) 
            (append (list (car l) (car l)) (double (cdr l)))
            (append (list (car l)) (double (cdr l)))
        )
    )
)

;; 5) récursif
;;#

;; 6) itératif
(defun monAppend (l m)
    (let ((a (list ())))
        (dolist (x l)
            (nconc a (list x))
        )
        (dolist (x m)
            (nconc a (list x))
        )
        (cdr a)
    )
)

;; 6) récursif
;;#

;; 7) récursif
(defun myEqual (a b)
    (when (eq (type-of a) (type-of b))
        (cond 
            ((atom a)
                (eq a b)
            )
            ((listp a)
                (and (myEqual (car a) (car b)) (myEqual (cdr a) (cdr b)))
            )
            ;; Mettre ici la gestion d'autres types
        )
    )
)