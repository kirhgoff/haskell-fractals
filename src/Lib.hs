module Lib ( mainFunc, colorFor, blackColor, greenColor ) where

import Graphics.Gloss
import Data.Word
import Data.ByteString (ByteString, pack)

-----------------------------------------
-- conversions

screenWidth = 600
screenHeight = 600
-- positionX = - 1.0
-- positionY = - 1.0
-- worldWidth = 2.0
-- worldHeight = 2.0

-----------------------------------------
-- fractal

blackColor = [0, 0, 0, 100]
greenColor = [0, 128, 0, 100]

colorFor :: (Int, Int) -> [Word8]
colorFor coords = case coords of
  (x, y) | rem x 10 == 0 || rem y 10 == 0-> greenColor
  otherwise -> blackColor

allPixels :: Int -> Int -> [(Int,Int)]
allPixels width height = [(i, j) | i <- [0..width-1], j <- [0..height-1]]

---------------------------------------
--- IO related part

bitmapData :: ByteString
bitmapData = pack $ concat (map colorFor (allPixels screenWidth screenHeight))

ourPicture :: Picture
ourPicture = bitmapOfByteString screenWidth screenHeight (BitmapFormat TopToBottom PxRGBA) bitmapData True

mainFunc :: IO ()
mainFunc = display (InWindow "Nice Window" (screenWidth, screenHeight) (10, 10)) white ourPicture
