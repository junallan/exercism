module Phone (areaCode, number, prettyPrint) where

import Data.Char (isDigit)
import Data.Maybe (fromJust, isJust)


areaCode :: String -> Maybe String
areaCode phoneNumber = if isJust phoneNumDigits
                       then Just $ take 3 (fromJust phoneNumDigits)
                       else Nothing
                       where phoneNumDigits = number phoneNumber

number :: String -> Maybe String
number phoneNumber
    | length (phoneNumDigits) == 10                                   = Just phoneNumDigits
    | length (phoneNumDigits) == 11 && (take 1 phoneNumDigits) == "1" = Just $ drop 1 phoneNumDigits  
    | otherwise                                                       = Nothing
    where phoneNumDigits = justDigits phoneNumber

prettyPrint :: String -> Maybe String
prettyPrint phoneNumber = if length phoneNumDigits == 10
                          then Just $ "(" ++ areaCd ++ ") " ++  phone1 ++ "-" ++ phone2
                          else  Nothing
                          where phoneNumDigits         = fromJust $ number phoneNumber
                                areaCd                 = fromJust $ areaCode phoneNumDigits
                                phoneExcludingAreaCode = splitAt 3 (drop 3 phoneNumDigits)
                                phone1                 = fst phoneExcludingAreaCode
                                phone2                 = snd phoneExcludingAreaCode
                          
justDigits :: String -> String
justDigits phoneNumber = filter(\x -> isDigit(x)) phoneNumber