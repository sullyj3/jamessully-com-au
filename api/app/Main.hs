{-# LANGUAGE OverloadedStrings #-}

import Application () -- for YesodDispatch instance
import Foundation
import Yesod.Core
import Network.Wai.Middleware.Cors
import Network.Wai.Handler.Warp
import Network.Wai
import System.Environment


main :: IO ()
main = do
  port <- read <$> getEnv "PORT"
  toWaiApp App >>= \application ->
    Network.Wai.Handler.Warp.run port (cors myCORSPolicy application)


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

