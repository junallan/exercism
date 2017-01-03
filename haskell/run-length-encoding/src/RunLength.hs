module RunLength (decode, encode) where

import Data.Char (isDigit)

decode :: String -> String
decode ""     = ""
decode (x:"") = [x]
decode (x:xs) =
  case repeatingCharacters of
    0         -> x : decode xs
    otherwise -> replicate repeatingCharacters currentCharacter ++ decode nextValues
  where
     repeatingCharacters = if isDigit(x) then read $ takeWhile (\v -> isDigit(v)) (x:xs) else 0
     nextValues          = drop ((length $ show repeatingCharacters) + 1) (x:xs)
     currentCharacter    = head $ drop ((length $ show repeatingCharacters)) (x:xs)


encode :: String -> String
encode "" = ""
encode (x:xs) =
  case repeatingCharacters of 
    0         -> x : encode xs
    otherwise -> show (repeatingCharacters + 1) ++ [x] ++ encode (drop repeatingCharacters xs)
  where
    repeatingCharacters = length (takeWhile (\v -> v == x) xs)


