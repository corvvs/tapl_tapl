import System.Environment (getArgs)


printList :: [String] -> IO()
printList xs = do
    putStr (unwords xs)

main :: IO()
main = do
    args <- getArgs
    case args of
        "-n":rest -> printList rest
        _         -> printList args >> putStr "\n"
