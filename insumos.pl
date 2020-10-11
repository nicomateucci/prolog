% personal

personal(juan).
personal(pedro).
personal(lucas).
personal(martin).

% materiales

insumo(cemento,20).
insumo(arena,5).
insumo(cal,10).
insumo(plasticor, 50).
insumo(aleacionSilicio, 500).

% material importado
insumoImportado(plasticor, 50).
insumoImportado(aleacionSilicio, 500).

% herramientas

equipo(grua,200).
equipo(taladro,50).

% empleados

empleado(nico, oficina).
empleado(seba, gerencia).

% habilitaciones.
% Sale de unarealción de muchos a muchos entre peronsal y equipos
habilitado(juan, grua).
habilitado(juan, taladro).
habilitado(padro, grua).

% proyeccion
proyectarNombre(Nombre) :-insumo(Nombre, _), write(Nombre), nl, fail. % _ variable anonima
proyectarPrecio(Precio) :-insumo(_, Precio).

% seleccion
seleccionar(Nom, Pre) :- insumo(Nom,Pre),Pre < 15.

% producto
producto(I1, I2, E1, E2) :- insumo(I1,I2),equipo(E1, E2).

% --------------------------------------------------------------------------------

% union
union(X,Y) :- insumo(X,Y);equipo(X,Y).

% la union incompatible funciona igual en Prolog
unionIncompatible(X,Y) :- insumo(X,Y);empleado(X,Y).


% diferencia
diferencia(X,Y) :- insumo(X,Y), not(insumoImportado(X,Y)).

diferencia2(X,Y) :- union(X,Y), not(insumo(X,Y)).

% los que estan en ambos
en_ambos(X,Y) :- insumo(X,Y), insumoImportado(X,Y).

% interseccion

interseccion_habilitados_grua_taladro(X) :- habilitado(X, grua),
                                            habilitado(X,taladro).
