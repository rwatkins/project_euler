module Main where

import Lib

main :: IO ()
main = do
  putStrLn "Problem 25"
  putStrLn $ show $ Lib.answer 1000
