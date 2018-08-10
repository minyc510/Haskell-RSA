--To compile this file: `ghc -o output RSA.hs`
import System.Random 
import ModularOperations 
import Primes             

main :: IO()
main = do
    --Initialize Seeds
    seed <- newStdGen
    seedP <- newStdGen
    seedQ <- newStdGen

    --Generate/Calcuate: p,q,n,e,totient, and d
    let p = randomPrime seedP $ rInteger $ "1024"
    let q = randomPrime seedQ $ rInteger $ "1024"
    let n = p*q
    let e = 65537
    let totient = lcm (p-1) (q-1)
    let d = if modMulInv e totient > 0
            then modMulInv e totient
            else (modMulInv e totient) + totient

    print $ isPrime seed $ p
    print $ isPrime seed $ q

    print $ "p: " ++ show p
    print $ "q: " ++ show q
    print $ "n: " ++ show n
    print $ "d: " ++ show d

    --User Input
    print $ "Input message:"
    input <- getLine
    let pT = read input
    print $ "plain text: " ++ show pT

    --Encrypt, Decrypt
    let cT = encrypt pT e n
    let rT = decrypt cT d n    
    print $ "cipher text: " ++ show cT
    print $ "recovered text: " ++ show rT     

    
rInteger :: String -> Integer
rInteger = read 

--Encrypt m (plaintext) given the public exponent e and modulus n
encrypt :: Integer -> Integer -> Integer -> Integer
encrypt m e n = (m^e) `mod` n

--Decrypt c (ciphertext) given the private exponent d and modulus n 
decrypt :: Integer -> Integer -> Integer -> Integer
decrypt c d n = modExp c d n



