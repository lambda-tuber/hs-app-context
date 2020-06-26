{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module Sample.Control (
    ArgData(..)
  , run
  ) where

import qualified Control.Exception.Safe as E
import Data.Default
import Data.Yaml
import Control.Lens
import System.Log.FastLogger

import Sample.Type
import Sample.Constant
import qualified Sample.Utility as U
import qualified Sample.Application as A

-- |
--
run :: ArgData -> IO ()
run args = do

  conf <- maybe (pure def) decodeFileThrow (args^.yamlArgData)

  tcache <- newTimeCache _TIME_FORMAT
  (logger, finalizeLogger) <- newTimedFastLogger tcache 
                            $ LogFileNoRotate (conf^.logFileConfigData) defaultBufSize

  let appDat = AppData {
      _loggerAppData   = logger
    , _logLevelAppData = conf^.logLevelConfigData
    }

  U.runApp appDat A.app >>= \case
    Right _ -> return ()
    Left er -> E.throwString er

  finalizeLogger

  return ()

