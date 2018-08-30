--To compile this file: `ghc -o enc Encrypt.hs`
import System.Environment
import Primes
import ModularOperations
import Data.ByteString.Base64
import Data.ByteString.Conversion
import Data.ByteString.Internal

main :: IO()
main = do (message:exponent:modulus:_) <- getArgs
          let m = read message
          let e = 65537
          let n = read modulus -- Public Key

          let cipherText = encrypt m e n

          print $ "-----BEGIN ENCRYPTED MESSAGE-----"
          --print $ encode (toByteString (cipherText :: Integer))
          print $ cipherText
          print $ "-----END ENCRYPTED MESSAGE-----"


--Encrypt m (plaintext) given the public exponent e and modulus n
encrypt :: Integer -> Integer -> Integer -> Integer
encrypt m e n = (m^e) `mod` n

--rInteger :: String -> Integer
--rInteger = read
