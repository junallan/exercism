module PigLatin (translate) where

translate :: String -> String
translate (x:xs) = unwords $ map wordTranslator (words (x:xs))

wordTranslator :: String -> String
wordTranslator (x:xs)
  | isVowel x                         = x:xs ++ "ay" 
  | isLettersAsSingleConstant x xs    = if isLetterThreeLetterGrouping x (head xs) (head (tail xs)) then tail (tail xs) ++ [x] ++ [head xs] ++ [head (tail xs)] ++ "ay" else tail xs ++ [x] ++ [head xs] ++ "ay"
  | isLetterAsSingleVowel x (head xs) = x:xs ++ "ay"
  | otherwise                         = xs ++ [x] ++ "ay"

isVowel :: Char -> Bool
isVowel letter = letter == 'a'|| letter == 'e' || letter == 'i' || letter =='o' || letter == 'u'

isLettersAsSingleConstant :: Char -> String -> Bool
isLettersAsSingleConstant 'c' ('h':_)   = True
isLettersAsSingleConstant 'q' ('u':_)   = True
isLettersAsSingleConstant 't' ('h':_)   = True
isLettersAsSingleConstant _ ('q':'u':_) = True
isLettersAsSingleConstant 's' _         = True
isLettersAsSingleConstant _ _           = False

isLetterThreeLetterGrouping :: Char -> Char -> Char -> Bool
isLetterThreeLetterGrouping _ 'q' 'u'   = True
isLetterThreeLetterGrouping 't' 'h' 'r' = True
isLetterThreeLetterGrouping 's' 'c' 'h' = True
isLetterThreeLetterGrouping _ _ _       = False

isLetterAsSingleVowel :: Char -> Char -> Bool
isLetterAsSingleVowel l1 l2 = (l1 == 'y' && l2 == 't') || (l1 == 'x' && l2 == 'r')
