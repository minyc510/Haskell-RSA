--To compile this file: `ghc -o enc Encrypt.hs`
import System.Environment             -- Used for `getArgs`
import Base64Conversions as B64

main :: IO()
main = do (message:exponent:modulus:_) <- getArgs
          --Parse Inputs
          let m = read message
          let e = 65537                     -- Fermat Number F_4: 2^(2n) + 1
          let n = B64.toInt modulus

          let cipherText = encrypt m e n

          putStrLn $ ""
          putStrLn $ "-----BEGIN ENCRYPTED MESSAGE-----"
          putStrLn $ B64.fromInt cipherText -- Converts FROM an INT to Base64
          putStrLn $ "-----END ENCRYPTED MESSAGE-----"
          putStrLn $ ""

--Encrypt m (plaintext) given the public exponent e and modulus n
encrypt :: Integer -> Integer -> Integer -> Integer
encrypt m e n = (m^e) `mod` n
