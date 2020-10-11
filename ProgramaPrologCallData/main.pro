% main.pro - front end user interface for phone pricing

% User repeat/fail loop to price each phone_call recor ...
% Calculate the Rate based on the Day and Hour 
% Multiple that times the DUration to get the Price

main :-
	phone_call(ID, Day, Hour, Duration),
	rate(Day, Hour, Rate),
	Price is Rate * Duration,
	write(ID), tab(2), 
	write(Day), tab(2), 
	write(Hour), tab(2), 
	write(Price), tab(2),
	fail.
main. 