# normal
bindkey -e
bindkey '^W' vi-backward-kill-word
bindkey '^U' backward-kill-line
bindkey '^[[1;5D' vi-backward-word
bindkey '^[[1;5C' vi-forward-word
# search
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end
# completion
bindkey '^[[Z' reverse-menu-complete
