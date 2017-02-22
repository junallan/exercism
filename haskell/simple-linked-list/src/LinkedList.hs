module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

data LinkedList a = EmptyList | Cell a (LinkedList a)

datum :: LinkedList a -> a
datum EmptyList    = error "No value for element."
datum (Cell a (_)) = a

fromList :: [a] -> LinkedList a
fromList [] = EmptyList
fromList(x:xs) = Cell x (fromList xs)

isNil :: LinkedList a -> Bool
isNil EmptyList = True
isNil _         = False

new :: a -> LinkedList a -> LinkedList a
new x y = Cell x y

next :: LinkedList a -> LinkedList a
next EmptyList = EmptyList
next (Cell _ (a)) = a

nil :: LinkedList a
nil = EmptyList

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = fromList . reverse . toList

toList :: LinkedList a -> [a]
toList EmptyList = []
toList (Cell a (b)) = a : toList b
