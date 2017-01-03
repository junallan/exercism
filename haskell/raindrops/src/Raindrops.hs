module Raindrops (convert) where

convert :: Int -> String
convert number =  if length (result) > 0
	              then result
	              else show number
                  where result = concat (map (\x -> if (divisibleBy number x) then factorConversion x else "") [3,5,7])
            

divisibleBy :: Int -> Int -> Bool
divisibleBy number divisor = number `mod` divisor == 0

factorConversion :: Int -> String
factorConversion 3 = "Pling"
factorConversion 5 = "Plang"
factorConversion 7 = "Plong"
factorConversion _ = "" 