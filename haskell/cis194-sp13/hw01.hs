{- HW 01 -}

{- Exercise 1 --}

toDigits :: Integer -> [Integer]
toDigits n <= 0 = []
toDigits n < 10 = n : []
toDigits n < 100 = (n `div` 10) : toDigits (n `mod` 10)
toDigits n < 1000 = (n `div` 100) : toDigits (n `mod` 100)
toDigits n < 10000 = (n `div` 1000) : toDigits (n `mod` 1000)

-- toDigitsRev :: Integer -> [Integer]


