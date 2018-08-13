--To compile this file: `ghc -o enc Encrypt.hs`
import System.Random 
import ModularOperations 
import Primes             
import System.Environment

main :: IO()
main = do (message:exponent:modulus:_) <- getArgs
          --Parse Input
          let m = rInteger $ message
          let e = rInteger $ exponent
          let n = rInteger $ modulus

          print $ encrypt m e n
          
--Encrypt m (plaintext) given the public exponent e and modulus n
encrypt :: Integer -> Integer -> Integer -> Integer
encrypt m e n = (m^e) `mod` n

rInteger :: String -> Integer
rInteger = read 

