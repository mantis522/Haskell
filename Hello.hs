main :: IO()
main = do
    putStrLn "Hello"
    let x = 10 :: Int
    putStrLn ("Hello, World" ++ show x)