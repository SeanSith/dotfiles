# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/$HOME/.docker/completions $fpath)
# End of Docker CLI completions

# Load and initialise completion system
autoload -Uz compinit
compinit -d "${XDG_DATA_HOME:-$HOME}/.local/share/zsh/.zcompdump"
