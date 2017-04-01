module Matrix
    ( Matrix
    , cols
    , column
    , flatten
    , fromList
    , fromString
    , reshape
    , row
    , rows
    , shape
    , transpose
    ) where

import Data.Vector (Vector)
import qualified Data.Vector as V
import Data.Char(isLetter, isSpace)

data Matrix a = Matrix { rws::Int, cls::Int, info :: V.Vector a} deriving (Eq, Show)

cols :: Matrix a -> Int
cols matrix = cls matrix
--error "You need to implement this function."

column :: Int -> Matrix a -> Vector a
column x matrix =
  let
    listElementColumns = [x, x + cls matrix .. rws matrix * cls matrix]
    counterVector = V.fromList [0 .. rws matrix * cls matrix - 1]
    infoVector = info matrix
    contents = V.zip infoVector counterVector
  in
    V.map fst (V.filter (\(a,b) -> (b `elem` listElementColumns) == True) contents)

flatten :: Matrix a -> Vector a
flatten matrix = info matrix

fromList :: [[a]] -> Matrix a
fromList xss = 
  Matrix 
  { 
    rws  = length xss, 
    cls  = if length xss == 0 then 0 else length (concat xss) `div` length xss, 
    info = V.fromList (concat xss) 
  }

fromString :: Read a => String -> Matrix a
{-fromString = fromList . map mySplit . lines
               where mySplit x = case reads x of
                                   [(x, xs)] -> x : mySplit xs
                                   _         -> []-}
fromString xs = fromList $ map mySplit (lines xs)
                where mySplit y = case reads y of
                                    [(y, ys)] -> y : mySplit ys
                                    _         -> []                                   
--fromList $ map (map read) (map words (lines xs))

  

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape dimensions matrix = 
  Matrix { rws = fst dimensions, cls = snd dimensions, info = info matrix}

row :: Int -> Matrix a -> Vector a
row x matrix = V.slice (x * cls matrix) (cls matrix) (info matrix)

rows :: Matrix a -> Int
rows matrix = rws matrix

shape :: Matrix a -> (Int, Int)
shape matrix = (rws matrix, cls matrix)

transpose :: Matrix a -> Matrix a
transpose matrix = 
  Matrix 
  { 
    rws = cls matrix, 
    cls = rws matrix, 
    info = V.fromList $ concatMap (\c -> V.toList (column c matrix)) [0 .. cls matrix - 1]
 }
