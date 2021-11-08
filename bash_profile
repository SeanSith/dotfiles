#!/bin/bash

if [ $(uname) == 'Darwin' ]; then
  ssh-add -K > /dev/null 2>&1
else
  ssh-add > /dev/null 2>&1
fi

# Set VI keybindings in Bash
set -o vi

# Aliases directory, if exists
[ -d $HOME/.config/aliases ] && eval "$(cat $HOME/.config/aliases/*)"
[ -d $HOME/.config/environment ] && eval "$(cat $HOME/.config/environment/*)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# My local scripts
export PATH="$HOME/.bin:$PATH"

alias ls='ls -G'
alias ll='ls -lG'
alias weather='curl -4 wttr.in'
alias moon='curl wttr.in/Moon'

check-tls-expiration() {
  echo | \
  openssl s_client -servername $1 -connect ${1}:443 2>/dev/null | \
  openssl x509 -noout -dates
}

alias dcr='docker compose run --rm'
