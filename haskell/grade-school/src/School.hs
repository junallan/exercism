module School (School, add, empty, grade, sorted) where

import Data.List (filter, unzip, sort)

type School  = [Student]
type Student = (Int, [String])

add ::  Int -> String -> School -> School
add schoolgrade studentname school = if kidsinclass /= empty
	                                 then [(schoolgrade, sort (studentname : kidsinclass))] ++ filter (\ (x, y) -> x /= schoolgrade) school
	                                 else [(schoolgrade, [studentname])] ++ school
	                                 where kidsinclass = grade schoolgrade school
empty = []

grade :: Int -> School -> [String]
grade gd school = if students /= empty
	              then concat $ snd (unzip students)
	              else []
	              where students = filter (\ (x, y) -> x == gd) school

sorted :: School -> School
sorted students = sort students
