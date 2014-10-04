;; fonctions de service

(defun nom (personne) (car personne))
(defun prenom (personne) (cadr personne))
(defun ville (personne) (caddr personne))
(defun age (personne) (cadddr personne))
(defun nombre-livres (personne) (car (last personne)))


(defun fb1 (base)
	(dolist (x base) 
		(format t "~S ~S ~S ~S ~S ~%" (nom x) (prenom x) (ville x) (age x) (nombre-livres x))
    )
)


(defun fb2 (base)
	(dolist (x base) 
		(if (equal 'Perrot (nom x))
			(format t "~S ~S ~S ~S ~S ~%" (nom x) (prenom x) (ville x) (age x) (nombre-livres x))
		)
	)
)


(defun fb3 (base nom)
	(let ((l '()))
		(dolist (x base l)
			(if (equal (nom x) nom)
				(setf l (append (list x) l))
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

