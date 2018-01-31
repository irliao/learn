-- greetIfCool2.hs
module GreetIfCool2 where

-- rewritten version of GreetIfCool1
greetIfCool :: String -> IO ()
greetIfCool coolness = 
  if cool coolness then 
    putStrLn "eyyyyy. What's shakin'?"
  else
    putStrLn "pshhhh."
  where cool v =  -- cool is rewrote as a function rather than a value like in GreetIfCool1
          v == "downright frosty yo"
  
