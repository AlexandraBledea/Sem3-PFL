;a) Write a function to return the sum of two vectors.

; myAppend(l1l2...ln, p1p2...pm) = 
; = p1p2...pm, if n = 0
; = {l1} U myAppend(l2...ln, p1p2...pm), otherwise


(defun myAppend (l1 l2)
  (cond
    ((null l1) l2)
    (t (cons (car l1) (myAppend (cdr l1) l2)))
  )
)

; myReverse(l1l2...ln) = 
; = NIL , if n = 0
; = myAppend(myReverse(l2...ln), myReverse(l1)) , if l1 is a list
; = myAppend(myReverse(l2...ln), list(l1)) , otherwise

(defun myReverse (l)
  (cond
    ((null l) nil)
    ((listp (car l)) (myAppend (myReverse (cdr l)) (list(myReverse (car l)))))
    (t (myAppend (myReverse (cdr l)) (list (car l))))
  )
)


; sumVectors (l1l2...ln, p1p2...pm) = 
; = p1p2...pm , if n = 0 
; = {l1 + p1} U sumVectors(l2...ln, p2...pm), otherwise

(defun sumVectors (v1 v2)
  (cond
    ((null v1) v2)
    (t (cons (+ (car v1) (car v2)) (sumVectors (cdr v1) (cdr v2))))
  )
)


; b) Write a function to get from a given list the list of all atoms, on any
;  level, but on the same order. Example:
;  (((A B) C) (D E)) ==> (A B C D E)


; getAllAtoms(l1l2...ln) = 
; = NIL , if n = 0
; = myAppend(getAllAtoms(l1), getAllAtoms(l2...ln)) , if l1 is a list
; = myAppend((list(l1), getAllAtoms(l2...ln)) , otherwise

(defun getAllAtoms (l)
  (cond
    ((null l) nil)
    ((listp (car l)) (myAppend (getAllAtoms(car l)) (getAllAtoms(cdr l))))
    (t (myAppend (list (car l)) (getAllAtoms(cdr l))))
  )
)


;c) Write a function that, with a list given as parameter, inverts only continuous
;   sequences of atoms. Example:
;   (a b c (d (e f) g h i)) ==> (c b a (d (f e) i h g)


; invertCont (l1l2...ln, aux) = 
; = aux , if n = 0
; = myAppend(aux, myAppend(list(invertCont(l1, NIL)), invertCont(l2...ln, NIL))) , if l1 is a list
; = invertCont(l2...ln, myAppend(list(l1), aux)) , otherwise


(defun invertCont (l aux)
  (cond
    ((null l) aux)
    ((listp (car l)) (myAppend aux (myAppend (list (invertCont (car l) nil)) (invertCont (cdr l) nil))))
    (t (invertCont (cdr l) (myAppend (list (car l)) aux)))
  )
)


;d) Write a list to return the maximum value of the numerical atoms from a list, at superficial level.

; myMax(a,b) = 
; = a , if b is not a number
; = b , if a is not a number
; = a , if a > b
; = b , otherwise


(defun myMax (a b)
  (cond
    ((not (numberp a)) b)
    ((not (numberp b)) a)
    ((> a b) a)
    (t b)
  )
)


; maxForList (l1l2...ln) = 
; = NIL , if n = 0
; = myMax(l1, maxForList(l2...ln)) , otherwise


(defun maxForList(l)
  (cond
    ((null l) nil)
    (t (myMax (car l) (maxForList (cdr l))))
  )
)