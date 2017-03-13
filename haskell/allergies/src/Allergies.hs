module Allergies (Allergen(..), allergies, isAllergicTo) where

import Data.Bits

data Allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats
              deriving (Eq)

allergies :: Int -> [Allergen]
allergies x = filter (\allergen -> isAllergicTo allergen x) [Cats,Chocolate,Eggs,Peanuts,Pollen,Shellfish,Strawberries,Tomatoes]

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo a x = if (.&.) (allergenAsInt a) x /= 0 then True else False

allergenAsInt :: Allergen -> Int
allergenAsInt x = 
  case x of 
    Eggs -> 1
    Peanuts -> 2
    Shellfish -> 4
    Strawberries -> 8
    Tomatoes -> 16
    Chocolate -> 32
    Pollen -> 64
    Cats -> 128
