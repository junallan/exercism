{-# LANGUAGE OverloadedStrings #-}

module Frequency (frequency) where

import Data.Map  (Map, fromList, empty)
import Data.Text (Text, unpack, strip)
import Data.List (sort, group, elem)
import Data.Char (toLower)

frequency :: Int -> [Text] -> Map Char Int
frequency nWorkers texts 
  | null filteredWords = empty
  | otherwise          = fromList $ map (\x -> (head x, length x)) (group $ sort (map toLower filteredWords))
  where
    filteredWords = (removeNumbers . removePunctuations) (concat $ nonBlankWords texts)

nonBlankWords :: [Text] -> [String]
nonBlankWords texts = filter (not . null) (map (unpack . strip) texts)

removePunctuations :: String -> String
removePunctuations = filter (\x -> (x /= ',') && (x /= '.') && (x /= '?') && (x /= '!') && (x /= '-') && (x /= ':') && (x /= ';') && (x /= '\\'))

removeNumbers :: String -> String
removeNumbers = filter (\x -> (x /= '0') && (x /= '1') && (x /= '2') && (x /= '3') && (x /= '4') && (x /= '5') && (x /= '6') && (x /= '7') && (x /= '8') && (x /= '9'))
