%               Práctica bases de datos y functores

% Etiqueta que indica que un hecho es dinamico. 
% En Prolog todos los hechos son estaticos (no pueden ser alterados en tiempo de ejecución).
%   Internamente, Prolog compila las clausulas estaticas, por eso es que debe hacerse la diferencia.
%:-dynamic personas/2.

% Cargar los datos de un archivo desde el disco a la memoria.
consultarBase :- consult('BasesDeDatos/DatosPersonas.txt').

% Escribir en el disco los cambios en memoria.
guardarPersonas :- tell('BasesDeDatos/DatosPersonas.txt'), listing(personas), told.
guardarLibros :- tell('BasesDeDatos/DatosLibros.txt'), listing(libro), told.
guardarAnimales :- tell('BasesDeDatos/DatosAnimales.txt'), listing(animal), told.


%-----------------------------------------------------------------------


%1. Hacer un programa que permita definir las cuentas a pagar del mes (luz,agua, alquiler, teléfono,
%  cable, supermercado, etc.) de un grupo de personas. A su vez, deberá permitir ingresar el nombre de
%  una de ellas e informar de todos sus gastos.

% Modelo 1
persona(juan, agua).
persona(juan, luz).
persona(juan, gas).
persona(jose, luz).
persona(jose, cable).
persona(jose, internet).

getCuentasPersona(Nombre, Cuentas) :- persona(Nombre, Cuentas).

% Modelo 2
persona(juan, [luz, agua, gas]).
persona(jose, [luz, cable, internet]).


%2. Hacer un programa que defina una Base de datos de personas de la siguiente forma:
%  personas(codigo,nombre). El programa debe permitir ingresar un código y verificar si el mismo está
%  definido en la BBDD. De estarlo deberá informar a quién corresponde, de lo
%  contrario deberá solicitar ingresar un nombre y registrar entonces la persona en la BBDD.

%personas(Nombre, []).
%crearLista(X,L,[X|L]).

validarCodigo(Cod) :- personas(Cod, Nom), 
     write('El código ingresado esta cargado en la base y pertence a '),
     write(Nom).

validarCodigo(Cod) :- write('Ingrese su nombre '),
    read(Nom),
    consult('BasesDeDatos/DatosPersonas.txt'),
    assertz(personas(Cod, Nom)),
    guardarPersonas,
    validarCodigo(Cod).


%3. Desarrollar un programa que permita definir los hábitos de:
%   • alimentación (comida, cantidad)
%   • bebida (bebida, cantidad)
%   • reproducción (época de reproducción, período de gestación)
%   • horas de sueño de un conjunto de animales de un Zoo.

%animal('NombreAnimal', alimentación (comida, cantidad), bebida(bebida, cantidad), 
%    reproducción(época de reproducción, período de gestación), horasSueño(cantidad).

%Dicha información se guardará en una base de datos. El programa, deberá permitir:
%   a. Ingresar el nombre de un animal e informar de todos sus hábitos.
%   b. Ingresar un hábito e informar todos los animales que lo tienen.

ej3A :- write('Ingrese el nombre de un animal '), read(Nom),
   consult('BasesDeDatos/DatosAnimales.txt'),
   animal(Nom,A,B,C,D),
   write('Lista de habitos de '), write(Nom), tab(1),
   write(A), tab(1),
   write(B), tab(1),
   write(C), tab(1),
   write(D).

buscarAnimalByHabito(Hab, Func) :- functor(Func, A,_),
   A == Hab.


ej3B :- write('Ingrese un habito para buscar '), read(Hab),
   consult('BasesDeDatos/DatosAnimales.txt'),
   animal(Nom,A,_,_,_),
   functor(A,Fun,_).


%4. Ampliar el ejercicio 1 a través del uso de functores. Por ejemplo:
%  gasto(maria, super(coto,500)).
%  gasto(omar, tel(fijo,telecom,150)).
%  gasto(maria,tel(movil,personal,100)).

gasto(juan, agua(aysa, 500)).
gasto(juan, luz(epe, 2000)).
gasto(juan, gas('litoral gas', 1500)).
gasto(jose, luz('EPE Buenos Aires', 4000)).
gasto(jose, cable(cablehogar, 1100)).
gasto(jose, internet(fibertel, 1300)).

%  a. Ingresar un gasto (por ej. super) e informar todas las personas que tienen dicho gasto.
ej4A :- write('Ingrese un habito para buscar '), read(Hab),
   gasto(Nom, NombreGasto),
   functor(NombreGasto, FuncNomGasto, _),
   string_lower(Hab, Lower), % Convertir el habito ingresado a minusculas. Debe ingresarse entre ''.
   term_string(FuncNomGasto, Lower2), % Convertir el functor en string: agua -> "agua"
   Lower == Lower2,
   write(Nom),
   write(' tuvo el gasto ingresado.').
   
%  b. Informar las personas que tienen un consumo superior a los $150 en un cierto gasto (dato de entrada).
ej4B :- write('Ingrese un habito para buscar '), read(Hab),
   gasto(Nom, NombreGasto),
   functor(NombreGasto, FuncNomGasto, _),
   string_lower(Hab, Lower), 
   term_string(FuncNomGasto, Lower2),
   Lower == Lower2,
   arg(2, NombreGasto, Valor),
   Valor > 150,
   write(Nom),
   write(' tuvo un gasto superior a 150$.').

%  c. Calcular gasto promedio para una determinada persona (dato de entrada).
calcularPromedioGastos(Per, Total, CantGastos) :- gasto(Per, Funct),
   arg(2, Funct, Valor),
   Total is Total + Valor,
   CantGastos is CantGastos + 1.

ej4C :- write('Ingrese el nombre de una persona '), read(Nom),
   string_lower(Nom, NomLower).
   

%5. Hacer un programa que permita realizar altas, bajas y consultas a la base de datos de una librería.
% De cada libro se registran los siguientes datos:
%   • Nro. de libro (auto numérico)
%   • Titulo
%   • Autor
%   • Editorial
%   • Precio
% La base datos debe guardarse en disco.

%Devuelve la cabeza de la lista.
getCabeza([C|L], C).

%Devuelve el ultimo elemento de la lista, usado para encontrar el ultimo Id cargardo en la base.
ultimoElementoLista(Lista, Ult) :- invertirLista(Lista, ListaInvertida), 
    getCabeza(ListaInvertida, Ult).

invertirLista([],[]).
invertirLista([Cabeza | Cola], ListaInvertida) :- invertirLista(Cola, ListaTemp),
    append(ListaTemp, [Cabeza], ListaInvertida).
    % @Duda Porque si no pongo Cabeza entre corchetes no funciona: Porque la regla append()
    %    recibe tres listas como parametros. En el caso de la cabeza, la tengo que pasar dentro de
    %    una lista para poder cumplir con los tipos de datos que necesita el la regla..

% Cantidad de reglas cargadas en la base de datos:
%        - Primero agrupa todos los IdLibros existentes.
%        - Luego retorna el ultimo IdLibro
contarHechos(Cont) :- consult('BasesDeDatos/DatosLibros.txt'),
    findall(IdLibro, libro(IdLibro,_,_,_,_), IdLibros),
    ultimoElementoLista(IdLibros, Cont).

% Cargar datos de un libro y devolverlo como salida.
cargarDatosLibro(Libro) :- write('---->  Cargar nuevo libro: '), nl,
    write('Ingrese el titulo del nuevo libro: '), read(Titulo), nl,
    write('Ingrese el autor del nuevo libro: '), read(Autor), nl,
    write('Ingrese el editorial del nuevo libro: '), read(Editorial), nl,
    write('Ingrese el precio del nuevo libro: '), read(Precio), nl,
    contarHechos(Cont),
    NuevoId is Cont + 1,
    Libro = libro(NuevoId, Titulo, Autor, Editorial, Precio).

% Agregar un nuevo libro a la base de datos.
addLibro() :- cargarDatosLibro(Libro),
    consult('BasesDeDatos/DatosLibros.txt'),
    assertz(Libro),
    guardarLibros.

removeLibro(IdLibro) :- consult('BasesDeDatos/DatosLibros.txt'),
   retract(libro(IdLibro,_,_,_,_)), 
   guardarLibros.

mostrarDatosLibro(Libro) :- write('El libro ingresado es:'), nl,
   write('    Titulo: '), write(arg(2, Libro, Valor)), nl,
   write('    Autor:  '), write(arg(3, Libro, Valor)), nl,
   write('    Editorial: '), write(arg(4, Libro, Valor)), nl,
   write('    Precio: '), write(arg(5, Libro, Valor)).

getLibro(IdLibro) :- consult('BasesDeDatos/DatosLibros.txt'),
   Libro = libro(IdLibro, Nom, Aut, Edit, Precio),
  % mostrarDatosLibro(Libro).
   write('El libro ingresado es:'), nl,
   write('    Titulo: '), write(Nom), nl,
   write('    Autor:  '), write(Aut), nl,
   write('    Editorial: '), write(Edit), nl,
   write('    Precio: '), write(Precio).

getAllLibros() :- consult('BasesDeDatos/DatosLibros.txt'),
   findall().

ej5A :- write('Bienvenido a BiblioFar, una biblioteca virtual creada utilizando Inteligencia Artificial'), nl,
   write('Que operación desea realizar:'), nl,
   write('    1 - Consultar disponibilidad de un libro según su IdLibro'), nl,
   write('    2 - Agregar un nuevo libro'), nl,
   write('    3 - Borrar un libro: '), nl,
   write('    0 - Salir del sistema'), nl,
   read(Opc).

ej5A :- Opc == 1, write('Ingrese el IdLibro del libro buscado: '), read(IdLibro),
   getLibro(IdLibros).

% Calcular además el precio promedio de los libros de un determinado autor.

%6. Hacer un programa que permita registrar en una Base de Datos recetas
% de cocina. De cada receta se registran los siguientes datos:
%   • Código de receta
%   • Nombre de la receta
%   Y por cada ingrediente que contenga la receta:
%   • Nombre del ingrediente
%   • Cantidad

%receta(Codigo, Nombre)
receta(1, 'Torta 1234', [ingrediente(azucar, 400), ingrediente(harina, 300), ingrediente(huevo, 2), ingrediente(crema, 100)]).
receta(2, 'Torta invertida de manzana', [ingrediente(azucar, 300), ingrediente(harina, 500), ingrediente(huevo, 4), ingrediente(manteca, 200)]).
receta(3, 'Torta Lemon Pie', [ingrediente(azucar, 600), ingrediente(harina, 200), ingrediente(huevo, 8), ingrediente(manteca, 100), ingrediente(limon, 4]).
receta(4, 'Torta Exquisita', [ingrediente(lecha, 1000), ingrediente(huevo, 2), ingrediente('Polvo Exquisita', 100)]).
receta(5, 'Torta de Manteca', [ingrediente(azucar, 400), ingrediente(harina, 500), ingrediente(huevo, 4), ingrediente(manteca, 400)]).

ingrtediente(1, azucar, 100).
ingrtediente(1, manetaca, 100).
ingrtediente(1, huevo, 100).
ingrtediente(2, azucar, 100).
ingrtediente(2, huevo, 100).
ingrtediente(2, limon, 100).
% A su vez, permitir ingresar dos (2) ingredientes e informar de todas las recetas (Código y Nombre)
% que poseen ambos ingredientes. Por otro lado, para un ingrediente en particular y una cierta cantidad
% del mismo, determinar aquellas recetas que llevan ese ingrediente y superan dicha cantidad.

