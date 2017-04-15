module Pangram (isPangram) where

import Data.Char(isAlpha)
import Data.List(nub)

isPangram :: String -> Bool
isPangram text = length (filter (\x -> isAlpha x == True) (nub text)) == length ['a'..'z']
