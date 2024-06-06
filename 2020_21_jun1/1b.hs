import Data.List (sort)

data Znak = Herc | Karo | Pik | Tref
  deriving (Show, Eq, Ord)

data Karta = MkKarta {vrednost :: Int, znak :: Znak}
  deriving (Show, Eq, Ord)

type Ruka = [Karta]

izlistaj :: Znak -> Ruka -> [Karta]
izlistaj z ruka = [x | x <- ruka, znak x == z]

postoji :: Ruka -> Karta -> Bool
postoji ruka karta = foldr ((\el acc -> if el then el else acc) . (== karta)) False ruka

dodaj :: Ruka -> Karta -> Ruka
dodaj ruka karta =
  if postoji ruka karta
    then ruka
    else sort (karta : ruka)

-- ili ako pretpostavljamo da je prosledjena ruka vec sortirana:
-- dodaj ruka karta = manje ++ [karta] ++ vece
--   where
--     manje = [x | x <- ruka, x < karta]
--     vece = [x | x <- ruka, x > karta]

najjaca :: Ruka -> Karta
najjaca = last
