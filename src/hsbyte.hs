-- SPDX-License-Identifier: MIT
-- Copyright (c) 2020 Chua Hou

import System.IO
import qualified Data.ByteString.Char8 as Char8

ys = 'y' : '\n' : ys

bufSize = 8192

main :: IO ()
main = do
    hSetBuffering stdout (BlockBuffering (Just bufSize))
    yes . Char8.pack . take bufSize $ ys

yes :: Char8.ByteString -> IO ()
yes ys = do
    Char8.putStr ys
    hFlush stdout
    yes ys
