#!/bin/bash
# Enable SSH-Agent
#if [ -z "$SSH_AUTH_SOCK" ] ; then
#  eval `ssh-agent -s`
#  ssh-add
#fi
# Use gpg-agent
if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
fi
export GPG_TTY=$(tty)

# Set Vi keybindings in Bash
set -o vi

# Aliases directory, if exists
[ -d ~/.config/aliases ] && eval "$(cat ~/.config/aliases/*)"
[ -d ~/.config/environment ] && eval "$(cat ~/.config/environment/*)"

# Homebrew Setup
if which brew > /dev/null; then
  alias caskrepo='cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask'
  # Homebrew/PHP PHP 5.6
  export PATH="/usr/local/sbin:$PATH"
  export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
fi

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ChefDK Stuff (not the full load)
[ -d /opt/chefdk/bin ] && export PATH="/opt/chefdk/bin:$PATH"

# Pear
[ -d ~/.pear/bin ] && export PATH="~/.pear/bin:$PATH"

# AWS CLI
if which aws > /dev/null; then 
  complete -C aws_completer aws
  function ip_for () {
    aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" | jq -r '.["Reservations"]|.[]|.Instances|.[]|.PublicIpAddress'
  }
fi

# Go
if which go > /dev/null; then
  export PATH=$PATH:/usr/local/opt/go/libexec/bin
  export GOPATH=~/.go
fi

# Android SDK
if which android > /dev/null; then
  export ANDROID_HOME=/usr/local/opt/android-sdk
fi

# My local scripts
export PATH="~/.bin:$PATH"

# vimpager
#export PAGER=/usr/local/bin/vimpager
#alias less=$PAGER
#alias zless=$PAGER

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
