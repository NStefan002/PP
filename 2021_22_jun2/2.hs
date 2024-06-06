type Stek a = [a]

push :: Stek a -> a -> Stek a
push s x = x : s

top :: Stek a -> Maybe a
top [] = Nothing
top (g : _) = Just g

pop :: Stek a -> (Maybe a, Stek a)
pop [] = (Nothing, [])
pop (g : r) = (Just g, r)

stekMap :: Stek a -> (a -> b) -> Stek b
stekMap s f = map f s

izbaciNeparne :: Int -> Stek a -> Stek a
izbaciNeparne idx [] = []
izbaciNeparne idx (g : r) =
  if mod idx 2 == 1
    then izbaciNeparne (idx + 1) r
    else g : izbaciNeparne (idx + 1) r

proredi :: Stek a -> Stek a
proredi = izbaciNeparne 0
