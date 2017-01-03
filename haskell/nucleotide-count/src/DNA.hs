module DNA (count, nucleotideCounts) where

import Data.Map (Map)
import qualified Data.Map as Map

dnaElementError = "Incorrect dna element" 

count :: Char -> String -> Either String Int
count vallooking nucleotide = if isDNAElement(vallooking) && isValidNucleotide(nucleotide)
                              then Right total
                              else Left dnaElementError 
                              where total = foldl (\acc x -> if x == vallooking then acc + 1 else acc) 0 nucleotide

countVal :: Either String Int -> Int
countVal (Right count) = count
countVal (Left _     ) = error dnaElementError 

isDNAElement :: Char -> Bool
isDNAElement 'A' = True
isDNAElement 'C' = True
isDNAElement 'G' = True
isDNAElement 'T' = True
isDNAElement _   = False

nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts nucleotide = if isValidNucleotide(nucleotide)
                              then Right (Map.fromList (map buildMap "ACGT"))
                              else Left dnaElementError 
                              where buildMap x = (x, (countVal(count x nucleotide))) 

isValidNucleotide :: String -> Bool
isValidNucleotide(nucleotide) = all(\x -> isDNAElement(x)) nucleotide	
