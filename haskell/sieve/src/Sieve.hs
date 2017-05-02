module Sieve (primesUpTo) where

import Data.List((\\))

primesUpTo :: Integer -> [Integer]
primesUpTo n
  | n <= 1    = []
  | otherwise = 
                 let
                   sqrtLimit = (floor . sqrt) (fromIntegral n :: Double)
                   iVal = [i | i <- [2 .. sqrtLimit]]
                   jVal x = [x^2, x^2 + x .. n]
                 in
                   [2..n] \\ (concat $ map jVal iVal)
  