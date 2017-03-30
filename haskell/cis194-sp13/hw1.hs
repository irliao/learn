{- HW 01 -}

{- Exercise 1 --}

toDigits :: Integer -> [Integer]
toDigits n
  | n <= 0 = []
  | n < 10 = n:[]
  | n < 100 = (n `div` 10):(toDigits (n `mod` 10))
  | n < 1000 = (n `div` 100):(toDigits (n `mod` 100))
  | n < 10000 = (n `div` 1000):(toDigits (n `mod` 1000))

toDigitsRev :: Integer -> [Integer]
toDigitsRev n
  | n <= 0 = []
  | n < 10 = n:[]
  | n < 100 = (n `div` 10) ++ (toDigits (n `mod` 10))
  | n < 1000 = (n `div` 100) ++ (toDigits (n `mod` 100))
  | n < 10000 = (n `div` 1000) ++ (toDigits (n `mod` 1000))

  -- | n <= 0 = []
  -- | n < 10 = n:[] 
  -- | n < 100 = (n `mod` 10):(toDigitsRev (n `div` 10))
  -- | n < 1000 = (n `mod` 100):(toDigitsRev (n `div` 100)) -- wrong
  -- | n < 10000 = (n `mod` 1000):(toDigitsRev (n `div` 1000))

