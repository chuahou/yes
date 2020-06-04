-- SPDX-License-Identifier: MIT
-- Copyright (c) 2020 Chua Hou

ys = 'y' : '\n' : ys

main :: IO ()
main = yes ys

yes :: [Char] -> IO ()
yes (c:cs) = do
    putChar c
    yes cs
