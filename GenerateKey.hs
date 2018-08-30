--To compile this file: `ghc -o gen GenerateKey.hs`
import System.Environment                     -- getArgs
import System.Random                          -- newStdGen
import Primes                                     
import ModularOperations 
import Data.ByteString.Base64.Lazy as B64     -- Base 64
import Data.ByteString.Conversion             -- Base 64

main :: IO()
main = do x <- getArgs
          --Parse Input
          let keySize = read $ head x
          let primeSize = keySize `div` 2

          --Initialize Seeds
          seedP <- newStdGen
          seedQ <- newStdGen

          --Generate/Calcuate: p,q,n,e,totient, and d
          let p = randomPrime seedP $ primeSize
          let q = randomPrime seedQ $ primeSize
          let n = p*q
          let e = 65537
          let totient = lcm (p-1) (q-1)
          let d = if modMulInv e totient > 0
                  then modMulInv e totient
                  else (modMulInv e totient) + totient

          --Output
          print $ "-----BEGIN RSA PUBLIC KEY-----"
          print $ B64.encode (toByteString (n :: Integer))
          print $ "-----END RSA PUBLIC KEY-----"
          print $ ""
          print $ "-----BEGIN RSA PRIVATE KEY-----"
          print $ B64.encode (toByteString (d :: Integer))
          print $ "-----END RSA PRIVATE KEY-----"

--rInteger :: String -> Integer
--rInteger = read 
