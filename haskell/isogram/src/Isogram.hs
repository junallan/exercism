module Isogram (isIsogram) where

import Data.Char(isLetter)
import Data.List(length,filter,nub)
import Data.Text(pack,unpack,toLower)

isIsogram :: String -> Bool
isIsogram word = length lettersInWord == length (nub $ unpack $ toLower $ pack lettersInWord)
                 where
                   lettersInWord = filter isLetter word
