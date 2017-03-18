module Series (largestProduct) where

import Data.Text (chunksOf, unpack)
import Data.Text as T
import Data.String (fromString)
import Data.Char (digitToInt)


largestProduct :: Int -> String -> Maybe Integer
largestProduct 0 digits      = Just 1
largestProduct series ""     = if series == 0 then Just 1 else Nothing
largestProduct series digits =
  case Prelude.length digits < series || series < 0 of
    True         -> Nothing
    False        -> let 
                      --digit    = digitToInt x
                      isNumber = (Prelude.length $ Prelude.filter (\x -> digitToInt x < 0 || digitToInt x > 9) digits) == 0
                    in 
                      if isNumber then Just (toInteger . fst $ Prelude.maximum $ Prelude.map (\x -> (seriesProduct x,x)) (getAllSubstrings series digits series)) else Nothing

--    False        -> Just (toInteger . fst $ Prelude.maximum $ Prelude.map (\x -> (seriesProduct x,x)) (getAllSubstrings series digits series))
 
getAllSubstrings :: Int -> String -> Int -> [String]
getAllSubstrings series [] counter     = []
getAllSubstrings series digits 1       = getSubstrings series digits
getAllSubstrings series digits counter = getSubstrings series digits ++ getAllSubstrings series (Prelude.tail digits) (counter - 1)

seriesProduct :: String -> Int
seriesProduct [] = 1
seriesProduct digits = 
  let 
    values = Prelude.map digitToInt digits
  in
    Prelude.head values * (seriesProduct $ Prelude.tail digits)   

getSubstrings :: Int -> String -> [String]
getSubstrings series digits = Prelude.map (\y -> unpack y) (Prelude.filter (\x -> Prelude.length (unpack x) == series) (chunksOf series (fromString digits::Text)))
