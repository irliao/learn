{- HW 01 -}

{- Exercise 1 --}

{- ':' operator inserts element as the HEAD of the list
    x:[a,b,c] == [x,a,b,c] 

    input: 1234
    1:toDigits 234
    2:toDigits 23
    3:toDigits 4
    4:[] => BASE CASE
    [4]
    3:[4] => [3,4]
    2:[3,4] => [2,3,4]
    1:[2,3,4] => [1,2,3,4]
-}
toDigits :: Integer -> [Integer]
toDigits n
  | n <= 0 = []
  | n < 10 = n:[]
  | n < 100 = (n `div` 10):(toDigits (n `mod` 10))
  | n < 1000 = (n `div` 100):(toDigits (n `mod` 100))
  | n < 10000 = (n `div` 1000):(toDigits (n `mod` 1000))

{- '++' operator joins two lists
    [x,y,z] ++ [a,b,c] == [x,y,z,a,b,c]

    input: 1234
-}
toDigitsRev :: Integer -> [Integer]
toDigitsRev n
  | n <= 0 = []
  | n < 10 = n:[]
  | n < 100 = (toDigitsRev (n `mod` 10))++ [(n `div` 10)]
  | n < 1000 =(toDigitsRev (n `mod` 100)) ++  [(n `div` 100)]
  | n < 10000 =(toDigitsRev (n `mod` 1000)) ++ [(n `div` 1000)]

