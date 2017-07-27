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
-- skips (x:[]) = [[x]]
skips xs = map f (zip [1..(length xs)] (replicate (length xs) xs))
              -- where f y = [fst y]
              where f (y,z) = z


-- map f xs where f (a,b) = 

-- foldr
-- let f acc b = (acc + b) in foldl f 0 [1,2,3,4,5] 
-- let f = (+) in foldl f 0 [1,2,3,4,5]
-- foldl (+) 0 [1,2,3,4,5]
