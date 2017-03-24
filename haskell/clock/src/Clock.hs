module Clock (clockHour, clockMin, fromHourMin, toString) where

data Clock = Clock { hours :: Int, minutes :: Int} deriving (Show, Eq)

hoursInDay      :: Int
hoursInDay      = 24
secondsInMinute :: Int
secondsInMinute = 60
minutesInDay    :: Int
minutesInDay    = secondsInMinute * hoursInDay

instance Num Clock where
  (Clock h1 m1) + (Clock h2 m2) = fromHourMin (h1 + h2) (m1 + m2)
  fromInteger x = if minutesInDay == fromIntegral x then Clock 0 0 else Clock (fromIntegral x `div` secondsInMinute `mod` hoursInDay) (fromIntegral x `mod` secondsInMinute)
  negate (Clock hrs mins) = if minutesInDay - (hrs * secondsInMinute + mins) == 0 then 0 else fromInteger (toInteger $ minutesInDay - (hrs * secondsInMinute + mins))

clockHour :: Clock -> Int
clockHour (Clock h _) = h

clockMin :: Clock -> Int
clockMin (Clock _ m) = m

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = fromInteger $ toInteger (hour * secondsInMinute + min)

toString :: Clock -> String
toString (Clock hrs mins) =
  let
    hrsResult  = if hrs >= 0 && hrs < 10 then "0" ++ show hrs else show hrs
    minsResult = if mins >= 0 && mins < 10 then "0" ++ show mins else show mins
  in
    hrsResult ++ ":" ++ minsResult 
