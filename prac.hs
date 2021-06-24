squareSum :: Int -> Int -> Int
squareSum x y = x * x + y * y

--- >>> squareSum 2 3
--- 13
---

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib(n-2)

--- >>> fib 10
--- 55
---

myLength :: [a] -> Int
myLength [] = 0
myLength (x : xs) = 1 + myLength xs

append :: [a] -> [a] -> [a]
append [] ys = ys
append (x : xs) ys = x : append xs ys

myGcd :: Int -> Int -> Int 
myGcd  x y 
    | y == 0 = x
    | y > x = myGcd y x
    | otherwise = myGcd (x - y) y


