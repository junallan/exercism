module Deque (Deque, mkDeque, pop, push, shift, unshift) where

import Data.IORef

--data Deque a = Dummy
data Deque a = EmptyNode | Cell a (Deque a) (Deque a)

--data BankAccount = BankAccount { balance :: IORef (Maybe Integer)}
--EmptyList | Cell a (LinkedList a)

mkDeque :: IO (Deque a)
mkDeque = return EmptyNode
--mkDeque = error "You need to implement this function."

pop :: Deque a -> IO (Maybe a)
pop EmptyNode = return Nothing
pop (Cell x _ _) = return (Just x)
--pop deque = error "You need to implement this function."

push :: Deque a -> a -> IO ()
{-push EmptyNode x = do 
	                 item <- newIORef EmptyNode
	                 --modifyIORef item ((Cell x) EmptyNode EmptyNode)
	                 writeIORef item ((Cell x) EmptyNode EmptyNode)-}

push deque x = do
                 item <- newIORef deque
                 item' <- readIORef item
                 writeIORef item ((Cell x) EmptyNode item')

unshift :: Deque a -> a -> IO ()
unshift deque x = error "You need to implement this function."

shift :: Deque a -> IO (Maybe a)
shift deque = error "You need to implement this function."
