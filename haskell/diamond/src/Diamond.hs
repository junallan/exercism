module Diamond (diamond) where

import Data.List(lookup,elemIndex)
import Data.Maybe(fromJust)

diamond :: Char -> [String]
diamond letter = ascendingList ++ descendingList
                 where
                   descendingList = (tail . reverseList) ascendingList
                   ascendingList  = map (\x -> getDiamondRow x letter (findDimension letter)) ['A'..letter]
                   
reverseList :: [String] -> [String]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

findDimension :: Char -> Int
findDimension 'A' = getNumber 'A'
findDimension letter = getNumber (getLetter (lastLetterPos - 1)) + getNumber letter
                       where
                         lastLetterPos = getNumber letter

getNumber :: Char -> Int
getNumber letter = fromJust (elemIndex letter ['A'..'Z']) + 1

getLetter :: Int -> Char
getLetter number = fromJust $ lookup number (zip [1..] ['A'..'Z'])

getDiamondRow :: Char -> Char -> Int -> String
getDiamondRow letter lastLetter dimension = 
                                 blanks ++ reverseSequenceLetters ++ seqenceLetters ++ blanks
                                 where
                                   blanks                 = replicate (lastLetterNumber - letterNumber) ' '
                                   reverseSequenceLetters = reverse (tail seqenceLetters)
                                   seqenceLetters         = map (\x -> if x == letterNumber then getLetter x else ' ') [1..letterNumber]
                                   letterNumber           = getNumber letter
                                   lastLetterNumber       = getNumber lastLetter               