import Test.Hspec
import Test.QuickCheck
import Test.Invariant
import Ch1 (curry', uncurry')

prop_uncurryInvertsCurry :: Fun (Int, Int) Int -> (Int, Int) -> Bool
prop_uncurryInvertsCurry (Fn f) b = uncurry' (curry' f) b == f b

prop_curryInvertsUncurry :: Fun (Int, Int) Int -> Int -> Int -> Bool
prop_curryInvertsUncurry (Fn2 f) a b = curry' (uncurry' f) a b == f a b

main :: IO ()
main = hspec $ do
  describe "uncurry\'" $ do
    it "inverts curry\'" $
      property prop_uncurryInvertsCurry
    it "is inverted by curry\'" $
      property prop_curryInvertsUncurry
