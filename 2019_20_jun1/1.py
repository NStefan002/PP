import json
import sys


class Player:
    def __init__(self, dres, ime, prezime, visina, godine):
        self.dres = dres
        self.ime = ime
        self.prezime = prezime
        self.visina = visina
        self.godine = godine
        self.pozicija = 1
        if 190 <= visina < 200:
            self.pozicija = 3
        elif visina >= 200:
            self.pozicija = 5


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("-1")
        sys.exit()

    igraci = []
    try:
        with open(sys.argv[1], "r") as f:
            obj = json.load(f)
            for o in obj:
                igraci.append(
                    Player(o["dres"], o["ime"], o["prezime"], o["visina"], o["godine"])
                )

    except IOError:
        print("-1")
        sys.exit()

    godina = float(input())
    pozicija = int(input())
    max_visina = 0
    for i in igraci:
        if i.pozicija == pozicija and i.godine <= godina:
            if max_visina < i.visina:
                max_visina = i.visina

    if max_visina == 0:
        print("-1")
    else:
        print(max_visina)
