module Triangle (TriangleType(..), triangleType) where

import Data.List (sort)

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Degenerate
                  | Illegal
                  deriving (Eq, Show)

triangleType :: Float -> Float -> Float -> TriangleType
triangleType x y z
    | isDegenerate                            = Degenerate
    | not isNonDegenerate && not isDegenerate = Illegal
    | s1 == s2 && s2 == s3                    = Equilateral
    | s1 == s2 || s2 == s3                    = Isosceles
    | s1 /= s2 && s2 /= s3                    = Scalene
  where
    [s1, s2, s3]    = sort [x, y, z]
    isDegenerate    = s1 /= 0 && s2 /= 0 && s3 /= 0 && s3 == s1 + s2
    isNonDegenerate = s3 < s1 + s2
                      
