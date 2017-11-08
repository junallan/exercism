module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify number
  | number <= 0                   = Nothing
  | numberSumOfDivisors == number = Just Perfect
  | numberSumOfDivisors > number  = Just Abundant
  | otherwise                     = Just Deficient
  where
    numberSumOfDivisors = sum (divisibleNumbers number)
    divisibleNumbers number = filter (\x -> number `mod` x == 0) [1..(number `div` 2)]
