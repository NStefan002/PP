-- map prvo preslika listu racuna u listu bool-ova (true ako je broj racuna odgovarajuceg elementa jednak br)
-- zatim foldr (moze i foldl svejedno je) listu bool-ova svodi na true/false
postoji :: [(String, Int)] -> String -> Bool
postoji b br = foldr ((\el acc -> if el then el else acc) . (\x -> fst x == br)) False b
-- pre nadovezivanja map-a i foldr-a je funkcija je izgledala ovako:
-- postoji b br = foldr (\el acc -> if el then el else acc) False (map (\x -> fst x == br) b)

otvori :: [(String, Int)] -> String -> [(String, Int)]
otvori b br =
  if postoji b br
    then b -- ako racun vec postoji vracamo samo postojecu listu
    else (br, 0) : b -- dodavanje novog para na pocetak

zatvori :: [(String, Int)] -> String -> [(String, Int)]
zatvori b br = [x | x <- b, fst x /= br] -- vracamo samo racune koji imaju razlicit broj od br

uplati :: [(String, Int)] -> String -> Int -> [(String, Int)]
uplati b br iznos =
  if postoji b br
    -- ako racun postoji, onda ce funkcija map uvecati stanje na racunu koji ima broj 'br' za 'iznos'
    then map (\x -> if fst x == br then (fst x, snd x + iznos) else x) b
    -- ukoliko racun ne postoji, pravimo novu listu racuna (bn) i pozivamo uplati nad tom listom (koja ce sadrzati novi racun)
    else uplati bn br iznos
  where
    bn = otvori b br
