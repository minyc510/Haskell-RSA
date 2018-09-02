--To compile this file: `ghc -o dec Decrypt.hs`
import System.Environment
import ModularOperations 
import Base64Conversions as B64
            
main :: IO()
main = do (cipher:privateKey:modulus:_) <- getArgs
          --Parse Input
          let c = B64.toInt cipher
          let d = B64.toInt privateKey
          let n = B64.toInt modulus
          
          putStrLn $ ""
          putStrLn $ "-----BEGIN DECRYPTED MESSAGE-----"
          putStrLn $ show (decrypt c d n)
          putStrLn $ "-----END DECRYPTED MESSAGE-----"
          putStrLn $ ""

--Decrypt c (ciphertext) given the private exponent d and modulus n 
decrypt :: Integer -> Integer -> Integer -> Integer
decrypt c d n = modExp c d n
