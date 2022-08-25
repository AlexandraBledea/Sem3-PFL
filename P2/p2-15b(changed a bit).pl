reverseList([],A,A).
reverseList([H|T],A,R):-  reverseList(T,[H|A],R).


predecessor([],_,_,A,A).
predecessor([E],F,1,A,R):-
	F=0,
    E=0,
	predecessor([],F,0,[E|A],R).
predecessor([E],F,1,A,R):-
    F=0,
    E=1,
    E1 is E-1,
    predecessor([],F,0,[E1|A],R).
predecessor([E],F,1,A,R):-
	F=1,
    E=1,
	predecessor([],F,0,A,R).
predecessor([E],F,1,A,R):-
	E\=0,
    E\=1,
    E1 is E-1,
	predecessor([],F,0,[E1|A],R).
predecessor([H|T],_,1,A,R):-
    H=0,
    NH is 9,
    NF is 1,
    predecessor(T,NF,1,[NH|A],R).
predecessor([H|T],_,1,A,R):-
    H\=0,
    NH is H-1,
    NF is 1,
    predecessor(T,NF,0,[NH|A],R).
predecessor([H|T],F,0,A,R):-
    predecessor(T,F,0,[H|A],R).


mainProgr(L, R):-
    reverseList(L,[],RL),
    predecessor(RL,0,1,[],R).


% heterList(L - list, R - result list)
%Mathematical model:
%heterList(l1l2...ln, p1p2...pm)
	% = [], if n = 0
	% reverse(l1l2...ln,p1p2...pm) + predecessor(l1l2...ln,0,1,[],p1p2...pm)
	%  + heterList(l2...ln, p1p2...pm) if is_list(l1) = TRUE
	% heterList(l2...ln, p1p2...pm), otherwise

heterList([],[]).
heterList([H|T1],[R|T2]):-
    is_list(H),
    !,
    reverseList(H,[],HR),
    predecessor(HR,0,1,[],R),
    heterList(T1,T2).
heterList([H|T1],[H|T2]):-
    heterList(T1,T2).
