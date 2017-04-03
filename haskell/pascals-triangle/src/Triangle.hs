module Triangle (rows) where

rows :: Int -> [[Integer]]
rows x
  | x > 0     = rows (x-1) ++ [map (\y -> pascalFormula (x-1) y) [0..x-1]]
  | otherwise = []
  where pascalFormula n k = toInteger (product [1..n] `div` (product [1..k] * product [1..n-k]))