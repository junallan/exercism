module Sublist (Sublist(..), sublist) where

import Data.List.Split(chunksOf)

data Sublist = Equal | Sublist | Superlist | Unequal deriving (Eq, Show)

sublist :: Eq a => [a] -> [a] -> Sublist
sublist xs ys
  | xs == ys                                                    = Equal                                           
  | null xs                                                     = Sublist
  | null ys                                                     = Superlist
  | listsSameSize && not (isContainedInList xs ys)              = Unequal
  | firstListSmallerThanSecond && isContainedInList xs ys       = Sublist
  | firstListSmallerThanSecond && not (isContainedInList xs ys) = Unequal
  | isContainedInList ys xs                                     = Superlist
  | not (isContainedInList ys xs)                               = Unequal
  where
    listsSameSize              = length xs == length ys
    firstListSmallerThanSecond = length xs < length ys

isContainedInList :: Eq a => [a] -> [a] -> Bool
isContainedInList smallList largeList =
  any (== smallList) (concatMap (\y -> chunksOf (length smallList) y) (map (\x -> drop x largeList) [0.. endIndex]))
  where
    endIndex = if differenceInSize < length smallList then differenceInSize - 1 else length smallList - 1
    differenceInSize = length largeList - length smallList   
