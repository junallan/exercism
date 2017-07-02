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
  left == right  = (size left == size right) && isSubsetOf left right
  
delete :: (Eq a) => a -> CustomSet a -> CustomSet a
delete x set = fromList $ toList set \\ [x]

difference :: (Eq a) => CustomSet a -> CustomSet a -> CustomSet a
difference setA setB   = fromList $ toList setA \\ toList setB 

empty :: CustomSet a
empty = Empty

fromList :: [a] -> CustomSet a
fromList [] = Empty
fromList set = Item (head set) (fromList (tail set))

insert :: (Eq a) => a -> CustomSet a -> CustomSet a
insert a set   = if member a set then set else fromList $ a : toList set

intersection :: (Eq a ) => CustomSet a -> CustomSet a -> CustomSet a
intersection setA setB   = fromList $ toList setA `intersect` toList setB

isDisjointFrom :: (Eq a) => CustomSet a -> CustomSet a -> Bool
isDisjointFrom Empty _            = True
isDisjointFrom (Item a setA) setB = not (member a setB) && isDisjointFrom setA setB

isSubsetOf :: (Eq a) => CustomSet a -> CustomSet a -> Bool
isSubsetOf Empty _            = True
isSubsetOf (Item a setA) setB = member a setB && isSubsetOf setA setB 

member :: (Eq a) => a -> CustomSet a -> Bool
member a Empty = False
member a (Item b set) = (a == b) || member a set

null :: (Eq a) => CustomSet a -> Bool
null set = set == Empty

size :: (Eq a) => CustomSet a -> Int
size set = length $ toList set

toList :: (Eq a) => CustomSet a -> [a]
toList Empty = []
toList (Item a set) = nub $ a : toList set

union :: (Eq a) => CustomSet a -> CustomSet a -> CustomSet a
union setA setB   = fromList (toList (difference setA setB) ++ toList (difference setB setA) ++ toList (intersection setA setB))
