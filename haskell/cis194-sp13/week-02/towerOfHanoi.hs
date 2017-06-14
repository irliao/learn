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
