module Brackets (arePaired) where

import Data.List.Split(splitOn)

arePaired :: String -> Bool
arePaired [] = True
arePaired sentence
  | null filteredOutClosingBrackets                                     = True
  | length filteredBracketSentence == length filteredOutClosingBrackets = False
  | otherwise                                                           = arePaired filteredOutClosingBrackets
  where
    filteredBracketSentence = [x | x <- sentence, x == '[' || x == ']' || x == '{' || x == '}' || x =='(' || x == ')']
    filteredOutClosingBrackets = concat $ splitOn "()" (concat $ splitOn "{}" (concat $ splitOn "[]" filteredBracketSentence))
