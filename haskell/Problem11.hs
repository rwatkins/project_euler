module Main where

import Data.Maybe (catMaybes, isJust)

readInt :: String -> Int
readInt = read

grid :: IO [[Int]]
grid = do
    gridText <- readFile "problem11.txt"
    return . partition gridWidth . map readInt $ words gridText

gridWidth = 20

coordinatesHorizontal :: [(Int,Int)]
coordinatesHorizontal = [(0,i) | i <- [0..3]]

partition :: Int -> [a] -> [[a]]
partition _ [] = []
partition n lst = (take n lst) : partition n (drop n lst)

-- safe index

(!?) :: [a] -> Int -> Maybe a
[] !? i = Nothing
lst !? i | i < length lst = Just $ lst !! i
         | otherwise      = Nothing

rowHorizontal :: [[a]] -> Int -> Int -> Maybe [a]
rowHorizontal lst x y =
    let maybes = [ lst !? x >>= (!? y)
                 , lst !? x >>= (!? (y + 1))
                 , lst !? x >>= (!? (y + 2))
                 , lst !? x >>= (!? (y + 3))
                 ]
    in if (all isJust maybes)
           then Just $ catMaybes maybes
           else Nothing

main :: IO ()
main = do
    putStrLn "hello"
