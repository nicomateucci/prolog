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

son_rivales(X,Y) :- grupo1(X), grupo1(Y);
                    grupo2(X), grupo2(Y).

mis_rivales(X, Rival) :- son_rivales(X,Rival),
                    dif(X,Rival).




% 7 Calculadora

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
horoscopo(aries,21,3,20,4).
horoscopo(tauro,21,4,21,5).
horoscopo(cancer,22,6,21,7). % Puede estar errado
horoscopo(geminis,22,5,21,6).

% 24/5   25/6
fecha_del_pasado(MiDia, MiMes, Dia, Mes) :- MiMes < Mes; (MiMes =:= Mes, MiDia < Dia).

%fecha_to_number(Dia, Mes, Result) :- Result = (Mes * 31) + Dia.

signo(Dia,Mes,Signo) :- horoscopo(Signo,A,B,C,D),
                        fecha_del_pasado(Dia,Mes, C,D),
                        fecha_del_pasado(A,B, Dia, Mes);
                        horoscopo(Signo,Dia,Mes,_,_);
                        horoscopo(Signo,_,_,Dia,Mes).

% Recursividad --------------------------------------------------------------------------------------

% 9 ------------Padre-hijo
hijo(juan,miguel).
hijo(jose,miguel).
hijo(miguel,roberto).
hijo(julio,roberto).
hijo(roberto,carlos).

descendiente(A,B) :- hijo(A,B);
    hijo(A,Otro),
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
    conexion(X,Y,_);
    conexion(Otro, Y, _),
    requiere_de(X, Otro).

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
    Tiempo is T1 + T2.

factorial(0,1).
factorial(N,Z):-X is N-1,factorial(X,R),Z is R*N.
inicio:-write('Ingrese un número: '),read(N),factorial(N,Z),write(Z).
