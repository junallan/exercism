module CustomSet
  ( delete
  , difference
  , empty
  , fromList
  , insert
  , intersection
  , isDisjointFrom
  , isSubsetOf
  , member
  , null
  , size
  , toList
  , union
  ) where

import Prelude hiding (null)
import Data.List(intersect, (\\), nub)

data CustomSet a = Empty | Item a (CustomSet a) deriving (Show)

instance (Eq a) => Eq (CustomSet a) where
  left == right  = (size left == size right) && (isSubsetOf left right)
  
delete :: (Eq a) => a -> CustomSet a -> CustomSet a
delete x set = fromList $ toList set \\ [x]

difference :: (Eq a) => CustomSet a -> CustomSet a -> CustomSet a
difference Empty Empty = Empty
difference Empty setB  = Empty
difference setA  Empty = setA
difference setA setB    = fromList $ toList setA \\ toList setB 

empty :: CustomSet a
empty = Empty

fromList :: [a] -> CustomSet a
fromList [] = Empty
fromList set = Item (head set) (fromList (tail set))

insert :: (Eq a) => a -> CustomSet a -> CustomSet a
insert a Empty = fromList [a]
insert a set   = if member a set then set else fromList $ a : toList set

intersection :: (Eq a ) => CustomSet a -> CustomSet a -> CustomSet a
intersection Empty Empty = Empty
intersection Empty setB  = Empty
intersection setA  Empty = Empty
intersection setA setB   = fromList $ toList setA `intersect` toList setB

isDisjointFrom :: (Eq a) => CustomSet a -> CustomSet a -> Bool
isDisjointFrom Empty Empty = True
isDisjointFrom setA Empty = True
isDisjointFrom Empty setB = True
isDisjointFrom (Item a (setA)) setB = if member a setB then False else isDisjointFrom setA setB

isSubsetOf :: (Eq a) => CustomSet a -> CustomSet a -> Bool
isSubsetOf Empty Empty = True
isSubsetOf Empty setB = True
isSubsetOf setA Empty = False
isSubsetOf (Item a (setA)) setB = if member a setB then isSubsetOf setA setB else False

member :: (Eq a) => a -> CustomSet a -> Bool
member a Empty = False
member a (Item b (set)) = if a == b then True else member a set

null :: (Eq a) => CustomSet a -> Bool
null set = case set == Empty of True -> True
                                False -> False 

size :: (Eq a) => CustomSet a -> Int
size set = length $ toList set

toList :: (Eq a) => CustomSet a -> [a]
toList Empty = []
toList (Item a (set)) = nub $ a : toList set

union :: (Eq a) => CustomSet a -> CustomSet a -> CustomSet a
union Empty Empty = Empty
union Empty setB  = setB
union setA  Empty = setA
union setA setB   = fromList (toList (difference setA setB) ++ toList (difference setB setA) ++ toList (intersection setA setB))
