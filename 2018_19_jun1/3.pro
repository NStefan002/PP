clan(X, [X|_]).
clan(X, [_|R]) :- clan(X, R).

% devojka(ime, prezime, vrsta obuce, boja obuce)

drugarice(L) :-
    L = [
        d(anja, _, cipele, _),
        d(milica, _, sandale, _),
        d(kaca, andonov, _, _),
        d(_, _, _, _)
    ],
    clan(d(_, ranisavljevic, _, zelena), L),
    clan(d(_, _, cizme, braon), L),
    clan(d(_, cugurovic, _, _), L),
    clan(d(_, ranisavljevic, _, _), L),
    clan(d(_, _, sandale, _), L),
    clan(d(_, _, _, crna), L),
    clan(d(_, _, cipele, _), L),
    clan(d(_, _, _, pink), L),
    clan(d(_, bogdanovic, _, _), L),
    clan(d(jelena, _, _, _), L),
    clan(d(_, _, patike, _), L),
    not(clan(d(_, cugurovic, cipele, braon), L)),
    not(clan(d(milica, ranisavljevic, _, _), L)),
    not(clan(d(milica, _, sandale, crna), L)),
    not(clan(d(kaca, andonov, cizme, _), L)),
    not(clan(d(_, _, cipele, pink), L)),
    not(clan(d(anja, bogdanovic, _, _), L)),
    not(clan(d(jelena, _, patike, _), L)).
