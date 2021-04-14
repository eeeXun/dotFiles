# search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
# completion
autoload -U compinit && compinit
zmodload -i zsh/complist
