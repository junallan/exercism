module ETL (transform) where

import Data.Map (Map, fromList, toList, unionWith)
import qualified Data.Map as Map
import Data.Char (toLower)


transform :: Map a String -> Map Char a
transform x = Map.fromList $ concat (map (\x -> transform' (fst x) (snd x)) (Map.toList x))

transform' :: a -> String -> [(Char, a)]
transform' k v = zip (toLowercase v) (repeat k)

toLowercase :: String -> String
toLowercase x = map toLower x

