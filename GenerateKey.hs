--To compile this file: `ghc -o gen GenerateKey.hs`
import System.Random 
import ModularOperations 
import Primes             
import System.Environment

main :: IO()
main = do x <- getArgs
          --Parse Input
          let keySize = rInteger $ head x
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
          print $ "RSA KEY"
          print $ "* Private key consists of (d,n)"
          print $ "* Public key consists of (e,n)"
          print $ "------------------------------------------------------------"
          print $ "p: " ++ show p
          print $ "------------------------------------------------------------"
          print $ "q: " ++ show q
          print $ "------------------------------------------------------------"
          print $ "n: " ++ show n
          print $ "------------------------------------------------------------"
          print $ "e: " ++ show e
          print $ "------------------------------------------------------------"
          print $ "d: " ++ show d
          print $ "------------------------------------------------------------"
 
          --print $ isPrime seedP $ p
          --print $ isPrime seedQ $ q

rInteger :: String -> Integer
rInteger = read 
