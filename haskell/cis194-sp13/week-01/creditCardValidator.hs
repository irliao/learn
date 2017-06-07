{- HW 01 - Credit Card Validator -}

module HW1 where

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
  | otherwise = (toDigitsRev (n `mod` 10)) ++ (toDigitsRev (n `div` 10))

{- Exercise 2 --}
-- (x:y:[])) indicates there is 2 items in the array
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = [] -- do nothing to empty list
doubleEveryOther (x:[]) = [x] -- do nothing to list when there is only 1 item in the array
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

