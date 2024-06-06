import constraint

sastojci = {
    "brasno": {"cena": 30, "max_kesica": 10, "protein": 20, "masti": 30, "secer": 5},
    "plazma": {"cena": 300, "max_kesica": 20, "protein": 15, "masti": 10, "secer": 30},
    "jaja": {"cena": 50, "max_kesica": 7, "protein": 70, "masti": 150, "secer": 2},
    "mleko": {"cena": 170, "max_kesica": 5, "protein": 40, "masti": 32, "secer": 15},
    "visnja": {"cena": 400, "max_kesica": 3, "protein": 23, "masti": 3, "secer": 45},
    "nutela": {"cena": 450, "max_kesica": 9, "protein": 7, "masti": 15, "secer": 68},
}

euro_u_dinare = 117
novac_u_eurima = 10
max_dinara = novac_u_eurima * euro_u_dinare
max_kesica = 10
max_masti = 500
max_secera = 150

problem = constraint.Problem()

for sastojak, podaci in sastojci.items():
    problem.addVariable(sastojak, range(podaci["max_kesica"] + 1))

problem.addConstraint(lambda *kesice: sum(kesice) <= max_kesica, sastojci.keys())

problem.addConstraint(
    lambda *kesice: sum(
        sastojci[s]["cena"] * kesice[i] for i, s in enumerate(sastojci.keys())
    )
    <= max_dinara,
    sastojci.keys(),
)

problem.addConstraint(
    lambda *kesice: sum(
        sastojci[s]["masti"] * kesice[i] for i, s in enumerate(sastojci.keys())
    )
    < max_masti,
    sastojci.keys(),
)

problem.addConstraint(
    lambda *kesice: sum(
        sastojci[s]["secer"] * kesice[i] for i, s in enumerate(sastojci.keys())
    )
    <= max_secera,
    sastojci.keys(),
)


def ukupno_proteina(resenje):
    return sum(sastojci[s]["protein"] * resenje[s] for s in resenje)


resenja = problem.getSolutions()
resenja = sorted(resenja, key=ukupno_proteina)
print(ukupno_proteina(resenja[-1]))
