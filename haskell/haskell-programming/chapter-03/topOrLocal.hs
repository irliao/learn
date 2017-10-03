module TopOrLocal where

topLevelFunction :: Integer -> Integer
topLevelFunction x = x + woot + topLevelValue
  -- where and let introduces local bindings or declarations
  -- woot has it's type explicitly declared with :: syntax, which isn't necessary as Haskell's type inference would've figured it out
  where woot :: Integer -- woot is invisible oytside of topLevelFunction
        woot = 10

topLevelValue :: Integer
topLevelValue = 5

