sumListByFold :: [Int] -> Int
sumListByFold [] = 0
sumListByFold (x : xs) = foldl (+) x xs

-- >>> sumListByFold [1, 2, 3]
-- 6
--

oddplus1 :: [Int] -> [Int]
oddplus1 [] = []
oddplus1 xs = [x + 1 | x <- xs, mod x 2 == 1]

-- >>> oddplus1 [1 .. 10]
-- [2,4,6,8,10]
--

merge :: [Int] -> [Int] -> [Int]
merge []　[] = []
merge rest [] = rest
merge [] rest = rest
merge (xl : xsl) (xr : xsr) 
    | (xl < xr) = xl : merge (xsl) (xr : xsr)
    | otherwise = xr : merge (xl : xsl) (xsr)

-- >>> merge [1, 3, 5] [2, 4, 6]
-- [1,2,3,4,5,6]
--

split :: [Int] -> ([Int], [Int])
split []        = ([], [])
split [x]       = ([x], [])
split (x:y:xs)  = ((x:ys), (y:zs))
    where (ys, zs) = split xs

-- >>> split [1, 2, 3, 4, 5]
-- ([1,3,5],[2,4])
--

msort :: [Int] -> [Int]
msort [] = []
msort [x] = [x]
msort xs = merge (msort ys) (msort zs)
    where (ys, zs) = (split xs)


data Tree = Leaf | Node Tree Int Tree

t1 = Node Leaf 1 Leaf
t3 = Node Leaf 3 Leaf
t5 = Node Leaf 5 Leaf
t4 = Node t3 4 t5
t2 = Node t1 2 t4

member :: Int -> Tree -> Bool
member x Leaf = False
member x (Node l y r) = x == y || member x l || member x r

-- >>> member 3 t2
-- True
--

inorder :: Tree -> [Int]
inorder Leaf = []
inorder (Node l x r) = inorder l ++ [x] ++ inorder r

-- >>> inorder t2
-- [1,2,3,4,5]
--

preorder :: Tree -> [Int]
preorder Leaf = []
preorder (Node l x r) = x : preorder l ++ preorder r

-- >>> preorder t2
-- [2,1,4,3,5]
--

instance Show Tree where
    show Leaf = "Leaf"
    show (Node l x r) = 
        "(Node " ++ show l ++ " " ++ show x ++ " " ++ show r ++ ")"

myLookup :: Eq a => a -> [(a, b)] -> Maybe b
myLookup _ [] = Nothing
myLookup x ((y, z) : a)
    | x == y = Just z
    | otherwise = myLookup x a

-- >>> myLookup "x" [("x", 10), ("y", 20)]
-- Just 10
--
