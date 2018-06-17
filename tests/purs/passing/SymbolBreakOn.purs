module Main where

import Data.Symbol (SProxy(..))
import Prim.Symbol as Symbol

data BOProxy (result :: Symbol.BreakOnResult) = BOProxy

breakOnSymbol
  :: forall breakOn sym result
   . Symbol.BreakOn breakOn sym result
  => SProxy breakOn
  -> SProxy sym
  -> BOProxy result
breakOnSymbol _ _ = BOProxy

result1 :: BOProxy (Symbol.Broken "a" ",b")
result1 = breakOnSymbol (SProxy :: SProxy ",") (SProxy :: SProxy "a,b")

result2 :: BOProxy Symbol.NotBroken
result2 = breakOnSymbol (SProxy :: SProxy ",") (SProxy :: SProxy "ab")
