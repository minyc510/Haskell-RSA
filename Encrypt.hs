--To compile this file: `ghc -o enc Encrypt.hs`
import Primes
import ModularOperations

import System.Environment
import Data.ByteString.Base64.Lazy as B64

main :: IO()
main = do (message:exponent:modulus:_) <- getArgs
          --Parse Input
          --let mInt = 
          let m = rInteger $ message
          let e = 65537
          let n = rInteger $ modulus -- Public Key

          let cipherText = encrypt m e n

          print $ "-----BEGIN ENCRYPTED MESSAGE-----"
          print $ cipherText
          print $ "-----END ENCRYPTED MESSAGE-----"

--Encrypt m (plaintext) given the public exponent e and modulus n
encrypt :: Integer -> Integer -> Integer -> Integer
encrypt m e n = (m^e) `mod` n

rInteger :: String -> Integer
rInteger = read
