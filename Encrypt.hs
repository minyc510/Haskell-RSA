--To compile this file: `ghc -o enc Encrypt.hs`
import System.Environment
import ModularOperations
import Base64Conversions as B64

main :: IO()
main = do (message:exponent:modulus:_) <- getArgs
          --Parse Inputs
          let m = read message
          let e = 65537
          let n = B64.toInt modulus

          let cipherText = encrypt m e n

          print $ "-----BEGIN ENCRYPTED MESSAGE-----"
          print $ B64.fromInt cipherText
          print $ "-----END ENCRYPTED MESSAGE-----"

--Encrypt m (plaintext) given the public exponent e and modulus n
encrypt :: Integer -> Integer -> Integer -> Integer
encrypt m e n = (m^e) `mod` n
