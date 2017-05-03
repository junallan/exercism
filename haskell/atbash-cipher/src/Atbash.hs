module Atbash (decode, encode) where

import Data.Char (toLower, isDigit)
import Data.List.Split (chunksOf)

decode :: String -> String
decode cipherText = filter (\x -> x /= ' ') (map (characterMapping . toLower) cipherText)

encode :: String -> String
encode plainText = 
  let
    content = concat $ map (\x -> x ++ " ") (chunksOf 5 (filter (\x -> x /= ' ') (map (characterMapping . toLower) plainText)))
  in 
    take (length content- 1) content

characterMapping :: Char -> Char
characterMapping c
  | c == 'a'  = 'z'
  | c == 'b'  = 'y'
  | c == 'c'  = 'x'
  | c == 'd'  = 'w'
  | c == 'e'  = 'v'
  | c == 'f'  = 'u'
  | c == 'g'  = 't'
  | c == 'h'  = 's'
  | c == 'i'  = 'r'
  | c == 'j'  = 'q'
  | c == 'k'  = 'p'
  | c == 'l'  = 'o'
  | c == 'm'  = 'n'
  | c == 'n'  = 'm'
  | c == 'o'  = 'l'
  | c == 'p'  = 'k'
  | c == 'q'  = 'j'
  | c == 'r'  = 'i'
  | c == 's'  = 'h'
  | c == 't'  = 'g'
  | c == 'u'  = 'f'
  | c == 'v'  = 'e'
  | c == 'w'  = 'd'
  | c == 'x'  = 'c'
  | c == 'y'  = 'b'
  | c == 'z'  = 'a'
  | isDigit(c) == True = c
  | otherwise = ' '


