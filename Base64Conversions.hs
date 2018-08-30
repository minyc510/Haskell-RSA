--This module is used to convert strings which contain base 64 encoded integers back to a Integer type, as vise-versa

module Base64Conversions
( 
  toInt
, fromInt
) where

import Data.ByteString.Base64       -- For `encode` and `decodeLenient`
import Data.ByteString.Char8        -- For `pack` and `unpack`, used to convert between Strings and ByteStrings

--Given a base64 encoded integer which is given as a string, convert it back to a Integer
toInt :: String -> Integer
toInt n = (read (unpack (decodeLenient (pack n)))) :: Integer

--Encode an Integer in Base64 as a string
fromInt :: Integer -> String
fromInt n = unpack (encode (pack (show n)))
