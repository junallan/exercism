module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , simulate
    , turnLeft
    , turnRight
    ) where

data Bearing = 
    North
  | East
  | South
  | West
  deriving (Eq, Show)

data Robot =
  Robot Bearing (Integer, Integer)

bearing :: Robot -> Bearing
bearing (Robot direction _) = direction

coordinates :: Robot -> (Integer, Integer)
coordinates (Robot _ coords) = coords 


mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot direction coords = Robot direction coords

simulate :: Robot -> String -> Robot
simulate (Robot direction coords) "" = Robot direction coords
simulate (Robot direction coords) movement
  | currentMove == advanceMove && direction == North = simulate (Robot direction (fst coords, (snd coords) + 1)) nextMoves
  | currentMove == advanceMove && direction == South = simulate (Robot direction (fst coords, (snd coords) - 1)) nextMoves
  | currentMove == advanceMove && direction == East  = simulate (Robot direction ((fst coords) + 1, snd coords)) nextMoves
  | currentMove == advanceMove && direction == West  = simulate (Robot direction (((fst coords) - 1), snd coords)) nextMoves
  | currentMove == leftTurn                          = simulate (Robot (turnLeft direction) ((fst coords), snd coords)) nextMoves
  | currentMove == rightTurn                         = simulate (Robot (turnRight direction) ((fst coords), snd coords)) nextMoves
  where currentMove = head movement
        nextMoves   = tail movement
        advanceMove = 'A'
        leftTurn    = 'L'
        rightTurn   = 'R'

turnLeft :: Bearing -> Bearing
turnLeft direction =
  case direction of
  North -> West
  East  -> North
  South -> East
  West  -> South

turnRight :: Bearing -> Bearing
turnRight direction =
  case direction of
  North -> East
  East  -> South
  South -> West
  West  -> North
