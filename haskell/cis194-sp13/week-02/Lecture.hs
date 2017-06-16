{-- Week 02 Lecture --}

-- Declares a new type called Thing with five data constructors Shoe, Ship, etc
data Thing = Shoe 
           | Ship 
           | SealingWax 
           | Cabbage 
           | King
  deriving Show

shoe :: Thing
shoe = Shoe

listO'Things :: [Thing]
listO'Things = [Shoe, SealingWax, King, Cabbage, King]

isSmall :: Thing -> Bool
isSmall Shoe       = True
isSmall Ship       = False
isSmall SealingWax = True
isSmall Cabbage    = True
isSmall King       = False

isSmall2 :: Thing -> Bool
isSmall2 Ship = False
isSmall2 King = False
isSmall2 _    = True

{- Beyong enumerations -}
data FailableDouble = Failure
                    | OK Double
  deriving Show

ex01 = Failure
ex02 = OK 3.4

safeDiv :: Double -> Double -> FailableDouble
safeDiv _ 0 = Failure
safeDiv x y = OK (x / y)

failureToZero :: FailableDouble -> Double
failureToZero Failure = 0
failureToZero (OK d)  = d

-- Store a person's name, age, and favourite Thing.
data Person = Person String Int Thing
  deriving Show

brent :: Person
brent = Person "Brent" 31 SealingWax

stan :: Person
stan  = Person "Stan" 94 Cabbage

getAge :: Person -> Int
getAge (Person _ a _) = a

-- ex03 = case "Hello" of
--          []      -> 3  -- not matched since Hello is not empty
--         ('H':s) -> length s -- matched
--            _       -> 7 -- not matched since 2nd case is matched already


-- failureToZero' :: FailableDouble -> Double
-- failureToZero' x = case x of
--                      Failure -> 0
--                      OK d    -> d
