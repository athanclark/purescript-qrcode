module QRCode (QRCODE, toCanvas) where

import Prelude
import Data.Function.Eff (EffFn3, runEffFn3, EffFn1, mkEffFn1)
import Data.Nullable (Nullable, toMaybe)
import Data.Maybe (Maybe)
import Control.Monad.Eff (Eff)

import DOM.HTML.Types (HTMLElement)



foreign import data QRCODE :: !

foreign import toCanvasImpl :: forall eff handleEff. EffFn3 (qrcode :: QRCODE | eff) HTMLElement String (EffFn1 (qrcode :: QRCODE | handleEff) (Nullable String) Unit) Unit


toCanvas :: forall eff handleEff
          . { canvas   :: HTMLElement
            , qrString :: String
            , handle   :: Maybe String -> Eff (qrcode :: QRCODE | handleEff) Unit
            } -> Eff (qrcode :: QRCODE | eff) Unit
toCanvas {canvas,qrString,handle} =
  runEffFn3 toCanvasImpl canvas qrString (mkEffFn1 $ handle <<< toMaybe)
