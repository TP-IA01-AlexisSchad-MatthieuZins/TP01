;; 1)
(defun reverseA (a b c)
    (list c b a))


;; 2)
(defun reverseB (n)
    (cond 
        ((= (length n) 1) 
            n)
        ((= (length n) 2)
            (list (cadr n) (car n)))
        ((= (length n) 3)
         (list (caddr n) (cadr n) (car n)))
     )
)

;; 3) iteratif
(defun reverseC_i (l)
    (let ((n ()))
        (dolist (x l n) (push x n))))

;; 3) recursif
(defun reverseC_r (l)
    (when l
        (append (reverseC_r (cdr l)) (list (car l)))))

;; 4) iteratif
(defun double_i (l)
  (let ((temp ()))
    (dolist (x l temp) 
      (if (atom x) 
          (setq temp (append temp (list x x)))
        (setq temp (append temp (list x)))))))



;; 4) recursif
(defun double_r (l)
    (when l
        (if (atom (car l)) 
            (append (list (car l) (car l)) (double_r (cdr l)))
            (append (list (car l)) (double_r (cdr l)))
        )
    )
)


                
;; 5) recursif
(defun doublebis (l)
    (when l
        (if (atom (car l))
            (append (list (car l) (car l)) (doublebis (cdr l)))
            (append (list (doublebis (car l))) (doublebis (cdr l)))
        )
    )
)

;; 6) itératif
(defun monAppend_i (l m)
    (let ((a ()))
        (dolist (x l)
            (setq a (cons x a))
        )
        (dolist (x m)
          (setq a (cons x a))
          )
        (reverse a)
      )
)

;; 6) recursif
(defun monAppend_r (l n)
    (if l
        (cons (car l) (monAppend_r (cdr l) n))
        (when n
            (cons (car n) (monAppend_r l (cdr n)))
        )
    )
)

;; 7) recursif
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