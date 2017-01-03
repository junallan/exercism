module Accumulate (accumulate) where

accumulate :: (a -> b) -> [a] -> [b]
accumulate f [] = []
accumulate f x = f (head x) : accumulate f (tail x)
