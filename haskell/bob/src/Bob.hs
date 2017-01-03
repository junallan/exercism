module Bob (responseFor) where

import Data.Char


responseFor :: String -> String
responseFor sentence 
    | isEmpty sentence                                       = "Fine. Be that way!"
    | isNoLowerCase sentence && isContainsUpperCase sentence = "Whoa, chill out!"
    | isQuestion sentence                                    = "Sure."
    | otherwise                                              = "Whatever."

isQuestion :: String -> Bool
isQuestion sentence = last (filter (\x -> not(isSpace x)) sentence) == '?'

isNoLowerCase :: String -> Bool
isNoLowerCase sentence = not (any isLower sentence)

isContainsUpperCase :: String -> Bool
isContainsUpperCase sentence = any isUpper sentence

isEmpty :: String -> Bool
isEmpty sentence = all isSpace sentence
