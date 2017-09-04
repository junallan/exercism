module Robot (Robot, mkRobot, resetName, robotName) where

import System.Random
import Data.IORef

data Robot = Robot { name :: IORef String}

mkRobot :: IO Robot
mkRobot = do 
            generator <- newStdGen
            let randomCode = take 2 (randomRs ('A','Z') generator) ++ take 3 (randomRs ('0','9') generator)
            irefCode <- newIORef randomCode
            return (Robot irefCode)
 
resetName :: Robot -> IO ()
resetName (Robot name) = do
                           generator <- newStdGen
                           let randomCode = take 2 (randomRs ('A','Z') generator) ++ take 3 (randomRs ('0','9') generator)
                           writeIORef name randomCode

robotName :: Robot -> IO String
robotName robot = readIORef (name robot)