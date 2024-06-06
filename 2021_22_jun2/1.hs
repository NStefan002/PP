maxl :: (Ord a) => [a] -> a
maxl [x] = x
-- null lista je kao length lista == 0
maxl (g : r) = if null veci then g else maxl veci
  where
    veci = [x | x <- r, x > g]

ind' :: (Eq a) => [a] -> a -> Int -> Int
ind' [y] x idx = if x == y then idx else -1
ind' (g : r) x idx = if g == x then idx else ind' r x (idx + 1)

ind :: (Eq a) => [a] -> a -> Int
ind [] x = -1
ind lst x = ind' lst x 1

presek :: (Eq a) => [a] -> [a] -> [a]
presek lst1 lst2 = [x | x <- lst1, ind lst2 x /= -1]

umetni :: [a] -> a -> [a]
umetni [] x = []
umetni [y] x = [y]
umetni (g : r) x = [g, x] ++ umetni r x
