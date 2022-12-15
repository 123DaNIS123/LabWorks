:-op( 50,xfy, :).

flight( Point1, Point2, Day, Nf, TimeDep, TimeArrival) :-
    schedule( Point1, Point2, FlightList),
    member( TimeDep / TimeArrival / Nf / DaysList, FlightList),
    day_dep( Day, DaysList).

member( X, [X | L]).
member( X, [Y | L]) :- member( X,L ).


day_dep(Day, DaysList):-
    member(Day, DaysList).
day_dep(Day, everyday):-
    member(Day, [mon, tue, wed, thur, fri, sat, sun]).

route(P1, P2, Day, [P1-P2:Nf:Day:TimeDep:TimeArrival]):-
    % direct flight
    flight(P1, P2, Day, Nf, TimeDep, TimeArrival).

% Flight's Data Base

schedule( kazan, moscow,
         [9:40 / 10:50 / ba4733 / everyday,
           13:40 / 14:50 / ba4773 / everyday,
           19:40 / 20:50 / ba4833 / [mon,tue,wed, thur,fri,sun]] ).

schedule( moscow, kazan,
         [9:40/10:50/ba4732/everyday,
           11:40/12:50/ba4752/everyday,
           18:40/19:50/ba4822/[mon,tue,wed, thur,fri]] ).

schedule( moscow, saint_petersburg,
         [13:20/16:20/ba614/everyday,
           14:45/17:20/sr805/everyday] ).

schedule( moscow, samara,
         [9:10/11:45/ba614/everyday,
           14:45/17:20/sr805/everyday] ).

schedule( moscow, sochi,
         [8:30/11:20/ba510/everyday,
           11:00/13:50/ba4773/everyday,
           19:40/12:50/ba4833/[mon,tue,wed, thur,fri,sun]] ).

schedule( saint_petersburg, samara,
         [9:40/10:50/ba4733/everyday,
           13:40/14:50/ba4773/everyday,
           19:40/20:50/ba4833/[mon,tue,wed, thur,fri,sun]] ).

schedule( saint_petersburg, moscow,
         [9:40/10:50/ba4733/everyday,
           13:40/14:50/ba4773/everyday,
           19:40/20:50/ba4833/[mon,tue,fri,sun]] ).

schedule( sochi, moscow,
         [13:40/14:50/ba4773/everyday,
           19:40/20:50/ba4833/[thur,fri,sun]] ).

schedule( sochi, samara,
         [9:40/10:50/ba4733/everyday,
           19:40/20:50/ba4833/[mon,tue,wed, thur,fri,sun]] ).

schedule( samara, saint_petersburg,
         [9:40/10:50/ba4733/everyday,
           13:40/14:50/ba4773/everyday] ).

schedule( samara, moscow,
         [9:40/10:50/ba4733/everyday,
           15:45/19:55/ba4833/[mon,tue,wed, thur,fri,sun]] ).

interface :-
    writeln('d - для поиска маршрута в определённый день'),
    writeln('ad - для поиска маршрутов'),
    read(Answer),
    route_make(Answer).

route_make('d'):-
    writeln("Город отправления с маленькой буквы и латиницей"),
    writeln("Город отправления: "),
    read(City1),
    writeln("Город прибытия: "),
    read(City2),
    writeln("День отправления: "),
    read(Theday),
    route( City1, City2, Theday, R ),
    writeln(R),
    abort.

route_make('ad'):-
    writeln("Город отправления с маленькой буквы и латиницей"),
    writeln("Город отправления: "),
    read(City1),
    writeln("Город прибытия: "),
    read(City2),
    route( City1, City2, _, R ),
    writeln(R).
