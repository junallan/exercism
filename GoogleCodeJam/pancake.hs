import Data.List
import Data.Ord

pancake :: String -> Integer -> Integer -> String
pancake s k numFlips
  | length (filter(=='-') s) == 0            = show numFlips
  | length (filter(=='-') s) < fromInteger k = "Impossible"
  | otherwise                                = pancake (flipPancake s k) k (numFlips + 1)

patternSequence :: String -> [(Int, Char)]
patternSequence xs = map (\s -> (length s, s!!0)) (group xs)

maximumCharacterElement :: [(Int,Char)] -> Char -> Int
maximumCharacterElement s c = 
  let 
    results = zip s [0..]
  in
    snd $ maximumBy (comparing fst) (filter(\((repetition,value),index) -> value==c) results)

flipPancake :: String -> Integer -> String
flipPancake s k =
  let
    patternValue = patternSequence s
    (x,y:ys)     = splitAt (maximumCharacterElement patternValue '-') patternValue
    newVal       = if snd y == '-' then [(fst y,'+')] else [(fst y,'-')]
  in
    concat $ map (\(repetition,value) -> replicate repetition value) (x ++ newVal ++ ys)
