tupJ :: (Show a, Show b) => (a, b) -> String
tupJ t = "(" ++ show (fst t) ++ "," ++ show (snd t) ++ ")"

lstJ :: (Show a) => [a] -> String
lstJ = show

flstJ :: (Show a) => ([a] -> Bool) -> [[a]] -> [String]
flstJ p lst = map show (filter p lst)

zipJ :: (Show a) => [a] -> [(a, String)]
zipJ lst = zip lst (map show lst)
