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

# Git Autocompletion and Prompt
[ -f /usr/local/etc/bash_completion.d/git-completion.bash ] && \
  source /usr/local/etc/bash_completion.d/git-completion.bash
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  export GIT_PS1_SHOWCOLORHINTS=1
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_STATESEPARATOR=''
  export PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ "'
fi

# Homebrew Setup
if which brew > /dev/null; then
  alias caskrepo='cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask'
  export PATH="/usr/local/sbin:$PATH"
  # PHP
  php_packages=$(brew list --full-name | grep 'homebrew/php')
  php_version=$(echo "$php_packages" | grep 'homebrew/php/php')
  if [ -n "$php_version" ]; then
    export PATH="$(brew --prefix $php_version)/bin:$PATH"
    # Composer
    [ $(echo "$php_packages" | grep 'homebrew/php/composer') ] && \
      export PATH=$HOME/.composer/vendor/bin:$PATH
    # Pear
    [ -d $HOME/.pear/bin ] && export PATH="$HOME/.pear/bin:$PATH"
  fi
fi

# rbenv
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# ChefDK Stuff (not the full load)
[ -d /opt/chefdk/bin ] && export PATH="/opt/chefdk/bin:$PATH"

# AWS CLI
if [ $(which aws > /dev/null 2>&1) ]; then
  complete -C aws_completer aws
  function ip_for () {
    aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" | \\
      jq -r '.["Reservations"]|.[]|.Instances|.[]|.PublicIpAddress'
  }
fi

# Go
if [ $(which go > /dev/null 2>&1) ]; then
  export PATH=$PATH:/usr/local/opt/go/libexec/bin
  export GOPATH=$HOME/.go
fi

# Android SDK
[ $(which android > /dev/null 2>&1) ] && \
  export ANDROID_HOME=/usr/local/opt/android-sdk

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# pyenv
if [ -d $HOME/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Java
[ -e /usr/libexec/java_home ] && \
  export JAVA_HOME=$(/usr/libexec/java_home --failfast > /dev/null 2>&1)

# My local scripts
export PATH="$HOME/.bin:$PATH"

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-monokai.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

[ TERM_PROGRAM == "iTerm.app" ] && \
  [ -e "$HOME/.iterm2_shell_integration.bash" ] && \
    source "$HOME/.iterm2_shell_integration.bash"
