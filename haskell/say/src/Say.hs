module Say (inEnglish) where

import Data.Maybe

inEnglish :: Integer -> Maybe String
inEnglish 0 = Just "zero"
inEnglish 1 = Just "one"
inEnglish 2 = Just "two"
inEnglish 3 = Just "three"
inEnglish 4 = Just "four"
inEnglish 5 = Just "five"
inEnglish 6 = Just "six"
inEnglish 7 = Just "seven"
inEnglish 8 = Just "eight"
inEnglish 9 = Just "nine"
inEnglish 10 = Just "ten"
inEnglish 11 = Just "eleven"
inEnglish 12 = Just "twelve"
inEnglish 13 = Just "thirteen"
inEnglish 14 = Just "fourteen"
inEnglish 15 = Just "fifteen"
inEnglish 16 = Just "sixteen"
inEnglish 17 = Just "seventeen"
inEnglish 18 = Just "eighteen"
inEnglish 19 = Just "nineteen"
inEnglish 20 = Just "twenty"
inEnglish 30 = Just "thirty"
inEnglish 40 = Just "forty"
inEnglish 50 = Just "fifty"
inEnglish 60 = Just "sixty"
inEnglish 70 = Just "seventy"
inEnglish 80 = Just "eighty"
inEnglish 90 = Just "nignty"
inEnglish number
  | numberLength >= 10 && numberLength < 13 = if number `mod` oneBillion == 0 then Just $ fromJust (inEnglish (number `div` oneBillion)) ++ " billion" else Just $ fromJust (inEnglish (number `div` oneBillion)) ++ " billion " ++ fromJust (inEnglish (number `mod` oneBillion))
  | numberLength >= 7 && numberLength < 10 = if number `mod` oneMillion == 0 then Just $ fromJust (inEnglish (number `div` oneMillion)) ++ " million" else Just $ fromJust (inEnglish (number `div` oneMillion)) ++ " million " ++ fromJust (inEnglish (number `mod` oneMillion))
  | numberLength >= 4 && numberLength < 7 = if number `mod` oneThousand == 0 then Just $ fromJust (inEnglish (number `div` oneThousand)) ++ " thousand" else Just $ fromJust (inEnglish (number `div` oneThousand)) ++ " thousand " ++ fromJust (inEnglish (number `mod` oneThousand))
  | numberLength == 3  = if number `mod` oneHundred == 0 then Just $ fromJust (inEnglish (number `div` oneHundred)) ++ " hundred" else Just $ fromJust (inEnglish (number `div` oneHundred)) ++ " hundred " ++ fromJust (inEnglish (number `mod` oneHundred)) 
  | number > 20 && number < 30 = Just ("twenty-" ++ fromJust (inEnglish $ number `mod` 20)) 
  | number > 30 && number < 40 = Just ("thirty-" ++ fromJust (inEnglish $ number `mod` 30))
  | number > 40 && number < 50 = Just ("forty-" ++ fromJust (inEnglish $ number `mod` 40))
  | number > 50 && number < 60 = Just ("fifty-" ++ fromJust (inEnglish $ number `mod` 50))
  | number > 60 && number < 70 = Just ("sixty-" ++ fromJust (inEnglish $ number `mod` 60))
  | number > 70 && number < 80 = Just ("seventy-" ++ fromJust (inEnglish $ number `mod` 70))
  | number > 80 && number < 90 = Just ("eighty-" ++ fromJust (inEnglish $ number `mod` 80))
  | number > 90 && number < 100 = Just ("nignty-" ++ fromJust (inEnglish $ number `mod` 90))
  | otherwise                  = Nothing
  where 
  	numberLength = length (show number)
  	oneHundred   = 100
  	oneThousand  = 1000
  	oneMillion   = 1000000
  	oneBillion   = 1000000000