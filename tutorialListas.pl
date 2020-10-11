% Toda lista tiene 2 elementos en prolog [Cabeza, Cola].
% La estructura de la lista esta definida asi internamente.

listar(L) :- L = [1,2,3,4,5].

listarCabeza([Cabeza | Cola], Cabeza).
listarCola([Cabeza | Cola], Cola).

listarCabezaDoble([E1, E2 | L] ,[E1, E2]).

quitarPrimerosDosElementos([E1, E2 | L] ,L).

crearLista(L) :- Cola = [2,3,4,5],
  L = [1, 1.1 | Cola],
  listarCabeza(L, C).

% Que pasa si en vez de | usamos ,
listar2_1(L) :- Cola = [2,3,4,5], L = [1, Cola].

listarTripleCabeza(L) :- Cabeza = [1,2,3], Cola = [4,5,6,7,8,9,10], L = [Cabeza | Cola].

listar3(L) :- Cabeza = 1, Cola = [2,3,4,5], L = [Cabeza | Cola].
listar31(L) :- Cabeza = 1, Cola = [2,3,[3.1,3.2,3.3], 4,5], L = [Cabeza | Cola].

% La cabeza es un elemento lista, que tiene dos listas adentro
listar32(L) :- Cabeza = [[10, 100],[500, 5]], Cola = [2,3,[3.1,3.2,3.3], 4,5], L = [Cabeza | Cola].

listar33(L) :- Cabeza = 1, Cola = [2,3,[3.1,3.2,3.3], 4,5], L = [-1, 0, Cabeza | Cola].

%--------------------------------------------------------------------------------

% A la hora de eliminar un elemento se va descabezando la lista
descabezarListaDos([_, _ | Cola], Cola).
descabezarListaTres([_, _, _ | Cola], Cola).

% progenitor(pedro, ana).
% progenitor(pedro, ramon).
% primerHijo(P, H) :- progenitor(P, H), !.

progenitor(pedro, [ana, ramon, roxana, julia]).
progenitor(ana, [esteban, pepe, juan]).
primerHijoConListas(P, H) :- progenitor(P, [H, _]).

% Los casos bases en las listas son los pasos en el que el programa falla o triunfa.
%   Luego de llegar a estos, debe detenerse para que no haga backtracking.
buscar(Hijo, []) :- !, fail.
buscar(Hijo, [ Hijo | L ]) :- !, true.
buscar(Hijo, [ C | L ]) :- buscar( Hijo, L).
hijoDe(Padre, Hijo ) :- progenitor(Padre, Hijos), buscar(Hijo, Hijos).


% tutorial Programación para Dummies

cuenta_elementos([], 0).
cuenta_elementos([_|Y], N) :- cuenta_elementos(Y, CantCola), N is CantCola + 1.
