module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear yr = divisibleBy 4 && not (divisibleBy 100) || divisibleBy 400 
    where 
        divisibleBy x = yr `mod` x == 0
