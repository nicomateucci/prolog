% Leer datos
% hola :- write('Nombre: '), read(Nombre),
%     write('Primer Apellido: '), read(Apellido1),
%     write('Segundo Apellido: '), read(Apellido2), nl,
%     write('Hola '), write(Nombre), tab(1),
%     write(Apellido1), tab(1), write(Apellido2).

% Ejemplos del powerpoint

inicio:- write("Ingrese una lista de elementos: "), leer(Lista), write(Lista).

leer([H|T]) :- read(H), H\=[], leer(T).
leer([]).

listaConLosPrimerosDosElementos([E1, E2 | Cola] ,[E1, E2]).
primerosDosElementosLista([E1, E2 | Cola] ,E1, E2).
crearLista(L) :- Cola = [2,3,4,5], L = [1, 1.1 | Cola].

%1 Leer y mostrar lista

ej1:- write('Ingrese una lista de elementos: '), leer(Lista).
leer([H|T]) :- read(H), H\=[], leer(T).
leer([]).


%2 Mostrar cabeza y cola

ej2:- write("Ingrese una lista de elementos: "), leer(Lista),
    write("La cabeza de la lista es: "), listarCabeza(Lista), nl,
    write("La cola de la lista es: "), listarCola(Lista).
    listarCabeza([Cabeza | Cola]) :-  write(Cabeza).
    listarCola([Cabeza | Cola]) :- write(Cola).

%3 Mostrar primer elemento

ej3:- write("Ingrese una lista de elementos: "), leer(Lista),
    write("El primer elemento de la lista es: "), listarCabeza(Lista).
    listarCabeza([Cabeza | _]) :-  write(Cabeza).

%4 Mostrar primeros dos elementos

ej4:- Lista = [ nico, seba, 9,8,7,6,5,4,3,2,1],
    listarPrimerosDosElementos(Lista).
    listarPrimerosDosElementos([E1, E2 | _]) :-  write("El 1er elemento es"), tab(1), write(E1),
        write(" y el 2do elemento es"), tab(1), write(E2).

%5 Mostrar ultimo elemento

ej5:- %write("Ingrese una lista de elementos: "), leer(Lista),
    Lista = [ nico, seba, 9,8,7,6,5,4,3,2,1],
    invertirLista(Lista, ListaInvertida), write("El ultimo elemento de la lista es: "), listarCabeza(ListaInvertida, _).

listarCabeza([Cabeza | _], Cabeza) :-  write(Cabeza).

invertirLista([],[]).
invertirLista([Cabeza | Cola], ListaInvertida) :- invertirLista(Cola, ListaTemp),
    append(Lista, [Cabeza], ListaConCabezaAlFinal).
    % @Duda Porque si no pongo Cabeza entre corchetes no funciona.

% Lista de enteros y calcular diferencia entre primero y ultimo.
ej6 :- write("Ingrese una lista de elementos: "), leer(Lista),
    diferenciaPrimeroUltimo(Lista, Resultado).
    diferenciaPrimeroUltimo(L,R) :- getCabeza(L, C1),
        invertirLista(L, ListaInvertida), getCabeza(ListaInvertida, C2),
        Resultado is C1 + C2,
        write("La suma del primer y ultimo elemento es"), tab(1), write(Resultado).
    getCabeza([Cabeza | _], Cabeza).

% Contar elementos lista

contarElementosLista([], 0).
contarElementosLista([Cabeza|Cola], CantTotal) :- contarElementosLista(Cola, Cant), CantTotal is Cant + 1.

ej7 :- write("Ingrese una lista de elementos: "), leer(Lista),
 contarElementosLista(Lista, CantE),
 write('La lista tiene: '), write(CantE), tab(1), write('elementos.').

%8 Sumatoria

sumarLista([], 0).
sumarLista([C|L], Sumatoria) :- sumarLista(L, SumaIntermedia), Sumatoria is C + SumaIntermedia.

ej8 :- write("Ingrese una lista de numeros enteros: "), leer(Lista),
  sumarLista(Lista, Suma),
  write("La suma de los numeros de la lista es: "), write(Suma).

%9 Promedio

promedio([], 0, 0).
promedio([C|L], Suma, Contador):- promedio(L, SumaI, ContI), Suma is SumaI + C, Contador is ContI + 1.

ej9:- write("Ingrese una lista de numeros enteros: "), leer(Lista),
  promedio(Lista, Suma, Cont),
  write("EL promedio de los numeros de la lista es: "), S is Suma/Cont, write(S).

%10 Buscar elemento

% pertenece(X, []) :- write(X), tab(1), write(" no pertenece a la lista.").
% pertenece(X, [X|_]) :- write(X), tab(1), write(" SE HA ENCONTRADO EN LA LISTA."), !.
% pertenece(X, [_|L]) :- pertenece(X,L).

pertenece(X, [X|_]).
pertenece(X, [_|L]) :- pertenece(X, L).


ej10 :- write("Ingrese una lista de numeros enteros: "), leer(Lista),
  write("Ingrese el elemento que desea buscar en la lista ingresada: "), read(Elem),
  pertenece(Elem, Lista).

%11 Numero mayor

mayorNumero([X],X).
%mayorNumero([C|L], Mayor):- Mayor is C, mayorNumero(L, MayorInt), MayorInt > Mayor, Mayor is MayorInt.
mayorNumero([X1,X2|L],Y) :-
  X3 is max(X1,X2),
  mayorNumero([X3|L],Y).

ej11:- write("Ingrese una lista de numeros: "), leer(Lista),
  mayorNumero(Lista, Mayor),
  write("El numero mayor de la lista es: "), write(Mayor).

%12 Numero mayor

menorNumero([X],X).
%menorNumero([C|L], Mayor):- Mayor is C, mayorNumero(L, MayorInt), MayorInt < Mayor, Mayor is MayorInt.
menorNumero([X1,X2|L],Y) :-
  X3 is min(X1,X2),
  menorNumero([X3|L],Y).

ej12:- write("Ingrese una lista de numeros: "), leer(Lista),
  menorNumero(Lista, Mayor),
  write("El numero menor de la lista es: "), write(Mayor).

% Concatenar listas

concatenar([],[],[]).
concatenar([H1|T1],L2,[H1|T3]):-concatenar(T1,L2,T3).
concatenar([],[H2|T2],[H2|T3]):-concatenar([],T2,T3).


%concatenar([], Lista, Lista).
%concatenar([C|L], Lista, ListaNueva) :- concatenar(L, Lista, ListaTemp),
  append([C], ListaTemp, ListaNueva).

ej13 :- write("Ingrese una lista de elementos: "), leer(Lista),
  write("Ingrese otra lista de elementos: "), leer(Lista2),
  concatenar(Lista, Lista2, L),
  write("Listas ingresadas concatenadas: "), write(L).

% 14 Primero que se repite

%primeroRepite([], _) :- write("El elemento "), write(X), write(" no se repite en la lista.").
%primeroRepite([ElemRepetido|_], ElemRepetido) :- write("El primer elemento que se repite es "), write(ElemRepetido).
%primeroRepite(Lista, ElemRepetido).
%primeroRepite([C|L],  ElemRepetido) :- ElemABuscar is C, pertenece(C, L), ElemRepetido is ElemABuscar.
%primeroRepite([C|L],  ElemRepetido):- primeroRepite(L,  ElemRepetido).

buscar(X, [X|_]).
buscar(X, [_|L]) :- buscar(X, L).
primeroRepite([],[]).
primeroRepite([H|L],H):-
  buscar(H,L).
primeroRepite([H|L],R) :-
  %not(buscar(H, L)),
  primeroRepite(L,R).

ej14 :- write("Ingrese una lista de elementos con algunos repetidos: "), leer(Lista),
  primeroRepite(Lista, Elem),
  write("El primer elemento que se repite es: "), write(Elem).

% 15 Todos los elementos que se repiten

buscar(X, [X|_]).
buscar(X, [_|L]) :- buscar(X, L).

listaRepetidos([],[]).
listaRepetidos([H|L],[H|T]) :-
  buscar(H,L),
  listaRepetidos(L,T).
listaRepetidos([H|L],Z) :-
  not(buscar(H,L)),
  listaRepetidos(L,Z).

ej15 :- write("Ingrese una lista de elementos con algunos repetidos: "), leer(Lista),
  listaRepetidos(Lista, ListaElem),
  write("Los elementos que se repiten son; "), write(ListaElem).

%16 Contar un elemento

contarElemento(X, [], 0).
contarElemento(X, [H|L], Contador) :- X=H,
  contarElemento(X, L, ContadorI),
  Contador is ContadorI + 1.
contarElemento(X, [H|L], Contador) :- X/=H,
  contarElemento(X, L, ContadorI),
  Contador is ContadorI.

%contarElemento(X, Lista, Cant) :- buscar(X, Lista), contarElemento(X), Cant is CantI + 1.

ej16 :- write("Ingrese una lista de elementos: "), leer(Lista),
  write("Ingrese el elemento que desea contar en la lista ingresada: "), read(Elem),
  contarElemento(Elem, Lista, Cant),
  write("El elemento ingresado se repite en la lista "),
  write(Cant),
  write(" veces.").

%17 persona(nombre, [lista ciudades visitó])

persona(nico, [rosario, diego, miami, junin, venado]).
persona(roxana, [mexico, chile, diego, venado, junin, hughes]).
persona(paola, [mexico, brasil, francia, portugal, suiza, italia]).

visito(NombrePersona, Ciudad) :- persona(NombrePersona, L), buscar(Ciudad, L).

%18

%usuario(idUsuario, nombre, localidad).
usuario(1,'Miguel Martinez',rosario).
usuario(2,'Pato Rodríguez',funes).
usuario(3,'Marilyn Perez',rosario).
usuario(4,'Esteban Serrat',sandford).
usuario(5,'Damian Estigma',sandford).

%intereses(idUsuario, [lista intereses]).
intereses(1,['natacion','mineria de datos','yoga','comida mexicana']).
intereses(2,['frutas organicas','Fast & Furious','yoga','formula 1']).
intereses(3,['frutas organicas','natacion', 'formula 1']).
intereses(4,['chocolate','basquet','yoga','TC2000']).
intereses(5,['helado','correr','tenis']).

%a Listar intereses en comun de dos usuarios.

ej18A :- write('Ingrese un id de usuario: '), read(Id1), nl,
  write('Ingrese un id de usuario 2: '), read(Id2),
  intereses(Id1, L1),
  intereses(Id2, L2),
  interesesEnComun(L1,L2,Lista),
  write("Los intereses en comun son: "),
  write(Lista).

  interesesEnComun([],_,[]).
  interesesEnComun([H1|T1],L2,[H3|T3]):- buscar(H1,L2),
    H3 = H1,
    interesesEnComun(T1,L2,T3).
  interesesEnComun([_|T1],L2,L3):- interesesEnComun(T1,L2,L3).

%b Son candidatos a ser amigos

ej18B :- write('Ingrese un id de usuario: '), read(Id1), nl,
  write('Ingrese un id de usuario 2: '), read(Id2),
  intereses(Id1, L1),
  intereses(Id2, L2),
  interesesEnComun(L1,L2,Lista),
  sonCandidatos(Lista).

sonCandidatos(Lista) :- contarElementosLista(Lista, C),
  C > 1,
  write("Las personas son potenciales candidatos a ser amigos y algo mas tambien.").
sonCandidatos(Lista) :- contarElementosLista(Lista, C),
  C =< 1,
  write("Las personas NO PUEDEN SER AMIGAS.").

%c Union de intereses

ej18C :- write('Ingrese un id de usuario: '), read(Id1), nl,
  write('Ingrese un id de usuario 2: '), read(Id2),
  intereses(Id1, L1),
  intereses(Id2, L2),
  unionIntereses(L1,L2,Lista),
  write("La union de intereses es:"),
  write(Lista).

%unionIntereses([],L,L).
%unionIntereses(Lista,[H2,T2],Lista) :- not(buscar(H2, Lista)),
%  append(Lista, [H2], Lista),
%  unionIntereses(Lista, T2,Lista).
%unionIntereses(Lista,[H2,T2],Lista) :- buscar(H2, Lista),
%  unionIntereses(Lista, T2,Lista).

unionIntereses([],L,L).
unionIntereses([X|L1],L2,[X|L3]):-unionIntereses(L1,L2,L3).

%d Usuarios de una ciudad

ej18D :- write('Ingrese una ciudad: '), read(Ciudad), nl,
  usuariosCiudad(Ciudad, Lista),
  write("Lista de usuarios de la ciudad de "),
  write(Ciudad),
  write(" : "),
  write(Lista).

usuariosCiudad(NombreCiudad, Lista) :- findall(NombreUsuario, usuario(_,NombreUsuario, NombreCiudad), Lista).
