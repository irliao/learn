module Golf where

{- Exercise 1 -}
-- skips "ABCD" == ["ABCD", "BD", "C", "D"] -- "ABCD" is of type [Char]
-- skips "hello!" == ["hello!", "el!", "l!", "l", "o", "!"]
-- skips [1] ==  [[1]]
-- skips [True,False] == [[True,False], [False]]
-- skips [True,False,True] == [[True,False], [False]]
-- skips [a,b,c,d] == [[a,b,c,d], [b,d], [d]]
-- skips []           == []
skips :: [a] -> [[a]]
skips [] = []
skips (x:[]) = [[x]]
skips (x:(y:zs)) = [ (x:y:zs), zip (x:y:zs) [1..] ]

 zip [1..(length a)] (replicate (length a) a)
