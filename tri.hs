import Graphics.Gloss

picture = Line [(0,0),(100,0),(80,100),(0,0)]

window = InWindow "Snowflake" (500, 500) (20, 20)

main :: IO ()
main = display window white picture
