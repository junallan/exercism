module Deque (Deque, mkDeque, pop, push, shift, unshift) where

import Data.IORef

data Deque a = Deque (IORef [a])

mkDeque :: IO (Deque a)
mkDeque = do
            emptyItems <- newIORef []
            return (Deque emptyItems)

pop :: Deque a -> IO (Maybe a)
pop (Deque x) = do
                  items <- readIORef x
                  if null items then 
                    return Nothing 
                  else 
                    do 
                      writeIORef x (take (length items-1) items) 
                      return (Just (last items))

push :: Deque a -> a -> IO ()
push (Deque x) val = do
                       items <- readIORef x
                       writeIORef x (items ++ [val])

unshift :: Deque a -> a -> IO ()
unshift (Deque x) val = do
                          items <- readIORef x
                          writeIORef x (val : items)  

shift :: Deque a -> IO (Maybe a)
shift (Deque x) = do
                    items <- readIORef x
                    if null items then
                      return Nothing
                    else
                      do
                        writeIORef x (tail items)
                        return (Just (head items))
