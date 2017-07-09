 {-# OPTIONS_GHC -Wall #-}
 module LogAnalysis where -- declares file as module

import Log -- imports module from Log.hs
import Data.List.Split (splitOn)
import Data.List (intercalate)

{- Exercise 1 -}
-- Test cases: 
-- parseMessage "E 2 562 help help" == LogMessage (Error 2) 562 "help help"
-- parseMessage "I 29 la la la" == LogMessage Info 29 "la la la"
-- parseMessage "This is not in the right format" == Unknown "This is not in the right format"

-- TODO: ask if there is already an importable function or better way to do this
-- check if a String is convertable to an Int
isInteger s = case reads s :: [(Integer, String)] of
  [(_, "")] -> True
  _         -> False
 
generateErrorMessage :: [String] -> LogMessage
generateErrorMessage (a:b:cs)
  | (isInteger a) && (isInteger b) = LogMessage (Error (read a)) (read b) (intercalate " " cs)
  | otherwise = Unknown "This is not in the right format"

parseMessageList :: [String] -> LogMessage
parseMessageList (a:b:cs) 
  | not (isInteger b) = Unknown "This is not in the right format"
  | a == "W" = LogMessage Warning (read b) (intercalate " " cs)
  | a == "I" = LogMessage Info (read b) (intercalate " " cs)
  | a == "E" = generateErrorMessage (b:cs) -- TODO: ask if there is a way to handle cs without using separate function
  | otherwise = Unknown "This is not in the right format"
  -- | otherwise = Unknown (intercalate " " (a:b:cs))
parseMessageList _ = Unknown "This is not in the right format"

-- TODO: ask if using case would be more idiomatic here
-- parseMessageList (a:b:cs) = case a of
--                               "W" -> LogMessage Warning (read b) (intercalate " " cs)
--                               "I" -> LogMessage Info (read b) (intercalate " " cs)

-- TODO: ask if there is a way to combine splitOn call to parseMessageList before pattern matching
-- parse single message line
parseMessage :: String -> LogMessage
parseMessage x = parseMessageList (splitOn " " x)

parse :: String -> [LogMessage]
parse x = map parseMessage (splitOn "\n" x)

