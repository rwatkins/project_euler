module Main where

import qualified Data.Set as Set

isDivisor :: Integer -> Integer -> Bool
isDivisor number i = (mod number i) == 0

divisors :: Integer -> [Integer]
divisors number = filter (isDivisor number) [1..(number `div` 2)]

isAbundant :: Integer -> Bool
isAbundant n = n < (sum $ divisors n)

abundantNumbers :: [Integer]
abundantNumbers = [ i | i <- [12..28123], isAbundant i ]

abundantSums :: Set.Set Integer
abundantSums = Set.fromList [ x + y | x <- abundantNumbers,
                                      y <- abundantNumbers,
                                      x <= y,
                                      x + y <= 28123 ]

answer :: Integer
answer = sum $ filter (\x -> not $ Set.member x abundantSums) [1..28122]

main = do
  putStrLn "Problem 23"
  putStrLn $ show $ answer
