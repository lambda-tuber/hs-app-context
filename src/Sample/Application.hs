{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module Sample.Application (
    app
  ) where

import Control.Monad.Logger
import Control.Monad.Reader
import qualified Data.Text as T

import Sample.Type
import Sample.Constant
import qualified Sample.Utility as U


-- |
--
app :: AppContext ()
app = do
  lv <- _logLevelAppData <$> ask
  U.liftIOE $ print ("app called." :: String)
  $logDebugS _LOG_APP "This is a debug log message"
  $logInfoS  _LOG_APP "This is a info log message"
  $logWarnS  _LOG_APP "This is a warn log message"
  $logErrorS _LOG_APP $ "This is a error log message" `T.append` T.pack (show lv)

  return ()
