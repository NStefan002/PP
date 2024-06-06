data Transakcija = MkTransakcija
  { ident :: Int,
    iznos :: Int,
    posiljalac :: String,
    primalac :: String
  }
  deriving (Show, Eq)

type AktivneTransakcije = [Transakcija]

-- spajamo listu transakcija u kojima je 'br' posiljalac sa listom transakcija u kojima je 'br' primalac
izlistaj :: AktivneTransakcije -> String -> [Transakcija]
izlistaj ts br = [x | x <- ts, posiljalac x == br] ++ [x | x <- ts, primalac x == br]

dodaj :: AktivneTransakcije -> Transakcija -> AktivneTransakcije
dodaj ts t = t : ts

ukloni :: AktivneTransakcije -> Int -> AktivneTransakcije
ukloni ts i = [x | x <- ts, ident x /= i]

ukupno :: AktivneTransakcije -> Int
ukupno = foldr ((+) . iznos) 0 -- prvo se na element liste primeni iznos pa se onda primeni acc + taj medjurezultat, gde je acc akumulator (0 na pocetku)
-- ili:
-- ukupno = foldr (\el acc -> iznos el + acc) 0
