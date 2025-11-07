# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "wintermi/zsh-brew"
plug "zap-zsh/completions"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"  # Must be installed after zap-zsh/supercharge
plug "zap-zsh/fzf"
plug "zap-zsh/vim"
# Disable zap-zsh/vim change of cursor style
  zle -D zle-keymap-select
  # zle -D zle-line-init
  echo -ne '\e[1 q'
  preexec() { echo -ne '\e[1 q' ;}

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "Aloxaf/fzf-tab"
plug "chivalryq/zsh-autojump"
plug "hlissner/zsh-autopair"
plug "wintermi/zsh-mise"

eval "$(starship init zsh)"

# My custom stuff
for name in `/bin/ls $HOME/.config/environment`
do
  plug "$HOME/.config/environment/$name"
done

for name in `find ~/.config/zsh -maxdepth 1 -type l`
do
  plug "$name"
done

# Raycast is contaminating my shell
if [[ -n "$NODE_ENV" ]]; then
  unset NODE_ENV
  unset NODE_PATH
fi

unset LC_ALL
