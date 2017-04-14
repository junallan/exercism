module Matrix (saddlePoints) where

import Data.Array (Array, array, assocs)
import Data.List

saddlePoints :: Array (Int,Int) Int -> [(Int,Int)]
saddlePoints matrix = 
  let 
    matrixList = assocs matrix
  in
	findPositionsMaxRowsValue matrixList `intersect` findPositionsMinColumnsValue matrixList

findPositionsMaxRowsValue :: [((Int,Int),Int)] -> [(Int,Int)]
findPositionsMaxRowsValue matrix = 
  let 
    rowIndices                = nub $ map fst $ map fst matrix
    maxRowValue row           = maximum $ map snd (filter (\((r,c),v) -> r == row) matrix)
    maxRowPositionsValues row = filter (\((r,c),v) -> v == maxRowValue r && r == row) matrix 
    positionsMaxRowValue row  = map fst (maxRowPositionsValues row)
  in
    concat $ map (\r -> positionsMaxRowValue r) rowIndices

findPositionsMinColumnsValue :: [((Int,Int),Int)] -> [(Int,Int)]
findPositionsMinColumnsValue matrix = 
  let 
    columnIndices                   = nub $ map snd $ map fst matrix
    minColumnValue column           = minimum $ map snd (filter (\((r,c),v) -> c == column) matrix)
    minColumnPositionsValues column = filter (\((r,c),v) -> v == minColumnValue c && c == column) matrix
    positionsMinColumnValue column  = map fst (minColumnPositionsValues column)
  in
    concat $ map (\c -> positionsMinColumnValue c) columnIndices
{-
findPositionsMinColumnValue :: Int -> [((Int,Int),Int)] -> [(Int,Int)]
findPositionsMinColumnValue column matrix = 
  map fst minColumnPositionsValues
  where
    minColumnValue           = minimum $ map snd (filter (\((r,c),v) -> c == column) matrix)
    minColumnPositionsValues = filter (\((r,c),v) -> v == minColumnValue && c == column) matrix

-}

