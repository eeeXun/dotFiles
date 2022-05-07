# normal
bindkey -e
bindkey '^W' vi-backward-kill-word
bindkey '^U' backward-kill-line
bindkey '^[[1;5D' vi-backward-word
bindkey '^[[1;5C' vi-forward-word
# search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# completion
bindkey '^[[Z' reverse-menu-complete
