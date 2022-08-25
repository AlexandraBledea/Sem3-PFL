%nrOcc(L-list, E-elem, N-number of occurances)
%flow(i,i,o) (i,i,i)
nrOcc([],_,0).
nrOcc([H|T],E,N):-
    H=E,
    nrOcc(T,E,N1),
    N is N1+1.
nrOcc([H|T],E,N):-
    H\=E,
    nrOcc(T,E,N).


%addToEnd(L-list, E-elem, R-list)
%flow: (i,i,o)

addToEnd([],E,[E]).
addToEnd([H|T],E,[H|R]):-
    addToEnd(T,E,R).

%transformList(L-list, C - copy, R - result)
%flow(i,i,o), (i,i,i)

transformList([],C,C).
transformList([H|T],C,R):-
    nrOcc(C,H,N),
    N=:=0,
    addToEnd(C,H,C1),
    transformList(T,C1,R).
transformList([H|T],C,R):-
    nrOcc(C,H,N),
    N=\=0,
    transformList(T,C,R).
    