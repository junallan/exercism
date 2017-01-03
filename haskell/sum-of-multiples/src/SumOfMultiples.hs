module SumOfMultiples (sumOfMultiples) where

import Data.List (nub)

type Factors = [Integer]
type Limit   = Integer

sumOfMultiples :: Factors -> Limit -> Integer
sumOfMultiples [] limit     = 0
sumOfMultiples factors limit = sum (distinctMultiples factors limit) 

distinctMultiples :: Factors -> Limit -> [Integer]
distinctMultiples [] limit = []
distinctMultiples (x:xs) limit = nub (distinctMultiples xs limit ++ addMultiple x limit 1)

addMultiple :: Integer -> Integer -> Integer -> [Integer]
addMultiple factor limit index = if factor * index >= limit then [] else factor * index : addMultiple factor limit (index + 1)
