Loading dynamic plugins with hint
=================================

This is a very basic example demonstrating how to use
the hint library to add some rudimentary scripting
functionality to an application.

Depending on your usecase, you'd probably want a more
restrictive context than `IO`.

Usage
=====

`stack setup && stack build && stack exec dynamic-exe`

At runtime, the plugins/TestPlugin.hs file is loaded and the `plugin` value from that is used to control the behavior of the program. The example Plugin is simply a counter, but it should be obvious how given more application specific hooks this could be generalized to perform arbitrarily complex tasks.
