;;;; Ryusei Sashida
;;;; CSC 351L
;;;; Lab 8
;;;; 4/26/2019


;;; powerRec
;;; This is a recursive function and return the power function
;;; Two parameters: num -- Int
;;;               : power -- Int
;;; if the parameter of power became 0, it  will return 1
(defun powerRec(num power)
	(if (= power 0) 1
  		(* num (powerRec num (- power 1)))
  	)
)

;;; powerLoop
;;; This function use loop instead of recursion and return the power function
;;; Two parameters: num -- Int
;;;               : power -- Int
;;; if the parameter of power became 0, the loop will be stop
(defun powerLoop(num power)
  (setf ans 1)
  (do	((i 0 (+ i 1)))
  		((>= i power) 'done)
  		(setf ans (* ans num))
   	)
  ans
)

;;; smarlge1
;;; This function return the list that has smallest and largest element in the lsit
;;; One parameters: intList -- List
;;; it uses two helper function that return smallest and largest value.
;;; this fuction simply create a list of those returned value

(defun smarlge1 (intList)
	(cons (minimum intList) (list (maximum intList)))
)


;;; maximum
;;; This function use recursion and return the largest element in the lsit
;;; One parameters: theList -- List

;;; if the parameter of theList become null, it will simply return
;;; if the length of theList become 1, it will simply return the element
;;; if the first element is larger than the result of recursion of rest, it will return the first element
;;; Otherwise, it will keep recursion with parameter that does not have first element

(defun maximum (theList)
	(cond
		((null theList) theList)
		((= (length theList) 1) (car theList))
		((> (car theList) (maximum (cdr theList)))
			(car theList)
		)
		(t (maximum (cdr theList)))
	)
)


;;; minimum
;;; This function use recursion and return the smallest element in the lsit
;;; One parameters: theList -- List

;;; if the parameter of theList become null, it will simply return
;;; if the length of theList become 1, it will simply return the element
;;; if the first element is smaller than the result of recursion of rest, it will return the first element
;;; Otherwise, it will keep recursion with parameter that does not have first element

(defun minimum (theList)
	(cond
		((null theList) theList)
		((= (length theList) 1) (car theList))
		((< (car theList) (minimum (cdr theList)))
			(car theList)
		)
		(t (minimum (cdr theList)))
	)
)


;;; smarlge2
;;; This function use recursion and return the list that has smallest and largest element in the lsit
;;; One parameters: theList -- List

;;; if the parameter of theList become null, it will simply return
;;; if the length of theList become 1, it will simply return the element
;;; if the length of theList become 2, it will simply return two element
;;; if the first element is larger than second elememnt, it will swap two elements
;;; if the third element is smaller than first elememnt,
;;;         the first element will replace and keep recursion with paraameter that take off the third element
;;; if the third element is larger than second elememnt,
;;;         the second element will replace and keep recursion with paraameter that take off the third element
;;; Otherwise, it will keep recursion with parameter that does not have third element

(defun smarlge2(theList)
  (cond
    ((null theList) nil)
    ((= (length theList) 1) (cons (car theList) theList))
    ((= (length theList) 2) theList)
    ((> (car theList) (cadr theList))
     (smarlge2 (cons (cadr theList) (cons (car theLIst) (cddr theList))))
    )
    ((> (car theList) (caddr theList))
     (smarlge2 (cons (caddr theList) (cdr theList)))
    )
    ((< (cadr theList) (caddr theList))
     (smarlge2 (cons (car theList) (cddr theList)))
    )
    (t (smarlge2 (cons (car theList) (cons (cadr theList) (cdddr theList)))))
  )
)
