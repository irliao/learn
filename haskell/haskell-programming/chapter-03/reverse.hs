module Reverse where

rvrs :: String -> String
rvrs x = drop 9 x ++ " " ++ (take 2 (drop 6 x)) ++ " " ++ take 5 x

main :: IO ()
-- inside print so rvrs is applied and evaluated first, then the result is printed
-- main = print (rvrs "Curry is awesome") -- using parenthesis
main = print $ rvrs "Curry is awesome" -- using $ instead of parenthesis
