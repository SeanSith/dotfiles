#!/bin/bash

# Set VI keybindings in Bash
set -o vi

# Environment helpers
[ -d $HOME/.config/environment ] && eval "$(cat $HOME/.config/environment/*)"

