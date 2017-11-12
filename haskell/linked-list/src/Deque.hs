module Deque (Deque, mkDeque, pop, push, shift, unshift) where

import Data.IORef

type Deque a = IORef [a]
--data BankAccount = BankAccount { balance :: IORef (Maybe Integer)}
--EmptyList | Cell a (LinkedList a)

mkDeque :: IO (Deque a)
mkDeque = newIORef []
--mkDeque = error "You need to implement this function."

pop :: Deque a -> IO (Maybe a)
pop x = do
                  items <- readIORef x
                  if null items then 
                    return Nothing 
                  else 
                    do 
                    	writeIORef x (take ((length items)-1) items) 
                    	return (Just (last items))
--pop (Cell x _ _) = return (Just x)
--pop deque = error "You need to implement this function."

push :: Deque a -> a -> IO ()
push items x = do
                 items' <- readIORef items
                 writeIORef items (items' ++ [x])


unshift :: Deque a -> a -> IO ()
unshift deque x = error "You need to implement this function."

shift :: Deque a -> IO (Maybe a)
shift deque = error "You need to implement this function."
