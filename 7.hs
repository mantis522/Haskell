myunzip :: [(a, b)] -> ([a], [b])
myunzip [] = ([], [])
myunzip ((x, y) : zs) = (x : xs, y : ys)
    where (xs, ys) = myunzip zs

-- >>> myunzip [(1, 10), (2, 20), (3, 30)]
-- ([1,2,3],[10,20,30])
--

power [] = [[]]
power (x : xs) = power xs ++ [x : ys | ys <- power xs]

-- >>> power [1, 2, 3]
-- [[],[3],[2],[2,3],[1],[1,3],[1,2],[1,2,3]]
--

-- Definition :
-- A1 : [] ++ ys = ys
-- A2 : (x : xs) ++ ys = x : (xs + ys)

-- R1 : rev [] = []
-- R2 : rev (x : xs) = rev xs ++ [x]

-- Lemma : 
-- rev (xs ++ [x]) = x : rev xs
--     for all elements x and lists xs

-- Proof.
-- We show the claim by structural induction on xs.
-- Base case:
-- If xs = [] then
--     lhs = rev ([] ++ (x : []))
--         = rev (x : [])   by A1
--         = rev [] ++ [x] by R2
--         = [] ++ [x] by R1
--         = [x] by A1

--     rhs = x : rev []
--         = x : [] by R1
--         = [x]

-- If xs = y : ys for some element y and list ys then
--     lhs = rev ((y : ys) ++ [x])
--         = rev (y : (ys ++ [x])) by A2
--         = rev (ys ++ [x]) ++ [y] by R2
--         = (x : rev ys) ++ [y] by I.H.
--         = x : (rev ys ++ [y]) by A2

--     rhs = x : rev (y : ys)
--         = x : (rev ys ++ [y]) by R2

-- QED.

safe i j i' j' = 
    (i /= i' &&
    j /= j' &&
    i - i' /= j - j' &&
    i - i' /= j' - j) ||
    (i == i' && j == j')

ok xs =
    all (\i -> all (\j -> safe i (xs !! i) j (xs !! j)) [0 .. n-1])
    [0 .. n-1]
    where n = length xs

-- >>> safe 1 3 2 4
-- False
--

-- >>> ok [4, 1, 5, 0, 6, 3, 7, 2]
-- True
--

data Tree a = Leaf | Node (Tree a) a (Tree a)
    deriving Show

member :: Ord a => a -> Tree a -> Bool
member _ Leaf = False
member x (Node l y r)
    | x == y = True
    | x < y = member x l
    | otherwise = member x r 

add :: Ord a => a -> Tree a -> Tree a
add x Leaf = Node Leaf x Leaf
add x (Node l y r)
    | x == y = Node l y r
    | x < y = Node (add x l) y r
    | otherwise = Node l y (add x r)

depth :: Tree a -> Int
depth Leaf = 0
depth (Node l _ r) = 1 + max (depth l) (depth r)

inorder :: Tree a -> [a]
inorder Leaf = []
inorder (Node l x r) = inorder l ++ [x] ++ inorder r

