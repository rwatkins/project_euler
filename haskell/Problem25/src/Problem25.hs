module Main where

import qualified Data.Map as Map

fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

fib n = fibs !! n

main :: IO ()
main = do
  putStrLn "Problem 25"
  putStrLn $ show $ head $ dropWhile (not . valid) $ map fib [1..]
  where valid i = (length $ show i) == 10


-- 1, 1, 2, 3, 5, 8, 13, 21, _
