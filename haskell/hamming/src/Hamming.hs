module Hamming (distance) where


distance :: String -> String -> Maybe Integer
distance strand1 strand2 = if length strand1 == length strand2
	                       then differences $ zip strand1 strand2
	                       else Nothing

differences :: [(Char, Char)] -> Maybe Integer
differences strands = Just . toInteger . length $ filter (\(a,b) -> a /= b) strands
