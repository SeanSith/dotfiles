# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zap-zsh/completions"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"  # Must be installed after zap-zsh/supercharge
plug "zap-zsh/vim"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "chivalryq/zsh-autojump"
plug "hlissner/zsh-autopair"
plug "wintermi/zsh-mise"
plug "wintermi/zsh-starship"

# My custom stuff
plug "$HOME/.config/environment/*"
plug "$HOME/.config/zsh/*"

# Load and initialise completion system
autoload -Uz compinit
compinit -d "${XDG_DATA_HOME:-$HOME}/.local/share/zsh/.zcompdump"
