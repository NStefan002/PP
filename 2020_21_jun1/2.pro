paran(X) :- X mod 2 #= 0.
neparan(X) :- X mod 2 #= 1.

razlicita_parnost(X, Y) :- paran(X), neparan(Y).
razlicita_parnost(X, Y) :- neparan(X), paran(Y).

kvadrat(Vars) :-
    Vars = [
        X13, X23, X33,
        X12, X22, X32,
        X11, X21, X31
    ],
    Vars :: 1..9,
    alldistinct(Vars),
    razlicita_parnost(X13, 1 + 3),
    razlicita_parnost(X23, 2 + 3),
    razlicita_parnost(X33, 3 + 3),
    razlicita_parnost(X12, 1 + 2),
    razlicita_parnost(X22, 2 + 2),
    razlicita_parnost(X32, 3 + 2),
    razlicita_parnost(X11, 1 + 1),
    razlicita_parnost(X21, 2 + 1),
    razlicita_parnost(X31, 3 + 1),
    labeling(Vars),
    write(X13), write(' '), write(X23), write(' '), write(X33), nl,
    write(X12), write(' '), write(X22), write(' '), write(X32), nl,
    write(X11), write(' '), write(X21), write(' '), write(X31), nl.
