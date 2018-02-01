# Chapter 04

=> in type signature means that an expression evaluates/reduces to another expression or value
ex. (==) :: Eq a => a -> a -> Bool
    first 'a' indicates the *single* type of value that Eq takes in (ex. '1' == '1' has type Char, '1' == 1 violates that rule since it has more than 1 type)
    second 'a' indicates the first parameter (must conform to type specified by the first 'a')
    third 'a' indicates the second parameter (must conform to type specified by the first 'a')

data Bool = False | True
data (type constructor) = (data constructor) | (data constructor)

deriving Show -- when making own datatypes, allows values of that type to be printed to the screen

$ :i - takes type constructor and prints the data constructors (ex. ':i Bool' prints 'False | True')
$ :t - takes function and prints the type signatures (references to the type constructors) (ex. ':t not' prints 'Bool -> Bool')
     - also takes value, which prints the type of the value (ex. ':t True' prints 'Bool')

type classes are like abstract classes (???? need to confirm this) in Java since they add reusable functionality to all types that have instances of that typeclass
ex. Integer and Double types have instance of Num typeclass, allowing (+) (-), and (*) operators

## Types
type constructor are NOT values and can only be used in type signatures
data declaration generates new type constructors (but may or may not create new data constructor)

## Integral
Int (cannot be arbitrarily large/small) and Integer (can be arbitrarily large/small) are different
most cases should use Integer

## Fractional
arbitrary precision means doing calcs with high degree of precision
never use Float unless doing graphics programming (ex. OpenGL)
Fractional operation default to Double (most cases do not want to explicitly use Double)
floating point arithmetic are hard, so generally use arbitrary-precision types

## Comparison/Equality operators
/= is same as != in other languages
must have Ord instance to do comparison (<, >)
must have Eq instance to do equality check (==, /=)
both sides of the operator must have types match, otherwise exception

## If/Else
only have if-expression (should return value), no if statement
return value of if and else must be same type

## Tuple
type constructs used in signatures are same as your values (note a,b are not capitalized like how types are)
ex. fst' :: (a, b) -> a
    fst' (a,b) = a
generally do not use tuple of more than 5 arity

## Polymorphism
parametric - works for all types (ex. id)
constrained - works for set of types (ex. isEqual, which requires instance of Eq typeclass)
