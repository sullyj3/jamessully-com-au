{-# LANGUAGE OverloadedStrings #-}

import Application () -- for YesodDispatch instance
import Foundation
import Yesod.Core
import Network.Wai.Middleware.Cors
import Network.Wai.Handler.Warp
import Network.Wai

import System.Environment
import Control.Applicative


main :: IO ()
main = do
  port <- getPort
  application <- toWaiApp App
  Network.Wai.Handler.Warp.run port (cors myCORSPolicy application)
  where
    getPort :: IO Int
    getPort = read <$> getEnv "PORT" <|> pure defaultPort

    defaultPort = 6900


myCORSPolicy :: Request -> Maybe CorsResourcePolicy
myCORSPolicy _ = Just $
    CorsResourcePolicy
          { corsOrigins = Nothing
          , corsMethods = ["GET", "POST"]
          , corsRequestHeaders = simpleHeaders -- adds "Content-Type" to defaults
          , corsExposedHeaders = Nothing
          , corsMaxAge = Nothing
          , corsVaryOrigin = False
          , corsRequireOrigin = False
          , corsIgnoreFailures = False
          }

