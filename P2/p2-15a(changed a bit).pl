%reverseList(L-list, A-accumulator List, R-result)
%flow: (i,i,i)

%Mathematical Model
%reverseList(l1l2...ln,p1p2...pm)
	% = p1p2...pm, if n = 0
	% = reverseList(l2...ln, {l1} U p1p2...pm), otherwise

reverseList([],A,A).
reverseList([H|T],A,R):-  reverseList(T,[H|A],R).


%predecessor(L-List, F-flag, F1-flag, A-accumulator List, R-result)
%F - is a flag which will indicate if the first digit of the number which is 1 should be kept or not

%F1 - is a flag which will indicate if we need to do more subtractions in order to find the predecessor of
% 	  the number, when the flag is 1 it means we have to do more subtractions and when the flag is 0
%	  it means we stop with the subtractions

%Mathematical Model
%predecessor(l1l2...ln, f1, f2, p1p2...pm)
	% = p1p2...pm , if n = 0
	% = predecessor([], f1, 0, {l1} U p1p2...pm), if n = 1, f1 = 0, f2 = 1 and l1 = 0
	% = predecessor([],f1,0,{l1 - 1} U p1p2...pm), if n = 1, f1 = 0, f2 = 1 and l1 = 1
	% = predecessor([], f1, 0, p1p2...pm), if n = 1, f1 = 1, f2 = 1 and l1 = 1
	% = predecessor([], f1, 0, {l1 - 1} U p1p2...pm), if n = 1, f2 = 1, l1 != 0 and l1 != 1
	% = predecessor(l2...ln, 1, 1, {9} U p1p2...pm), if n > 1, f2 = 1, l1 = 0
	% = predecessor(l2...ln, 1, 0, {l1 - 1} U p1p2...pm), if n > 1, f2 = 1, l1 != 0
	% = predecessor(l2...ln, f1, 0, {l1} U p1p2...pm), if n > 1, f2 = 0



% this represents the case of the empty list
% in this case we don't care about the values of the flags
predecessor([],_,_,A,A).

% in this case we check whether the flag is 0, if the flag F is 0 it means we are in the case
% where we have a number with only one digit which is 0 so we don't compute the predecessor
% and return 0
predecessor([E],F,1,A,R):-
	F=0,
    E=0,
	predecessor([],F,0,[E|A],R).

%in this case we check whether the flag is 0, if the flag F is 0 it means we are in the case where we hve a number
% with only one digit which is 1 in our case so the predecessor is 0
predecessor([E],F,1,A,R):-
    F=0,
    E=1,
    E1 is E-1,
    predecessor([],F,0,[E1|A],R).

% in this case we check if the flag is 1, then we check if the last element is 1, if so
% it means we still need to do some subtractions in order to get the right predecessor
% but because the element is 1 we don't need to add it anymore to the number, because by subtracting 1 
% we will obtain 0 and we can't have a number like 09, we have 9.
predecessor([E],F,1,A,R):-
	F=1,
    E=1,
	predecessor([],F,0,A,R).

% in this case we check if the single digit of the number is different from 0
% if this is different from 0 then we subtract from it 1
% in this case we don't care about the value of the flag F
% we can reach this case if we have a number composed of only 1 digit and also when we have a number
% with more digits but we still have to do more subtractions because the second flag is marked with 1
predecessor([E],F,1,A,R):-
	E\=0,
    E\=1,
    E1 is E-1,
	predecessor([],F,0,[E1|A],R).

% in this case we check whether the head is 0, if it is, the new head becomes 9 and we mark
% the second flag with 1 in order to know we still need to do some subtractions
% when we reach this case we mark the flag F as being 1 so that we know our number has more than 1 digit
% but we don't care about its value when we call the function
predecessor([H|T],_,1,A,R):-
    H=0,
    NH is 9,
    NF is 1,
    predecessor(T,NF,1,[NH|A],R).

% in this case we check whether the head is different from 0, if it is, the new head will be
% the head from which we subtract 1 and we mark the second flag with 0 in order to signal that
% we don't have any other operations regarding the subtraction
% when we reach this case we mark the flag F as being 1 so that we know our number has more than 1 digit
% but we don't care about its value when we call the function
predecessor([H|T],_,1,A,R):-
    H\=0,
    NH is H-1,
    NF is 1,
    predecessor(T,NF,0,[NH|A],R).

% in this case we get when there are no other operations to be done and we simply add the rest
% of the digits to the accumulator list, where we compute the predec
predecessor([H|T],F,0,A,R):-
    predecessor(T,F,0,[H|A],R).

%flow(i,i) -> flow(i,o)
mainProgr(L, R):-
    reverseList(L,[],RL),
    predecessor(RL,0,1,[],R).
