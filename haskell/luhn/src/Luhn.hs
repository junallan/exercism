{-# LANGUAGE ParallelListComp #-}

module Luhn (isValid) where

import Data.Char(digitToInt)

isValid :: String -> Bool
isValid n = 
  case length (stringToIntList n) < 2 of True  -> False 
                                         False -> let
                                                    oddSum = foldl (+) 0 (first (stringToIntList (reverse n))) 
                                                    evenSum = foldl (+) 0 (second (stringToIntList (reverse n))) 
                                                  in
                                                    (evenSum + oddSum) `mod` 10 == 0 
                                                    
stringToIntList :: String -> [Int]
stringToIntList xs =  map digitToInt $ filter (/=' ') xs

first :: [Int] -> [Int]
first xs = [x | (x,n) <- [(x,n) | x <- xs | n <- [1..]], odd n]

second :: [Int] -> [Int]
second xs = [if x > 9 then x - 9 else x | (x,n) <- [(x*2,n) | x <- xs | n <- [1..]], even n]


