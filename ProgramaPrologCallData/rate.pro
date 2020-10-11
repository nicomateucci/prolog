% rate.pro - phone calls pricing rules

% rate is 5 cents on the weekend
% rate is 7 cents on a weekday during the night
% rate is 5 cents on a weekday during the day

weekend(sabado).
weekend(domingo).

weekday(lunes).
weekday(martes).
weekday(miercoles).
weekday(jueves).
weekday(viernes).

nightTime(Hour) :-
	Hour > 19.
nightTime(Hour) :-
	Hour < 8.

dayTime(Hour):-
	Hour >= 8.
	
dayTime(Hour):-
	Hour =< 19.

rate(Day, Hour, 5) :-
	weekend(Day).
	
rate(Day, Hour, 7) :-
	weekday(Day),
	nightTime(Hour).
	
rate(Day, Hour, 5) :-
	weekday(Day),
	dayTime(Hour).
	
	
	