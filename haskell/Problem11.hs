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
lst !? i | i >= 0 && i < length lst = Just $ lst !! i
         | otherwise                = Nothing

indexGrid :: [[a]] -> Int -> Int -> Maybe a
indexGrid lst x y = lst !? x >>= (!? y)

addCoordinates :: Int -> Int -> (Int,Int) -> (Int,Int)
addCoordinates x y (i,j) = (i+x, j+y)

rowHorizontal :: [[a]] -> Int -> Int -> Maybe [a]
rowHorizontal lst startX startY =
    let coords = map (addCoordinates startX startY) coordinatesHorizontal
        maybes = map (uncurry (indexGrid lst)) coords
    in sequence maybes

main :: IO ()
main = do
    putStrLn "hello"
