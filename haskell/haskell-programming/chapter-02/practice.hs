-- Exercise: A Head Code

-- Let vs Where:
-- let should be used in REPL
-- where should be used in a file

-- this should work in GHCI (will not work in file)
-- let x = 5; y = 6 in x * y

-- put this in a file (will work in both file and REPL)
mult1 = x * y
  where x = 5
        y = 6

-- Rewrite with where clauses:
-- let x = 3; y = 1000 in x * 3 + y
rewrite1 = x * 3 + y
  where x = 3
        y = 1000
            
-- NOTE: since let is used in REPL, y must be defined before x
--       since where is used in file (compiler loads entire file at once), y can be defined after x 
-- let y = 10; x = 10 * 5 + y in x * 5
rewrite2 = x * 5
  where x = 10 * 5 + y
        y = 100

-- let x = 7; y = negate x; z = y * 10 in z / x + y 
rewrite3 = z / x + y
  where x = 7
        y = negate x
        z = y * 10
