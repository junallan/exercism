module Garden
    ( Plant (..)
    , defaultGarden
    , garden
    , lookupPlants
    ) where

import Data.Map (Map)
import qualified Data.Map as M
import Data.Maybe (fromJust, isJust, mapMaybe)
import Data.List (sort)


data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)

plantTranslation :: Map Char Plant
plantTranslation = M.fromList ([('C', Clover), ('G', Grass), ('R', Radishes), ('V', Violets)])

mapStudentPlants :: String -> String -> String -> Map String Int -> [Plant]
mapStudentPlants studentName fRow sRow studentGrdnPos = 
  if (indexPos < length fRow) 
  then plants 
  else [] -- SORT OF HACKISH CAN THIS BE DONE BETTER???
  where 
    indexPos = fromJust (M.lookup studentName studentGrdnPos)
    plant1   = fromJust (M.lookup (fRow !! (indexPos)) plantTranslation)         
    plant2   = fromJust (M.lookup (fRow !! (indexPos + 1)) plantTranslation)
    plant3   = fromJust (M.lookup (sRow !! indexPos) plantTranslation)
    plant4   = fromJust (M.lookup (sRow !! (indexPos + 1)) plantTranslation)            
    plants   = [plant1, plant2, plant3, plant4]

setupStudentGardenPosition :: [String] -> Map String Int
setupStudentGardenPosition students = M.fromList (map (\x -> (students !! x, x * 2)) [0..(length students - 1)])

studentPlantMapping :: Map String Int -> String -> String -> [(String, [Plant])]
studentPlantMapping studentGardenPosition fstRow sndRow = map ( \x -> ((M.keys studentGardenPosition !! x), mapStudentPlants (M.keys studentGardenPosition !! x) fstRow sndRow studentGardenPosition)) [0..(length studentGardenPosition - 1)]

defaultGarden :: String -> Map String [Plant]
defaultGarden plants = 
  let [fstRow, sndRow]                       = lines plants
      studentGardenPosition                  = setupStudentGardenPosition ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"] -- M.fromList ([("Alice", 0), ("Bob", 2), ("Charlie", 4), ("David", 6), ("Eve", 8), ("Fred", 10), ("Ginny", 12), ("Harriet", 14), ("Ileana", 16), ("Joseph", 18), ("Kincaid", 20), ("Larry", 22)])
  in
    M.fromList (studentPlantMapping studentGardenPosition fstRow sndRow)

garden :: [String] -> String -> Map String [Plant]
garden students plants = 
	let [fstRow, sndRow] = lines plants  
	in
	  M.fromList (studentPlantMapping (setupStudentGardenPosition (sort students)) fstRow sndRow) 

lookupPlants :: String -> Map String [Plant] -> [Plant]
lookupPlants studentName garden = 
  if isJust plants  
  then fromJust plants
  else []
  where plants = M.lookup studentName garden
