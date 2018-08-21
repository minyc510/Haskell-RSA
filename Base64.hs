module Base64
( 
  toB64
) where

import Data.ByteString.Base64.Lazy as B64
import Data.ByteString.Conversion
import Data.ByteString.Internal

toB64 :: Integer -> String
toB64 n = (fromByteString (B64.encode (toByteString (n :: Integer))) :: String)

--toB64 n = fromByteString (B64.encode (toByteString (n :: Integer))) :: String

--main = do
--    let msg = toByteString (41934802354324567890876543245678908765432456789765432456782 :: Integer)
--    print $ msg
--    let b64 = B64.encode msg
--    let db64 = B64.decode b64
--    print $ b64
--    print $ db64



