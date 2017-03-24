module Clock (clockHour, clockMin, fromHourMin, toString) where

data Clock = Clock { hours :: Integer, minutes :: Integer} deriving (Show, Eq)

hoursInDay      = toInteger 24
secondsInMinute = toInteger 60
minutesInDay    = secondsInMinute * hoursInDay

instance Num Clock where
  (Clock h1 m1) + (Clock h2 m2) = fromHourMin (fromInteger $ h1 + h2) (fromInteger $ m1 + m2)
  fromInteger x = if minutesInDay == x then Clock 0 0 else Clock (x `div` secondsInMinute `mod` hoursInDay) (x `mod` secondsInMinute)
  negate (Clock hrs mins) = if minutesInDay - (hrs * secondsInMinute + mins) == 0 then 0 else fromInteger (minutesInDay - (hrs * secondsInMinute + mins))

clockHour :: Clock -> Int
clockHour (Clock h _) = fromInteger $ h

clockMin :: Clock -> Int
clockMin (Clock _ m) = fromInteger $ m

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = fromInteger $ toInteger (hour) * secondsInMinute + toInteger (min)

toString :: Clock -> String
toString (Clock hrs mins) =
  let
    hrsResult  = if hrs >= 0 && hrs < 10 then "0" ++ show hrs else show hrs
    minsResult = if mins >= 0 && mins < 10 then "0" ++ show mins else show mins
  in
    hrsResult ++ ":" ++ minsResult 
