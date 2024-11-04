import Data.ByteString qualified as BS (hGet, hPut, length)
import System.Environment
import System.IO

catFile :: Int -> Handle -> IO ()
catFile chunkSize h = do
  chunk <- BS.hGet h chunkSize
  let n = BS.length chunk
  if n == 0
    then return ()
    else do
      BS.hPut stdout chunk
      catFile chunkSize h

catFiles :: Int -> [String] -> IO ()
catFiles chunkSize =
  mapM_
    ( \file -> do
        case file of
          "-" -> catFile chunkSize stdin
          _ -> withFile file ReadMode (catFile chunkSize)
    )

main :: IO ()
main = getArgs >>= catFiles 1024
