#!/bin/bash

# Use gpg-agent
if [ -f $HOME/.gpg-agent-info ]; then
  source $HOME/.gpg-agent-info
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
  export GPG_TTY=$(tty)
elif [ -z "$SSH_AUTH_SOCK" ]; then
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
  alias caskrepo='cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask'
  export PATH="/usr/local/sbin:$PATH"
  # PHP
  php_version=$(brew list --full-name | grep 'homebrew/php/php')
  if [ -n "$php_version" ]; then
    export PATH="$(brew --prefix $php_version)/bin:$PATH"
    # Composer
      export PATH=$HOME/.composer/vendor/bin:$PATH
    # Pear
    [ -d $HOME/.pear/bin ] && export PATH="$HOME/.pear/bin:$PATH"
  fi
fi

# ASDF
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# ChefDK Stuff (not the full load)
[ -d /opt/chefdk/bin ] && export PATH="/opt/chefdk/bin:$PATH"

# Android SDK
[ $(which android > /dev/null 2>&1) ] && \
  export ANDROID_HOME=/usr/local/opt/android-sdk

# Java
[ -e /usr/libexec/java_home ] && \
  export JAVA_HOME=$(/usr/libexec/java_home --failfast > /dev/null 2>&1)

# My local scripts
export PATH="$HOME/.bin:$PATH"

# AWS CLI Autocompletion
if [ $(which aws > /dev/null 2>&1) ]; then
  complete -C aws_completer aws
  function ip_for () {
    aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" | \\
      jq -r '.["Reservations"]|.[]|.Instances|.[]|.PublicIpAddress'
  }
fi

# Git Autocompletion and Prompt Window Dressing
[ -f /usr/local/etc/bash_completion.d/git-completion.bash ] && \
  source /usr/local/etc/bash_completion.d/git-completion.bash
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  export GIT_PS1_SHOWCOLORHINTS=1
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_STATESEPARATOR=''
  export PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ "'
fi

[ TERM_PROGRAM == "iTerm.app" ] && \
  [ -e "$HOME/.iterm2_shell_integration.bash" ] && \
    source "$HOME/.iterm2_shell_integration.bash"
