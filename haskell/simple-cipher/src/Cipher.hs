module Cipher (caesarDecode, caesarEncode, caesarEncodeRandom) where

import Data.Char
import Data.Maybe
import System.Random
import Data.List


caesarDecode :: String -> String -> String
caesarDecode key encodedText
  | isKeyLongerThenOrEqualToText = map (\(a,b) -> shiftCipherLeft (charToIntRepresentation a) b) (zip key encodedText)
  | otherwise                    = map (\(a,b) -> shiftCipherLeft (charToIntRepresentation a) b) (zip (repeat $ head key) encodedText)
  where
    isKeyLongerThenOrEqualToText = longerThan (length encodedText - 1) key

caesarEncode :: String -> String -> String
caesarEncode key text 
  | isKeyLongerThenOrEqualToText = map (\(a,b) -> shiftCipherRight (charToIntRepresentation a) b) (zip key text)
  | otherwise                    = map (\(a,b) -> shiftCipherRight (charToIntRepresentation a) b) (zip (repeat $ head key) text)
  where
    isKeyLongerThenOrEqualToText = longerThan (length text - 1) key

isNonEmpty [] = False
isNonEmpty _  = True

longerThan :: Int -> [a] -> Bool
longerThan n xs = isNonEmpty $ drop n xs

caesarEncodeRandom :: String -> IO (String, String)
caesarEncodeRandom text = do
                            generator <- newStdGen
                            let alphabetCharacters = take 100 $ randomRs ('a','z') generator
                            return (alphabetCharacters, caesarEncode alphabetCharacters text)

charToIntRepresentation :: Char -> Int
charToIntRepresentation x = fromJust $ lookup x alphabetList 

shiftCipherRight :: Int -> Char -> Char
shiftCipherRight shiftVal x
  | charIntVal <= 25 = fromJust $ lookup charIntVal alphabetListByValue
  | otherwise        = fromJust $ lookup (charIntVal `mod` 25 - 1) alphabetListByValue
  where
    charIntVal = charToIntRepresentation x + shiftVal

shiftCipherLeft :: Int -> Char -> Char
shiftCipherLeft shiftVal x
  | charIntVal >= 0 = fromJust $ lookup charIntVal alphabetListByValue
  | otherwise       = fromJust $ lookup (26 + charIntVal) alphabetListByValue
  where
  	charIntVal = charToIntRepresentation x - shiftVal


alphabetList :: [(Char,Int)]
alphabetList = zip ['a'..'z'] [0..25]

alphabetListByValue :: [(Int, Char)]
alphabetListByValue = zip [0..25] ['a'..'z']