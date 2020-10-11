% uruguay es un pais
es_un_pais(argentina).
es_un_pais(brasil).
es_un_pais(uruguay).
es_un_pais(chile).
es_un_pais(paraguay).

% brasil limita con argentina
limita_con(brasil, argentina).
limita_con(brasil, paraguay).
limita_con(brasil, uruguay).
limita_con(argentina, chile).
limita_con(argentina, uruguay).
limita_con(venezuela, brasil).
limita_con(argentina, pataguay).

% superficie pais
superficie_pais(brasil,8547404).
superficie_pais(uruguay,176000).
superficie_pais(uruguay,1000000).

% grafo no dirigido DISYUNTIVA
limitrofes(X,Y):- limita_con(X,Y); %OR
		  limita_con(Y,X).

%limitrofes(X,Y):- limita_con(Y,X).


% regla pais peque�o CONJUNTIVA
pais_paqueno(X):- superficie_pais(X,Y),
			Y < 1000000.

$ todos los paises translimitrofes

translimitrofes(X,Y):- limitrofes(X,Z),
 		       limitrofes(Z,Y),
		       dif(X,Y),
		       not(limitrofes(X,Y)).
