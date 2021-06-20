sumList :: [Int] -> Int
sumList[] = 0
sumList(x : xs) = x + sumList xs

-- >>> sumList [10, 20, 30]
-- 60
--

evens :: [Int] -> [Int]
evens [] = []
evens [a] = [a]
evens (x : _ : xs) = x : evens xs

-- >>> evens [0, 10, 20, 30, 40]
-- [0,20,40]
--

-- >>> evens [40, 50]
-- [40]
--


myGcd :: Int -> Int -> Int 
myGcd  x y 
    | y == 0 = x
    | y > x = myGcd y x
    | otherwise = myGcd (x - y) y

-- myGcd :: Int -> Int -> Int
-- myGcd x 0 = x
-- myGcd x y
--     | y > x = myGcd y x
--     | otherwise = myGcd (x - y) y

-- >>> myGod(12 32)
-- <interactive>:4526:2-6: error:
--     ? Variable not in scope: myGod :: t1 -> t
--     ? Perhaps you meant myGcd (line 24)
--

range :: Int -> Int -> [Int]
range m n
    | m > n = []
    | otherwise = m : range (m + 1) n

-- >>> range 10 15
-- [10,11,12,13,14,15]
--

insert :: Int -> [Int] -> [Int]
insert x []                   = [x]
insert x (y : xs) | y < x     = y : insert x xs
                  | otherwise = x : y : xs

-- >>> insert 5 [2, 2, 4, 6]
-- [2,2,4,5,6]
--

isort :: [Int] -> [Int]
isort [] = []
isort (x : xs) = insert x (isort xs)

-- >>> isort [5,2,3,2]
-- [2,2,3,5]
--

-- >>> (\x y -> x + y) 5 10
-- 15
--

twice f x = f (f x)

-- >>> twice (*2) 1
-- 4
--

myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (x : xs) = (f x) : ((myMap f) xs)

-- >>> myMap (*10) [1, -2, 3, -4]
-- [10,-20,30,-40]
--

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p [] = []
myFilter p (x : xs)
    | p x = x : myFilter p xs
    | otherwise = myFilter p xs

-- >>> myFilter (> 0) [1, -2, 3, -4, 5, -6]
-- [1,3,5]
--


partition :: (a -> Bool) -> [a] -> ([a], [a])
partition _ [] = ([], [])
partition p (x : xs)
 | p x = (x : ys, zs)
 | otherwise = (ys, x : zs)
 where (ys, zs) = partition p xs

-- >>> partition (>0) [1, -2, 3, -4, 5]
-- ([1,3,5],[-2,-4])
--

myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl _ e [] = e
myFoldl f e (x : xs) = myFoldl f (f e x) xs

-- >>> myFoldl (-) 10 [1, 2, 3]
-- 4
--
