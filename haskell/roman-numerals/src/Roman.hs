module Roman (numerals) where

import Data.Maybe(isJust, fromMaybe)
 
numerals :: Integer -> Maybe String
numerals x
  | number >= 1 && number < 5        = case number < 4 of
                                         True   -> Just (concat $ replicate number "I")
                                         False  -> Just "IV"
  | number >= 5 && number < 10       = case number < 9 of
                                         True   -> Just (concat $ "V" : (replicate (number - 5) "I"))
                                         False  -> Just "IX"
  | number >= 10 && number < 50      = case number < 40 of
                                         True   -> numeralLookupLeftSide 10 "X"
                                         False  -> numeralLookupRightSide 40 "XL"
  | number >= 50 && number < 100     = case number < 90 of
                                         True   -> numeralLookupLeftSide 50 "L"
                                         False  -> numeralLookupRightSide 90 "XC"
  | number >= 100 && number < 500    = case number < 400 of
                                         True   -> numeralLookupLeftSide 100 "C"
                                         False  -> numeralLookupRightSide 400 "CD"
  | number >= 500 && number < 1000   = case number < 900 of
                                         True   -> numeralLookupLeftSide 500 "D"
                                         False  -> numeralLookupRightSide 900 "CM"
  | number >= 1000 && number <= 3000 = numeralLookupLeftSide 1000 "M"
  | otherwise                        = Nothing 
  where
    number                                           = fromInteger x 
    numeralLookupLeftSide dividedNumber romanNumeral = Just (concat ((replicate (number `div` dividedNumber) romanNumeral) ++ [(fromMaybe "" (numerals (toInteger (number `mod` dividedNumber))))] ))  
    numeralLookupRightSide modNumber romanNumeral    = Just (romanNumeral ++ fromMaybe "" (numerals (toInteger (number `mod` modNumber))))  
    