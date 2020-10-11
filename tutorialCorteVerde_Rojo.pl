% Si N > 0 y N <= 2, S= 1
% Si N > 2 y N <= 5, S= 2
% Si N > 5, S= 3

% Sin verde: ejecutra siempre las 3 clausulas
rangoSinCorte(N, 1) :- N > 0, N =< 2.
rangoSinCorte(N, 2) :- N > 2, N =< 5.
rangoSinCorte(N, 3) :- N > 5.

% Corte verde: verde porque devuelve las mismas soluciones que sin corte.
%   Es mas EFICIENTE, ya que en caso de encontrar una solución, no busca mas.
rangoCorteVerde(N, 1) :- N > 0, N =< 2, !.
rangoCorteVerde(N, 2) :- N > 2, N =< 5, !.
rangoCorteVerde(N, 3) :- N > 5.

% Corte rojo: devuelve otra solución si no hubiera corte
% si encuentra la solución en 1 o 2, devolveria tambien 3 si no estuvieran los cortes.
rangoCorteRojo(N, 1) :- N > 0, N =< 2, !.
rangoCorteRojo(N, 2) :- N > 2, N =< 5, !.
rangoCorteRojo(N, 3).
