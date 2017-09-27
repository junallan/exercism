module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz 1 = Just 0
collatz number = if number > 1 then Just $ toInteger $ length (collatzValues number) - 1 else Nothing

collatzValues :: Integer -> [Integer]
collatzValues 1 = [1]
collatzValues number = if even number then number : collatzValues (divideInHalf number) else number : collatzValues (multiplyBy3AndAdd1 number)

divideInHalf :: Integer -> Integer
divideInHalf number = number `div` 2	

multiplyBy3AndAdd1 :: Integer -> Integer
multiplyBy3AndAdd1 number = 3 * number + 1
