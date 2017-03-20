module Base (rebase) where

rebase :: Integral a => a -> a -> [a] -> Maybe [a]
rebase inputBase outputBase inputDigits = 
  let isContainNegativeDigit   = length (filter (<0) inputDigits) > 0
      isIncorrectPositiveDigit = length (filter (>=inputBase) inputDigits) > 0
      isInvalidBase            = inputBase <= 1 || outputBase <=1
  in
    if isInvalidBase || isContainNegativeDigit || isIncorrectPositiveDigit then Nothing else Just (baseConversion outputBase (base10Value inputBase inputDigits))
   
baseConversion :: Integral a => a-> a -> [a]
baseConversion inputBase 0        = []
baseConversion inputBase dividend = (baseConversion inputBase (dividend `div` inputBase))  ++ [dividend `mod` inputBase]

base10Value :: Integral a => a -> [a] -> a
base10Value base []     = 0
base10Value base values = base ^ (length values - 1) * head values + base10Value base (tail values)
