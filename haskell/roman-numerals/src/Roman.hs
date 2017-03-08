module Roman (numerals) where

import Data.Maybe(isJust, fromMaybe)

romanNumeralMapping :: Integer -> Maybe String
romanNumeralMapping 1    = Just "I"
romanNumeralMapping 5    = Just "V"
romanNumeralMapping 10   = Just "X"
romanNumeralMapping 50   = Just "L"
romanNumeralMapping 100  = Just "C"
romanNumeralMapping 500  = Just "D"
romanNumeralMapping 1000 = Just "M"
romanNumeralMapping _    = Nothing 

numerals :: Integer -> Maybe String
numerals x = let 
               romanNumeral = romanNumeralMapping x
             in
               case isJust romanNumeral of
                 True  -> romanNumeral
                 False -> romanNumeralLookup (fromInteger x)   
 
romanNumeralLookup :: Int -> Maybe String
romanNumeralLookup x
  | x > 1 && x < 5        = case x < 4 of
                              True  -> Just (concat $ replicate x "I")
                              False -> Just "IV"
  | x > 5 && x < 10       = case x < 9 of
  	                          True  -> Just (concat $ "V" : (replicate (x - 5) "I"))
  	                          False -> Just "IX"
  | x > 10 && x < 50      = case x < 40 of
                              True  -> numeralLookupLeftSide 10 "X"
                              False -> numeralLookupRightSide 40 "XL"
                              --Just ("XL" ++ fromMaybe "" (numerals (toInteger (x `mod` 40))))
  | x > 50 && x < 100     = case x < 90 of
                              True  -> numeralLookupLeftSide 50 "L"
                              False -> numeralLookupRightSide 90 "XC"
                              --Just ("XC" ++ fromMaybe "" (numerals (toInteger (x `mod` 90))))
  | x > 100 && x < 500    = case x < 400 of
                              True  -> numeralLookupLeftSide 100 "C"
                              False -> numeralLookupRightSide 400 "CD"
                              --Just ("CD" ++ fromMaybe "" (numerals (toInteger (x `mod` 400))))
  | x > 500 && x < 1000   = case x < 900 of
                              True  -> numeralLookupLeftSide 500 "D"
                              False -> numeralLookupRightSide 900 "CM"
                              --Just ("CM" ++ fromMaybe "" (numerals (toInteger (x `mod` 900))))
  | x > 1000 && x <= 3000 = numeralLookupLeftSide 1000 "M"
  | otherwise             = Nothing 
  where
    numeralLookupLeftSide dividedNumber romanNumeral = Just (concat ((replicate (x `div` dividedNumber) romanNumeral) ++ [(fromMaybe "" (numerals (toInteger (x `mod` dividedNumber))))] ))  
    numeralLookupRightSide modNumber romanNumeral    = Just (romanNumeral ++ fromMaybe "" (numerals (toInteger (x `mod` modNumber))))    