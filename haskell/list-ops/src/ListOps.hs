module ListOps
  ( length
  , reverse
  , map
  , filter
  , foldr
  , foldl'
  , (++)
  , concat
  ) where

import Prelude hiding
  ( length, reverse, map, filter, foldr, (++), concat )

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f x [] = x
foldl' f x (y:ys) = let x' = f x y in x' `seq` foldl' f x' ys

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f x [] = x
foldr f x (y:ys) = y `f` foldr f x ys 

length :: [a] -> Int
length []     = 0
length [x]    = 1
length (x:xs) = length [x] + length xs

reverse :: [a] -> [a]
reverse []  = []
reverse (x) = last x : reverse (take (length x - 1) x)

map :: (a -> b) -> [a] -> [b]
map f [] = []
map f x  = f (head x) : map f (tail x) 

filter :: (a -> Bool) -> [a] -> [a]
filter f [] = []
filter f (x:xs) = if f x == True then x : filter f (xs) else filter f (xs)

(++) :: [a] -> [a] -> [a]
[] ++ ys  = ys
xs ++ ys = head xs : tail xs ++ ys

concat :: [[a]] -> [a]
concat [] = []
concat [[]] = []
--concat (x) = foldl' (++) (head x) (tail x)
concat (x) = head x ++ concat (tail x)