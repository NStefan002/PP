kakuro(Vars) :- Vars = [
        X1, X2, X3, X4, X5, X6, X7, X8,
        X9, X10, X11, X12, X13, X14, X15, X16
    ],
    Vars :: 1..9,

    % vrste
    alldistinct([X1, X2]),
    alldistinct([X3, X4, X5, X6]),
    alldistinct([X7, X8]),
    alldistinct([X9, X10]),
    alldistinct([X11, X12, X13, X14]),
    alldistinct([X15, X16]),

    % kolone
    alldistinct([X3, X7]),
    alldistinct([X1, X4, X8, X11]),
    alldistinct([X2, X5]),
    alldistinct([X12, X15]),
    alldistinct([X6, X9, X13, X16]),
    alldistinct([X10, X14]),

    %vrste
    X1 + X2 #= 5,
    X3 + X4 + X5 + X6 #= 17,
    X7 + X8 #= 6,
    X9 + X10 #= 4,
    X11 + X12 + X13 + X14 #= 10,
    X15 + X16 #= 3,

    %kolone
    X3 + X7 #= 14,
    X1 + X4 + X8 + X11 #= 11,
    X2 + X5 #= 4,
    X12 + X15 #= 3,
    X6 + X9 + X13 + X16 #= 10,
    X10 + X14 #= 3,

    labeling(Vars).
