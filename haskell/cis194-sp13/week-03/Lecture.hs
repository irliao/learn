{- Lecture 03 -}

-- list of int values
data IntList = Empty | Cons Int IntList
  deriving Show

-- ensure every element in list is non negative using absolute value
absAll :: IntList -> IntList
absAll Empty       = Empty
absAll (Cons x xs) = Cons (abs x) (absAll xs)

-- square every element
squareAll :: IntList -> IntList
squareAll Empty       = Empty
squareAll (Cons x xs) = Cons (x*x) (squareAll xs)

-- abstraction by using mapIntList to implement addOneToAll, absAll, and squareAll:
-- passing functions as inputs to other functions
exampleList = Cons (-1) (Cons 2 (Cons (-6) Empty))

addOne x = x + 1
square x = x * x

mapIntList addOne exampleList
mapIntList abs    exampleList
mapIntList square exampleList
