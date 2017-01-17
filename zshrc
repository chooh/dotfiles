# ADD THIS TO ~/.zshrc
# [ -f .aliases ] && source .aliases

# Preferred editor
export EDITOR='vim'

# Do not share history
unsetopt share_history

# Maps `ctrl + →` and `ctrl + ←` under tmux
bindkey '^[[C' forward-word
bindkey '^[[D' backward-word
