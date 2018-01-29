# Chapter 03

the following 2 type signature outputs from REPL have same meaning, just different based on GHCI version
'''hs
Foldable t => t [a] -- ghc < 7.10
[[a]] -- ghc >= 7.10
'''
