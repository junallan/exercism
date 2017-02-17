module Anagram (anagramsFor) where

import Data.List(sort)
import Data.Char(toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (isAnagramWords xs) xss

isAnagramWords :: String -> String -> Bool
isAnagramWords xs ys = map toLower xs /= map toLower ys && sort (map toLower xs) == sort (map toLower ys)
  