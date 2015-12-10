module Main where

triples :: [(Int,Int,Int)]
triples = [(x,y,z) | x <- [1..1000],
                     y <- [1..1000],
                     z <- [1..1000],
                     x < y && y < z,
                     x*x + y*y == z*z,
                     x + y + z == 1000]

tripleToList :: (a,a,a) -> [a]
tripleToList (a,b,c) = [a,b,c]

main :: IO ()
main = putStrLn . show . product . tripleToList . head $ triples
