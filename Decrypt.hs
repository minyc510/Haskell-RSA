--To compile this file: `ghc -o dec Decrypt.hs`
import System.Random 
import ModularOperations 
import Primes             
import System.Environment

main :: IO()
main = do (cipher:privateKey:modulus:_) <- getArgs
          --Parse Input
          let c = read cipher
          let d = read privateKey
          let n = read modulus

          print $ "DECRYPTED MESSAGE:"
          print $ decrypt c d n
          
--Decrypt c (ciphertext) given the private exponent d and modulus n 
decrypt :: Integer -> Integer -> Integer -> Integer
decrypt c d n = modExp c d n

--rInteger :: String -> Integer
--rInteger = read 
