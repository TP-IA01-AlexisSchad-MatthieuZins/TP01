;;; This is the IDE's built-in-editor, where you create and edit
;;; lisp source code.  You could use some other editor instead,
;;; though the IDE's menu-bar commands would not be applicable there.
;;; 
;;; This editor has a tab for each file that it's editing.  You can
;;; create a new editor buffer at any time with the File | New command.
;;; Other commands such as Search | Find Definitions will create
;;; editor buffers automatically for existing code.
;;; 
;;; You can use the File | Compile and Load command to compile and
;;; load an entire file, or compile an individual definition by
;;; placing the text cursor inside it and using Tools | Incremental
;;; Compile.  You can similarly evaluate test expressions in the
;;; editor by using Tools | Incremental Evaluation; the returned
;;; values and any printed output will appear in a lisp listener
;;; in the Debug Window.
;;; 
;;; For a brief introduction to other IDE tools, try the
;;; Help | Interactive IDE Intro command.  And be sure to explore
;;; the other facilities on the Help menu.



;; 1)
(defun reverseA (a b c) (list c b a))


;; 2)
(defun reverseB
              (n)
               (if (= (length n) 1)
                   n  (if (= (length n) 2)
                     (list (car (cdr n)) (car n))
                   (if (= (length n) 3)
                       (list (car (cdr (rest n))) (car (rest n)) (car n))))))

;; 3) ;;============================= ITERATIVE
;; methode 1:

(defun reverseC (l)
               (let ((n nil))
                 (dolist (x l n) (push x n))))

;;==================================================







;; 4) ITERATIVE :

(defun double (l)
              (let ((a (list ())))
                (dolist (x l (cdr a)) 
                  (if (atom x) (nconc a (list x x))
                    (nconc a (list x))))))


;; 4) RECURSIVE :


(defun double (l)
               (when l
                   (if (atom (car l)) 
                       (append (list (car l) (car l)) (double (cdr l)))
                     (append (list (car l)) (double (cdr l))))))





;; 5)  ITERATIVE :



;; 5)  RECURSIVE :

(defun doublebis (l)
               (if  (not (null l)) 
                   (if (atom (car l)) 
                       (append (list (car l) (car l)) (doublebis (cdr l)))
                     (append (list (doublebis (car l))) (doublebis (cdr l)))
                     )
                 )
                    )

;;NOUVELLE
(defun doublebis_r (l)
               (when l 
                   (if (atom (car l)) 
                       (append (list (car l) (car l)) (doublebis_r (cdr l)))
                     (append (list (doublebisr (car l))) (doublebis_r (cdr l))))))



;; 6) ITERATIVE:


;; 6) RECURSIVE :

(defun monAppend (l n)
                (if (not (null l))
                    (cons (car l) (monAppend (cdr l) n))
                  (if (not (null n))
                      (cons (car n) (monAppend () (cdr n)))
                    )))


