module Prime (nth) where

import Data.List(nub)

nth :: Int -> Maybe Integer
nth n = if null(primesUpTo n) then Nothing else Just $ toInteger $ last $ primesUpTo n

primesUpTo :: Int -> [Int]
primesUpTo 0 = []
primesUpTo 1 = [2]
primesUpTo n = 
  let
    previousPrimes = primesUpTo (n - 1)
    previousPrime = last previousPrimes
    nextPrime = until (\x -> not (isDivisibleBy x previousPrimes)) (+1) previousPrime
  in 
    previousPrimes ++ [nextPrime] 

isDivisibleBy :: Int -> [Int] -> Bool
isDivisibleBy dividend divisors = True `elem` nub (map  (\x -> dividend `mod` x == 0) divisors)
