#!/bin/bash

# Suppress Bash deprecation warning on macOS
[ "$(uname)" == "Darwin" ] && export BASH_SILENCE_DEPRECATION_WARNING=1

# Bootstrap my environment helpers
[ -d $XDG_CONFIG_HOME/environment ] && eval "$(cat $XDG_CONFIG_HOME/environment/*)"
