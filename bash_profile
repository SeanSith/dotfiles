#!/bin/bash

if [ $(uname) == 'Darwin' ]; then
  ssh-add --apple-use-keychain > /dev/null 2>&1
else
  ssh-add > /dev/null 2>&1
fi

# Set VI keybindings in Bash
set -o vi

# Environment helpers
[ -d $HOME/.config/environment ] && eval "$(cat $HOME/.config/environment/*)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
