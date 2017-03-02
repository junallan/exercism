module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar (Day, fromGregorian, toGregorian)
import Data.Time.Calendar.WeekDate

data Weekday = Monday
             | Tuesday
             | Wednesday
             | Thursday
             | Friday
             | Saturday
             | Sunday

data Schedule = First
              | Second
              | Third
              | Fourth
              | Last
              | Teenth

meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay schedule weekday year month = fromGregorian year month 13

weekSpanInMonth :: [[Day]] -> Integer -> [[Day]]
weekSpanInMonth weeks month = filter (isMatchingMonth month) weeks

isMatchingMonth :: Integer -> [Day] -> Bool
isMatchingMonth month week = let 
                               (_, mnth, _) = toGregorian (head week) 
                             in
                               (toInteger mnth) == month

weekTeenths :: Integer -> Integer -> [[Day]]
weekTeenths year month = filter isWeekTeenth (weekSpanInMonth (weeksInYear year) month)

isWeekTeenth :: [Day] -> Bool
isWeekTeenth [beginDate,endDate] = let 
                                       (_,_,dayStart) = toGregorian(beginDate)
                                       (_,_,dayEnd)   = toGregorian(endDate)
                                       teenthDays     = [13 .. 19]
                                     in
                                       dayStart `elem` teenthDays || dayEnd `elem` teenthDays

weekSpan :: Integer -> Int -> [[Day]]
weekSpan year yrWeek =  [[fromWeekDate year yrWeek (fromWeekdayToInt Monday)] ++ [fromWeekDate year yrWeek (fromWeekdayToInt Sunday)]]

weeksInYear :: Integer -> [[Day]]
weeksInYear year = concat $ map (weekSpan year) [1 .. 53]

fromWeekdayToInt :: Weekday -> Int
fromWeekdayToInt Monday    = 1
fromWeekdayToInt Tuesday   = 2
fromWeekdayToInt Wednesday = 3
fromWeekdayToInt Thursday  = 4
fromWeekdayToInt Friday    = 5
fromWeekdayToInt Saturday  = 6
fromWeekdayToInt Sunday    = 7

--fromWeekDate 2017 1 1
 --gregorianMonthLength
--error "You need to implement this function."
