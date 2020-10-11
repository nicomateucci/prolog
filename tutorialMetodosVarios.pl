
% auto(patente, consumo_por_km, tipo_combustible, listado]_choferes)
% chofer(nombre, años_experiencia, km_recorridos)

auto(hav390, 0.4, nafta, [chofer('Jose', 5,17), chofer('Juan',6 ,9)]).
auto(hav391, 0.6, gasoil, [chofer('Pedro', 5,17), chofer('Emilio',6 ,9)]).
auto(hav392, 0.8, nafta, [chofer('Santiago', 5,17), chofer('Jose',6 ,9)]).
auto(hav394, 1.8, nafta, [chofer('Jorge', 5,17), chofer('Jose',6 ,9)]).
auto(hav395, 0.5, gasoil, [chofer('Esteban', 5,17), chofer('Juan',6 ,9)]).


%a) Listado de las patentes de todos los carros que consumen nafta


%b) Dada una chapa y una cantidad de combustible, determinar cuandos km puede recorrer un auto recorrer
%   un auto con el combustible dado

cantKm(Patente, CantComb, CantKm) :-
    auto(Patente, ConsumoKm, _,_),
    CantKm is CantComb * ConsumoKm.
