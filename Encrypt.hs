--To compile this file: `ghc -o enc Encrypt.hs`
import Primes
import ModularOperations

import System.Environment
import Data.ByteString.Base64
import Data.ByteString.Conversion
import Data.ByteString.Internal
main :: IO()
main = do (message:exponent:modulus64:_) <- getArgs
          let modulusBS = toByteString (modulus64 :: String)
          print $ modulusBS
          let modulus = case decode modulusBS of
                          Left err -> err
                          Right msg -> fromByteString msg
          print $ modulus
{-
          --let message = 
          --let temp = case decode (toByteString (messageB64 :: String)) of
          --             Left err -> err 
          --             Right msg -> msg
          --print $ message
          let m = rInteger $ message
          let e = 65537
          let n = rInteger $ modulus -- Public Key

          let cipherText = encrypt m e n

          print $ "-----BEGIN ENCRYPTED MESSAGE-----"
          print $ encode (toByteString (cipherText :: Integer))
          print $ "-----END ENCRYPTED MESSAGE-----"
-}
--Encrypt m (plaintext) given the public exponent e and modulus n
encrypt :: Integer -> Integer -> Integer -> Integer
encrypt m e n = (m^e) `mod` n

rInteger :: String -> Integer
rInteger = read
