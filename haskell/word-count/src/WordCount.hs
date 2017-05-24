module WordCount (wordCount) where

import Data.List(group, sort)
import Data.List.Split(splitOn)
import Data.Char(toLower, isAlphaNum, isSpace)

wordCount :: String -> [(String, Int)]
wordCount xs = map (\x -> (head x, length x)) (wordGrouping xs)

wordGrouping :: String -> [[String]]
wordGrouping xs = group $ sort $ map (\y -> if head y == '\'' && last y == '\'' then filter (/= '\'') y else y ) (words $ filter (\x -> isAlphaNum x || isSpace x || x == '\'') (map toLower (splitOnComma xs)))

splitOnComma :: String -> String
splitOnComma = map (\x -> if x == ',' then ' ' else x)
