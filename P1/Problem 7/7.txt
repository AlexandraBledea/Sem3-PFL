% a. Write a predicate to compute the intersection of two sets

% contains(l1l2...ln, elem) = 
% = true, if l1 = elem
% = false, if n = 0
% = contains(l2...ln, elem), otherwise

% contains(L:list, E:number)
% (i,i)

contains([V|_],V):-!.
contains([_|T],V):- contains(T,V).

% intersection(l1l2...ln, p1p2...pm) = 
% = [], if n = 0
% = {l1} U intersection(l2...ln, p1p2...pm), if contains(p1p2...pm, l1) = true
% = intersection(l2...ln, p1p2...pm), otherwise

% intersection(L:list,P:list,R:list).
% (i,i,o)

intersection([],_,[]).
intersection([H|T],P,[H|R]):-
    contains(P,H),
    intersection(T,P,R),!.
intersection([_|T],P,R):-
    intersection(T,P,R).

% b. Write a predicate to create a list (m, ..., n)
%  of all integer numbers from the interval [m, n]

% interval(a,b) = 
% = b - 1 , if a + 1= b - 1
% = {a + 1} U interval(a+1,b), otherwise

% interval(A:number,B:number,R:list)
% (i,i,o)

interval(A,B,[B1]):-
    A + 1 =:= B - 1,
    B1 is B - 1.
interval(A,B,[A1|R]):-
    A1 is A + 1,
    interval(A1,B,R).