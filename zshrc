# ADD THIS TO ~/.zshrc
# [ -f .dotfiles/zshrc ] && source .dotfiles/zshrc

source $HOME/.dotfiles/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    # Bundles from the default repo (robbyrussell's oh-my-zsh)
    git
    docker
    kubectl

    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting

    # Fish-like auto suggestions
    zsh-users/zsh-autosuggestions

    # Extra zsh completions
    zsh-users/zsh-completions
EOBUNDLES

# Load the theme
antigen theme robbyrussell

# Tell antigen that you're done
antigen apply

# Preferred editor
export EDITOR='vim'

# Do not share history
unsetopt share_history

# Maps `ctrl + →` and `ctrl + ←` under tmux
bindkey '^[[C' forward-word
bindkey '^[[D' backward-word

alias dcr='docker-compose run --rm'
