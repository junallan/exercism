module Queens (boardString, canAttack) where

import Data.Maybe(fromJust)
import Data.Char(isSpace)


boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString Nothing Nothing = "_ _ _ _ _ _ _ _\n_ _ _ _ _ _ _ _\n_ _ _ _ _ _ _ _\n_ _ _ _ _ _ _ _\n_ _ _ _ _ _ _ _\n_ _ _ _ _ _ _ _\n_ _ _ _ _ _ _ _\n_ _ _ _ _ _ _ _\n"
boardString queenA Nothing =
  let
    queenARow    = fst $ fromJust queenA
    queenAColumn = snd $ fromJust queenA
    rowLine      = words "_ _ _ _ _ _ _ _"
    queenAPosition = trimR $ concat $ map (\x -> x ++ " ") (take queenAColumn rowLine ++ ["W"] ++ drop (queenAColumn + 1) rowLine)
  in
    unlines [if r /= queenARow then "_ _ _ _ _ _ _ _" else queenAPosition | r <- [0..7]]

boardString Nothing queenB =
  let
    queenBRow    = fst $ fromJust queenB
    queenBColumn = snd $ fromJust queenB
    rowLine      = words "_ _ _ _ _ _ _ _"
    queenBPosition = trimR $ concat $ map (\x -> x ++ " ") (take queenBColumn rowLine ++ ["B"] ++ drop (queenBColumn + 1) rowLine)
  in
    unlines [if r /= queenBRow then "_ _ _ _ _ _ _ _" else queenBPosition | r <- [0..7]]
boardString queenA queenB =
  let
    rowLine      = words "_ _ _ _ _ _ _ _"
    queenARow    = fst $ fromJust queenA
    queenAColumn = snd $ fromJust queenA
    queenAPosition = trimR $ concat $ map (\x -> x ++ " ") (take queenAColumn rowLine ++ ["W"] ++ drop (queenAColumn + 1) rowLine)
    queenBRow    = fst $ fromJust queenB
    queenBColumn = snd $ fromJust queenB
    queenBPosition = trimR $ concat $ map (\x -> x ++ " ") (take queenBColumn rowLine ++ ["B"] ++ drop (queenBColumn + 1) rowLine)
  in    
    unlines [placeQueen r queenARow queenBRow queenAPosition queenBPosition | r <- [0..7]]
    where
      placeQueen r queenARow queenBRow queenAPosition queenBPosition
        | r == queenARow && r == queenBRow = placeQueensSameRow queenAPosition queenBPosition     
        | r == queenARow && r /= queenBRow = queenAPosition
        | r /= queenARow && r == queenBRow = queenBPosition
        | otherwise                        = "_ _ _ _ _ _ _ _"

placeQueensSameRow :: String -> String -> String
placeQueensSameRow queenA queenB =
  let
    qA = words queenA
    qB = words queenB
    qAB = zip qA qB
    rowPlacement queen
      | fst queen /= "_" = fst queen ++ " "
      | snd queen /= "_" = snd queen ++ " "
      | otherwise    = "_ "
  in
    trimR $ concat $ map rowPlacement qAB

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack queenA queenB =
  let
    (rowQueenA, columnQueenA) = queenA
    (rowQueenB, columnQueenB) = queenB
    magnitudeOfDistanceRow    = rowQueenB - rowQueenA
    magnitudeOfDistanceColumn = columnQueenB - columnQueenA
    isMagnitudeSame           = (abs magnitudeOfDistanceRow - abs magnitudeOfDistanceColumn) == 0
  in
    if rowQueenA == rowQueenB || columnQueenA == columnQueenB then True else isMagnitudeSame    

trimR :: String -> String
trimR xs = reverse $ dropWhile isSpace (reverse xs)
