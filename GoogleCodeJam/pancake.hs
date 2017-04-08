import Data.List
import Data.Ord
import Data.Maybe

pancake :: String -> Integer -> Integer -> String
pancake s k numFlips
  | length (filter(=='-') s) == 0            = show numFlips
  | length (filter(=='-') s) < fromInteger k = "Impossible"
  | otherwise                                = pancake (flipPancake s k) k (numFlips + 1)

patternSequence :: String -> [(Int, Char)]
patternSequence xs = map (\s -> (length s, s!!0)) (group xs)

maximumCharacterElement :: [(Int,Char)] -> Char -> ((Int,Char),Int)
maximumCharacterElement s c = 
  let 
    results = characterElements s
  in
    maximumBy (comparing fst) (filter(\((repetition,value),index) -> value==c) results)

characterElements :: [(Int,Char)] -> [((Int,Char),Int)]
characterElements xs = zip xs [0..]

previousCharacterElement :: [((Int,Char),Int)] -> Int -> Maybe ((Int,Char),Int)
previousCharacterElement xs index = if index - 1 >= 0 then Just (xs !! (index - 1)) else Nothing

nextCharacterElement :: [((Int,Char),Int)] -> Int -> Maybe ((Int,Char),Int)
nextCharacterElement xs index = if index + 1 < length xs then Just (xs !! (index + 1)) else Nothing

flipPancake :: String -> Integer -> String
flipPancake s k =
  let
    patternSeq                   = patternSequence s
    maxCharElement               = maximumCharacterElement patternSeq '-'
    ((maxRepetionCount,_),maxIndex) = maxCharElement
    charElements                 = characterElements patternSeq
    prevCharElement              = previousCharacterElement charElements  maxIndex
    nextCharElement              = nextCharacterElement charElements maxIndex
  in
    if maxRepetionCount == fromInteger k 
    then 
      concat $ map (\((rep,val),_) -> replicate rep val) (map (\((repetion,value),indx) -> if maxIndex == indx then flipElement ((repetion,value),indx) else ((repetion,value),indx)) charElements)
    else
      case isNothing prevCharElement of
        True  -> ""
        False -> let
                   prvCharElement              = fromJust prevCharElement
                   prevChrElementRepetionCount = fst (fst prvCharElement)
                   prevChrElement              = snd (fst prvCharElement)
                   prevIndex                   = snd prvCharElement
--                   ((prevCharElementRepetionCount, prevCharElement), prevIndex) = prevCharElement
                 in
                   if prevChrElementRepetionCount == fromInteger k - maxRepetionCount
                   then
                     concat $ map (\((rep,val),_) -> replicate rep val) (map (\((repetion,value),indx) -> if maxIndex == indx || prevIndex == indx then flipElement ((repetion,value),indx) else ((repetion,value),indx)) charElements)
                   else
                     ""

flipElement :: ((Int,Char),Int) -> ((Int,Char),Int)
flipElement ((repetion,value),index) =
  let
    flippedValue = if value == '-' then '+' else '-'
  in
    ((repetion,flippedValue),index)

{-
flipPancake :: String -> Integer -> String
flipPancake s k =
  let
    patternValue = patternSequence s
    (x,y:ys)     = splitAt (maximumCharacterElement patternValue '-') patternValue
    newVal       = if snd y == '-' then [(fst y,'+')] else [(fst y,'-')]
  in
    concat $ map (\(repetition,value) -> replicate repetition value) (x ++ newVal ++ ys)
-}