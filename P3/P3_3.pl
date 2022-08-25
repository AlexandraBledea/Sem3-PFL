% onesolution(N, E) =
% 	[], if N == 0
% 	E U onesolution(N - E, E + 1), otherwise
 
% onesolution(N:number, E:number, R:list)
% onesolution(i, i, o)

onesolution(0, _, []).
onesolution(N, E, [E|R]) :-
    N >= E,
    NN is N - E,
    NE is E + 1,
    onesolution(NN, NE, R).

% decomposition(N, E) =
% 	= onesolution(N, E), if E < N
% 	= onesolution(N, E + 1), if E < N

% decomposition(N:number, E:number, R:list)
% decomposition(i, i, o)

%First we search for a solution
decomposition(N, E, R) :-
    E < N,
    onesolution(N, E, R).
% Then we increase the value of the element E and call decoposition again, in order
% to try to find another solution starting with a new value of E
decomposition(N, E, R) :-
    E < N,
    NE is E + 1,
    decomposition(N, NE, R).

% allsolutions(N:number, R:list)
% allsolutions(i, o)

allsolutions(N, R) :-
    findall(RPartial, decomposition(N, 1, RPartial), R).