--Modular Exponentation source: https://gist.github.com/trevordixon/6788535
--Modular Multiplicative Inverse source: https://gist.github.com/lovasoa/0e52bcbc937f3d26224f303669ca2b0f

module ModularOperations
( 
  modExp
, modMulInv
) where

import Data.Bits 

--Returns X, where X = c^d mod n
modExp :: Integer -> Integer -> Integer -> Integer
modExp c 0 n = 1
modExp c d n = t * modExp ((c * c) `mod` n) (shiftR d 1) n `mod` n
                where t = if testBit d 0 then c `mod` n else 1

--Returns X, where X is the modular multiplicative inverse of a mod b
modMulInv :: Integer -> Integer -> Integer
modMulInv b a =
  let
    next a b = zipWith (-) a $ map (*(head $ zipWith div a b)) b
    l = [a,0] : [b,1] : zipWith next l (tail l)
  in
    head $ tail $ head $ filter ((==1).head) l

