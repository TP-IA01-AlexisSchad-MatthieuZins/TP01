

(defun my-assoc (cle a-liste)
	(dolist (x a-liste) 
		(if (equal (car x) cle) 
			(return x)
		)
	)
)