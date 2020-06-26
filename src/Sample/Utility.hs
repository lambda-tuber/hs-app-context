{-# LANGUAGE OverloadedStrings #-}

module Sample.Utility where

import System.Log.FastLogger
import Control.Monad.Logger
import qualified Control.Exception.Safe as E
import Control.Monad.IO.Class
import Control.Monad.Except
import Control.Monad.Reader
import Control.Lens

import Sample.Type


-- |
--
runApp :: AppData -> AppContext a -> IO (Either ErrorData a)
runApp appDat app =
  runFastLoggerT appDat
    $ runExceptT
    $ runReaderT app appDat


-- |
--
runFastLoggerT :: AppData -> LoggingT IO a -> IO a
runFastLoggerT appDat app = do
  let logLevel = appDat^.logLevelAppData
      logger   = appDat^.loggerAppData
      
  runLoggingT (filterLogger (filterByLevel logLevel) app) $ output logger 

  where
    -- |
    --
    output :: TimedFastLogger
           -> Loc
           -> LogSource
           -> LogLevel
           -> LogStr
           -> IO ()
    output logger a b c d = do
      let msg = defaultLogStr a b c d
      logger (\ts -> toLogStr ts <> " " <> msg)

    -- |
    --
    filterByLevel :: LogLevel -> LogSource -> LogLevel -> Bool
    filterByLevel target _ actual = actual >= target


-- |
--
liftIOE :: IO a -> AppContext a
liftIOE f = liftIO (go f) >>= liftEither
  where
    go :: IO b -> IO (Either String b)
    go f = E.catchAny (Right <$> f) errHdl

    errHdl :: E.SomeException -> IO (Either String a)
    errHdl = return . Left . show
