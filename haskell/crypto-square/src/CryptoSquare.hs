module CryptoSquare (encode) where

import Data.Char(toLower, isAlphaNum)
import Data.List.Split(chunksOf)
import Data.List(concat, intersperse, transpose)

encode :: String -> String
encode xs = 
  concat [x ++ " " | x <- stringTransposed]
  where
  	filteredEncoded = map toLower (filter isAlphaNum xs)
  	filteredEncodedLength = length filteredEncoded
  	stringTransposed = transpose $ chunksOf (findRectangleColumnLength filteredEncodedLength) filteredEncoded

findRectangleColumnLength :: Int -> Int
findRectangleColumnLength encodingLength = 
  columnLength
  where 
{-    Determine what range column span falls in within c - r <=1, by finding squares of numbers of the max column size that follows criteria-}
    numbersSquare = [x | x <- [1 .. encodingLength `div` 2], x^2 <= encodingLength || x*(x-1) <= encodingLength]
    numberSquare = last numbersSquare
    columnLength = if numberSquare^2 < encodingLength && (numberSquare + 1)^2 > encodingLength then numberSquare + 1 else numberSquare
