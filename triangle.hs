import Graphics.Gloss

window = InWindow "Snowflake" (500, 500) (20, 20)

d = 3.14 / 3

eval (x, y, a) [] = [(x, y)]
eval (x, y, a) ('+' : cs) = eval (x, y, a + d) cs
eval (x, y, a) ('-' : cs) = eval (x, y, a - d) cs
eval (x, y, a) (c : cs) = (x, y) : eval (x', y', a) cs
    where
        x' = x + cos a
        y' = y + sin a

picture = Line (eval (0, 0, 0) "F+F-F+F")

main :: IO ()
main = display window white picture

-- >>> eval (0, 0, 0) "F+F-F+F"
-- [(0.0,0.0),(1.0,0.0),(1.5004597,0.86575985),(2.5004597,0.86575985),(3.0009193,1.7315197)]
--

-- x는 x좌표, y는 y좌표, a는 대충 각도 조절용이라고 생각.
-- cos 0 = 1, sin 0 = 0. 