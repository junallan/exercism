module Scrabble (scoreLetter, scoreWord) where

import Data.Char (toUpper)
import Data.Map (Map)
import qualified Data.Map as M

scoreLetter :: Char -> Integer
scoreLetter letter = let letterScores = addLettersValue (addLettersValue (addLettersValue (addLettersValue (addLettersValue (addLettersValue (addLettersValue M.empty 1 "AEIOULNRST") 2 "DG") 3 "BCMP") 4 "FHVWY") 5 "K") 8 "JX") 10 "QZ"
                     in findLetterScore letter letterScores

scoreWord :: String -> Integer
scoreWord wrd = sum (map scoreLetter wrd)

findLetterScore :: Char -> Map Char Integer -> Integer
findLetterScore letter letterValues = M.findWithDefault 0 (toUpper letter) letterValues

addLettersValue :: Map Char Integer -> Integer -> String -> Map Char Integer
addLettersValue letterValues val letters = M.fromList (concat (map (addLetterValue letterValues val) letters))

addLetterValue :: Map Char Integer -> Integer -> Char -> [(Char,Integer)]
addLetterValue letterValues val letter = M.toList (M.insert letter val letterValues) 