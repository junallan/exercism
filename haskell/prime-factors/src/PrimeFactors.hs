module PrimeFactors (primeFactors) where

primeFactors :: Integer -> [Integer]
primeFactors 1 = []
primeFactors n = 
  findPrime n 2
    where 
      findPrime divisor dividend
        | divisor < dividend          = []
        | divisor `mod` dividend == 0 = [dividend] ++ findPrime (divisor `div` dividend) dividend
        | otherwise                   = findPrime divisor (dividend + 1)
