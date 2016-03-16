module Main where

import Data.List (permutations, sort)

main :: IO ()
main = do
  putStrLn "Problem 24"
  putStrLn . concat . map show . (!! 999999) . sort . permutations $ [0..9]
