--To compile this file: `ghc -o enc Encrypt.hs`
import System.Environment
import ModularOperations
import Data.ByteString.Base64
import Data.ByteString.Char8        --pack :: String -> ByteString

main :: IO()
main = do (message:exponent:modulus:_) <- getArgs
          --Parse Inputs
          let m = read message
          let e = 65537
          let n = b64ToInteger modulus

          let cipherText = encrypt m e n

          print $ "-----BEGIN ENCRYPTED MESSAGE-----"
          print $ integerToB64 cipherText
          print $ "-----END ENCRYPTED MESSAGE-----"

--Encrypt m (plaintext) given the public exponent e and modulus n
encrypt :: Integer -> Integer -> Integer -> Integer
encrypt m e n = (m^e) `mod` n

--Given a base64 encoded integer which is given as a string, convert it back to a Integer
b64ToInteger :: String -> Integer
b64ToInteger n = (read (unpack (decodeLenient (pack n)))) :: Integer

--Encode an Integer in Base64 as a string
integerToB64 :: Integer -> String
integerToB64 n = unpack (encode (pack (show n)))
