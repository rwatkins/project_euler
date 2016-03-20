module Lib where

import qualified Data.Foldable as Foldable
import qualified Data.Sequence as Seq
import Data.List (unfoldr)

fibs :: [Integer]
fibs = map fst $ iterate (\(a,b) -> (b,a+b)) (0,1)
--fibs = unfoldr (\(a, b) -> Just (a, (b, a+b))) (0, 1)
--fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

fib :: Int -> Integer
fib n = fibs !! n

enumerate :: [a] -> [(Integer,a)]
enumerate = enumerate' 0
  where enumerate' :: Int -> [a] -> [(Integer,a)]
        enumerate' _ [] = []
        enumerate' 0 (x:xs) = (toInteger 0, x) : enumerate' 1 xs
        enumerate' i (x:xs) = (toInteger i, x) : enumerate' (i + 1) xs

answer :: Int -> (Integer,Integer)
answer digits = head .
                dropWhile (not . valid) .
                map (\(i, x) -> (i + 1, x)) .
                enumerate $
                map fib [1..]
  where valid :: (Integer,Integer) -> Bool
        valid = (== digits) . length . show . snd
