import Data.ByteString.Base64.Lazy as B64
import Data.ByteString.Conversion

main = do
    let msg = toByteString (419348023843884818123846754324567890876543245678908765432456789765432456782 :: Integer)
    print $ msg
    let b64 = B64.encode msg
    let db64 = B64.decode b64
    print $ b64
    print $ db64


