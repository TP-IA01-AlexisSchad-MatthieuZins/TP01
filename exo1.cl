

;; 1)
(defun reverseA (a b c) (list c b a))


;; 2)
(defun reverseB
               (n)
               (if (= (length n) 1)
                   (first n)
                 (if (= (length n) 2)
                     (list (first (last n)) (first n))
                   (if (= (length n) 3)
                       (list (first (last (rest n))) (first (rest n)) (first n))))))
;; 3)
;; methode 1:

(defun reverseC (l)
               (setq n ())  ;;remise a zero de n
               (dolist (x l n) (setq n (cons x n))))


;; methode 2:

(defun reverseC (l)
               (setq n ())  ;;remise a zero de n
  (dolist (x l n) (push x n)))

;; methode 3 :

(defun reverseB (n)
              (reverse n))




;; 4) ITERATIVE :

(defun double (l)
              (let ((a (list ())))
                (dolist (x l (cdr a)) 
                  (if (atom x) (nconc a (list x x))
                    (nconc a (list x))))))

;; 4) RECURSIVE :


(defun double (l)
               (if  (not (null l)) 
                   (if (atom (car l)) 
                       (append (list (car l) (car l)) (double (cdr l)))
                     (append (list (car l)) (double (cdr l)))
                     )
                 )
                    )





;; 5)  ITERATIVE :



;; 5)  RECURSIVE :

(defun doublebis (l)
               (if  (not (null l)) 
                   (if (atom (car l)) 
                       (append (list (car l) (car l)) (doublebis (cdr l)))
                     (append (list (doublebis (car l))) (doublebis (cdr l)))
