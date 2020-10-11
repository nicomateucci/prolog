% Practica 3 Inteligencia Artificial

% Reglas comunes a todos los ejercicios:

leer_palabra(Pal) :- write("Ingrese una palabra "), nl, read(Pal), nl.

% 1. Ingresar una cadena de texto y obtener el primer carácter de la misma.

ej1 :- leer_palabra(Pal),
       write("La longitud de la palabra es "), atom_length(Pal, Cant), write(Cant), tab(1),
       write("El primera caracter de la palabra es:  "), sub_atom(Pal, 0,1,_, X), write(X).

% 2. Ingresar una cadena de texto y obtener el último carácter de la misma.

ej2 :- leer_palabra(Pal), atom_length(Pal, Cant),
       write("El ultimo caracter de la palabra es:  "), Ult is Cant - 1, sub_atom(Pal, Ult,1,_, X), write(X).

% 3. Ingresar una cadena de texto e informar cuántos caracteres tiene.  En primer lugar haciendo
% uso del predicado atom_length/2 y en una segunda instancia utilizando sub_atom/5 de forma recursiva.

ej3 :- leer_palabra(Pal),
       write("La longitud usando atom_length() es: "), atom_length(Pal, Cant), write(Cant), nl,
       write("El longitud usando sub_atom() es: "), sub_atom(Pal, 0, X, 0, Pal), write(X), nl,
       write("El longitud usando sub_atom() de forma recursiva es: "), calcularLongitud(Pal, X), write(X).

calcularLongitud("", 0).
calcularLongitud(Pal, Long) :- calcularLongitud(Pal, LongAnt), Long  

% 4. Transformar una cadena en una lista de caracteres.

ej4 :- leer_palabra(Pal).

construirLista(X,L,[X|L]).

cadenaToLista("", []).
cadenaToLista(Pal, Lista) :- sub_atom(Pal, _, 1, _, Carac), append(Lista, ).

% 5. Transformar una cadena de texto en una lista de palabras, tomando como divisor el espacio.

% 6. Hacer un programa que transforme un número entero a binario.

% 7. Hacer un reconocedor de palabras de la forma a n b n .

% 8. Ingresar una cadena y un carácter, luego informar la cantidad de veces que aparece dicho carácter en la cadena.

% 9. Ingresar una cadena, contar e informar el número de veces que aparece cada una de las vocales
% (a, e, i, o, u) y la cantidad de veces que aparece cualquier consonante.
