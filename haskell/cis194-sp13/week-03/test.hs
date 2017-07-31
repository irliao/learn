-- doStuff1 :: [Int] -> Int
-- doStuff1 []  = 0
-- doStuff1 [_] = 0
-- doStuff1 xs  = head xs + (head (tail xs)) 

-- doStuff2 :: [Int] -> Int
-- doStuff2 []        = 0
-- doStuff2 [_]       = 0
-- doStuff2 (x1:x2:_) = x1 + x2

foldl f [] [1,2,3,4,5] 
  where f a b = a ++ b
