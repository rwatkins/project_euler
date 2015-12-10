module Main where

import Data.Map hiding (filter, foldl, fromList)
import Debug.Trace (trace)
import qualified Data.Set as S

--debug :: Bool
--debug = False

--wrapTrace :: Show a => String -> a -> a
--wrapTrace dbg x | debug && trace ("trace " ++ dbg ++ ": " ++ show x) False = undefined
--                | otherwise = x

--wrapTraceExclude :: Show a => a -> a
--wrapTraceExclude = wrapTrace "exclude"

--exclude1 :: Int -> [Int]
--exclude1 n =
--    map (\(i,j) -> wrapTrace "exclude" $ i+j+2*i*j) $
--        [(x,y) | x <- [1..n], y <- [1..n], x <= y, x + y + 2*x*y <= n]

exclude2 :: Int -> [Int]
exclude2 n = filter (<= n) [i+j+2*i*j | let n' = fromIntegral n,
                                        i <- [1..floor (sqrt (n' / 2))],
                                        let i' = fromIntegral i,
                                        j <- [1..floor ((n' - i') / (2*i' + 1))]]

exclude3 :: Int -> Map Int Bool
exclude3 n = let excluded = exclude2 n
             in foldl (\m i -> insert i True m) empty excluded

exclude4 :: Int -> S.Set Int
exclude4 = S.fromList . exclude2

sieveSundaram :: (Int -> [Int]) -> Int -> [Int]
sieveSundaram exclude n =
    let excluded = exclude n
    in filter (<=n) (2:[2*i+1 | i <- [1..n], not (elem i excluded)])

sieveWithMap :: Int -> [Int]
sieveWithMap n =
    let excludeMap = exclude3 n
    in filter (<= n) (2:[2*i+1 | i <- [1..n], i `notMember` excludeMap])

sieveWithSet :: Int -> [Int]
sieveWithSet n =
    let excludeSet = exclude4 n
    in takeWhile (<= n) (2:[2*i+1 | i <- [1..n], not (i `S.member` excludeSet)])

--sieve1 :: Int -> [Int]
--sieve1 = sieveSundaram exclude1

sieve2 :: Int -> [Int]
sieve2 = sieveSundaram exclude2

-- http://www.justinshield.com/2011/05/haskell-a-better-prime-number-list-using-sieve-of-eratosthenes-and-lazy-pattern-matching/
primes :: [Integer]
primes = 2: 3: sieve (tail primes) [5,7..]

sieve (p:ps) xs = h ++ sieve ps [x | x <- t, rem x p /= 0]
    where (h,~(_:t)) = span (< p*p) xs

main :: IO ()
main = do
    --mapM_ putStrLn $ map show $ sieveSundaram 20
    --putStrLn . show . sum $ sieve2 2000000
    putStrLn . show . sum $ takeWhile (<= 2000000) primes
