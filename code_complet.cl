;; Code Lisp du TP1 
;; Alexis Schad
;; Matthieu Zins
;;
;; Lorsque deux solutions sont présentées (itérative et récursive)
;; nous avons rajouté "_i" ou "_r" aux noms des fonctions 
;; pour les différencier.
;;olololol
;;lacazette

;; Exercice 1 :
;;-------------

(defun reverseA (a b c)
    (list c b a)
)

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

(defun reverseC_i (l)
    (let ((n ()))
        (dolist (x l n) (push x n))
	)
)

(defun reverseC_r (l)
    (when l
        (append (reverseC_r (cdr l)) (list (car l)))
	)
)

(defun double_i (l)
  (let ((temp ()))
    (dolist (x l temp) 
      (if (atom x) 
          (setq temp (append temp (list x x)))
        (setq temp (append temp (list x)))
		)
	)
  )
)

(defun double_r (l)
    (when l
        (if (atom (car l)) 
            (append (list (car l) (car l)) (double_r (cdr l)))
            (append (list (car l)) (double_r (cdr l)))
        )
    )
)
     
(defun doublebis (l)
    (when l
        (if (atom (car l))
            (append (list (car l) (car l)) (doublebis (cdr l)))
            (append (list (doublebis (car l))) (doublebis (cdr l)))
        )
    )
)

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

(defun monAppend_r (l n)
    (if l
        (cons (car l) (monAppend_r (cdr l) n))
        (when n
            (cons (car n) (monAppend_r l (cdr n)))
        )
    )
)

(defun myEqual (a b)
	(cond 
		((and (stringp a) (stringp b) (eq (length a) (length b)))
			(dotimes (x (length a) t)
				(when (not (eq (char a x) (char b x)))
					(return nil))
			)
		)
		((or (and (integerp a) (integerp b)) (and (floatp a) (floatp b)))
			(= a b)
		)
		((and (atom a) (atom b))
			(eq a b)
		)
		((and (listp a) (listp b))
			(and (myEqual (car a) (car b)) (myEqual (cdr a) (cdr b)))
		)      
   )
)

;; Exercice 2 :
;;-------------

(defun list-paire (l)
	(mapcar #'(lambda (x) (list x x)) l)
)

;; Exercice 3 :
;;-------------

(defun my-assoc (cle a-liste)
	(dolist (x a-liste) 
		(if (equal (car x) cle) 
			(return x)
		)
	)
)

;; Exercice 4 :
;;-------------

;; fonctions de service

(defun nom (personne) (car personne))
(defun prenom (personne) (cadr personne))
(defun ville (personne) (caddr personne))
(defun age (personne) (cadddr personne))
(defun nombre-livres (personne) (car (last personne)))

;; fonctions de gestion de la base

(defun fb1 (base)
	(dolist (x base) 
		(format t "~S ~S ~S ~S ~S ~%" (nom x) (prenom x) (ville x) (age x) (nombre-livres x))
    )
)

(defun fb2 (base)
	(dolist (x base) 
		(when (equal 'Perrot (nom x))
			(format t "~S ~S ~S ~S ~S ~%" (nom x) (prenom x) (ville x) (age x) (nombre-livres x))
		)
	)
)

(defun fb3 (base n)
	(let ((l ()))
		(dolist (x base l)
			(if (equal (nom x) n)
				(setq l (append l (list x)))
			)
		)
	)
)

(defun fb4 (base x)
	(dolist (p base nil) 
		(if (equal x (age p)) 
			(return p)
		)
	)
)

(defun fb5 (base)
	(dolist (x base nil) 
		(if (< (nombre-livres x) 100)
			(return x)
		)
	)
)

(defun fb6 (base x)
	(let ((somme-ages 0) (somme-pers 0))
		(dolist (p base)
			(if (equal x (nom p))
				(progn
					(setf somme-ages (+ somme-ages (age p)))
					(setf somme-pers (+ somme-pers 1))
				)
			)
		)
		(if (= somme-pers 0)
			nil
			(/ somme-ages somme-pers)
		)
	)
)