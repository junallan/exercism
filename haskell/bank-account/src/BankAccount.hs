module BankAccount
    ( BankAccount
    , closeAccount
    , getBalance
    , incrementBalance
    , openAccount
    ) where

import Data.IORef(newIORef, IORef, writeIORef, readIORef)
import Data.Maybe(fromMaybe, isNothing)

data BankAccount = BankAccount { balance :: IORef (Maybe Integer)}

closeAccount :: BankAccount -> IO ()
closeAccount (BankAccount balance) = writeIORef balance Nothing

getBalance :: BankAccount -> IO (Maybe Integer)
getBalance account = readIORef $ balance account

incrementBalance :: BankAccount -> Integer -> IO (Maybe Integer)
incrementBalance (BankAccount balance) amount = 
    do
      currentBalance <- readIORef balance
      if isNothing currentBalance then writeIORef balance Nothing else writeIORef balance (Just (amount + fromMaybe 0 currentBalance)) 
      readIORef balance

openAccount :: IO BankAccount
openAccount =  do
                 irefBalance <- newIORef (Just 0)
                 return (BankAccount irefBalance)
