module Lib (run) where

import qualified Data.Foldable as Foldable
import qualified Data.Sequence as Seq
import Data.List (elemIndex, sort)
import Data.Maybe (catMaybes)
import Data.String.Utils (replace, split)

letters :: [Char]
letters = ['A'..'Z']

cleanNames :: String -> String
cleanNames = replace "\"" ""

splitNames :: String -> [String]
splitNames = split ","

namesFromString :: String -> [String]
namesFromString = splitNames . cleanNames

alphabeticalValue :: String -> Int
alphabeticalValue = sum . map (+1) . catMaybes . map (\c -> elemIndex c letters)

multiplyByIndex = Foldable.toList . Seq.mapWithIndex (\i x -> (i + 1) * x) . Seq.fromList

run :: IO ()
run = do
  namesStr <- readFile "problem22_names.txt"
  let names = sort $ namesFromString namesStr
  putStrLn . show . sum . multiplyByIndex . map alphabeticalValue $ names
