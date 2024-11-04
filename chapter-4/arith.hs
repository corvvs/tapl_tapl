data Info = Info
newtype TmTrue = TmTrue Info
newtype TmFalse = TmFalse Info
data TmIf = TmIf Info Term Term Term
newtype TmZero = TmZero Info
data TmSucc = TmSucc Info Term
data TmPred = TmPred Info Term
data TmIsZero = TmIsZero Info Term

data Term = TmTmTrue TmTrue
            | TmTmFalse TmFalse
            | TmTmIf TmIf
            | TmTmZero TmZero
            | TmTmSucc TmSucc
            | TmTmPred TmPred
            | TmTmIsZero TmIsZero

infoVal :: Info
infoVal = Info

isNumericVal :: Term -> Bool
isNumericVal (TmTmZero _) = True
isNumericVal (TmTmSucc (TmSucc _ t)) = isNumericVal t
isNumericVal _ = False

isVal :: Term -> Bool
isVal (TmTmTrue _) = True
isVal (TmTmFalse _) = True
isVal t
    | isNumericVal t = True
    | otherwise = False


main :: IO ()
main =  putStrLn "Ice" >>
        print 3.14 >>
        print [1, 2, 3]



