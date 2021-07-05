rewrite rules [] = []
rewrite rules ('A' : cs) = "B-A-B" ++ rewrite rules cs
rewrite rules ('B' : cs) = "A+B+A" ++ rewrite rules cs
rewrite rules (c : cs) = c : rewrite rules cs


-- >>> rewrite rules "B-A-B"
-- <interactive>:893:10-14: error: Variable not in scope: rules
--


-- >>> rules = [('A', "B-A-B"), ('B', "A+B+A")]
-- >>> lookup 'A' rules
-- Just "B-A-B"
--

-- rewrite :: String -> String
-- rewrite [] = []
-- rewrite ('A' : cs) = "B-A-B" ++ rewrite cs
-- rewrite ('B' : cs) = "A+B+A" ++ rewrite cs
-- rewrite (c : cs)   = c : rewrite cs

myZipWith f [] [] = []
myZipWith f (x : xs) (y : ys) = f x y : myZipWith f xs ys


suffixes [] = [[]]
suffixes (x : xs) = (x:xs) : suffixes xs

-- >>> suffixes [2, 3]
-- [[2,3],[3],[]]
--

prefixes [] = [[]]
prefixes (x : xs) = [] : [x : ys | ys <- prefixes xs]

-- >>> prefixes [2, 3]
-- [[],[2],[2,3]]
--

interleave x xs =
    [ys ++ [x] ++ zs | (ys, zs) <- zip (prefixes xs) (suffixes xs)]

-- >>> [ys ++ [1] ++ zs | (ys, zs) <- zip (prefixes [2,3]) (suffixes [2, 3])]
-- [[1,2,3],[2,1,3],[2,3,1]]
--

-- >>> interleave 1 [2, 3, 4]
-- [[1,2,3,4],[2,1,3,4],[2,3,1,4],[2,3,4,1]]
--

permutations [] = [ [] ]
permutations (x : xs) =
    [zs | ys <- permutations xs, zs <- interleave x ys]

-- >>> permutations [1, 2, 3]
-- [[1,2,3],[2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]]
--
