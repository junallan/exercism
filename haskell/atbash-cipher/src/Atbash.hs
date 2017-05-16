module Atbash (decode, encode) where

import Data.Char (toLower, isSpace)
import Data.List.Split (chunksOf)
import Data.List (dropWhileEnd)
import Data.Maybe (catMaybes)

decode :: String -> String
decode cipherText = catMaybes $ map (characterMapping . toLower) cipherText

encode :: String -> String
encode plainText = dropWhileEnd isSpace (concat $ map (\x -> x ++ " ") (chunksOf 5 (decode plainText)))
  
characterMapping :: Char -> Maybe Char
characterMapping c = lookup c mappings
                     where 
                       characters = ['a'..'z']
                       numbers    = ['1'..'9'] 
                       mappings   = zip characters (reverse characters) ++ zip numbers numbers

