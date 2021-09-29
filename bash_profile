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

# Bash Autocompletion and Prompt Window Dressing for Git
# `brew install bash-completion`
if [ -f /usr/local/etc/profile.d/bash_completion.sh ]; then
  source /usr/local/etc/profile.d/bash_completion.sh
  export GIT_PS1_SHOWCOLORHINTS=1
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_STATESEPARATOR=''
  export PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ "'
fi

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
