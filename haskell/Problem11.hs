module Main where

import Data.Maybe (catMaybes, isJust)

readInt :: String -> Int
readInt = read

getGrid :: IO [[Int]]
getGrid = do
    gridText <- readFile "problem11.txt"
    return . partition gridWidth . map readInt $ words gridText

gridWidth :: Int
gridWidth = 20

rowSize :: Int
rowSize = 4

coordinatesHorizontal :: [(Int,Int)]
coordinatesHorizontal = [(0,i) | i <- [0..(rowSize-1)]]

coordinatesVertical :: [(Int,Int)]
coordinatesVertical = [(i,0) | i <- [0..(rowSize-1)]]

coordinatesDiagonalForward :: [(Int,Int)]
coordinatesDiagonalForward = [(i, (-i)) | i <- [0..(rowSize-1)]]

coordinatesDiagonalBackward :: [(Int,Int)]
coordinatesDiagonalBackward = [(i, i) | i <- [0..(rowSize-1)]]

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

rowGeneric :: [(Int,Int)] -> [[a]] -> Int -> Int -> Maybe [a]
rowGeneric coords lst startX startY =
    let indexByTuple = uncurry (indexGrid lst)
        coords' = map (addCoordinates startX startY) coords
        maybes = map indexByTuple coords'
    in sequence maybes

rowHorizontal :: [[a]] -> Int -> Int -> Maybe [a]
rowHorizontal = rowGeneric coordinatesHorizontal

rowVertical :: [[a]] -> Int -> Int -> Maybe [a]
rowVertical = rowGeneric coordinatesVertical

rowDiagonalForward :: [[a]] -> Int -> Int -> Maybe [a]
rowDiagonalForward = rowGeneric coordinatesDiagonalForward

rowDiagonalBackward :: [[a]] -> Int -> Int -> Maybe [a]
rowDiagonalBackward = rowGeneric coordinatesDiagonalBackward

rowsFromGrid :: [[Int]] -> [[Int]]
rowsFromGrid grid =
    let fs = [ rowHorizontal, rowVertical, rowDiagonalForward, rowDiagonalBackward ]
        maybes = concat $ map (\f -> [f grid x y | x <- [0..19], y <- [0..19]]) fs
    in catMaybes maybes

maxProduct :: [[Int]] -> Int
maxProduct = maximum . map product

main :: IO ()
main = do
    grid <- getGrid
    let max = maxProduct (rowsFromGrid grid)
    putStrLn $ show max
