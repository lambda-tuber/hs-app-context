{-# LANGUAGE TemplateHaskell #-}

module Sample.Type where

import Data.Data
import Data.Default
import Control.Lens
import Data.Aeson
import Data.Aeson.TH
import Control.Monad.Reader
import Control.Monad.Logger
import Control.Monad.Except
import System.Log.FastLogger
import qualified Data.Text as T
import qualified Text.Read as R

--------------------------------------------------------------------------------
-- |
--
instance FromJSON LogLevel where
  parseJSON (String v) = case R.readEither ("Level" ++ T.unpack v) of
    Right l -> pure l
    Left er -> error $ "invalid loglevel. <" ++ T.unpack v ++ "> " ++ er
  parseJSON o = error $ "json parse error. Priority:" ++ show o

instance ToJSON LogLevel where
  toJSON LevelDebug     = String $ T.pack "Debug"
  toJSON (LevelInfo)    = String $ T.pack "Info"
  toJSON (LevelWarn)    = String $ T.pack "Warn"
  toJSON (LevelError)   = String $ T.pack "Error"
  toJSON (LevelOther m) = String m


--------------------------------------------------------------------------------
-- |
--
data ArgData = ArgData {
    _yamlArgData :: Maybe FilePath
  } deriving (Data, Typeable, Show, Read, Eq)

makeLenses ''ArgData
$(deriveJSON
  defaultOptions {
      fieldLabelModifier = tail . reverse . drop (length "ArgData") . reverse
    }
  ''ArgData)

instance Default ArgData where
  def = ArgData {
        _yamlArgData = Nothing
      }


--------------------------------------------------------------------------------
-- |
--
data ConfigData = ConfigData {
    _logFileConfigData :: FilePath
  , _logLevelConfigData :: LogLevel
  } deriving (Typeable, Show, Read, Eq)

makeLenses ''ConfigData
$(deriveJSON
  defaultOptions {
      fieldLabelModifier = tail . reverse . drop (length "ConfigData") . reverse
    }
  ''ConfigData)

instance Default ConfigData where
  def = ConfigData {
        _logFileConfigData  = "sample.log"
      , _logLevelConfigData = LevelWarn
      }


--------------------------------------------------------------------------------
-- |
--
data AppData = AppData {
    _loggerAppData   :: TimedFastLogger
  , _logLevelAppData :: LogLevel
  }

makeLenses ''AppData


--------------------------------------------------------------------------------
-- |
--
type ErrorData = String
type AppContext = ReaderT AppData (ExceptT ErrorData (LoggingT IO))

