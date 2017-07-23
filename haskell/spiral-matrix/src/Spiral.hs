module Spiral (spiral) where

import Data.List.Split(chunksOf) 

spiral :: Int -> [[Int]]
spiral size = chunksOf size [spiralPosVal (x,y) size | x <- [0..size-1], y <- [0..size-1]]

spiralPosVal :: (Int,Int) -> Int -> Int
spiralPosVal (row,col) dimensionSize
  | row == 0                 = col + 1 -- left to right
  | col == dimensionSize - 1 = row + (col + 1) -- top to bottom
  | row == dimensionSize - 1 = (dimensionSize - 1) * 2 + (dimensionSize - col) -- right to left
  | col == 0                 = dimensionSize + ((dimensionSize - 1) * 2) + ((dimensionSize - 1) - row) -- bottom to top
  | otherwise                = (dimensionSize + ((dimensionSize - 1) * 2) + (dimensionSize - 2)) + spiralPosVal (row - 1,col - 1) (dimensionSize - 2) -- not outside of array inner part, outside number of items equal: size + ((size - 1) * 2) + (size - 2)

