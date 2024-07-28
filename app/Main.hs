module Main where

import Controller
import View

main :: IO ()
main = do
    putStrLn welcome
    mainLoop []
