module Plugin
where

import Data.Plugin


data InternalState = InternalState { myUpdateCount :: Int }

initialInternalState = InternalState 1

reifyState :: InternalState -> PluginState
reifyState s@InternalState {myUpdateCount = c} = PluginState {
    updatePluginState = putStrLn ("Update number " ++ show c) >> return (reifyState s{myUpdateCount = c + 1} )
  , quitPluginState = putStrLn $ "Quit after " ++ show c ++ " updates"
  }

plugin :: Plugin
plugin = Plugin {
    pluginName = "test-plugin"
  , initialPluginState = putStrLn "Created a nice plugin" >>  return (reifyState initialInternalState)
  }
