module Main where

import Data.Char

fact 0 = 0
fact 1 = 1
fact x = x * (fact (x - 1))

main = do
    putStrLn . show . sum . map digitToInt . show $ fact 100
