%addToEnd(L-list, E-elem, R-list)
%flow: (i,i,o)

addToEnd([],E,[E]).
addToEnd([H|T],E,[H|R]):-
    addToEnd(T,E,R).


%decomposeList(L-list,
% F-final list,
% E - number of even elements,
% O - number of odd elements,
% RF - result final list,
% RE - result number of even elems,
% RO - result number of odd elems)
%flow: (i,i,i,i,o,o,o)

%Mathematical model
%decomposeList(l1l2...ln,p1p2...pm,e,o) =
	% = p1p2...p3, if n = 0
	% l1 U decomposeList(l2...ln,p1p2...pm,e+1,o), if l1 % 2 == 0
	% decomposeList(l2...ln,p1p2...pm, e, o+1), if l1 % 2 != 0


%decomposeListMain(l1l2...ln,F,E,O) = 
	% = decomposeList(l1l2...ln, [], E, O), if n = 0
	% = decompseList(l2...ln, l1 U p1p2...pm, E+1, O) if l1 % 2 == 0
	% = decomposeList(l2...ln, p1p2...pm U l1, E, O+1) if l1 % 2 != 0

decomposeListMain(L, RL, RE, RO):-decomposeList(L, [], 0, 0, RL, RE, RO).
decomposeList([],F,E,O,F,E,O).
decomposeList([H|T],F,E,O,RF,RE,RO):-
    %If the head is an even number, we increase the number of even elements
    H mod 2=:=0,
    E1 is E+1,
    decomposeList(T,[H|F],E1,O,RF,RE,RO).
decomposeList([H|T],F,E,O,RF,RE,RO):-
    addToEnd(F,H,F1),
    H mod 2=\=0,
    O1 is O+1,
    decomposeList(T,F1,E,O1,RF,RE,RO).
    
    
    