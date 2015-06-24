#!/bin/bash
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

set -o vi

# Aliases file, if exists
[ -f ~/.config/aliases ] && source ~/.config/aliases

# AWS CLI
complete -C aws_completer aws

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ChefDK Stuff (not the full load)
export PATH="/opt/chefdk/bin:$PATH"

# Pear
export PATH="~/.pear/bin:$PATH"

# My local scripts
export PATH="~/.bin:$PATH"

alias ll='ls -l'
alias caskrepo='cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask'

# vimpager
#export PAGER=/usr/local/bin/vimpager
#alias less=$PAGER
#alias zless=$PAGER

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
