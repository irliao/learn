{- HW4 -}

{-
  Exercise 1: Wholemeal programming
  Reimplement each of the following functions in a more idiomatic Haskell style. 
  Use wholemeal programming practices, breaking each function into a pipeline of incremental transformations to an entire data structure.
  Name your functions fun1’ and fun2’ respectively.

  Hint: For this problem you may wish to use the functions iterate and takeWhile.
  Look them up in the Prelude documentation to see what they do.
-}

-- fun1 [1,2,3,4] == (0 * 2) == 0
-- fun1 [3,4,5,6] == (2 * 4) == 8
fun1 :: [Integer] -> Integer
fun1 [] = 1
fun1 (x:xs)
  | even x = (x - 2) * fun1 xs
  | otherwise = fun1 xs

fun2 :: Integer -> Integer
fun2 1 = 0
fun2 n | even n = n + fun2 (n `div` 2)
  | otherwise = fun2 (3 * n + 1)

fun1' :: [Integer] -> Integer
fun1' [] = 1
fun1' (x:xs) = take 10 (iterate (\x -> (x+3)*2) 1)

fun2' :: Integer -> Integer
fun2' 1 = 0
