module Palindromes (largestPalindrome, smallestPalindrome) where


largestPalindrome :: Integer -> Integer -> (Integer, [(Integer, Integer)])
largestPalindrome minFactor maxFactor = (largestProduct, map (\x -> snd x) (getLargestProductPairs minFactor maxFactor maxFactor maxFactor largestProduct))
                                        where 
                                          largestProduct = getLargestProduct minFactor maxFactor maxFactor maxFactor 0
                                        
smallestPalindrome :: Integer -> Integer -> (Integer, [(Integer, Integer)])
smallestPalindrome minFactor maxFactor = (smallestProduct, map (\x -> snd x) (getSmallestProductPairs minFactor maxFactor minFactor minFactor smallestProduct))
                                         where
                                           smallestProduct = getSmallestProduct minFactor maxFactor minFactor minFactor

isPalindromeProduct :: Integer -> Integer -> Bool
isPalindromeProduct num1 num2 = isPalindrome $ num1 * num2

isPalindrome :: Integer -> Bool
isPalindrome num = reverse result == result
                   where 
                     result = show $ num

getSmallestProduct :: Integer -> Integer -> Integer -> Integer -> Integer
getSmallestProduct minFactor maxFactor x y
  | isPalindrome $ x * y                  = x * y
  | (x /= maxFactor && y == maxFactor) = if isPalindromeProduct (x+1) minFactor then (x+1) * minFactor else getSmallestProduct minFactor maxFactor (x+1) minFactor
  | otherwise                          = if isPalindromeProduct x (y+1) then x * (y+1) else getSmallestProduct minFactor maxFactor x (y+1)

getLargestProduct :: Integer -> Integer -> Integer -> Integer -> Integer -> Integer
getLargestProduct minFactor maxFactor x y currentLargestProduct
  | y == minFactor && x == minFactor = currentLargestProduct
  | x == y                           = if isPalindromeProd then getLargestProduct (y+1) maxFactor (x-1) maxFactor currentLargestProd else getLargestProduct minFactor maxFactor x (y-1) currentLargestProd
  | y == minFactor && x /= minFactor = if isPalindromeProd then getLargestProduct (y+1) maxFactor (x-1) maxFactor currentLargestProd else getLargestProduct minFactor maxFactor (x-1) maxFactor currentLargestProd
  | otherwise                        = if isPalindromeProd then getLargestProduct (y+1) maxFactor (x-1) maxFactor currentLargestProd else getLargestProduct minFactor maxFactor x (y-1) currentLargestProd
  where 
    isPalindromeProd = isPalindromeProduct x y
    currentLargestProd = case isPalindromeProd of True -> if (x*y) >= currentLargestProduct then (x*y) else currentLargestProduct
                                                  False -> currentLargestProduct
getSmallestProductPairs :: Integer -> Integer -> Integer -> Integer -> Integer -> [(Integer,(Integer,Integer))]
getSmallestProductPairs minFactor maxFactor x y palindromeProduct
  | y == minFactor && x == minFactor = if isPalindromeProdMatch then [(x*y,(x,y))] else getSmallestProductPairs minFactor maxFactor x (y+1) palindromeProduct
  | y == maxFactor && x == maxFactor = if isPalindromeProdMatch then [(x*y,(x,y))] else []
  | x == y                           = if isPalindromeProdMatch then [(x*y,(x,y))] else getSmallestProductPairs minFactor maxFactor x (y+1) palindromeProduct
  | y == maxFactor                   = case isPalindromeProdMatch of True -> if isNextProductBelowGreater then [(x*y,(x,y))] else [(x*y,(x,y))] ++ getSmallestProductPairs minFactor maxFactor (x+1) (x+1) palindromeProduct
                                                                     False -> getSmallestProductPairs minFactor maxFactor (x+1) (x+1) palindromeProduct
  | otherwise                        = case isPalindromeProdMatch of True -> if isNextProductBelowGreater then [(x*y,(x,y))] else [(x*y,(x,y))] ++ getSmallestProductPairs minFactor maxFactor (x+1) (x+1) palindromeProduct
                                                                     False -> getSmallestProductPairs minFactor maxFactor x (y+1) palindromeProduct
  where
    isPalindromeProdMatch = (x * y) == palindromeProduct
    isNextProductBelowGreater = ((x+1) * (x+1)) > palindromeProduct

getLargestProductPairs :: Integer -> Integer -> Integer -> Integer -> Integer -> [(Integer,(Integer,Integer))]
getLargestProductPairs minFactor maxFactor x y palindromeProduct
  | y == maxFactor && x == maxFactor = if isPalindromeProdMatch then [(x*y,(x,y))] else getLargestProductPairs minFactor maxFactor (x-1) y palindromeProduct
  | y == minFactor && x == minFactor = if isPalindromeProdMatch then [(x*y,(x,y))] else []
  | x == y                           = case isPalindromeProdMatch of True -> if isNextProductAboveLesser then [(x*y,(x,y))] else [(x*y,(x,y))] ++ getLargestProductPairs minFactor maxFactor (x-1) maxFactor palindromeProduct
                                                                     False -> if isNextProductAboveLesser then [] else getLargestProductPairs minFactor maxFactor (x-1) maxFactor palindromeProduct
  | otherwise                        = case isPalindromeProdMatch of True -> if isNextProductAboveLesser then [(x*y,(x,y))] else [(x*y,(x,y))] ++ getLargestProductPairs minFactor maxFactor (x-1) maxFactor palindromeProduct
                                                                     False -> getLargestProductPairs minFactor maxFactor x (y-1) palindromeProduct
  where
    isPalindromeProdMatch = (x * y) == palindromeProduct
    isNextProductAboveLesser = ((x-1)*maxFactor) < palindromeProduct

                                                  
