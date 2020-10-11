%int factorial(x){
%    if (x == 0){
%        return 1;
%    }else{
%        return x * factorial(x - 1);
%    }
%}

factorial(0,1).
factorial(N, Factorial) :-
        N > 0, A is N - 1,
        factorial(A, Res), Factorial is N*Res.

% factorial(2, X)
% 1->  A = 1, Res = 1, Factorial = 3
% 2->


% int buscar(X, Lista){ -------------------------------------------------------------------
%     for(i = 0, i < Lista.lentgh, i++){
%         if (Lista[i] == X) return true;
%     }
%     return false;
% }

% buscar(X, [X | Lista]).
% buscar(X, [X | [1,2,3,4,5,6,7,8,9]]).
buscar(X, [X | 1,2,3,4,5,6,7,8,9]).
buscar(X, [Y | Lista]) :- buscar(X, Lista).


% Arboles SLD - Recursividad Gauss

%suma(0,0). % es indistinto
suma(1, 1).
suma(X, Res) :-
    %X > 0,
    A is X - 1,
    suma(A, Ri),
    Res is X + Ri.
