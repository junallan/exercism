module IsbnVerifier (isbn) where

import Data.Char(isNumber, isLetter, digitToInt)
import Data.List(last)

isbn :: String -> Bool
isbn code = isValidElements code && (x1 * 10 + x2 * 9 + x3 * 8 + x4 * 7 + x5 * 6 + x6 * 5 + x7 * 4 + x8 * 3 + x9 * 2 + x10 * 1) `mod` 11 == 0
            where
              [x1, x2, x3, x4, x5, x6, x7, x8, x9, x10] = getElements code

isValidElements :: String -> Bool
isValidElements code =  (length filteredNumericCode == 9 && last code == 'X' && length filteredXCode == 1) || (length filteredNumericCode == 10 && null filteredXCode)
                        where
                          filteredXCode       = filter (== 'X') code
                          filteredNumericCode = filter isNumber code

getElements :: String -> [Int]
getElements code = [x1, x2, x3, x4, x5, x6, x7, x8, x9, x10]
                   where
                     x1                 = digitToInt $ head filteredCodeFirst9
                     x2                 = digitToInt $ filteredCodeFirst9 !! 1
                     x3                 = digitToInt $ filteredCodeFirst9 !! 2
                     x4                 = digitToInt $ filteredCodeFirst9 !! 3
                     x5                 = digitToInt $ filteredCodeFirst9 !! 4
                     x6                 = digitToInt $ filteredCodeFirst9 !! 5
                     x7                 = digitToInt $ filteredCodeFirst9 !! 6
                     x8                 = digitToInt $ filteredCodeFirst9 !! 7
                     x9                 = digitToInt $ filteredCodeFirst9 !! 8
                     filteredCodeFirst9 = take 9 (filter (/= '-') code)
                     x10                = if lastCode == 'X' then 10 else digitToInt lastCode
                     lastCode           = last code
                  