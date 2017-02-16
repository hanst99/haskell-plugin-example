module Data.Plugin
where

data Plugin = Plugin { pluginName :: String, initialPluginState :: IO PluginState }

data PluginState = PluginState { updatePluginState :: IO PluginState, quitPluginState :: IO () }
