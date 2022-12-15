student(danis, male, excellent).
student(john, male, good).
student(margarita, female, excellent).
student(susie, female, notgood).
well_doner(X) :- student(X, _, excellent); student(X, _, good). /* Молодец ли X? */

run(X) :-
    well_doner(X);
    well_doner(Y), student(Y, male, _);
    well_doner(X), student(X, male, _).