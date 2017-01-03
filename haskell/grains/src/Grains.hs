module Grains (square, total) where

import Data.Maybe (fromJust)

square :: Integer -> Maybe Integer
square n = case n of x | x <= 0  || x > 64 -> Nothing
                     1                     -> Just 1
                     _                     -> Just (fromJust (square (n - 1)) + fromJust (square (n - 1)))

total :: Integer
total = sum $ map (fromJust . square ) [1..64]  