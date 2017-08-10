module Golf where

{- Exercise 1 -}
-- skips "ABCD" == ["ABCD", "BD", "C", "D"] -- "ABCD" is of type [Char]
-- skips "hello!" == ["hello!", "el!", "l!", "l", "o", "!"]
-- skips [1] ==  [[1]]
-- skips [True,False] == [[True,False], [False]]
-- skips [True,False,True] == [[True,False], [False]]
-- skips [a,b,c,d] == [[a,b,c,d], [b,d], [d]]
-- skips []           == []
-- TODO: ask brian and nikhil how to shorten this
skips :: [a] -> [[a]]
skips [] = []
skips xs = map f (zip [1..(length xs)] (replicate (length xs) xs)) 
  where f (y,z) = foldl (\acc x -> if mod (fst x) y == 0 then acc ++ [(snd x)] else acc) [] (zip [1..(length z)] z)

-- skips x = map f (zip [1..(length x)] (replicate (length x) x)) where f (y,z) = foldl (\a x -> if mod (fst x) y == 0 then a ++ [(snd x)] else a) [] (zip [1..(length z)] z), l = length
--   -- where f (y,z) = foldl (\[M D/a x -> if mod (fst x) y == 0 then a ++ [(snd x)] else a) [] (zip [1..(length z)] z)

-- localMaxima :: [Integer] -> [Integer]
-- localMaxima [] = []
-- localMaxima xs = 

-- Notes
-- foldr
-- let f acc b = (acc + b) in foldl f 0 [1,2,3,4,5] 
-- let f = (+) in foldl f 0 [1,2,3,4,5]
-- foldl (+) 0 [1,2,3,4,5]
--
-- foldl (\acc x -> acc ++ [x]) [] [1,2,3,4,5] == [1,2,3,4,5]
-- foldl (\acc x -> if x > 2 then acc ++ [x] else acc) [] [1,2,3,4,5] == [3,4,5]
-- foldl (\acc x -> if mod (fst x) 2 == 0 then acc ++ (snd x) else acc) "" [(1,"A"), (2,"B"), (3,"C"), (4,"D")] == "BD"

