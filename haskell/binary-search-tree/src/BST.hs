module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

import Data.Maybe(isJust, fromJust)


data BST a = EmptyTree | Node a (BST a) (BST a) deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft EmptyTree = Nothing
bstLeft  (Node a (left) (_)) = if isJust (bstValue left) then Just left else Nothing

bstRight :: BST a -> Maybe (BST a)
bstRight EmptyTree = Nothing
bstRight (Node a (_) (right)) = if isJust (bstValue right) then Just right else Nothing

bstValue :: BST a -> Maybe a
bstValue EmptyTree = Nothing
bstValue (Node a (_) (_)) = Just a

empty :: BST a
empty = EmptyTree

fromList :: Ord a => [a] -> BST a
fromList [] = empty
fromList [x] = singleton x
fromList (x:xs) = insert (last xs) (fromList (x:take (length xs-1) xs))

insert :: Ord a => a -> BST a -> BST a
insert x EmptyTree = singleton x
insert x (Node a (EmptyTree) (EmptyTree))
  | x <= fromJust (Just a) = (Node a (singleton x)(EmptyTree))
  | x > fromJust (Just a)  = (Node a (EmptyTree) (singleton x))
insert x (Node a (left) (right))
  | x <= fromJust (Just a) = (Node a (insert x left)(right))
  | x > fromJust (Just a)  = (Node a (left)(insert x right))

singleton :: a -> BST a
singleton x = Node x (EmptyTree) (EmptyTree)

toList :: BST a -> [a]
toList EmptyTree = []
toList (Node x (EmptyTree) (EmptyTree)) = [x]
toList (Node x (left) (right)) = toList left ++ [x] ++ toList right
