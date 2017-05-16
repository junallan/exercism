eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd x y
  | x < y = [x,y] 
  | x > y = []
  | otherwise = [x]
