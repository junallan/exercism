module OCR (convert) where

import Data.List.Split(chunksOf)

convert :: String -> String
convert xs
  | not isValidDimensions = "?"
  | otherwise             = findNumbersByGroup
  where 
    lns = lines xs
    lnGroups = chunksOf 4 lns
    isValidDimensions = (length lns `mod` 4 == 0) && all (\x -> length x `mod` 3 == 0) lns
    findNumber row0 row1 row2
      | row0 == " _ " && row1 == "| |" && row2 == "|_|" = "0"
      | row0 == "   " && row1 == "  |" && row2 == "  |" = "1"
      | row0 == " _ " && row1 == " _|" && row2 == "|_ " = "2"
      | row0 == " _ " && row1 == " _|" && row2 == " _|" = "3"
      | row0 == "   " && row1 == "|_|" && row2 == "  |" = "4"
      | row0 == " _ " && row1 == "|_ " && row2 == " _|" = "5"
      | row0 == " _ " && row1 == "|_ " && row2 == "|_|" = "6"
      | row0 == " _ " && row1 == "  |" && row2 == "  |" = "7"
      | row0 == " _ " && row1 == "|_|" && row2 == "|_|" = "8"
      | row0 == " _ " && row1 == "|_|" && row2 == " _|" = "9"
      | otherwise = "?"
    findNumbers lineGroup =
      let
        rowVal0 num = chunksOf 3 (head lineGroup) !! num
        rowVal1 num = chunksOf 3 (lineGroup !! 1) !! num
        rowVal2 num = chunksOf 3 (lineGroup !! 2) !! num
        rowMaxIndex = length (chunksOf 3 (head lineGroup)) - 1
      in 
        concatMap (\x -> findNumber (rowVal0 x) (rowVal1 x) (rowVal2 x)) [0..rowMaxIndex]
    findNumbersByGroup = tail $ concatMap (\numGroup -> "," ++ findNumbers numGroup) lnGroups
