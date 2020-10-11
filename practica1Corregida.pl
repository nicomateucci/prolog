% 1
observa(maria,omar).
observa(laura,omar).
observa(maria,flavio).
observa(gabriela,flavio).
observa(maria,carlos).
observa(maria).

% 2
conoce(franco,ingles).
conoce(renzo,ingles).
conoce(franco,frances).
conoce(renzo,frances).
conoce(franco,italiano).
conoce(marco,ingles).
conoce(omar,ingles).
conoce(maria,frances).

habla_ingles_frances(X) :-  conoce(X, frances),
                            conoce(X, ingles).

% 3
grupo1(brasil).
grupo1(españa).
grupo1(jamaica).
grupo1(italia).
grupo2(argentina).
grupo2(nigeria).
grupo2(holanda).
grupo2(escocia).
grupo2(irlanda).

son_rivales(X,Y) :- grupo1(X), grupo1(Y).
son_rivales(X,Y) :- grupo2(X), grupo2(Y).

mis_rivales(X, Rival) :- son_rivales(X,Rival),
    dif(X,Rival).

% 4

hombre(nico).
hombre(seba).
hombre(pablo).
hombre(nestor).
hombre(mariano).
hombre(juan).
hombre(orlando).
hombre(carlos).
hombre(mati).
mujer(roxana).
mujer(vanesa).
mujer(sara).
mujer(jazmin).
mujer(beba).
mujer(bety).
padres(sara, vanesa, mariano).
padres(mati, carlos, romina).
padres(jazmin, carlos, claudia).
padres(pablo, vanesa, mariano).
padres(nico, roxana, nestor).
padres(seba, roxana, nestor).
padres(roxana, beba, juan).
padres(carlos, beba, juan).
padres(vanesa, beba, juan).
padres(mariano, bety, orlando).

% reglas
hermana(A,B) :- padres(A,X, _),
                padres(B,X,_ ).
hermana(A,B) :- padres(A,_,Y ),
                padres(B,_,Y ).

nieto(A,B) :-   padres(A, X, Y),
    padres(X, B, _).
nieto(A,B) :-   padres(A, X, Y),
    padres(X, _, B).
nieto(A,B) :-   padres(A, X, Y),
    padres(Y, B, _).
nieto(A,B) :-   padres(A, X, Y),
    padres(Y, _, B).

abuelo(A,B) :- nieto(B,A).

tia(A,B) :- padres(B, Madre, Padre),
    hermana(A, Padre).

tia(A,B) :- padres(B, Madre, Padre),
        hermana(A, Madre).

% tia(A,B) :- padres(A, Madre, Padre),
%     padres(X, Madre, Padre),
%     dif(A,B),
%     padres(B, _, X).

% 5 Deudor auto

% auto(patente, dueño)

auto(hti687, pedro).
auto(jug144,juan).
auto(gqm758,pedro). % tiene deuda
auto(lod445,carlos).
auto(lfz569, miguel). % tiene deuda
auto(axk798, maria).  % tiene deuda

% deuda(patente, monto)

deuda(lfz569, 2000).
deuda(gqm758, 15000).
deuda(axk798,1000).

esDeudor(Persona) :- auto(Pat,Persona),
                        deuda(Pat, _).

% 6 Bandas de rock

es_guitarrista(carolina).
es_guitarrista(jose).
es_guitarrista(miguel).
es_guitarrista(nico).
es_cantante(mariano).
es_cantante(silvia).
es_cantante(mauro).
es_cantante(gianLucas).
es_baterista(eduardo).
es_baterista(diego).
es_baterista(laura).
es_baterista(mateo).

vive_en(rosario, es_guitarrista(carolina)).
vive_en(rosario, es_guitarrista(jose)).
vive_en(rosario, es_cantante(mariano)).
vive_en(rosario, es_baterista(laura)).
vive_en(funes, es_guitarrista(miguel)).
vive_en(funes, es_cantante(silvia)).
vive_en(funes, es_cantante(mauro)).
vive_en(roldan, es_baterista(eduardo)).
vive_en(casilda, es_baterista(diego)).
vive_en(dda, es_baterista(mateo)).
vive_en(dda, es_guitarrista(nico)).
vive_en(dda, es_cantante(gianLucas)).

vive_en(rosario, carolina).
vive_en(rosario, jose).
vive_en(rosario, mariano).
vive_en(rosario, laura).
vive_en(funes, miguel).
vive_en(funes, silvia).
vive_en(funes, mauro).
vive_en(roldan, eduardo).
vive_en(casilda, diego).
vive_en(dda, nico).
vive_en(dda, mateo).
vive_en(dda, gianLucas).

% union_natural(A,B,C) :- es(B,A), vive_en(C,A).

% cantantes_de_ciudad(X) :- vive_en(_, es_cantante(X)).

hay_baterista(X) :- vive_en(X, Persona), es_baterista(Persona).
hay_cantante(X) :- vive_en(X, Persona), es_cantante(Persona).
hay_guitarrista(X) :- vive_en(X, Persona), es_guitarrista(Persona).

hay_baterista2(Ciudad) :- vive_en(Ciudad, es_baterista(_)).
hay_cantante2(Ciudad) :- vive_en(Ciudad, es_cantante(_)).
hay_guitarrista2(Ciudad) :- vive_en(Ciudad, es_guitarrista(_)).

puede_armar_banda(Ciudad) :- hay_baterista(Ciudad),
                             hay_cantante(Ciudad),
                             hay_guitarrista(Ciudad).

puede_armar_banda2(Ciudad) :- hay_baterista2(Ciudad),
                             hay_cantante2(Ciudad),
                             hay_guitarrista2(Ciudad).


% Ejemplo tutorial mycyberacademy - Ejemplo grafos

% conexion(d,h,4).
% conexion(h,f,9).
% conexion(i,f,11).
% conexion(f,g,10).
% conexion(f,a,8).
% conexion(a,b,7).
% conexion(d,i,16).
%
% tiene_aristas(X) :- conexion(X,_,_).
%
% costo_paso(X,Y, Res) :- conexion(X, Z, C1),
% 				   conexion(Z,Y, C2),
% 				   Res is C1 + C2.
%
% costo_con_intermedio(A,B,C, Costo) :-
% 	conexion(A,B, C1),
% 	conexion(B,C, C2),
% 	Costo is C1 + C2.
%
% costo_mayor(A,B, CostoMayor) :-
% 	CostoMayor = 0,
% 	conexion(A,X,C1),
% 	conexion(X,B, C2),
% 	(C1 + C2) > CostoMayor,
% 	CostoMayor is (C1 + C2).

%7 Calculadora

%sumar(X,Y) :- Suma is X + Y, write(Suma).
%restar(X,Y) :- Resta is X - Y, write(Resta).
%dividir(X,Y) :- Coc is X / Y, write(Coc).
%multiplicar(X,Y) :- Prod is X * Y, write(Prod).

%caculadora(operacion(Arg1, Arg2), Resultado)
calculadora(sumar(X,Y), Resultado) :- Resultado is X + Y.
calculadora(restar(X,Y), Resultado) :- Resultado is X - Y.
calculadora(multiplicar(X,Y), Resultado) :- Resultado is X * Y.
calculadora(dividir(X,Y), Resultado) :- Resultado is X / Y.

% 8 Horoscopo

% horoscopo(Signo,DiaInicio,MesIni,DiaFin,MesFin).

horoscopo(capricornio, 22, 12, 20, 1).
horoscopo(acuario, 21, 1, 19, 2).
horoscopo(piscis, 20 ,2, 20, 3).
horoscopo(aries,21,3,20,4).
horoscopo(tauro,21,4,21,5).
horoscopo(geminis,22,5,21,6).
horoscopo(cancer,22,6,23,7).
horoscopo(leo, 24, 7, 23, 8).
horoscopo(virgo, 24, 8, 23, 9).
horoscopo(libra, 24, 9, 23, 10).
horoscopo(escorpio, 24, 10, 22, 11).
horoscopo(sagitario, 23, 11, 21, 12).

% 24/5   25/6
fecha_del_pasado(MiDia, MiMes, Dia, Mes) :- MiMes < Mes; (MiMes =:= Mes, MiDia < Dia).

%fecha_to_number(Dia, Mes, Result) :- Result = (Mes * 31) + Dia.

signo(Dia,Mes,Signo) :- horoscopo(Signo,A,B,C,D),
                        fecha_del_pasado(Dia,Mes, C,D),
                        fecha_del_pasado(A,B, Dia, Mes);
                        horoscopo(Signo,Dia,Mes,_,_);
                        horoscopo(Signo,_,_,Dia,Mes).

signo(Dia,Mes,Signo) :- horoscopo(Signo, A, B, C, D),
    Mes >= B,
    Dia >= A,
    Mes =< D,
    Dia =< C.

% Recursividad --------------------------------------------------------------------------------------

% 9 ------------Padre-hijo
hijo(juan,miguel).
hijo(jose,miguel).
hijo(miguel,roberto).
hijo(julio,roberto).
hijo(roberto,carlos).

descendiente(A,B) :- hijo(A,B).

descendiente(A,B) :-hijo(A,Otro),
    descendiente(Otro,B).

% 10 tareas

conexion(a,c,6).
conexion(c,d,4).
conexion(b,d,3).
conexion(d,e,5).
conexion(b,f,3).
conexion(e,h,4).
conexion(e,i,4).
conexion(i,j,2).
conexion(f,g,7).
conexion(g,j,4).
conexion(h,j,5).
% pruebas

requiere_de(X,Y) :-
    conexion(X,Y,_).

requiere_de(X,Y) :-
    conexion(Nodo, Y, _),
    requiere_de(X, Nodo).

detras_de(X, Nodo, SacarNodo) :-
    dif(Nodo, SacarNodo),
    conexion(Nodo, X,_).

distancia(X,Y, Duracion) :-
    conexion(X,Y, Duracion);
    conexion(X,Intermedia, D1),
    distancia(Intermedia, Y, D2),
    Duracion is D1 + D2.

total_duracion(a,6).
total_duracion(b,3).
total_duracion(X, Tiempo) :-
    total_duracion(X, Tiempo);
    conexion( NodoIntermedio,X, T1),
    total_duracion(NodoIntermedio, T2),
    Tiempo is T1 +T2.

%11
factorial(0,1).
factorial(N,Z):-X is N-1,factorial(X,R),Z is R*N.
inicio:-write('Ingrese un número: '),read(N),factorial(N,Z),write(Z).

%12

suma(0, 0).
suma(X, Res) :-
    X >= 0,
    A is X - 1,
    suma(A, Ri),
    Res is X + Ri.

% 13

esPar(X) :- R is X mod 2, R == 0.

sumarRestandoDos(0,0).
sumarRestandoDos(1,1).
sumarRestandoDos(N, Res) :-
    N >= 1,
    A is N - 2,
    sumarRestandoDos(A, Ri),
    Res is N + Ri.

sumaParImpar(N,SumPares, SumaImpares) :-
    esPar(N),
    sumarRestandoDos(N, SumPares),
    sumarRestandoDos(N - 1, SumaImpares).

sumaParImpar(N,SumPares, SumaImpares) :-
    not(esPar(N)),
    sumarRestandoDos(N, SumaImpares),
    sumarRestandoDos(N - 1, SumPares).
