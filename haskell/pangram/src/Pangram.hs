module Pangram (isPangram) where

import Data.Char(toLower)
import Data.List(intersect,sort,nub)

isPangram :: String -> Bool
isPangram text = 
  let
    sentenceLowerCase  = map toLower text
    alphabetCharacters = ['a'..'z']
  in
    sort (nub $ sentenceLowerCase `intersect` alphabetCharacters) == alphabetCharacters
{-  let 
    sentenceLowerCase  = map toLower text
    alphabetCharacters = ['a'..'z']
  in
    length (filter (==True) (map (\x -> elem x sentenceLowerCase) alphabetCharacters)) == length alphabetCharacters
-}