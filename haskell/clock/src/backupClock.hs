{-# LANGUAGE DeriveAnyClass #-}

module Clock (clockHour, clockMin, fromHourMin, toString) where

--data Clock = Dummy
data Clock = Clock { minutes :: Int} deriving (Eq, Show, Num)

fromInteger :: (Num t) => Clock t -> Int
fromInteger (Clock { minutes = m }) = m 
{-class (Num a) => Int a where
  fromInteger :: a -> String
-}

{-instance Num Clock where
  fromInteger n = let a = (fromInteger n) in Clock
-}
clockHour :: Clock -> Int
clockHour clock = error "You need to implement this function."

clockMin :: Clock -> Int
clockMin clock = error "You need to implement this function."

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = Clock 60

toString :: Clock -> String
toString clock = "00:03"
--toString clock = error "You need to implement this function."
