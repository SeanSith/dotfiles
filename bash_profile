#!/bin/bash

# Use gpg-agent
#if [ -f $HOME/.gpg-agent-info ]; then
#  source $HOME/.gpg-agent-info
#  export GPG_AGENT_INFO
#  export SSH_AUTH_SOCK
#  export GPG_TTY=$(tty)
#elif [ -z "$SSH_AUTH_SOCK" ]; then
if [ -z "$SSH_AUTH_SOCK" ]; then
  # Enable SSH-Agent
  eval `ssh-agent -s`
fi
if [ $(uname) == 'Darwin' ]; then
  ssh-add -A > /dev/null 2>&1
else
  ssh-add > /dev/null 2>&1
fi

# Set VI keybindings in Bash
set -o vi

# Aliases directory, if exists
[ -d $HOME/.config/aliases ] && eval "$(cat $HOME/.config/aliases/*)"
[ -d $HOME/.config/environment ] && eval "$(cat $HOME/.config/environment/*)"

# Homebrew Setup
if which brew > /dev/null; then
  alias caskrepo='cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask'
  export PATH="/usr/local/sbin:$PATH"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ASDF
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# ChefDK Stuff (not the full load)
[ -d /opt/chefdk/bin ] && export PATH="/opt/chefdk/bin:$PATH"

# Android SDK
[ $(which android > /dev/null 2>&1) ] && \
  export ANDROID_HOME=/usr/local/opt/android-sdk

# My local scripts
export PATH="$HOME/.bin:$PATH"

# Bash Autocompletion and Prompt Window Dressing for Git
# `brew install bash-completion`
if [ -f /usr/local/etc/profile.d/bash_completion.sh ]; then
  source /usr/local/etc/profile.d/bash_completion.sh
  export GIT_PS1_SHOWCOLORHINTS=1
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_STATESEPARATOR=''
  export PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ "'
fi

[ TERM_PROGRAM == "iTerm.app" ] && \
  [ -e "$HOME/.iterm2_shell_integration.bash" ] && \
    source "$HOME/.iterm2_shell_integration.bash"
