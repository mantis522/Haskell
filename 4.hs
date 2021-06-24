data Tree = Leaf | Node Tree Int Tree

postorder :: Tree -> [Int]
postorder Leaf = []
postorder (Node l x r) = postorder l ++ postorder r ++ [x]

t1 = Node Leaf 1 Leaf
t3 = Node Leaf 3 Leaf
t5 = Node Leaf 5 Leaf
t4 = Node t3 4 t5
t2 = Node t1 2 t3

-- >>> postorder t2
-- [1,3,2]
--

nub :: Eq a => [a] -> [a]
nub l = nub' l []
  where
    nub' [] _ = []
    nub' (x:xs) ls
      | x `elem` ls = nub' xs ls
      | otherwise = x : nub' xs (x:ls)



nub2 :: Eq a => [a] -> [a]
nub2 [] = []
nub2 (x : xs) = x : [y | y <- nub2 xs, x /= y]


-- nub [1,2,3,3,3,2,4,1] = [1,2,3,4]
-- nub [2,3,3,3,2,4,1] = [2,3,4,1]
-- nub [3,3,3,2,4,1] = [3,2,4,1]
-- nub [3,3,2,4,1] = [3,2,4,1]
-- nub [3,2,4,1] = [3,2,4,1]
-- nub [2,4,1] = [2,4,1]
-- nub [4,1] = [4,1]
-- nub [1] = [1]

-- >>> nub [1,2,3,3,3,2,4,1]
-- [1,2,3,4]
--

monthNames = [(1, "Jan"), (2, "Feb")]

monthName1 n =
    case lookup n monthNames of
        Just s -> s
        Nothing -> "not found"

monthName2 n
    | Just s <- lookup n monthNames = s
    | otherwise = "not found"

absolute n
    | n >= 0 =n
    | otherwise = -n

-- >>> monthName1 1
-- "Jan"
--

