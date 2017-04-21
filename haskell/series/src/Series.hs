module Series (slices) where

import Data.Char(isDigit)

slices :: Int -> String -> [[Int]]
slices n xs
  | isInputNonNumber || length xs < n = []
  | null xs || n == 0                 = [[]]
  | otherwise                         = subSubElements 0
  where
    subElements index xs n = [ take n . drop i $ xs | i <- [0..length xs - n]]
    subSubElements index   =
      let 
        subResult = [ take n . drop i $ xs | i <- [0..length xs - n]]
      in
        map (\x -> map (\y -> read y :: Int) (subElements 0 x 1)) subResult
    isInputNonNumber       = any (not . isDigit) xs
