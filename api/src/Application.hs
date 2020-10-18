
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE ViewPatterns         #-}

{-# LANGUAGE LambdaCase           #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}
module Application where

import Foundation
import Yesod.Core

import Network.Wai.Middleware.Cors

import Data.Text (Text)
import Data.Functor ((<&>))

postEchoR :: Handler Text
postEchoR = lookupPostParam "data" >>= maybe (invalidArgs ["\"data\" param not found"]) pure

getHomeR :: Handler Text
getHomeR = getHelloR

getApiR :: Handler Text
getApiR = getHelloR

getHelloR :: Handler Text
getHelloR = do
  pure "Hello, world!"



-- resourcesApp is generated by mkYesodData in Foundation.hs
mkYesodDispatch "App" resourcesApp
