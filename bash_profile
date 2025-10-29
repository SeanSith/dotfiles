#!/bin/bash

# Suppress Bash deprecation warning on macOS
[ "$(uname)" == "Darwin" ] && export BASH_SILENCE_DEPRECATION_WARNING=1

# macOS and Linux do not tell us where this is.
export XDG_CONFIG_HOME=$HOME/.config

# Bootstrap my environment helpers
[ -d $XDG_CONFIG_HOME/environment ] && eval "$(cat $XDG_CONFIG_HOME/environment/*)"
[ -d $XDG_CONFIG_HOME/bash ] && eval "$(cat $XDG_CONFIG_HOME/bash/*)"
