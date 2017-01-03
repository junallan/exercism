module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA [] = Nothing
toRNA dna = traverse transformSequence dna

transformSequence :: Char -> Maybe Char
transformSequence 'G' = Just 'C'
transformSequence 'C' = Just 'G'
transformSequence 'T' = Just 'A'
transformSequence 'A' = Just 'U'
transformSequence _   = Nothing