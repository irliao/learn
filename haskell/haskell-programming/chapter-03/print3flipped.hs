-- printed3flipped.hs
module Print3Flipped where

myGreeting :: String
myGreeting = (++) "hello" " world"

hello :: String
hello = "hello"

world :: String
world = "world!"

-- where causes secondGreeting to only be visible in main to prevent importing from another module
main :: IO ()
main = do
  putStrLn myGreeting
  putStrLn secondGreeting
    -- could've been: secondGreeting = hello ++ " " ++ world
    where secondGreeting = (++) hello ((++) " " world)
