 {-# OPTIONS_GHC -Wall #-}
 module LogAnalysis where -- declares file as module

import Log -- imports module from Log.hs
import Data.List.Split (splitOn)

{-
   error levels:
    1 - tiny error
    100 - epic error

   examples:
    I 147 mice in the air, I’m afraid, but you might catch a bat, and
    E 2 148 #56k istereadeat lo d200ff] BOOTMEM
-}

{- Exercise 1 -}
-- Test cases: 
-- parseMessage "E 2 562 help help" == LogMessage (Error 2) 562 "help help"
-- parseMessage "I 29 la la la" == LogMessage Info 29 "la la la"
-- parseMessage "This is not in the right format" == Unknown "This is not in the right format"

parseMessage :: String -> [String]
parseMessage x = splitOn " " x

