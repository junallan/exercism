module RotationalCipher (rotate) where

import Data.List(lookup,elemIndex)
import Data.Maybe(fromJust)
import Data.Char(isLetter,toLower,toUpper,isUpper)

rotate :: Int -> String -> String
rotate number = map (\c -> if isLetter c then if isUpper c then toUpper $ letterLookup c else letterLookup c else c)
                       where
                         letterLookup letter = getLetter ((number + getNumber letter) `mod` 26)

getNumber :: Char -> Int
getNumber letter = fromJust $ elemIndex (toLower letter) ['a'..'z']

getLetter :: Int -> Char
getLetter number = fromJust $ lookup number (zip [0..] ['a'..'z'])
