% benzin, dizel, zarada
rafinerija(Vars) :- Vars = [B, D],
    B :: 150000..600000,
    D :: 0..325000,
    B + D #=< 600000,
    D #>= 2 * B,
    labeling([maximize(2*B + D)], Vars),
    Z is (2*B + D),
    write('Maksimalna zarada je: '), write(Z), write(' dolara'), nl,
    write('Kolicina benzina: '), write(B), write(' galona'), nl,
    write('Kolicina dizela: '), write(D), write(' galona'), nl.
