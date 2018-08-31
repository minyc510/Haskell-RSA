--To compile this file: `ghc -o gen GenerateKey.hs`
import System.Environment                     -- getArgs
import System.Random                          -- newStdGen
import Primes                                     
import ModularOperations 
import Base64Conversions as B64

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
          putStrLn $ ""
          putStrLn $ "-----BEGIN RSA PUBLIC KEY-----"
          putStrLn $ B64.fromInt n
          putStrLn $ "-----END RSA PUBLIC KEY-----"
          putStrLn $ ""
          putStrLn $ ""
          putStrLn $ ""
          putStrLn $ "-----BEGIN RSA PRIVATE KEY-----"
          putStrLn $ B64.fromInt d
          putStrLn $ "-----END RSA PRIVATE KEY-----"

