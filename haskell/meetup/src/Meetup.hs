module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar (Day, fromGregorian, toGregorian, addDays)
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

teenthDays :: [Int] 
teenthDays = [13 .. 19]

weeksYear :: [Int]
weeksYear = [1 .. 52]

meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay Teenth weekday year month    = weekTeenthWeekday year (toInteger month) weekday
meetupDay Last weekday year month      = let
                                           dayWeek = dayInWeek (weekInMonthBySchedule year (toInteger month) Last) weekday
                                           (yrWeek, monthWeek, _) = toGregorian dayWeek
                                           dayWeekEnd = addDays (7) dayWeek
                                           (yrWeekLater, monthWeekLater, _) = toGregorian dayWeekEnd
                                         in
                                           if (yrWeek == year) && (monthWeek == month)
                                           then
                                             if (yrWeekLater == year) && (monthWeekLater == month) then dayWeekEnd else dayWeek
                                           else
                                             addDays (-7) dayWeek       
meetupDay schedule weekday year month  = let 
                                           dayWeek = dayInWeek (weekInMonthBySchedule year (toInteger month) schedule) weekday
                                           dayWeekStart = addDays (-(toInteger (fromScheduleToInt schedule) * 7)) dayWeek
                                           (yrWeekEarlier, monthWeekEarlier, _) = toGregorian dayWeekStart
                                         in
                                           if (yrWeekEarlier == year) && (monthWeekEarlier == month) then addDays (-7) dayWeek else dayWeek

weekSpanInMonth :: [[Day]] -> Integer  -> Integer -> [[Day]]
weekSpanInMonth weeks month year = filter (isMatchingMonth month year) weeks

isMatchingMonth :: Integer -> Integer -> [Day] -> Bool
isMatchingMonth month year week = let 
                               (yrStartWeek, mnthStartWeek, _) = toGregorian (head week) 
                               (yrEndWeek, mnthEndWeek, _)     = toGregorian (head week) 
                             in
                               ((toInteger mnthStartWeek) == month && (toInteger yrStartWeek) == year)  || ((toInteger mnthEndWeek) == month && (toInteger yrEndWeek) == year) 

weekTeenthWeekday :: Integer -> Integer -> Weekday -> Day
weekTeenthWeekday year month weekday = let
                                         weeks = weekTeenths year month
                                         isFirstWeekWeekteenth = isWeekTeenthDay (addDays (toInteger $ fromWeekdayToInt weekday - 1)  (head (head weeks)))
                                         isSecondWeekWeekteenth = isWeekTeenthDay (addDays (toInteger $ fromWeekdayToInt weekday - 1)  (head (last weeks)))
                                       in
                                         if isFirstWeekWeekteenth
                                         then addDays (toInteger $ fromWeekdayToInt weekday - 1) (head (head weeks))
                                         else addDays (toInteger $ fromWeekdayToInt weekday - 1) (head (last weeks))                                        

weekTeenths :: Integer -> Integer -> [[Day]]
weekTeenths year month = filter isWeekTeenth (weekSpanInMonth (weeksInYear year) month year)

weekInMonthBySchedule :: Integer -> Integer -> Schedule -> [Day]
weekInMonthBySchedule year month Last     = weekSpanInMonth (weeksInYear year) month year  !! (length (weekSpanInMonth (weeksInYear year) month year) - 1)
weekInMonthBySchedule year month schedule = weekSpanInMonth (weeksInYear year) month year  !! (fromScheduleToInt schedule - 1)

dayInWeek :: [Day] -> Weekday -> Day
dayInWeek week weekday = addDays (toInteger $ fromWeekdayToInt weekday - 1) (week !! 0)

isWeekTeenthDay :: Day -> Bool
isWeekTeenthDay day = let 
                        (_,_,dayMonth) = toGregorian(day)
                      in
                        dayMonth `elem` teenthDays

isWeekTeenth :: [Day] -> Bool
isWeekTeenth [beginDate,endDate] = let 
                                       (_,_,dayStart) = toGregorian(beginDate)
                                       (_,_,dayEnd)   = toGregorian(endDate)
                                     in
                                       dayStart `elem` teenthDays || dayEnd `elem` teenthDays

weekSpan :: Integer -> Int -> [[Day]]
weekSpan year yrWeek =  [[fromWeekDate year yrWeek (fromWeekdayToInt Monday)] ++ [fromWeekDate year yrWeek (fromWeekdayToInt Sunday)]]

weeksInYear :: Integer -> [[Day]]
weeksInYear year = concat $ map (weekSpan year) weeksYear

fromWeekdayToInt :: Weekday -> Int
fromWeekdayToInt Monday    = 1
fromWeekdayToInt Tuesday   = 2
fromWeekdayToInt Wednesday = 3
fromWeekdayToInt Thursday  = 4
fromWeekdayToInt Friday    = 5
fromWeekdayToInt Saturday  = 6
fromWeekdayToInt Sunday    = 7

fromScheduleToInt :: Schedule -> Int
fromScheduleToInt First  = 1
fromScheduleToInt Second = 2
fromScheduleToInt Third  = 3
fromScheduleToInt Fourth = 4
