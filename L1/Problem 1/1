; a) Write a function to return the n-th element of a list, or NIL if such an element does not exist;

; NthElem(l1l2...lm, n, pos) = 
; = nil , if m = 0
; = l1 , if n = pos
; = NthElem(l2...lm, n, pos + 1) , otherwise

(defun NthElem(l n pos)
  (cond
    ((null l) nil)
    ((= n pos) (car l))
    (t (NthElem (cdr l) n (+ pos 1)))
  )
)

(defun main(l n)
  (NthElem l n 0)
)


; b) Write a function to check whether an atom E is a member of a list which is not necessarily linear.


; checkAtom(l1l2...ln, elem) = 
; = nil , if n = 0
; = true , if l1 is an atom and l1 = elem
; = checkAtom(l1, elem) U checkAtom(l2...ln, elem) , if l1 is a list
; = checkAtom(l2...ln, elem) , otherwise


(defun checkAtom(l elem)
  (cond
    ((null l) nil)
    ((and (atom (car l)) (equal (car l) elem)) T)
    ((listp (car l)) (or (checkAtom (car l) elem) (checkAtom (cdr l) elem))) 
    (T (checkAtom (cdr l) elem))
  )
)


; c) Write a function to determine the list of all sublists of a given list, on any level.
; A sublist is either the list itself, or any element that is a list, at any level. Example:
; (1 2 (3 (4 5) (6 7)) 8 (9 10)) => 5 sublists :
; ( (1 2 (3 (4 5) (6 7)) 8 (9 10)) (3 (4 5) (6 7)) (4 5) (6 7) (9 10) )


; 

(defun allSublists (l)
  (cond
    ((atom l) nil)
    (T (apply 'append (list l) (mapcar 'allSublists l)))
  )
)


; d) Write a function to transform a linear list into a set.

; transformSet(l1l2...ln) = 
; = nil , if n = 0
; = {l1} U transformSet(removeApparences(l2...ln, l1)) , otherwise

(defun transformSet(l)
  (cond
    ((null l) nil)
    (t (cons (car l) (transformSet (removeApparences (cdr l) (car l)))))
  )
)


; removeApparences(l1l2...ln, elem) = 
; = nil , if n = 0
; = removeApparences(l2...ln, elem) , if l1 = elem
; = {l1} U removeApparences(l2...ln, elem) , otherwise

(defun removeApparences(l e)
  (cond 
    ((null l) nil)
    ((= (car l) e) (removeApparences (cdr l) e))
    (t (cons (car l) (removeApparences (cdr l) e)))
  )
)