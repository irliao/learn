{- HW 01 -}

{- Exercise 1 --}
toDigits :: Integer -> [Integer]
toDigits n
  | n < 0 = []
  | n < 10 = [n]
  | otherwise = (n `div` 10):(toDigits (n `mod` 10))

toDigitsRev :: Integer -> [Integer]
toDigitsRev n
  | n < 0 = []
  | n < 10 = [n]
  | otherwise = (toDigitsRev (n `mod` 10))++ (toDigitsRev (n `div` 10))

{- Exercise 2 --}
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = [] -- do nothing to empty list
doubleEveryOther (x:[]) = [x] -- do nothing to list with single element
doubleEveryOther (x:(y:zs)) = (x) : [(y*2)] ++ doubleEveryOther zs -- ex: [1,2,3,4,5] => (1:(2:[3,4,5]), so x is HEAD, y is HEAD + 1, zs is rest of list (if exists)

{- Exercise 3 --}
-- sumDigits [16,7,12,5] == 1 + 6 + 7 + 1 + 2 + 5 == 22 
sumDigitsHelper :: Integer -> Integer
sumDigitsHelper n
  | n < 10 = n
  | n < 100 = (n `div` 10) + (n `mod` 10)

sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:[]) = x
sumDigits (x:(y:zs)) = (sumDigitsHelper x) + (sumDigitsHelper y) + sumDigits zs

{- Exercise 4 --}
-- validate 4012888888881881 == True
-- validate 4012888888881882 == False
validate :: Integer -> Bool
validate n = ((sumDigits (doubleEveryOther (toDigitsRev n))) `mod` 10) == 0

{- Exercise 5 --}
-- hanoi 2 "a" "b" "c" == [("a","c"), ("a","b"), ("c","b")]
type Peg = String
type Move = (Peg, Peg)
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 a b c = [] -- BC
hanoi 1 a b c = [(a, b)] -- BC
hanoi n a b c = (a, c):(hanoi (n-1) a b c)++[(c, b)] -- RC

{- Exercise 6 -}
hanoi4 :: Integer -> Peg -> Peg -> Peg->Peg -> [Move]
hanoi4 0 a b c d = [] -- BC

{- Notes -}
{-  toDigits 
    ':' operator inserts element as the HEAD of the list
    x:[a,b,c] == [x,a,b,c] 

    input: 1234
    1:toDigits 234
    2:toDigits 23
    3:toDigits 4
    4:[] => BC
    [4]
    3:[4] => [3,4]
    2:[3,4] => [2,3,4]
    1:[2,3,4] => [1,2,3,4]
-}

{-  toDigitsRev 
    '++' operator joins two lists
    [x,y,z] ++ [a,b,c] == [x,y,z,a,b,c]

    input: 1234
-}

{- Examples -}
-- nested pattern matching
-- sumEveryTwo :: [Integer] -> [Integer]
-- sumEveryTwo []         = []     -- Do nothing to the empty list
-- sumEveryTwo (x:[])     = [x]    -- Do nothing to lists with a single element
-- sumEveryTwo (x:(y:zs)) = (x + y) : sumEveryTwo zs

