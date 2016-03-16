module Main where

import qualified Data.Map as Map

theNumber :: Integer
theNumber = 220

isDivisor :: Integer -> Integer -> Bool
isDivisor number i = (mod number i) == 0

divisors number = filter (isDivisor number) [1..(number `div` 2)]

sumDivisors = sum . divisors

compute :: Map.Map Integer Integer -> Integer -> Map.Map Integer Integer
compute memo i = Map.insert i (sumDivisors i) memo

buildMap :: Map.Map Integer Integer
buildMap = foldl compute Map.empty [1..10000]

amicableNumbers = let values = buildMap
                  in [ (x,y) | x <- [1..10000],
                               y <- [1..10000],
                               x < y,
                               ((Map.!) values x) == y,
                               ((Map.!) values y) == x ]

main = do
  putStrLn "Problem 21"
  let nums = amicableNumbers
  putStrLn $ show $ nums
  putStrLn $ show $ foldl (\acc (i,j) -> acc + i + j) 0 nums
