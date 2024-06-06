postoji :: [(Int, Char)] -> (Int, Char) -> Bool
postoji ruka karta = foldr ((\el acc -> if el then el else acc) . (== karta)) False ruka

sortirajRuku :: [(Int, Char)] -> [(Int, Char)]
sortirajRuku [] = []
sortirajRuku (g : r) = sortirajRuku manje ++ [g] ++ sortirajRuku vece
  where
    manje = [x | x <- r, x < g]
    vece = [x | x <- r, x > g]

dodaj :: [(Int, Char)] -> (Int, Char) -> [(Int, Char)]
dodaj ruka karta =
  if postoji ruka karta
    then ruka
    else sortirajRuku (karta : ruka)

ukloni :: [(Int, Char)] -> (Int, Char) -> [(Int, Char)]
ukloni ruka karta = [x | x <- ruka, x /= karta]

uporedi :: [(Int, Char)] -> [(Int, Char)] -> Ordering
uporedi = compare
