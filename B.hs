squareSum :: Int -> Int -> Int
squareSum x y = x * x + y * y

--- >>> squareSum 1 2
--- 5
---

identify :: a -> a
identify x = x

--- >>> identify 10
--- 10
---

sum1 :: Int -> Int
sum1 n =
    if n == 0 then 0 else sum1 (n-1) + n

--- >>> sum1 10
--- 55
---

sum2 :: Int -> Int
sum2 n | n == 0  = 0
    | otherwise = sum2 (n-1) + n

sum3 :: Int -> Int
sum3 0 = 0
sum3 n = sum3 (n-1) + n

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

-- >>> factorial 10
-- 3628800
--


fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-2) + fib (n-1)

-- >>> fib 10
-- 55
--

myLength :: [a] -> Int
myLength [] = 0
myLength (x : xs) = 1 + myLength xs

append :: [a] -> [a] -> [a]
append [] ys = ys
append (x : xs) ys = x : append xs ys

-- >>> append [1, 2, 3] [4, 5]
-- [1,2,3,4,5]
--

addThree :: Int -> Int -> Int -> Int
addThree a b c = a + b + c

--- >>> addThree 1 2 3
--- 6
---
