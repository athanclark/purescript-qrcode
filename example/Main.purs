module Main where

import Prelude
import QRCode (QRCODE, toCanvas)
import Data.Maybe (Maybe (..))
import DOM.Node.Types (Element)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)


foreign import theCanvas :: Element


main :: forall eff. Eff (qrcode :: QRCODE, console :: CONSOLE | eff) Unit
main = do
  log "writing..."
  toCanvas
    { canvas: theCanvas
    , qrString: "asdf"
    , handle: \mE -> case mE of
        Nothing -> log "no error"
        Just e  -> log $ "error: " <> e
    }
