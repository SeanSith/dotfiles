# Load and initialise completion system
autoload -Uz compinit
compinit -d "${XDG_DATA_HOME:-$HOME}/.local/share/zsh/.zcompdump"
