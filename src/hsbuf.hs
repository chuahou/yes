-- SPDX-License-Identifier: MIT
-- Copyright (c) 2020 Chua Hou

import System.IO

ys = 'y' : '\n' : ys

bufSize = 8192

main :: IO ()
main = do
    hSetBuffering stdout (BlockBuffering (Just bufSize))
    yes . take bufSize $ ys

yes :: [Char] -> IO ()
yes ys = putStr ys >> hFlush stdout >> yes ys
