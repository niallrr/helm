{-| Contains all data structures and functions for composing colors. -}
module FRP.Helm.Color (
	-- * Types
	Color(..),
	Gradient(..),
	-- * Composing
	rgba,
	rgb,
	linear,
	radial,
	-- * Constants
	red,
	lime,
	blue,
	yellow,
	cyan,
	magenta,
	black,
	white,
	gray,
	grey,
	maroon,
	navy,
	green,
	teal,
	purple,
	violet,
	forestGreen
) where

{-| A data structure describing a color. It is represented interally as an RGBA
    color, but the utility functions 'hsva', 'hsv', etc. can be used to convert
    from other popular formats to this structure. -}
data Color = Color { r :: !Double, g :: !Double, b :: !Double, a :: !Double }

{-| Creates an RGB color. -}
rgb :: Double -> Double -> Double -> Color
rgb r g b = Color r g b 1

{-| Creates an RGB color, with transparency. -}
rgba :: Double -> Double -> Double -> Double -> Color
rgba = Color

{-| A bright red color. -}
red :: Color
red = rgb 1 0 0

{-| A bright green color. -}
lime :: Color
lime = rgb 0 1 0

{-| A bright blue color. -}
blue :: Color
blue = rgb 0 0 1

{-| A yellow color, made from combining red and green. -}
yellow :: Color
yellow = rgb 1 1 0

{-| A cyan color, combined from bright green and blue. -}
cyan :: Color
cyan = rgb 0 1 1

{-| A magenta color, combined from bright red and blue. -}
magenta :: Color
magenta = rgb 1 0 1

{-| A black color. -}
black :: Color
black = rgb 0 0 0

{-| A white color. -}
white :: Color
white = rgb 1 1 1

{-| A gray color, exactly halfway between black and white. -}
gray :: Color
gray = rgb 0.5 0.5 0.5

{-| Common alternative spelling of 'gray'. -}
grey :: Color
grey = gray

{-| A medium red color. -}
maroon :: Color
maroon = rgb 0.5 0 0

{-| A medium blue color. -}
navy :: Color
navy = rgb 0 0 0.5

{-| A medium green color. -}
green :: Color
green = rgb 0 0.5 0

{-| A teal color, combined from medium green and blue. -}
teal :: Color
teal = rgb 0 0.5 0.5

{-| A purple color, combined from medium red and blue. -}
purple :: Color
purple = rgb 0.5 0 0.5

{-| A violet color. -}
violet :: Color
violet = rgb 0.923 0.508 0.923

{-| A dark green color. -}
forestGreen :: Color
forestGreen = rgb 0.133 0.543 0.133

{- TODO:

complement :: Color -> Color

hsva :: Double -> Double -> Double -> Double -> Color

hsv :: Double -> Double -> Double -> Color
-}

{-| A data structure describing a gradient. There are two types of gradients:
    radial and linear. Radial gradients are based on a set of colors transitioned
    over certain radii in an arc pattern. Linear gradients are a set of colors
    transitioned in a straight line. -}
data Gradient = Linear (Double, Double) (Double, Double) [(Double, Color)] |
                Radial (Double, Double) Double (Double, Double) Double [(Double, Color)]


{-| Creates a linear gradient. Takes a starting position, ending position and a list
    of color stops (which are colors combined with a floating value between /0.0/ and /1.0/
    that describes at what step along the line between the starting position
    and ending position the paired color should be transitioned to). -}
linear :: (Double, Double) -> (Double, Double) -> [(Double, Color)] -> Gradient
linear = Linear

{-| Creates a radial gradient. Takes a starting position and radius, ending position and radius
    and a list of color stops. See the document for 'linear' for more information on color stops. -}
radial :: (Double, Double) -> Double -> (Double, Double) -> Double -> [(Double, Color)] -> Gradient
radial = Radial
