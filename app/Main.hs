{-# LANGUAGE LambdaCase #-}
module Main where

import Data.Plugin
import Language.Haskell.Interpreter

loadPlugin :: FilePath -> Interpreter Plugin
loadPlugin pluginPath = do
  loadModules [pluginPath]
  setTopLevelModules ["Plugin"]
  interpret "plugin" infer

iterateM :: Monad m => (a -> m a) -> Int -> a -> m a
iterateM f n x | n <= 0 = return x
               | otherwise = f x >>= iterateM f (n-1)

main :: IO ()
main = do
  runInterpreter (loadPlugin "plugins/TestPlugin.hs") >>= \case
    Left err -> print err
    Right p -> do
      putStrLn ("Found plugin: " ++ pluginName p)
      s <- initialPluginState p
      s' <- iterateM updatePluginState 10 s
      quitPluginState s'

