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
                              True  -> Just (concat ((replicate (x `div` 10) "X") ++ [(fromMaybe "" (numerals (toInteger (x `mod` 10))))] ))
                              False -> Just ("XL" ++ fromMaybe "" (numerals (toInteger (x `mod` 40))))
  | x > 50 && x < 100     = case x < 90 of
                              True  -> Just (concat ((replicate (x `div` 50) "L") ++ [(fromMaybe "" (numerals (toInteger (x `mod` 50))))] ))
                              False -> Just ("XC" ++ fromMaybe "" (numerals (toInteger (x `mod` 90))))
  | x > 100 && x < 500    = case x < 400 of
                              True  -> Just (concat ((replicate (x `div` 100) "C") ++ [(fromMaybe "" (numerals (toInteger (x `mod` 100))))] ))
                              False -> Just ("CD" ++ fromMaybe "" (numerals (toInteger (x `mod` 400))))
  | x > 500 && x < 1000   = case x < 900 of
                              True  -> Just (concat ((replicate (x `div` 500) "D") ++ [(fromMaybe "" (numerals (toInteger (x `mod` 500))))] ))
                              False -> Just ("CM" ++ fromMaybe "" (numerals (toInteger (x `mod` 900))))
  | x > 1000 && x <= 3000 = Just (concat ((replicate (x `div` 1000) "M") ++ [(fromMaybe "" (numerals (toInteger (x `mod` 1000))))] ))
  | otherwise             = Nothing 
 --where findRomanNumeralCombination pattern n =          
--numerals  = error "You need to implement this function."
 