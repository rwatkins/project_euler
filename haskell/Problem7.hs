module Main where

import System.Environment (getArgs)

genPrimes :: Int -> [Int] -> Int -> [Int]
genPrimes n [] _
    | n <= 0    = []
    | otherwise = genPrimes (n-1) [2] 3
genPrimes n seed nextPrime
    | n == 0    = seed
    | otherwise = let sqrtNextPrime = floor . sqrt $ fromIntegral nextPrime
                      upToSqrt = filter (<= sqrtNextPrime) seed
                      isPrime = all (\n -> nextPrime `mod` n /= 0) upToSqrt
                  in
                  if isPrime
                      then genPrimes (n-1) (seed ++ [nextPrime]) (nextPrime+2)
                      else genPrimes n seed (nextPrime+2)

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

nthPrime :: Int -> Int
nthPrime n = let first = safeHead $ drop (n - 1) $ genPrimes n [] 0
             in
             case first of
                 Just n -> n
                 Nothing -> -1

readInt :: String -> Int
readInt = read

intFromArgs :: [String] -> Int
intFromArgs [] = 1
intFromArgs (x:_) = readInt x

main :: IO ()
main = do
    args <- getArgs
    let nth = intFromArgs args
    putStrLn . show $ nthPrime nth
