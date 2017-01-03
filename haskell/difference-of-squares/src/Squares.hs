module Squares (difference, squareOfSums, sumOfSquares) where

difference :: Integral a => a -> a
difference 0 = 0
difference a = squareOfSums a - sumOfSquares a

squareOfSums :: Integral a => a -> a
squareOfSums a = sum ([1..a]) ^ 2

sumOfSquares :: Integral a => a -> a
sumOfSquares a = sum (map (\x -> x ^ 2) [1..a])

