import Graphics.Gloss

-- picture = Line [(0,0),(100,0),(50,100),(0,0)]

window = InWindow "Snowflake" (500, 500) (20, 20)

d = 3.14159265 / 3

eval :: (Float, Float, Float) -> String -> [(Float, Float)]
eval (x, y, a)[] = [(x, y)]
eval (x, y, a) ('+' : cs) = eval (x, y, a + d) cs
eval (x, y, a) ('-' : cs) = eval (x, y, a - d) cs
eval (x, y, a) (c : cs) = (x, y) : eval (x', y', a) cs
    where 
        x' = x + cos a
        y' = y + sin a

-- >>> eval (0, 0, 0) "F+F--F+F"
-- [(0.0,0.0),(1.0,0.0),(1.5,0.86602545),(2.0,0.0),(3.0,0.0)]
--

rewrite [] = []
rewrite ('F' : cs) = "F+F--F+F" ++ rewrite cs
rewrite (c : cs) = c : rewrite cs

power f 0 x = x
power f n x = f(power f (n-1) x)


picture =
    Line (eval (0,0,0) (power rewrite 6 "F--F--F"))

main :: IO ()
main = display window white picture
