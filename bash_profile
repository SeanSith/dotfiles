#!/bin/bash
# Enable SSH-Agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

# Set Vi keybindings in Bash
set -o vi

# Aliases file, if exists
[ -f ~/.config/aliases ] && source ~/.config/aliases

# AWS CLI
complete -C aws_completer aws

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ChefDK Stuff (not the full load)
[ -d /opt/chefdk/bin ] && export PATH="/opt/chefdk/bin:$PATH"

# Pear
[ -d ~/.pear/bin ] && export PATH="~/.pear/bin:$PATH"

# Homebrew Setup
if which brew > /dev/null; then
  # Homebrew/PHP PHP 5.6
  export PATH="/usr/local/sbin:$PATH"
  export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
  alias caskrepo='cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask'
fi

# My local scripts
export PATH="~/.bin:$PATH"

alias ll='ls -l'

# vimpager
#export PAGER=/usr/local/bin/vimpager
#alias less=$PAGER
#alias zless=$PAGER

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
