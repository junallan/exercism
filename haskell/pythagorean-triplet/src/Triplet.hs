module Triplet (isPythagorean, mkTriplet, pythagoreanTriplets) where

import Data.Tuple.Select
import Data.List

isPythagorean :: (Int, Int, Int) -> Bool
isPythagorean triplet = 
  let 
    a = sel1 triplet
    b = sel2 triplet
    c = sel3 triplet
  in 
    a^2 + b^2 == c^2

mkTriplet :: Int -> Int -> Int -> (Int, Int, Int)
mkTriplet a b c =
  let
    orderedValues = sort [a,b,c]
  in
    (orderedValues !! 0, orderedValues !! 1, orderedValues !! 2)

pythagoreanTriplets :: Int -> Int -> [(Int, Int, Int)]
pythagoreanTriplets minFactor maxFactor = [(a,b,c) | a <- [minFactor..maxFactor], b <- [minFactor..maxFactor], c <- [minFactor..maxFactor], (a^2 + b^2 == c^2) && (a < b && b < c)]	
  