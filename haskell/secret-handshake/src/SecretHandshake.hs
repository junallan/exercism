
{-# LANGUAGE FlexibleInstances #-}

module SecretHandshake (handshake) where

import Data.Char (digitToInt)
import Data.Bits ((.&.))
import Text.Read (readMaybe)


class Secret a where
  handshake :: a -> [String] 

instance Secret Int where
  handshake(x) = 
    if x .&. 16 == 0 then      
      secretCodes      
    else
      reverse secretCodes
    where secretCodes = filter (not . null) $ zipWith codeLookup (repeat x) [1,2,4,8]

instance Secret String where
  handshake(x) = if ((readMaybe x :: Maybe Int) == Nothing) then [] else handshake $ fromBinary x
 
codeLookup :: Int -> Int -> String
codeLookup val cde =
  case cde of
    1         -> if hasCode then "wink" else ""
    2         -> if hasCode then "double blink" else ""
    4         -> if hasCode then "close your eyes" else ""
    8         -> if hasCode then "jump" else ""
  where hasCode = val .&. cde /= 0

-- found implementation from: http://stackoverflow.com/questions/5921573/convert-a-string-representing-a-binary-number-to-a-base-10-string-haskell
fromBinary :: String -> Int
fromBinary str = sum $ zipWith toDec (reverse str) [0 .. length str]
  where toDec a b = digitToInt a * (2 ^ b)
