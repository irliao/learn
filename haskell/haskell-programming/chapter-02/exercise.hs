-- Chapter 2 Basic Expression and Functions Exercise

-- write the following to be evaluated in REPL
-- z = 7
-- x = y ^ 2
-- waxOn = x * 5
-- y = z + 8

-- Answer:
-- z = 7
-- y = z + 8
-- x = y ^ 2
-- waxOn = x * 5

-- The following should evaluate in REPL:
-- waxOn == 1125
-- 10 + waxOn == 1135
-- (+10) waxOn == 1135
-- (-) 15 waxOn == -1110
-- (-) waxOn 15 == 1110

-- Enter in REPL:
-- let triple x = x * 3

-- The following should evaluate in REPL:
-- triple waxOn == 3375

-- Rewrite for source file, note that order of variables do not matter
waxOn = x * 5
  where z = 7
        y = z + 8
        x = y ^ 2
-- waxOn == 1125

triple x = x * 3
-- triple waxOn == 3375

waxOff x = triple x
-- waxOff waxOn == 3375
-- waxOff 10 == 30
-- waxOff (-50) == -150
