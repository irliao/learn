module Exercise where

-- Exercise: Scope

-- exercise 1
-- let x = 5
-- let y = 7
-- let z = x * y
-- y is in scope of z

-- exercise 2
-- let f = 3
-- let g = 6 * f + h
-- h is NOT in scope of g

-- exercise 3
-- area d = pi * (r * r)
-- r = d / 2
-- we do NOT have everything needed to execute area in scope

-- exercise 4
area d = pi * (r * r)
  where r = d / 2
-- r and d are in scope for area

-- Exercise: Synatax Error

-- 1. ++ [1,2,3] [4,5,6]
-- do NOT compile because ++ must be used with parens since its infix operator

-- 2. '<3' ++ ' Haskell'
-- do NOT compile because '' is not [Char]

-- 3. concat ["<3", " Haskell"]
-- do compile because types match

-- Exercise: Reading syntax

-- exercise 1 -- check syntax for below
-- a) concat [[1, 2, 3], [4, 5, 6]] -- good
-- b) ++ [1, 2, 3] [4, 5, 6] -- bad, missing () around ++
-- c) (++) "hello" " world" -- good
-- d) ["hello" ++ " world] -- good, becomes list of string
-- e) 4 !! "hello" -- bad, wrong order
-- f) (!!) "hello" 4  -- good, works like (++)
-- g) take "4 lovely" -- bad, 4 is in ""
-- h) take 3 "awesome" -- good

-- exercise 2 -- check output
-- a) concat [[1 * 6], [2 * 6], [3 * 6]] -- [6, 12, 18]
-- b) "rain" ++ drop 2 "elbow" -- "rainbow"
-- c) 10 * head [1, 2, 3] -- 10
-- d) (take 3 "Julie") ++ (tail "yes") -- "Jules"
-- e) concat [tail [1, 2, 3], tail [4, 5, 6], tail [7, 8, 9]] -- [2,3,4,5,8,9]

-- Exercise: Building functions

-- 1a) "Curry is awesome" -> "Curry is awesome!"
addExclamation :: String -> String
addExclamation x = x ++ "!"

-- 1b) "Curry is awesome!" -> "y"
getYBad :: String -> Char
getYBad x = x !! 4 -- bad because !! is unsafe operation

getYBetter :: String -> Char
getYBetter x = head (drop 4 x) -- not good because still can cause exception

-- 1c) "Curry is awesome!" -> "awesome!"
getAwesomeBad :: String -> String
getAwesomeBad x = drop 9 x -- good because does not cause exception

-- 2) same as 1a,1b,1c

-- 3) "Curry is awesome!" -> 'r'
thirdLetter :: String -> Char
thirdLetter x = x !! 2

-- 4) 4 -> "Curry is awesome!" -> 'r'
letterIndex :: Int -> Char
letterIndex x =  "Curry is awesome!" !! (x - 1)

-- 5) "Curry is awesome" -> "awesome is Curry"
rvrs :: String -> String
rvrs x = drop 9 x ++ " " ++ (take 2 (drop 6 x)) ++ " " ++ take 5 x
