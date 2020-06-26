module Sample.Constant where

import qualified Data.Text as T
import qualified Data.ByteString as B
import qualified Data.Text.Encoding as T

--------------------------------------------------------------------------------
-- |
--
_LOG_APP :: T.Text
_LOG_APP = T.pack "APP"


-- |
--
_TIME_FORMAT :: B.ByteString
_TIME_FORMAT = T.encodeUtf8 $ T.pack "%Y/%m/%d %T %z"

