module Exercise where

-- Tuple Examples
fst' :: (a, b) -> a
fst' (a, b) = a

snd' :: (a, b) -> b
snd' (a, b) = b

topFunc :: (Int, [a]) -> (Int, [a]) -> (Int, [a])
topFunc (a, b) (c, d) = ((a + c), (b ++ d))

-- Exercise: Mood Swing
data Mood = Blah | Woot deriving Show
-- 1) type constructor is Mood, name of this type is Mood
-- 2) values I can use are: Blah or Woot
-- 3) 'changeMood :: Mood -> Woot' is wrong because Woot is a data, not a type
-- 4)
changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _ = Blah
-- 5) enter above in a source file (done here)

-- Exercise: Find the Mistakes
-- 1. not True && true -- true should be True
-- 2. not (x == 6) -- x not in scope
-- 3. (1 * 2) > 5 -- no mistake
-- 4. [Merry] > [Happy] -- missing double quotes around Merry and Happy, treated as Data constructor not in scope
-- 5. [1,2,3] ++ "look at me!" -- cannot combine list of Integer with list of String

-- Chapter Exercise
awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]
-- 1. length function's type signature should be Foldable t => t a -> Int (Foldable t => t a is same as [a])
-- 2a. length [1,2,3,4,5] => 5
-- 2b. length [(1,2), (2,3), (3,4)] => 3
-- 2c. length allAwesome => 3
-- 2d. length (concat allAwesome) => 5
-- 3. 6 / length [1,2,3] will error because length returns Int type, but division requires Num type
-- 4. fix above with different division function/operator
exercise4Fix = div 6 (length [1,2,3]) -- div takes both ints, but rounds the result (ex. div 4 3 => 1)
-- 5. expression 2 + 3 == 5 should be Bool type, True as value
-- 6. let x = 5 => Num type, value 5
--    x  + 3 == 5 => Bool type, value False
-- 7. length allAwesome == 2 -- True
--    length [1, 'a', 3, 'b'] -- error because list elements not same type
--    length allAwesome + length awesome -- 3 + 2 => 5
--    (8 == 8) && ('b' < 'a') -- True && False => False
--    (8 == 8) && 9 -- error because 9 is Num type, && requres Bool and Bool
-- 8. write function to check for palindrome
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == (reverse x)
-- 9. write function to return absolute value of a nunber using if-then-else
myAbs :: Integer -> Integer
myAbs x = if x < 0 then x * (-1) else x
-- 10. using fst and snd, fill in definition
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f (a, b) (c, d) = ((b, d), (a, c))

-- Correcting syntax
-- 1. adds 1 to the length of a string arg
add1 xs = w + 1
  where w = length xs
-- 2. write identity function, id
id' x = x
-- 3. function to return 1 from value (1, 2)
getFst (a, b) = a

-- Match the function names to their types
-- 1. type of show is: Show a => a -> String
-- 2. type of (==) is: Eq a => a -> a -> Bool
-- 3. type of fst is: (a, b) -> a
-- 4. type of (+) is: Num a => a -> a -> a

-- 4.10 Definitions
type Name = String -- type alias
data Pet = Cat | Dog Name deriving Show
-- :t Cat => Pet
-- :t Dog => Name -> Pet
