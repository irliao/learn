-- print3broken.hs
module Print3Broken where

-- should break since greeting is not visible nor in scope to printSecond, only visible to main
-- printSecond :: IO ()
-- printSecond = do
--   putStrLn greeting 

-- should NOT break since greeting is now in visible/in scope to printSecond
printSecond :: IO ()
printSecond = do
  putStrLn greeting
    where greeting = "Yarrrrr"

main :: IO ()
main = do
  putStrLn greeting
  printSecond
    where greeting = "Yarrrrr"
