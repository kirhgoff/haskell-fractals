-- file Spec.hs
import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
  describe "colorFor" $ do
    it "returns black for common pixel" $ do
      colorFor (2, 2) `shouldBe` blackColor

    it "returns green for grid pixels" $ do
      colorFor (20, 2) `shouldBe` greenColor
      colorFor (0, 0) `shouldBe` greenColor
      colorFor (3, 100) `shouldBe` greenColor
